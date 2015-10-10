- view: clinical_report_type_appointment_type
  fields:

  - dimension: id
    primary_key: true
    type: int
    sql: ${TABLE}.id

  - dimension: appointment_type_id
    type: int
    # hidden: true
    sql: ${TABLE}.appointment_type_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: report_type_id
    type: int
    sql: ${TABLE}.report_type_id

  - measure: count
    type: count
    drill_fields: [id, appointment_type.appointment_type_id, appointment_type.appointment_type_name]

