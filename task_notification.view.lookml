- view: task_notification
  fields:

  - dimension: task_notification_id
    primary_key: true
    type: int
    sql: ${TABLE}.task_notification_id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: task_id
    type: int
    # hidden: true
    sql: ${TABLE}.task_id

  - dimension: task_note_id
    type: int
    # hidden: true
    sql: ${TABLE}.task_note_id

  - dimension: task_notification_type_id
    type: int
    # hidden: true
    sql: ${TABLE}.task_notification_type_id

  - dimension: user_id
    type: int
    sql: ${TABLE}.user_id

  - measure: count
    type: count
    drill_fields: [task_notification_id, task.task_id, task_notification_type.task_notification_type_id, task_notification_type.task_notification_type_name, task_note.task_note_id]

