- view: diary_section
  fields:

  - dimension: diary_section_id
    primary_key: true
    type: int
    sql: ${TABLE}.diary_section_id

  - dimension: diary_id
    type: int
    # hidden: true
    sql: ${TABLE}.diary_id

  - dimension: diary_template_entry_id
    type: int
    # hidden: true
    sql: ${TABLE}.diary_template_entry_id

  - dimension: end_time
    type: int
    sql: ${TABLE}.end_time
    
  - dimension: actual_start_time
    type: string
    sql: DATE_FORMAT(date_add(DATE(now()),interval ${TABLE}.start_time second),'%H:%i')    

  - dimension: actual_end_time
    type: string
    sql: DATE_FORMAT(date_add(DATE(now()),interval ${TABLE}.end_time second),'%H:%i')

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: start_time
    type: int
    sql: ${TABLE}.start_time

  - dimension: status
    sql: ${TABLE}.status
    
  - measure: diary_duration_seconds
    label: 'Diary Open Duration in Seconds'
    type: sum
    sql: (${TABLE}.end_time-${TABLE}.start_time) 

  - measure: count
    type: count
    drill_fields: [diary_section_id, diary.diary_id, diary_template_entry.diary_template_entry_id, diary_section_cab_service.count, diary_slot.count]

