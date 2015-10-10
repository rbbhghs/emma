- view: c_plan_withdrawn_reason
  fields:

  - dimension: c_plan_withdrawn_reason_id
    primary_key: true
    type: int
    sql: ${TABLE}.c_plan_withdrawn_reason_id

  - dimension: c_plan_withdrawn_reason_name
    sql: ${TABLE}.c_plan_withdrawn_reason_name

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
    drill_fields: [c_plan_withdrawn_reason_id, c_plan_withdrawn_reason_name]

