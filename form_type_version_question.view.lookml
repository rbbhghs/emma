- view: form_type_version_question
  fields:

  - dimension: form_type_version_question_id
    primary_key: true
    type: int
    sql: ${TABLE}.form_type_version_question_id

  - dimension: form_question_id
    type: int
    # hidden: true
    sql: ${TABLE}.form_question_id

  - dimension: form_type_version_id
    type: int
    # hidden: true
    sql: ${TABLE}.form_type_version_id

  - dimension: form_type_version_section_id
    type: int
    # hidden: true
    sql: ${TABLE}.form_type_version_section_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: mandatory
    type: yesno
    sql: ${TABLE}.mandatory

  - dimension: mandatory_all
    type: yesno
    sql: ${TABLE}.mandatory_all

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: question_number
    type: int
    sql: ${TABLE}.question_number

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - form_type_version_question_id
    - form_type_version.form_type_version_id
    - form_type_version.form_type_name
    - form_type_version_section.form_type_version_section_id
    - form_type_version_section.section_name
    - form_question.form_question_id
    - form_question_instance.count

