- view: name_title
  fields:

  - dimension: name_title_id
    primary_key: true
    type: int
    sql: ${TABLE}.name_title_id

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
    drill_fields: [name_title_id, name]

