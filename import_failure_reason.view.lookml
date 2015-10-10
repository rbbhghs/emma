- view: import_failure_reason
  fields:

  - dimension: import_failure_reason_id
    primary_key: true
    type: int
    sql: ${TABLE}.import_failure_reason_id

  - dimension: import_failure_reason
    sql: ${TABLE}.import_failure_reason

  - dimension: import_failure_reason_handle
    sql: ${TABLE}.import_failure_reason_handle

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - measure: count
    type: count
    drill_fields: [import_failure_reason_id, failed_patient_import.count]

