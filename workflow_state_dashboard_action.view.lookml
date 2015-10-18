- view: workflow_state_dashboard_action
  fields:

  - dimension: workflow_state_dashboard_action_id
    primary_key: true
    type: int
    sql: ${TABLE}.workflow_state_dashboard_action_id

  - dimension: dashboard_action_id
    type: int
    # hidden: true
    sql: ${TABLE}.dashboard_action_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: status
    sql: ${TABLE}.status

  - dimension: workflow_state_id
    type: int
    # hidden: true
    sql: ${TABLE}.workflow_state_id

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - workflow_state_dashboard_action_id
    - dashboard_action.dashboard_action_id
    - dashboard_action.dashboard_action_name
    - dashboard_action.canonical_name
    - workflow_state.workflow_state_id
    - workflow_state.name
    - workflow_state.short_name

