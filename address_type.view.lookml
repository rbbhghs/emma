- view: address_type
  fields:

  - dimension: address_type_id
    primary_key: true
    type: int
    sql: ${TABLE}.address_type_id

  - dimension: address_type_name
    sql: ${TABLE}.address_type_name

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
    drill_fields: [address_type_id, address_type_name, address.count]

