- view: observation_set_notification_abnormal
  fields:

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    type: int
    sql: ${TABLE}.last_modified_by

  - dimension_group: last_notification_sent
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_notification_sent

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: observation_set_id
    type: int
    # hidden: true
    sql: ${TABLE}.observation_set_id

  - measure: count
    type: count
    drill_fields: [observation_set.observation_set_id, observation_set.service_name, observation_set.ordered_by_name]

