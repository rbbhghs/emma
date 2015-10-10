- view: dashboard_view_field
  fields:

  - dimension: dashboard_view_field_id
    primary_key: true
    type: int
    sql: ${TABLE}.dashboard_view_field_id

  - dimension: dashboard_action_id
    type: int
    # hidden: true
    sql: ${TABLE}.dashboard_action_id

  - dimension: dashboard_view_field_type
    type: int
    sql: ${TABLE}.dashboard_view_field_type

  - dimension: dashboard_view_id
    type: int
    # hidden: true
    sql: ${TABLE}.dashboard_view_id

  - dimension: default_sort_direction
    type: int
    sql: ${TABLE}.default_sort_direction

  - dimension: display_confirmation_message
    type: yesno
    sql: ${TABLE}.display_confirmation_message

  - dimension: display_name
    sql: ${TABLE}.display_name

  - dimension: field_alignment
    type: int
    sql: ${TABLE}.field_alignment

  - dimension: is_escaped
    type: yesno
    sql: ${TABLE}.is_escaped

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: report_type_id_source_name
    sql: ${TABLE}.report_type_id_source_name

  - dimension: sort_order
    type: int
    sql: ${TABLE}.sort_order

  - dimension: sort_source_name
    sql: ${TABLE}.sort_source_name

  - dimension: sortable
    type: yesno
    sql: ${TABLE}.sortable

  - dimension: source_name
    sql: ${TABLE}.source_name

  - dimension: tooltip
    sql: ${TABLE}.tooltip

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - dashboard_view_field_id
    - source_name
    - display_name
    - sort_source_name
    - report_type_id_source_name
    - dashboard_view.dashboard_view_id
    - dashboard_view.dashboard_view_name
    - dashboard_action.dashboard_action_id
    - dashboard_action.dashboard_action_name
    - dashboard_action.canonical_name

