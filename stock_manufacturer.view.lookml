- view: stock_manufacturer
  fields:

  - dimension: stock_manufacturer_id
    primary_key: true
    type: int
    sql: ${TABLE}.stock_manufacturer_id

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

  - dimension: stock_manufacturer_name
    sql: ${TABLE}.stock_manufacturer_name

  - measure: count
    type: count
    drill_fields: [stock_manufacturer_id, stock_manufacturer_name]

