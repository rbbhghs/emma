- view: contract_parameter
  fields:

  - dimension: contract_parameter_id
    primary_key: true
    type: int
    sql: ${TABLE}.contract_parameter_id

  - dimension: data_type
    type: int
    sql: ${TABLE}.data_type

  - dimension: default
    sql: ${TABLE}.`default`

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    type: int
    sql: ${TABLE}.last_modified_by

  - dimension: mandatory
    type: int
    sql: ${TABLE}.mandatory

  - dimension: name
    sql: ${TABLE}.name

  - measure: count
    type: count
    drill_fields: [contract_parameter_id, name, contract_parameter_instances.count, contract_parameter_option.count]

