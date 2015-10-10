- view: cm_pricing_rule
  fields:

  - dimension: cm_pricing_rule_id
    primary_key: true
    type: int
    sql: ${TABLE}.cm_pricing_rule_id

  - dimension: cm_rule_id
    type: int
    # hidden: true
    sql: ${TABLE}.cm_rule_id

  - dimension: currency
    sql: ${TABLE}.currency

  - dimension: from_slot
    type: int
    sql: ${TABLE}.from_slot

  - dimension: from_time
    sql: ${TABLE}.from_time

  - dimension: is_absolute
    type: yesno
    sql: ${TABLE}.is_absolute

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

  - dimension: market_force_factor
    type: number
    sql: ${TABLE}.market_force_factor

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: price
    type: number
    sql: ${TABLE}.price

  - dimension: to_slot
    type: int
    sql: ${TABLE}.to_slot

  - dimension: to_time
    sql: ${TABLE}.to_time

  - dimension: weekday
    type: int
    sql: ${TABLE}.weekday

  - measure: count
    type: count
    drill_fields: [cm_pricing_rule_id, cm_rule.cm_rule_id, location.location_name, location.billing_location_id]

