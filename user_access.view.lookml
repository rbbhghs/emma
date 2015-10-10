- view: user_access
  fields:

  - dimension: access_type_id
    type: int
    # hidden: true
    sql: ${TABLE}.access_type_id

  - dimension: enable_rss_feed
    type: yesno
    sql: ${TABLE}.enable_rss_feed

  - dimension: enable_task_notification_email
    type: yesno
    sql: ${TABLE}.enable_task_notification_email

  - dimension: enable_task_notification_sms
    type: yesno
    sql: ${TABLE}.enable_task_notification_sms

  - dimension: failed_login_attempts
    type: int
    sql: ${TABLE}.failed_login_attempts

  - dimension: individual_id
    type: int
    # hidden: true
    sql: ${TABLE}.individual_id

  - dimension: ip_address
    sql: ${TABLE}.ip_address

  - dimension: is_locked
    type: yesno
    sql: ${TABLE}.is_locked

  - dimension_group: last_administered
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_administered

  - dimension_group: last_login
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_login

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: password
    sql: ${TABLE}.password

  - dimension_group: password_expires
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.password_expires

  - dimension: rss_password
    sql: ${TABLE}.rss_password

  - dimension: session_id
    sql: ${TABLE}.session_id

  - dimension: system_access_type
    type: int
    sql: ${TABLE}.system_access_type

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - individual.individual_id
    - individual.forename
    - individual.middlename
    - individual.surname
    - access_type.access_type_id
    - access_type.access_type_name

