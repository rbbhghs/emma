- view: dashboard_action_follow_up
  fields:

  - dimension: dashboard_action_follow_up_id
    primary_key: true
    type: int
    sql: ${TABLE}.dashboard_action_follow_up_id

  - dimension: follow_up_days
    type: int
    sql: ${TABLE}.follow_up_days

  - dimension: from_dashboard_action_id
    type: int
    sql: ${TABLE}.from_dashboard_action_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: to_dashboard_action_id
    type: int
    sql: ${TABLE}.to_dashboard_action_id

  - dimension: working_days
    type: yesno
    sql: ${TABLE}.working_days

  - measure: count
    type: count
    drill_fields: [dashboard_action_follow_up_id]

