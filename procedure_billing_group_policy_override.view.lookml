- view: procedure_billing_group_policy_override
  fields:

  - dimension: procedure_billing_group_policy_override_id
    primary_key: true
    type: int
    sql: ${TABLE}.procedure_billing_group_policy_override_id

  - dimension: default_areas_count
    type: yesno
    sql: ${TABLE}.default_areas_count

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

  - dimension: price
    type: number
    sql: ${TABLE}.price

  - dimension: procedure_billing_group_policy_id
    type: int
    # hidden: true
    sql: ${TABLE}.procedure_billing_group_policy_id

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: [procedure_billing_group_policy_override_id, procedure_billing_group_policy.procedure_billing_group_policy_id, procedure_billing_group_policy_override_data.count]

