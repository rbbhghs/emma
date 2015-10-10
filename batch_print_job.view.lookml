- view: batch_print_job
  fields:

  - dimension: batch_type_id
    type: int
    sql: ${TABLE}.batch_type_id

  - dimension_group: date
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.date

  - dimension: done_by
    type: int
    sql: ${TABLE}.done_by

  - dimension: file_name
    sql: ${TABLE}.file_name

  - dimension: file_present
    type: yesno
    sql: ${TABLE}.file_present

  - dimension: job_id
    type: int
    sql: ${TABLE}.job_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: letter_file_name_list
    sql: ${TABLE}.letter_file_name_list

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - measure: count
    type: count
    drill_fields: [file_name, patient_letter_revision.count]

