- view: first_appointment
  derived_table:
    sql: |
      SELECT first_appointment_date,count(*) new_appointments 
      FROM
      (select patient_id,min(appointment_id) first_appointment_id,DATE(min(start)) first_appointment_date from appointment group by patient_id)x
      GROUP BY first_appointment_date;

  fields:
  - measure: count
    type: count
    drill_fields: detail*

  - dimension: first_appointment_date
    type: string
    sql: ${TABLE}.first_appointment_date

  - dimension: new_appointments
    type: int
    sql: ${TABLE}.new_appointments

  sets:
    detail:
      - first_appointment_date
      - new_appointments

