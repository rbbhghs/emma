- view: diary_template_entry
  fields:

  - dimension: diary_template_entry_id
    primary_key: true
    type: int
    sql: ${TABLE}.diary_template_entry_id

  - dimension: diary_template_id
    type: int
    # hidden: true
    sql: ${TABLE}.diary_template_id

  - dimension: end_time
    type: int
    sql: ${TABLE}.end_time

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: restrict_to_limits
    type: yesno
    sql: ${TABLE}.restrict_to_limits

  - dimension: start_time
    type: int
    sql: ${TABLE}.start_time

  - measure: count
    type: count
    drill_fields: [diary_template_entry_id, diary_template.diary_template_id, diary_template.diary_template_name, appointment_section_limit.count, diary_section.count]

