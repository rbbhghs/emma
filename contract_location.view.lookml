- view: contract_location
  fields:

  - dimension: contract_location_id
    primary_key: true
    type: int
    sql: ${TABLE}.contract_location_id

  - dimension: contract_id
    type: int
    # hidden: true
    sql: ${TABLE}.contract_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: location_id
    type: int
    # hidden: true
    sql: ${TABLE}.location_id

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - measure: count
    type: count
    drill_fields: [contract_location_id, contract.contract_id, contract.contract_name, location.location_name, location.billing_location_id]

