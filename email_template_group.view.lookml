- view: email_template_group
  fields:

  - dimension: email_template_group_id
    primary_key: true
    type: int
    sql: ${TABLE}.email_template_group_id

  - dimension: custom
    type: yesno
    sql: ${TABLE}.custom

  - dimension: email_template_group_name
    sql: ${TABLE}.email_template_group_name

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: [email_template_group_id, email_template_group_name, dashboard_action.count, email_template.count, treatment_cycle_close_type.count]

