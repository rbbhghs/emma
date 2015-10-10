- view: appointment_section_limit
  fields:

  - dimension: appointment_section_limit_id
    primary_key: true
    type: int
    sql: ${TABLE}.appointment_section_limit_id

  - dimension: appointment_type_section_group_id
    type: int
    # hidden: true
    sql: ${TABLE}.appointment_type_section_group_id

  - dimension: appointment_type_section_id
    type: int
    # hidden: true
    sql: ${TABLE}.appointment_type_section_id

  - dimension: appointment_type_section_limit
    type: int
    sql: ${TABLE}.appointment_type_section_limit

  - dimension: diary_template_entry_id
    type: int
    # hidden: true
    sql: ${TABLE}.diary_template_entry_id

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
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - appointment_section_limit_id
    - diary_template_entry.diary_template_entry_id
    - appointment_type_section.appointment_type_section_id
    - appointment_type_section.section_name
    - appointment_type_section_group.appointment_type_section_group_id
    - appointment_type_section_group.appointment_type_section_group_name

