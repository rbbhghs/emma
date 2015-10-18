- view: diary_template
  fields:

  - dimension: diary_template_id
    primary_key: true
    type: int
    sql: ${TABLE}.diary_template_id

  - dimension: diary_template_name
    sql: ${TABLE}.diary_template_name

  - dimension: diary_type
    type: int
    sql: ${TABLE}.diary_type

  - dimension: doctor_id
    type: int
    sql: ${TABLE}.doctor_id

  - dimension: is_ad_hoc
    type: yesno
    sql: ${TABLE}.is_ad_hoc

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: quantum
    type: int
    sql: ${TABLE}.quantum

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: [diary_template_id, diary_template_name, diary.count, diary_template_entry.count]

