- view: workflow_state_treatment_cycle_referral_link
  fields:

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: treatment_cycle_referral_id
    type: int
    # hidden: true
    sql: ${TABLE}.treatment_cycle_referral_id

  - dimension: workflow_state_id
    type: int
    # hidden: true
    sql: ${TABLE}.workflow_state_id

  - measure: count
    type: count
    drill_fields: [treatment_cycle_referral.treatment_cycle_referral_id, workflow_state.workflow_state_id, workflow_state.name, workflow_state.short_name]

