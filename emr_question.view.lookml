- view: emr_question
  fields:

  - dimension: source_emr_question_id
    primary_key: true
    type: int
    sql: ${TABLE}.source_emr_question_id

  - dimension: depends_on_id
    type: int
    sql: ${TABLE}.depends_on_id

  - dimension: emr_question_id
    type: int
    # hidden: true
    sql: ${TABLE}.emr_question_id

  - dimension: emr_question_name
    sql: ${TABLE}.emr_question_name

  - dimension: emr_section_id
    type: int
    # hidden: true
    sql: ${TABLE}.emr_section_id

  - dimension: form_question_id
    type: int
    # hidden: true
    sql: ${TABLE}.form_question_id

  - dimension: form_question_id_2
    type: int
    sql: ${TABLE}.form_question_id_2

  - dimension: hide_name
    type: yesno
    sql: ${TABLE}.hide_name

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: mandatory
    type: yesno
    sql: ${TABLE}.mandatory

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: question_number
    type: int
    sql: ${TABLE}.question_number

  - dimension: validation_error
    sql: ${TABLE}.validation_error

  - dimension: validation_error_2
    sql: ${TABLE}.validation_error_2

  - dimension: validation_expression
    sql: ${TABLE}.validation_expression

  - dimension: validation_expression_2
    sql: ${TABLE}.validation_expression_2

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - source_emr_question_id
    - emr_question_name
    - hide_name
    - emr_question.emr_question_name
    - emr_question.hide_name
    - emr_question.source_emr_question_id
    - emr_section.emr_section_id
    - emr_section.section_name
    - emr_section.left_column_name
    - emr_section.right_column_name
    - form_question.form_question_id
    - emr_question.count

