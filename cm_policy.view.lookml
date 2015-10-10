- view: cm_policy
  fields:

  - dimension: cm_policy_id
    primary_key: true
    type: int
    sql: ${TABLE}.cm_policy_id

  - dimension: available_product_id
    type: int
    # hidden: true
    sql: ${TABLE}.available_product_id

  - dimension: available_product_set_id
    type: int
    # hidden: true
    sql: ${TABLE}.available_product_set_id

  - dimension_group: effective
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.effective

  - dimension_group: expires
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.expires

  - dimension: inherit
    type: yesno
    sql: ${TABLE}.inherit

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: policy_type
    type: int
    sql: ${TABLE}.policy_type

  - measure: count
    type: count
    drill_fields: [cm_policy_id, available_product.available_product_id, available_product_set.available_product_set_id, cm_procedure_pricing_rule.count, cm_rule.count]

