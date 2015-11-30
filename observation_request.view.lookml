- view: observation_request
  fields:

  - dimension: observation_request_id
    primary_key: true
    type: int
    sql: ${TABLE}.observation_request_id

  - dimension: charge_to_id
    type: int
    sql: ${TABLE}.charge_to_id

  - dimension: comments
    sql: ${TABLE}.comments

  - dimension: icd_9_codes
    sql: ${TABLE}.icd_9_codes

  - dimension: included_in_appointment
    type: yesno
    sql: ${TABLE}.included_in_appointment

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: notes
    sql: ${TABLE}.notes

  - dimension: observation_order_id
    type: int
    # hidden: true
    sql: ${TABLE}.observation_order_id

  - dimension: observation_service_id
    type: int
    # hidden: true
    sql: ${TABLE}.observation_service_id

  - dimension: price
    type: number
    sql: ${TABLE}.price

  - dimension: provider_code
    sql: ${TABLE}.provider_code

  - dimension: stat
    type: yesno
    sql: ${TABLE}.stat

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: [observation_request_id, observation_order.observation_order_id, observation_service.observation_service_id, observation_service.service_name, observation_set.count]

