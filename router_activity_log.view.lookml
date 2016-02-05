- view: activity_log
  fields:

  - dimension: id
    primary_key: true
    type: int
    hidden: true
    sql: ${TABLE}.id

  - dimension: action
    sql: ${TABLE}.action

  - dimension_group: datetime
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.datetime

  - measure: count
    type: count
    drill_fields: [id]

