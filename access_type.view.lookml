- view: access_type
  fields:

  - dimension: access_type_id
    primary_key: true
    type: int
    sql: ${TABLE}.access_type_id

  - dimension: access_type_name
    sql: ${TABLE}.access_type_name

  - dimension: allow_multiple_logins
    type: yesno
    sql: ${TABLE}.allow_multiple_logins

  - dimension: can_be_edited
    type: yesno
    sql: ${TABLE}.can_be_edited

  - dimension: default_page
    sql: ${TABLE}.default_page

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: password_valid_days
    type: int
    sql: ${TABLE}.password_valid_days

  - measure: count
    type: count
    drill_fields: [access_type_id, access_type_name, individual_type_access_link.count, security_point.count, user_access.count]

