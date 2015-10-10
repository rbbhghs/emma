- view: task_note
  fields:

  - dimension: task_note_id
    primary_key: true
    type: int
    sql: ${TABLE}.task_note_id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created

  - dimension: created_by_id
    type: int
    sql: ${TABLE}.created_by_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: note
    sql: ${TABLE}.note

  - dimension: status
    sql: ${TABLE}.status

  - dimension: task_id
    type: int
    # hidden: true
    sql: ${TABLE}.task_id

  - measure: count
    type: count
    drill_fields: [task_note_id, task.task_id, task_notification.count]

