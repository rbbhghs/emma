- view: form_question
  fields:

  - dimension: form_question_id
    primary_key: true
    type: int
    sql: ${TABLE}.form_question_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - form_question_id
    - anoto_form_type_field.count
    - emr_question.count
    - form_image_question.count
    - form_question_tag.count
    - form_question_version.count
    - form_question_version_latest.count
    - form_response.count
    - form_response_latest.count
    - form_type_version_question.count
    - smart_list_form_response_criterion.count

