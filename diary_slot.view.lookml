- view: diary_slot
  fields:

  - dimension: diary_slot_id
    primary_key: true
    type: int
    sql: ${TABLE}.diary_slot_id

  - dimension: appointment_section_id
    type: int
    # hidden: true
    sql: ${TABLE}.appointment_section_id

  - dimension: diary_section_id
    type: int
    # hidden: true
    sql: ${TABLE}.diary_section_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension_group: start
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.start_time

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: [diary_slot_id, diary_section.diary_section_id, appointment_section.appointment_section_id, cab_slot.count]

