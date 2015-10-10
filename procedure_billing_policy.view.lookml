- view: procedure_billing_policy
  fields:

  - dimension: procedure_billing_policy_id
    primary_key: true
    type: int
    sql: ${TABLE}.procedure_billing_policy_id

  - dimension: contract_id
    type: int
    # hidden: true
    sql: ${TABLE}.contract_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: name
    sql: ${TABLE}.name

  - dimension: parent_id
    type: int
    sql: ${TABLE}.parent_id

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - procedure_billing_policy_id
    - name
    - contract.contract_id
    - contract.contract_name
    - cm_rule.count
    - procedure_billing_group_policy.count

