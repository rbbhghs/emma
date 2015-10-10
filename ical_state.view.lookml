- view: ical_state
  fields:

  - dimension: appointment_id
    type: int
    # hidden: true
    sql: ${TABLE}.appointment_id

  - dimension: ical_sequence
    type: int
    sql: ${TABLE}.ical_sequence

  - dimension: ical_uid
    sql: ${TABLE}.ical_uid

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - measure: count
    type: count
    drill_fields: [appointment.appointment_id]

