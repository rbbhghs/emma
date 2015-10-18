- view: treatment_cycle_referral_priority_code
  fields:

  - dimension: client_priority_code
    sql: ${TABLE}.client_priority_code

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    type: int
    sql: ${TABLE}.last_modified_by

  - dimension: order
    type: int
    sql: ${TABLE}.`order`

  - dimension: pacs_priority_code
    sql: ${TABLE}.pacs_priority_code

  - dimension: priority_code_id
    type: int
    sql: ${TABLE}.priority_code_id

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: []

