- view: appointment_section
  fields:

  - dimension: appointment_section_id
    primary_key: true
    type: int
    sql: ${TABLE}.appointment_section_id

  - dimension: appointment_id
    type: int
    hidden: true
    sql: ${TABLE}.appointment_id

  - dimension: appointment_type_section_id
    type: int
    hidden: true
    sql: ${TABLE}.appointment_type_section_id

  - dimension: busy_series_id
    type: int
    hidden: true
    sql: ${TABLE}.busy_series_id

  - dimension: busy_type_id
    type: int
    hidden: true
    sql: ${TABLE}.busy_type_id

  - dimension: cab
    type: yesno
    sql: ${TABLE}.cab

  - dimension: cab_status
    sql: ${TABLE}.cab_status

  - dimension: class_id
    type: int
    hidden: true
    sql: ${TABLE}.class_id

  - dimension: comments
    sql: ${TABLE}.comments

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created

  - dimension: created_by_id
    type: int
    hidden: true
    sql: ${TABLE}.created_by_id

  - dimension: diary_id
    type: int
    hidden: true
    sql: ${TABLE}.diary_id

  - dimension: doctor_id
    type: int
    hidden: true
    sql: ${TABLE}.doctor_id

  - dimension_group: end
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.end

  - dimension_group: last_modified
    type: time
    hidden: true
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    hidden: true
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    hidden: true
    sql: ${TABLE}.modified_by_function

  - dimension: reservation
    type: yesno
    sql: ${TABLE}.reservation

  - dimension: reserved_by_id
    type: int
    hidden: true
    sql: ${TABLE}.reserved_by_id

  - dimension: room_diary_id
    type: int
    hidden: true
    sql: ${TABLE}.room_diary_id

  - dimension: seen_by_doctor_id
    type: int
    hidden: true
    sql: ${TABLE}.seen_by_doctor_id

  - dimension: shoehorn
    type: yesno
    sql: ${TABLE}.shoehorn

  - dimension_group: start
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.start

  - dimension_group: appt_section_end
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.end

  - dimension_group: appt_section_start
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.start

#  - dimension: status
#    alias: [app_section_status]  
#    sql: ${TABLE}.status

  - dimension: appt_section_status
    sql: case when ${TABLE}.status = 'A' then 'Active' when ${TABLE}.status = 'C' then 'Cancelled' when ${TABLE}.status = 'R' then 'Rescheduled' else 'Unknown' End

  - dimension: ubrn
    sql: ${TABLE}.ubrn

  - measure: busy_hours
    label: 'Busy Hours'
    type: sum
    sql: CASE WHEN ifnull(${TABLE}.busy_type_id,0) = 0 then 0 else round(time_to_sec(timediff(${TABLE}.end,${TABLE}.start))/3600.00,2) End

  - measure: busy_duration_seconds
    label: 'Busy Seconds'
    type: sum
    sql: CASE WHEN ifnull(${TABLE}.busy_type_id,0) = 0 then 0 else time_to_sec(timediff(${TABLE}.end,${TABLE}.start)) End

  - measure: appointment_section_duration_in_seconds
    label: 'App Section Duration in Seconds'
    type: sum
    sql: CASE WHEN ifnull(${TABLE}.busy_type_id,0) = 0 then time_to_sec(timediff(${TABLE}.end,${TABLE}.start)) else 0 End 

  - measure: appointment_section_duration_in_mins
    label: 'App Section Duration in Minutes'
    type: sum
    sql: CASE WHEN ifnull(${TABLE}.busy_type_id,0) = 0 then round(time_to_sec(timediff(${TABLE}.end,${TABLE}.start)) else 0 End)/3600.00,2) 

  - measure: appt_section_count
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
    - appointment_section.start
    - appointment_section.end
    - appointment_section_study.count
    - diary_slot.count

