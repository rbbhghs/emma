- view: workflow
  fields:

  - dimension: workflow_id
    primary_key: true
    type: int
    sql: ${TABLE}.workflow_id

  - dimension: comment
    sql: ${TABLE}.comment

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: start_state_id
    type: int
    sql: ${TABLE}.start_state_id

  - dimension: status
    sql: ${TABLE}.status

  - dimension: system_default
    type: int
    sql: ${TABLE}.system_default

  - dimension: uuid
    sql: ${TABLE}.uuid

  - dimension: workflow_name
    sql: ${TABLE}.workflow_name

  - measure: count
    type: count
    drill_fields: [workflow_id, workflow_name, contract.count, workflow_log.count, workflow_work_stage.count]

