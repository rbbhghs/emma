- view: clinical_report_type_parameter
  fields:

  - dimension: description
    sql: ${TABLE}.description

  - dimension: dictate
    type: yesno
    sql: ${TABLE}.dictate

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: mandatory
    type: yesno
    sql: ${TABLE}.mandatory

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: name
    sql: ${TABLE}.name

  - dimension: parameter_number
    type: int
    sql: ${TABLE}.parameter_number

  - dimension: parameter_type
    type: int
    sql: ${TABLE}.parameter_type

  - dimension: report_type_parameter_id
    type: int
    sql: ${TABLE}.report_type_parameter_id

  - dimension: report_type_version_id
    type: int
    sql: ${TABLE}.report_type_version_id

  - measure: count
    type: count
    drill_fields: [name]

