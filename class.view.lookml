- view: class
  fields:

  - dimension: class_id
    primary_key: true
    type: int
    sql: ${TABLE}.class_id

  - dimension: class_type_id
    type: int
    # hidden: true
    sql: ${TABLE}.class_type_id

  - dimension: comments
    sql: ${TABLE}.comments

  - dimension: diary_id
    type: int
    # hidden: true
    sql: ${TABLE}.diary_id

  - dimension: doctor_id
    type: int
    sql: ${TABLE}.doctor_id

  - dimension_group: end
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.end

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: location_id
    type: int
    # hidden: true
    sql: ${TABLE}.location_id

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: places
    type: int
    sql: ${TABLE}.places

  - dimension: room_id
    type: int
    # hidden: true
    sql: ${TABLE}.room_id

  - dimension_group: start
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.start

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - class_id
    - class_type.class_type_id
    - class_type.class_type_name
    - room.room_id
    - room.room_name
    - diary.diary_id
    - location.location_name
    - location.billing_location_id
    - appointment.count
    - appointment_section.count
    - _classes.count

