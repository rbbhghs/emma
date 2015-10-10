- view: procedure_billing_group_policy
  fields:

  - dimension: procedure_billing_group_policy_id
    primary_key: true
    type: int
    sql: ${TABLE}.procedure_billing_group_policy_id

  - dimension: additional_area_price
    type: number
    sql: ${TABLE}.additional_area_price

  - dimension: areas1
    type: number
    sql: ${TABLE}.areas1

  - dimension: areas2
    type: number
    sql: ${TABLE}.areas2

  - dimension: areas3
    type: number
    sql: ${TABLE}.areas3

  - dimension: areas4
    type: number
    sql: ${TABLE}.areas4

  - dimension: areas5
    type: number
    sql: ${TABLE}.areas5

  - dimension: currency
    sql: ${TABLE}.currency

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: procedure_billing_group_id
    type: int
    # hidden: true
    sql: ${TABLE}.procedure_billing_group_id

  - dimension: procedure_billing_policy_id
    type: int
    # hidden: true
    sql: ${TABLE}.procedure_billing_policy_id

  - dimension: reporting_group_id
    type: int
    # hidden: true
    sql: ${TABLE}.reporting_group_id

  - dimension: reporting_workflow_type
    type: int
    sql: ${TABLE}.reporting_workflow_type

  - dimension: secondary_reporting_group_id
    type: int
    sql: ${TABLE}.secondary_reporting_group_id

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - procedure_billing_group_policy_id
    - procedure_billing_group.procedure_billing_group_id
    - procedure_billing_group.name
    - procedure_billing_policy.procedure_billing_policy_id
    - procedure_billing_policy.name
    - reporting_group.reporting_group_id
    - reporting_group.reporting_group_name
    - procedure_billing_group_policy_override.count

