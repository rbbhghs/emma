- view: dashboard_event_follow_up
  fields:

  - dimension: dashboard_event_follow_up_id
    primary_key: true
    type: int
    sql: ${TABLE}.dashboard_event_follow_up_id

  - dimension: dashboard_action_id
    type: int
    # hidden: true
    sql: ${TABLE}.dashboard_action_id

  - dimension: dashboard_event_id
    type: int
    # hidden: true
    sql: ${TABLE}.dashboard_event_id

  - dimension_group: due
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.due

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

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - dashboard_event_follow_up_id
    - dashboard_event.dashboard_event_id
    - dashboard_action.dashboard_action_id
    - dashboard_action.dashboard_action_name
    - dashboard_action.canonical_name
    - dashboard_event.count
    - _dashboard_distributions_without_emails.count

