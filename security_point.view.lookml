- view: security_point
  fields:

  - dimension: id
    primary_key: true
    type: int
    sql: ${TABLE}.id

  - dimension: access_type_id
    type: int
    # hidden: true
    sql: ${TABLE}.access_type_id

  - dimension: can_add
    type: yesno
    sql: ${TABLE}.can_add

  - dimension: can_cancel
    type: yesno
    sql: ${TABLE}.can_cancel

  - dimension: can_edit
    type: yesno
    sql: ${TABLE}.can_edit

  - dimension: can_view
    type: yesno
    sql: ${TABLE}.can_view

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: security_point_name
    sql: ${TABLE}.security_point_name

  - measure: count
    type: count
    drill_fields: [id, security_point_name, access_type.access_type_id, access_type.access_type_name]

