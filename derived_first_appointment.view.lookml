- view: derived_first_appointment
  derived_table:
    sql: |
      SELECT a.patient_id,a.appointment_id first_appointment_id,first_appt,a.treatment_cycle_referral_id,count(*) new_appointments 
      FROM
      (select patient_id,min(start) first_appt from appointment where ifnull(dna,0) = 0 and status = 'A' group by patient_id)x 
      JOIN appointment a ON (x.patient_id = a.patient_id and x.first_appt = a.start)
      ;

  fields:
  - measure: new_appointments
    type: count
    drill_fields: detail*

  - dimension: first_appointment_id
    type: int
    primary_key: true
    sql: ${TABLE}.first_appointment_id

  - dimension: new_patient_appt
    type: yesno
    sql: CASE WHEN ${TABLE}.first_appointment_id is not null then 1 else 0 End

  - dimension: first_appt
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.first_appt

  - dimension: treatment_cycle_referral_id
    type: int
    sql: ${TABLE}.treatment_cycle_referral_id

#  - dimension: new_appointments
#    type: int
#    sql: ${TABLE}.new_appointments

  sets:
    detail:
      - first_appointment_id
      - new_appointments
      - new_patient_appt
      - first_appt

