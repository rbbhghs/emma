- view: appointment_search_result
  fields:

  - dimension: appointment_search_result_id
    primary_key: true
    type: int
    sql: ${TABLE}.appointment_search_result_id

  - dimension: appointment_search_id
    type: int
    # hidden: true
    sql: ${TABLE}.appointment_search_id

  - dimension_group: datetime
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.datetime

  - dimension: diary_id
    type: int
    # hidden: true
    sql: ${TABLE}.diary_id

  - dimension: distance
    type: number
    sql: ${TABLE}.distance

  - dimension: is_first_available
    type: int
    sql: ${TABLE}.is_first_available

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

  - dimension: practitioner_id
    type: int
    # hidden: true
    sql: ${TABLE}.practitioner_id

  - dimension: sort_order
    type: int
    sql: ${TABLE}.sort_order

  - measure: count
    type: count
    drill_fields: [appointment_search_result_id, appointment_search.appointment_search_id, location.location_name, location.billing_location_id, diary.diary_id]

