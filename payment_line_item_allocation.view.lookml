- view: payment_line_item_allocation
  fields:

  - dimension: id
    primary_key: true
    type: int
    sql: ${TABLE}.id

  - dimension: amount
    type: number
    sql: ${TABLE}.amount

  - dimension: invoice_item_id
    type: int
    # hidden: true
    sql: ${TABLE}.invoice_item_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: payment_allocation_id
    type: int
    # hidden: true
    sql: ${TABLE}.payment_allocation_id

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: [id, payment_allocation.payment_allocation_id, invoice_item.previous_invoice_item_id]

