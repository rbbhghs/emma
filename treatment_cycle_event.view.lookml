- view: treatment_cycle_event
  fields:

  - dimension: treatment_cycle_event_id
    primary_key: true
    type: int
    sql: ${TABLE}.treatment_cycle_event_id

  - dimension: appointment_id
    type: int
    # hidden: true
    sql: ${TABLE}.appointment_id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created

  - dimension: created_by_id
    type: int
    sql: ${TABLE}.created_by_id

  - dimension_group: event
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.event_date

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: notes
    sql: ${TABLE}.notes

  - dimension: status
    sql: ${TABLE}.status

  - dimension: treatment_cycle_event_type_id
    type: int
    # hidden: true
    sql: ${TABLE}.treatment_cycle_event_type_id

  - dimension: treatment_cycle_id
    type: int
    # hidden: true
    sql: ${TABLE}.treatment_cycle_id

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - treatment_cycle_event_id
    - treatment_cycle.treatment_cycle_id
    - treatment_cycle.treatment_cycle_name
    - treatment_cycle_event_type.treatment_cycle_event_type_id
    - treatment_cycle_event_type.event_type_name
    - appointment.appointment_id

