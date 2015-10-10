- view: cm_price_rule
  fields:

  - dimension: cm_rule_id
    type: int
    # hidden: true
    sql: ${TABLE}.cm_rule_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: slot_range_type
    type: int
    sql: ${TABLE}.slot_range_type

  - measure: count
    type: count
    drill_fields: [cm_rule.cm_rule_id]

