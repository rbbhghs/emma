- view: paper_archive_upload
  fields:

  - dimension: file_name
    sql: ${TABLE}.file_name

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension_group: upload
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.upload_date

  - dimension: upload_id
    type: int
    sql: ${TABLE}.upload_id

  - dimension: uploader_id
    type: int
    sql: ${TABLE}.uploader_id

  - measure: count
    type: count
    drill_fields: [file_name]

