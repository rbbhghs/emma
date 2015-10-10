- view: payment_allocation
  fields:

  - dimension: payment_allocation_id
    primary_key: true
    type: int
    sql: ${TABLE}.payment_allocation_id

  - dimension: allocated_by
    type: int
    sql: ${TABLE}.allocated_by

  - dimension_group: allocated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.allocated_date

  - dimension: amount
    type: number
    sql: ${TABLE}.amount

  - dimension: from_id
    type: int
    sql: ${TABLE}.from_id

  - dimension: from_type
    type: int
    sql: ${TABLE}.from_type

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

  - dimension: to_id
    type: int
    sql: ${TABLE}.to_id

  - dimension: to_type
    type: int
    sql: ${TABLE}.to_type

  - measure: count
    type: count
    drill_fields: [payment_allocation_id, payment_line_item_allocation.count]

