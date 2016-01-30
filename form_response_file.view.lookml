- view: form_response_file
  fields:

  - dimension: form_response_file_id
    primary_key: true
    type: int
    hidden: true
    sql: ${TABLE}.form_response_file_id

  - dimension: file_name
    sql: ${TABLE}.file_name

  - dimension: form_question_instance_id
    type: int
    hidden: true
    sql: ${TABLE}.form_question_instance_id

  - dimension: form_response_id
    type: int
    hidden: true
    sql: ${TABLE}.form_response_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    hidden: true
    sql: ${TABLE}.last_modified_by

  - dimension: mime_type
    sql: ${TABLE}.mime_type

  - dimension: modified_by_function
    hidden: true
    sql: ${TABLE}.modified_by_function

  - dimension: paper_file_type_id
    type: int
    hidden: true
    sql: ${TABLE}.paper_file_type_id

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - form_response_file_id
    - file_name
    - paper_file_type.paper_file_type_name
    - paper_file_type.paper_file_type_id
    - form_question_instance.form_question_instance_id
    - form_response.form_response_id
    - form_response_file_history.count

