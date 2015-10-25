- view: diary
  fields:

  - dimension: diary_id
    primary_key: true
    type: int
    sql: ${TABLE}.diary_id

  - dimension: comments
    sql: ${TABLE}.comments

  - dimension_group: diary
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.diary_date

  - dimension: diary_template_id
    type: int
    hidden: true
    sql: ${TABLE}.diary_template_id

  - dimension: diary_type
    type: int
    hidden: true
    sql: ${TABLE}.diary_type

  - dimension: doctor_id
    type: int
    hidden: true
    sql: ${TABLE}.doctor_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    hidden: true
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    hidden: true
    sql: ${TABLE}.modified_by_function

  - dimension: room_id
    type: int
    hidden: true
    sql: ${TABLE}.room_id

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - diary_id
    - diary_template.diary_template_id
    - diary_template.diary_template_name
    - room.room_id
    - room.room_name
    - appointment_search_result.count
    - appointment_section.count
    - class.count
    - diary_section.count
    - diary_waitinglist.count
    - _productivity.count

