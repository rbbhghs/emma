- view: core_config
  fields:

  - dimension: id
    primary_key: true
    type: int
    sql: ${TABLE}.id

  - dimension: description
    sql: ${TABLE}.description

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

  - dimension: type
    sql: ${TABLE}.type

  - dimension: value
    sql: ${TABLE}.value

  - measure: count
    type: count
    drill_fields: [id, name]

