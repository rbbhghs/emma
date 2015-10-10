- view: contract_parameter_instances
  fields:

  - dimension: contract_parameter_instances_id
    primary_key: true
    type: int
    sql: ${TABLE}.contract_parameter_instances_id

  - dimension: contract_id
    type: int
    # hidden: true
    sql: ${TABLE}.contract_id

  - dimension: contract_parameter_id
    type: int
    # hidden: true
    sql: ${TABLE}.contract_parameter_id

  - dimension_group: effective
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.effective

  - dimension_group: expires
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.expires

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

  - dimension: value
    sql: ${TABLE}.value

  - measure: count
    type: count
    drill_fields: [contract_parameter_instances_id, contract.contract_id, contract.contract_name, contract_parameter.contract_parameter_id, contract_parameter.name]

