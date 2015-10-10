- view: form_control
  fields:

  - dimension: form_control_id
    primary_key: true
    type: int
    sql: ${TABLE}.form_control_id

  - dimension: control_description
    sql: ${TABLE}.control_description

  - dimension: control_name
    sql: ${TABLE}.control_name

  - dimension: control_type
    sql: ${TABLE}.control_type

  - dimension: has_default
    type: yesno
    sql: ${TABLE}.has_default

  - dimension: individual_type
    type: int
    sql: ${TABLE}.individual_type

  - dimension: is_conditional
    type: yesno
    sql: ${TABLE}.is_conditional

  - dimension: is_sensitive
    type: yesno
    sql: ${TABLE}.is_sensitive

  - dimension: is_visible
    type: yesno
    sql: ${TABLE}.is_visible

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: read_only
    type: yesno
    sql: ${TABLE}.read_only

  - dimension: sort_order
    type: int
    sql: ${TABLE}.sort_order

  - dimension: view_type
    type: yesno
    sql: ${TABLE}.view_type

  - measure: count
    type: count
    drill_fields: [form_control_id, control_name]

