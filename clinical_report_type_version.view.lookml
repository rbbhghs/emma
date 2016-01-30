- view: clinical_report_type_version
  fields:

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    hidden: true
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    hidden: true
    sql: ${TABLE}.modified_by_function

  - dimension: name
    sql: ${TABLE}.name

  - dimension: report_type_id
    type: int
    hidden: true
    sql: ${TABLE}.report_type_id

  - dimension: report_type_version_id
    type: int
    hidden: true
    primary_key: true
    sql: ${TABLE}.report_type_version_id

  - dimension: status
    sql: ${TABLE}.status

  - dimension: version_number
    type: int
    sql: ${TABLE}.version_number

  - dimension: xslt
    sql: ${TABLE}.xslt

  - measure: count
    type: count
    drill_fields: [name]

