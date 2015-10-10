- view: workflow_rule
  fields:

  - dimension: workflow_rule_id
    primary_key: true
    type: int
    sql: ${TABLE}.workflow_rule_id

  - dimension: condition
    sql: ${TABLE}.`condition`

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: rule_name
    sql: ${TABLE}.rule_name

  - dimension: status
    sql: ${TABLE}.status

  - dimension: uuid
    sql: ${TABLE}.uuid

  - measure: count
    type: count
    drill_fields: [workflow_rule_id, rule_name, workflow_log.count, workflow_transition.count]

