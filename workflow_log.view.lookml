- view: workflow_log
  fields:

  - dimension: workflow_log_id
    primary_key: true
    type: int
    sql: ${TABLE}.workflow_log_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: message_id
    type: int
    sql: ${TABLE}.message_id

  - dimension: severity
    type: int
    sql: ${TABLE}.severity

  - dimension: treatment_cycle_referral_id
    type: int
    # hidden: true
    sql: ${TABLE}.treatment_cycle_referral_id

  - dimension: workflow_id
    type: int
    # hidden: true
    sql: ${TABLE}.workflow_id

  - dimension: workflow_rule_id
    type: int
    # hidden: true
    sql: ${TABLE}.workflow_rule_id

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - workflow_log_id
    - workflow_rule.rule_name
    - workflow_rule.workflow_rule_id
    - treatment_cycle_referral.treatment_cycle_referral_id
    - workflow.workflow_name
    - workflow.workflow_id

