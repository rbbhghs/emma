- view: batch_print_type
  fields:

  - dimension: allow_all_locations
    type: yesno
    sql: ${TABLE}.allow_all_locations

  - dimension: batch_type_id
    type: int
    sql: ${TABLE}.batch_type_id

  - dimension: batch_type_name
    sql: ${TABLE}.batch_type_name

  - dimension: class
    sql: ${TABLE}.class

  - dimension: comments
    sql: ${TABLE}.comments

  - dimension: date_identifier
    sql: ${TABLE}.date_identifier

  - dimension_group: date_last_round_up
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.date_last_round_up

  - dimension: has_appointment_type
    type: yesno
    sql: ${TABLE}.has_appointment_type

  - dimension: has_date_range
    type: yesno
    sql: ${TABLE}.has_date_range

  - dimension: has_location
    type: yesno
    sql: ${TABLE}.has_location

  - dimension: has_round_up
    type: yesno
    sql: ${TABLE}.has_round_up

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: location_identifier
    sql: ${TABLE}.location_identifier

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: sql
    sql: ${TABLE}.`sql`

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: [batch_type_name]

