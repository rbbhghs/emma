- view: treatment_cycle_event_type
  fields:

  - dimension: treatment_cycle_event_type_id
    primary_key: true
    type: int
    sql: ${TABLE}.treatment_cycle_event_type_id

  - dimension: event_type_name
    sql: ${TABLE}.event_type_name

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
    drill_fields: [treatment_cycle_event_type_id, event_type_name, treatment_cycle_event.count]

