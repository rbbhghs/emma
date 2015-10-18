- view: form_type_version_section
  fields:

  - dimension: form_type_version_section_id
    primary_key: true
    type: int
    sql: ${TABLE}.form_type_version_section_id

  - dimension: form_type_version_id
    type: int
    # hidden: true
    sql: ${TABLE}.form_type_version_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: section_name
    sql: ${TABLE}.section_name

  - dimension: section_number
    type: int
    sql: ${TABLE}.section_number

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - form_type_version_section_id
    - section_name
    - form_type_version.form_type_version_id
    - form_type_version.form_type_name
    - emr2_custom_annotation_link.count
    - emr2_note_entry.count
    - form_type_version_question.count

