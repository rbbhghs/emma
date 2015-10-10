- view: company_ancestor
  fields:

  - dimension: id
    primary_key: true
    type: int
    sql: ${TABLE}.id

  - dimension: child
    type: int
    sql: ${TABLE}.child

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: parent
    type: int
    sql: ${TABLE}.parent

  - measure: count
    type: count
    drill_fields: [id]

