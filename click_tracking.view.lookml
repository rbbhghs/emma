- view: click_tracking
  fields:

  - dimension: click_tracking_id
    primary_key: true
    type: int
    sql: ${TABLE}.click_tracking_id

  - dimension_group: date
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.date_time

  - dimension: http_port
    sql: ${TABLE}.http_port

  - dimension: individual_id
    type: int
    # hidden: true
    sql: ${TABLE}.individual_id

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

  - dimension: page
    sql: ${TABLE}.page

  - dimension: query_string
    sql: ${TABLE}.query_string

  - dimension: referrer
    sql: ${TABLE}.referrer

  - measure: count
    type: count
    drill_fields: [click_tracking_id, individual.individual_id, individual.forename, individual.middlename, individual.surname]

