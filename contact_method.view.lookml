- view: contact_method
  fields:

  - dimension: contact_method_id
    primary_key: true
    type: int
    sql: ${TABLE}.contact_method_id

  - dimension: contact_method_name
    sql: ${TABLE}.contact_method_name

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: sort_order
    type: int
    sql: ${TABLE}.sort_order

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: [contact_method_id, contact_method_name, treatment_cycle_referral.count]

