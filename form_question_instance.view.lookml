- view: form_question_instance
  fields:

  - dimension: form_question_instance_id
    primary_key: true
    type: int
    sql: ${TABLE}.form_question_instance_id

  - dimension: form_id
    type: int
    # hidden: true
    sql: ${TABLE}.form_id

  - dimension: form_question_version_id
    type: int
    # hidden: true
    sql: ${TABLE}.form_question_version_id

  - dimension: form_type_version_question_id
    type: int
    # hidden: true
    sql: ${TABLE}.form_type_version_question_id

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
    - form_question_instance_id
    - form_type_version_question.form_type_version_question_id
    - form_question_version.form_question_version_id
    - form_question_version.question_name
    - form_question_version.response_name
    - form_question_version.sub_response_name
    - form_question_version.sub_response_2_name
    - form_question_version.sub_response_3_name
    - form_question_version.order_interface_name
    - form_question_version.report_question_name
    - form.form_id
    - form_response.count
    - form_response_file.count
    - form_response_latest.count

