- view: practice_mapping
  fields:

  - dimension: practice_mapping_id
    primary_key: true
    type: int
    sql: ${TABLE}.practice_mapping_id

  - dimension: external_practice_id
    type: int
    # hidden: true
    sql: ${TABLE}.external_practice_id

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

  - measure: count
    type: count
    drill_fields: [practice_mapping_id, external_practice.external_practice_id, external_practice.practice_name]

