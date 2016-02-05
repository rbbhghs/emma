- view: workflow_work_stage
  fields:

  - dimension: workflow_work_stage_id
    primary_key: true
    type: int
    sql: ${TABLE}.workflow_work_stage_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: stage_name
    sql: ${TABLE}.name

  - dimension: order
    type: int
    sql: ${TABLE}.`order`
    
  - dimension: stage_order
    type: int
    sql: ${TABLE}.`order`    

  - dimension: short_name
    sql: ${TABLE}.short_name

  - dimension: stage_short_name
    sql: ${TABLE}.short_name

  - dimension: status
    sql: ${TABLE}.status

  - dimension: uuid
    sql: ${TABLE}.uuid

  - dimension: workflow_id
    type: int
    # hidden: true
    sql: ${TABLE}.workflow_id

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - workflow_work_stage_id
    - short_name
    - name
    - workflow.workflow_name
    - workflow.workflow_id
    - workflow_state.count

