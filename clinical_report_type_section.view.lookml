- view: clinical_report_type_section
  fields:

  - dimension: conditional_display
    type: yesno
    sql: ${TABLE}.conditional_display

  - dimension: conditional_display_expression
    sql: ${TABLE}.conditional_display_expression

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: optional
    type: yesno
    sql: ${TABLE}.optional

  - dimension: report_section_type_id
    type: int
    sql: ${TABLE}.report_section_type_id

  - dimension: report_type_section_id
    type: int
    sql: ${TABLE}.report_type_section_id

  - dimension: report_type_version_id
    type: int
    sql: ${TABLE}.report_type_version_id

  - dimension: section_number
    type: int
    sql: ${TABLE}.section_number

  - measure: count
    type: count
    drill_fields: []

