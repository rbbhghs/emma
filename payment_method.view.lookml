- view: payment_method
  fields:

  - dimension: payment_method_id
    primary_key: true
    type: int
    sql: ${TABLE}.payment_method_id

  - dimension: is_card
    type: yesno
    sql: ${TABLE}.is_card

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: online_type
    type: yesno
    sql: ${TABLE}.online_type

  - dimension: payment_method_name
    sql: ${TABLE}.payment_method_name

  - measure: count
    type: count
    drill_fields: [payment_method_id, payment_method_name, invoice.count, payment.count]

