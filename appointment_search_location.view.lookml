- view: appointment_search_location
  fields:

  - dimension: appointment_search_location_id
    primary_key: true
    type: int
    sql: ${TABLE}.appointment_search_location_id

  - dimension: appointment_search_id
    type: int
    # hidden: true
    sql: ${TABLE}.appointment_search_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: location_id
    type: int
    # hidden: true
    sql: ${TABLE}.location_id

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - measure: count
    type: count
    drill_fields: [appointment_search_location_id, appointment_search.appointment_search_id, location.location_name, location.billing_location_id]

