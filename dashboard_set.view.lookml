- view: dashboard_set
  fields:

  - dimension: dashboard_set_id
    primary_key: true
    type: int
    sql: ${TABLE}.dashboard_set_id

  - dimension: access_mask
    type: int
    sql: ${TABLE}.access_mask

  - dimension: dashboard_set_name
    sql: ${TABLE}.dashboard_set_name

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: sort_order
    type: int
    sql: ${TABLE}.sort_order

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: [dashboard_set_id, dashboard_set_name, dashboard_workflow.count]

