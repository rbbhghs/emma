- view: task_queue_subscription
  fields:

  - dimension: task_queue_subscription_id
    primary_key: true
    type: int
    sql: ${TABLE}.task_queue_subscription_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: task_queue_id
    type: int
    sql: ${TABLE}.task_queue_id

  - dimension: user_id
    type: int
    sql: ${TABLE}.user_id

  - measure: count
    type: count
    drill_fields: [task_queue_subscription_id]

