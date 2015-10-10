- view: access_event
  fields:

  - dimension: access_event_id
    primary_key: true
    type: int
    sql: ${TABLE}.access_event_id

  - dimension: email
    sql: ${TABLE}.email

  - dimension_group: event
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.event_date

  - dimension: event_type
    type: int
    sql: ${TABLE}.event_type

  - dimension: ip_address
    sql: ${TABLE}.ip_address

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: user_id
    type: int
    sql: ${TABLE}.user_id

  - measure: count
    type: count
    drill_fields: [access_event_id]

