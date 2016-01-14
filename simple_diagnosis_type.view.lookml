- view: simple_diagnosis_type
  fields:

  - dimension: diagnosis_type_id
    type: int
    hidden: true
    sql: ${TABLE}.diagnosis_type_id

  - dimension: diagnosis_type_name
    sql: ${TABLE}.diagnosis_type_name

  - dimension: diagnosis_type_short_name
    sql: ${TABLE}.diagnosis_type_short_name

  - dimension_group: last_modified
    type: time
    hidden: true
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    hidden: true
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    hidden: true
    sql: ${TABLE}.modified_by_function

  - dimension: status
    
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: [diagnosis_type_short_name, diagnosis_type_name, appointment.count]

