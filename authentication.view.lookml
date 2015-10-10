- view: authentication
  fields:

  - dimension: authentication_id
    primary_key: true
    type: int
    sql: ${TABLE}.authentication_id

  - dimension: challenge_token
    sql: ${TABLE}.challenge_token

  - dimension_group: expiry
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.expiry_date

  - dimension: individual_id
    type: int
    # hidden: true
    sql: ${TABLE}.individual_id

  - dimension: ip_address
    sql: ${TABLE}.ip_address

  - dimension: is_authenticated
    type: yesno
    sql: ${TABLE}.is_authenticated

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: status
    sql: ${TABLE}.status

  - dimension_group: token
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.token_date

  - dimension: user_agent
    sql: ${TABLE}.user_agent

  - measure: count
    type: count
    drill_fields: [authentication_id, individual.individual_id, individual.forename, individual.middlename, individual.surname]

