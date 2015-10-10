- view: appointment_section
  fields:

  - dimension: appointment_section_id
    primary_key: true
    type: int
    sql: ${TABLE}.appointment_section_id

  - dimension: appointment_id
    type: int
    # hidden: true
    sql: ${TABLE}.appointment_id

  - dimension: appointment_type_section_id
    type: int
    # hidden: true
    sql: ${TABLE}.appointment_type_section_id

  - dimension: busy_series_id
    type: int
    sql: ${TABLE}.busy_series_id

  - dimension: busy_type_id
    type: int
    # hidden: true
    sql: ${TABLE}.busy_type_id

  - dimension: cab
    type: yesno
    sql: ${TABLE}.cab

  - dimension: cab_status
    sql: ${TABLE}.cab_status

  - dimension: class_id
    type: int
    # hidden: true
    sql: ${TABLE}.class_id

  - dimension: comments
    sql: ${TABLE}.comments

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created

  - dimension: created_by_id
    type: int
    sql: ${TABLE}.created_by_id

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

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: reservation
    type: yesno
    sql: ${TABLE}.reservation

  - dimension: reserved_by_id
    type: int
    sql: ${TABLE}.reserved_by_id

  - dimension: room_diary_id
    type: int
    sql: ${TABLE}.room_diary_id

  - dimension: seen_by_doctor_id
    type: int
    sql: ${TABLE}.seen_by_doctor_id

  - dimension: shoehorn
    type: yesno
    sql: ${TABLE}.shoehorn

  - dimension_group: start
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.start

  - dimension: status
    sql: ${TABLE}.status

  - dimension: ubrn
    sql: ${TABLE}.ubrn

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - appointment_section_id
    - appointment_type_section.appointment_type_section_id
    - appointment_type_section.section_name
    - appointment.appointment_id
    - diary.diary_id
    - class.class_id
    - busy_type.busy_type_id
    - busy_type.busy_type_name
    - appointment_section_study.count
    - diary_slot.count

