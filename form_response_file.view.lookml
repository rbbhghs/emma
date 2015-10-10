- view: form_response_file
  fields:

  - dimension: form_response_file_id
    primary_key: true
    type: int
    sql: ${TABLE}.form_response_file_id

  - dimension: file_name
    sql: ${TABLE}.file_name

  - dimension: form_question_instance_id
    type: int
    # hidden: true
    sql: ${TABLE}.form_question_instance_id

  - dimension: form_question_version_id
    type: int
    # hidden: true
    sql: ${TABLE}.form_question_version_id

  - dimension: form_response_id
    type: int
    # hidden: true
    sql: ${TABLE}.form_response_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: mime_type
    sql: ${TABLE}.mime_type

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: paper_file_type_id
    type: int
    # hidden: true
    sql: ${TABLE}.paper_file_type_id

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - form_response_file_id
    - file_name
    - form_response.form_response_id
    - form_question_instance.form_question_instance_id
    - paper_file_type.paper_file_type_id
    - paper_file_type.paper_file_type_name
    - form_question_version.form_question_version_id
    - form_question_version.question_name
    - form_question_version.response_name
    - form_question_version.sub_response_name
    - form_question_version.sub_response_2_name
    - form_question_version.sub_response_3_name
    - form_question_version.order_interface_name
    - form_question_version.report_question_name

