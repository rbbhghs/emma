- view: form_question_version_to_product
  fields:

  - dimension: form_question_version_to_product_id
    primary_key: true
    type: int
    sql: ${TABLE}.form_question_version_to_product_id

  - dimension: enum_text
    sql: ${TABLE}.enum_text

  - dimension: form_question_version_id
    type: int
    # hidden: true
    sql: ${TABLE}.form_question_version_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: product_id
    type: int
    # hidden: true
    sql: ${TABLE}.product_id

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - form_question_version_to_product_id
    - form_question_version.form_question_version_id
    - form_question_version.question_name
    - form_question_version.response_name
    - form_question_version.sub_response_name
    - form_question_version.sub_response_2_name
    - form_question_version.sub_response_3_name
    - form_question_version.order_interface_name
    - form_question_version.report_question_name
    - product.product_id
    - product.product_name

