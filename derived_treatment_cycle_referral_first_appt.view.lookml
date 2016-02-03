- view: derived_treatment_cycle_referral_first_appt
  derived_table:
    sql: |
      SELECT a.patient_id,a.appointment_id first_referral_appointment_id,first_referral_appt,a.treatment_cycle_referral_id,created_date referral_created,tcr.referred first_referred,
      max(case when a.arrive is null then 1 else 0 End) unaccounted_arrival,count(*) new_appointments_by_referral 
      FROM
      (select patient_id,treatment_cycle_referral_id, min(start) first_referral_appt from appointment where ifnull(dna,0) = 0 and status = 'A' group by patient_id,treatment_cycle_referral_id)x 
      JOIN appointment a ON (x.patient_id = a.patient_id and x.first_referral_appt = a.start and x.treatment_cycle_referral_id = a.treatment_cycle_referral_id) 
      JOIN treatment_cycle_referral tcr ON (tcr.treatment_cycle_referral_id = a.treatment_cycle_referral_id)
      GROUP BY a.patient_id,a.appointment_id,first_referral_appt,a.treatment_cycle_referral_id,tcr.created_date,tcr.referred 
      ;

  fields:
  - measure: new_appointments_by_referral
    type: count
    drill_fields: detail*

  - measure: referral_to_treat_duration_days
    type: sum
    sql: round(time_to_sec(TIMEDIFF(${TABLE}.first_referral_appt,${TABLE}.referral_created))/86400,2) 

  - dimension: first_referral_appointment_id
    type: int
    primary_key: true
    sql: ${TABLE}.first_referral_appointment_id

  - dimension: new_referral_appt
    type: yesno
    sql: CASE WHEN ${TABLE}.first_referral_appointment_id is not null then 1 else 0 End

  - dimension: first_referral_appt
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.first_referral_appt

  - dimension: referral_created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.referral_created

  - dimension: first_referred
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.first_referred

  - dimension: referral_to_treat_duration_days_dim
    type: number
    sql: round(time_to_sec(TIMEDIFF(${TABLE}.first_referral_appt,${TABLE}.referral_created))/86400,2) 
    
  - dimension: treatment_cycle_referral_id
    type: int
    sql: ${TABLE}.treatment_cycle_referral_id 

#  - dimension: new_appointments
#    type: int
#    sql: ${TABLE}.new_appointments

  sets:
    detail:
      - first_referral_appointment_id
      - new_appointments_by_referral
      - new_referral_appt
      - first_referral_appt 
      - referral_to_treat_duration_days

