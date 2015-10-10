- view: contract_event
  fields:

  - dimension: contract_event_id
    primary_key: true
    type: int
    sql: ${TABLE}.contract_event_id

  - dimension: contract_event_type_id
    type: int
    sql: ${TABLE}.contract_event_type_id

  - dimension: contract_id
    type: int
    # hidden: true
    sql: ${TABLE}.contract_id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created

  - dimension_group: date_reviewed
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.date_reviewed

  - dimension_group: effective
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.effective

  - dimension: entity_id
    type: int
    sql: ${TABLE}.entity_id

  - dimension: entity_name_1
    sql: ${TABLE}.entity_name_1

  - dimension: entity_name_2
    sql: ${TABLE}.entity_name_2

  - dimension: entity_type_id
    type: int
    sql: ${TABLE}.entity_type_id

  - dimension: event_data
    sql: ${TABLE}.event_data

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: reviewed_by
    type: int
    sql: ${TABLE}.reviewed_by

  - dimension: user_id
    type: int
    sql: ${TABLE}.user_id

  - measure: count
    type: count
    drill_fields: [contract_event_id, contract.contract_id, contract.contract_name]

