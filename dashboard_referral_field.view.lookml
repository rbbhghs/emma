- view: dashboard_referral_field
  fields:

  - dimension: dashboard_referral_field_id
    primary_key: true
    type: int
    sql: ${TABLE}.dashboard_referral_field_id

  - dimension: access_mask
    type: int
    sql: ${TABLE}.access_mask

  - dimension: create_only
    type: yesno
    sql: ${TABLE}.create_only

  - dimension: default_value
    type: int
    sql: ${TABLE}.default_value

  - dimension: description
    sql: ${TABLE}.description

  - dimension: field_id
    sql: ${TABLE}.field_id

  - dimension: field_name
    sql: ${TABLE}.field_name

  - dimension: hidden
    type: yesno
    sql: ${TABLE}.hidden

  - dimension: is_bool
    type: yesno
    sql: ${TABLE}.is_bool

  - dimension: is_search
    type: yesno
    sql: ${TABLE}.is_search

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: mandatory
    type: yesno
    sql: ${TABLE}.mandatory

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: sort_order
    type: int
    sql: ${TABLE}.sort_order

  - dimension: visible
    type: yesno
    sql: ${TABLE}.visible

  - measure: count
    type: count
    drill_fields: [dashboard_referral_field_id, field_name]

