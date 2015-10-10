- view: appointment_review_list_field
  fields:

  - dimension: appointment_review_list_field_id
    primary_key: true
    type: int
    sql: ${TABLE}.appointment_review_list_field_id

  - dimension: display_name
    sql: ${TABLE}.display_name

  - dimension: field_alignment
    type: int
    sql: ${TABLE}.field_alignment

  - dimension: field_type
    type: int
    sql: ${TABLE}.field_type

  - dimension: is_link
    type: yesno
    sql: ${TABLE}.is_link

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: select_expression
    sql: ${TABLE}.select_expression

  - dimension: sort_order
    type: int
    sql: ${TABLE}.sort_order

  - dimension: source_name
    sql: ${TABLE}.source_name

  - dimension: width
    sql: ${TABLE}.width

  - measure: count
    type: count
    drill_fields: [appointment_review_list_field_id, source_name, display_name]

