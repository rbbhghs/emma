- view: payment_allocation
  fields:

  - dimension: payment_allocation_id
    primary_key: true
    type: int
    #hidden: true
    sql: ${TABLE}.payment_allocation_id

  - dimension: allocated_by
    type: int
    sql: ${TABLE}.allocated_by

  - dimension_group: date_allocated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.allocated_date

  - dimension: amount
    type: number
    sql: ${TABLE}.amount

  - dimension: from_id
    type: int
    hidden: true
    sql: ${TABLE}.from_id

  - dimension: from_type
    type: int
    hidden: true
    sql: ${TABLE}.from_type

  - dimension_group: last_modified
    type: time
    hidden: true
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    hidden: true
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    hidden: true
    sql: ${TABLE}.modified_by_function

  - dimension: status
    sql: ${TABLE}.status

  - dimension: to_id
    type: int
    hidden: true
    sql: ${TABLE}.to_id

  - dimension: to_type
    hidden: true
    type: int
    sql: ${TABLE}.to_type

  - measure: count
    type: count
    drill_fields: [payment_allocation_id, payment_line_item_allocation.count]

  - measure: sum_allocated
    type: sum_distinct
    sql: ${TABLE}.amount
    sql_distinct_key: ${payment_allocation_id}