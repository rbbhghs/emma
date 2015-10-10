- view: clinical_report_type_section_argument
  fields:

  - dimension: argument_value
    sql: ${TABLE}.argument_value

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: parameter_name
    sql: ${TABLE}.parameter_name

  - dimension: report_type_section_argument_id
    type: int
    sql: ${TABLE}.report_type_section_argument_id

  - dimension: report_type_section_id
    type: int
    sql: ${TABLE}.report_type_section_id

  - measure: count
    type: count
    drill_fields: [parameter_name]

