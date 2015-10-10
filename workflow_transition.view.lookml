- view: workflow_transition
  fields:

  - dimension: workflow_transition_id
    primary_key: true
    type: int
    sql: ${TABLE}.workflow_transition_id

  - dimension: from_state_id
    type: int
    sql: ${TABLE}.from_state_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: sort_order
    type: int
    sql: ${TABLE}.sort_order

  - dimension: status
    sql: ${TABLE}.status

  - dimension: to_state_id
    type: int
    sql: ${TABLE}.to_state_id

  - dimension: trigger_action_id
    type: int
    sql: ${TABLE}.trigger_action_id

  - dimension: uuid
    sql: ${TABLE}.uuid

  - dimension: workflow_rule_id
    type: int
    # hidden: true
    sql: ${TABLE}.workflow_rule_id

  - measure: count
    type: count
    drill_fields: [workflow_transition_id, workflow_rule.workflow_rule_id, workflow_rule.rule_name]

