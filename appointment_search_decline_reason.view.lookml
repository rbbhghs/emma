- view: appointment_search_decline_reason
  fields:

  - dimension: appointment_search_decline_reason_id
    primary_key: true
    type: int
    sql: ${TABLE}.appointment_search_decline_reason_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: reason_text
    sql: ${TABLE}.reason_text

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: [appointment_search_decline_reason_id, appointment_search.count]

