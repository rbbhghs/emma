- view: workflow_state
  fields:

  - dimension: workflow_state_id
    primary_key: true
    type: int
    sql: ${TABLE}.workflow_state_id

  - dimension: comment
    sql: ${TABLE}.comment

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: name
    sql: ${TABLE}.name

  - dimension: order
    type: int
    sql: ${TABLE}.`order`

  - dimension: short_name
    sql: ${TABLE}.short_name

  - dimension: status
    sql: ${TABLE}.status

  - dimension: uuid
    sql: ${TABLE}.uuid

  - dimension: workflow_work_stage_id
    type: int
    # hidden: true
    sql: ${TABLE}.workflow_work_stage_id

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - workflow_state_id
    - name
    - short_name
    - workflow_work_stage.workflow_work_stage_id
    - workflow_work_stage.name
    - workflow_work_stage.short_name
    - workflow_state_dashboard_action.count
    - workflow_state_treatment_cycle_referral_link.count

