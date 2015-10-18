- view: form_sub_response
  fields:

  - dimension: form_sub_response_id
    primary_key: true
    type: int
    sql: ${TABLE}.form_sub_response_id

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

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: read_code
    sql: ${TABLE}.read_code

  - dimension: response
    sql: ${TABLE}.response

  - dimension: response_code
    sql: ${TABLE}.response_code

  - dimension: sub_response
    sql: ${TABLE}.sub_response

  - dimension: sub_response_2
    sql: ${TABLE}.sub_response_2

  - dimension: sub_response_3
    sql: ${TABLE}.sub_response_3

  - measure: count
    type: count
    drill_fields: [form_sub_response_id, form_response.form_response_id]

