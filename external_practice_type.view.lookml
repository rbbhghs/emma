- view: external_practice_type
  fields:

  - dimension: external_practice_type_id
    primary_key: true
    type: int
    sql: ${TABLE}.external_practice_type_id

  - dimension: canonical_name
    sql: ${TABLE}.canonical_name

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

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: [external_practice_type_id, name, canonical_name, external_practice.count]

