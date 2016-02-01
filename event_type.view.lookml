- view: event_type
  fields:

  - dimension: integral_event_type_id
    primary_key: true
    type: int
    sql: ${TABLE}.integral_event_type_id

  - dimension: event_type
    sql: ${TABLE}.event_type

  - dimension: event_type_companies
    type: int
    sql: ${TABLE}.event_type_Companies

  - dimension: event_type_description
    sql: ${TABLE}.event_type_description

  - dimension: event_type_ext_practice
    type: yesno
    sql: ${TABLE}.event_type_ext_practice

  - dimension: event_type_ext_practitioners
    type: int
    sql: ${TABLE}.event_type_ext_practitioners

  - dimension: event_type_id
    type: int
    # hidden: true
    sql: ${TABLE}.event_type_id

  - dimension: event_type_patients
    type: int
    sql: ${TABLE}.event_type_patients

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
    drill_fields: [integral_event_type_id, event_type.integral_event_type_id, event.count, event_type.count]

