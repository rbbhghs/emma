- view: dashboard_view
  fields:

  - dimension: dashboard_view_id
    primary_key: true
    type: int
    sql: ${TABLE}.dashboard_view_id

  - dimension: access_mask
    type: int
    sql: ${TABLE}.access_mask

  - dimension: count_query
    sql: ${TABLE}.count_query

  - dimension: dashboard_view_name
    sql: ${TABLE}.dashboard_view_name

  - dimension: dashboard_workflow_id
    type: int
    # hidden: true
    sql: ${TABLE}.dashboard_workflow_id

  - dimension: default_row_count
    type: int
    sql: ${TABLE}.default_row_count

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: report_view_id
    type: int
    # hidden: true
    sql: ${TABLE}.report_view_id

  - dimension: sort_order
    type: int
    sql: ${TABLE}.sort_order

  - dimension: sortable
    type: yesno
    sql: ${TABLE}.sortable

  - dimension: status
    sql: ${TABLE}.status

  - dimension: view_query
    sql: ${TABLE}.view_query

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - dashboard_view_id
    - dashboard_view_name
    - dashboard_workflow.dashboard_workflow_id
    - dashboard_workflow.dashboard_workflow_name
    - report_view.report_view_id
    - report_view.view_name
    - report_view.friendly_name
    - dashboard_event.count
    - dashboard_view_field.count
    - _dashboard_distributions_without_emails.count

