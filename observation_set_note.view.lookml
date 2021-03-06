- view: observation_set_note
  fields:

  - dimension: observation_set_note_id
    primary_key: true
    type: int
    sql: ${TABLE}.observation_set_note_id

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

  - dimension: observation_set_id
    type: int
    # hidden: true
    sql: ${TABLE}.observation_set_id

  - measure: count
    type: count
    drill_fields: [observation_set_note_id, observation_set.observation_set_id, observation_set.service_name, observation_set.ordered_by_name]

