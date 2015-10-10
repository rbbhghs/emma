- view: import_process_method
  fields:

  - dimension: import_process_method_id
    primary_key: true
    type: int
    sql: ${TABLE}.import_process_method_id

  - dimension: import_process_method
    sql: ${TABLE}.import_process_method

  - dimension: import_process_method_handle
    sql: ${TABLE}.import_process_method_handle

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
    drill_fields: [import_process_method_id, import.count]

