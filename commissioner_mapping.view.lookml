- view: commissioner_mapping
  fields:

  - dimension: commissioner_mapping_id
    primary_key: true
    type: int
    sql: ${TABLE}.commissioner_mapping_id

  - dimension: commissioner_id
    type: int
    sql: ${TABLE}.commissioner_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: organisation_code
    sql: ${TABLE}.organisation_code

  - dimension: organisation_sub_type
    sql: ${TABLE}.organisation_sub_type

  - measure: count
    type: count
    drill_fields: [commissioner_mapping_id]

