- view: class_type
  fields:

  - dimension: class_type_id
    primary_key: true
    type: int
    sql: ${TABLE}.class_type_id

  - dimension: book_online
    type: yesno
    sql: ${TABLE}.book_online

  - dimension: class_type_name
    sql: ${TABLE}.class_type_name

  - dimension: duration
    type: int
    sql: ${TABLE}.duration

  - dimension: feedback_form_type_id
    type: int
    sql: ${TABLE}.feedback_form_type_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: places
    type: int
    sql: ${TABLE}.places

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
    - class_type_id
    - class_type_name
    - product.product_id
    - product.product_name
    - appointment_booklet_type_class_type.count
    - class.count
    - product.count

