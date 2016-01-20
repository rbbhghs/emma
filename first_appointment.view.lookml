- view: first_appointment
  derived_table:
    sql: |
      SELECT first_appointment_id,count(*) new_appointments 
      FROM
      (select patient_id,min(appointment_id) first_appointment_idfirst_appointment_idfirst_appointment_id,DATE(min(start)) first_appointment_date from appointment group by patient_id)x
      GROUP BY first_appointment_id;

  fields:
  - measure: new_appointments
    type: count
    drill_fields: detail*

  - dimension: first_appointment_id
    type: integer
    sql: ${TABLE}.first_appointment_id

#  - dimension: new_appointments
#    type: int
#    sql: ${TABLE}.new_appointments

  sets:
    detail:
      - first_appointment_id
      - new_appointments

