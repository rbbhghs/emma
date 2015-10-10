- view: clinical_report_section_type_version
  fields:

  - dimension: content
    sql: ${TABLE}.content

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: name
    sql: ${TABLE}.name

  - dimension: report_section_type_id
    type: int
    sql: ${TABLE}.report_section_type_id

  - dimension: report_section_type_version_id
    type: int
    sql: ${TABLE}.report_section_type_version_id

  - dimension: status
    sql: ${TABLE}.status

  - dimension: version_number
    type: int
    sql: ${TABLE}.version_number

  - measure: count
    type: count
    drill_fields: [name]

