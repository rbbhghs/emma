- view: derived_first_appointment
  derived_table:
    sql: |
      SELECT first_appointment_id,count(*) new_appointments,first_appt 
      FROM
      (select patient_id,min(appointment_id) first_appointment_id,min(start) first_appt from appointment group by patient_id)x
      GROUP BY first_appointment_id,first_appt;

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

#  - dimension: new_appointments
#    type: int
#    sql: ${TABLE}.new_appointments

  sets:
    detail:
      - first_appointment_id
      - new_appointments
      - new_patient_appt

