- view: template_files
  fields:

  - dimension: template_file_id
    primary_key: true
    type: int
    sql: ${TABLE}.template_file_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: rel_path
    sql: ${TABLE}.rel_path

  - dimension_group: upload
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.upload_time

  - dimension: uploader_id
    type: int
    sql: ${TABLE}.uploader_id

  - measure: count
    type: count
    drill_fields: [template_file_id]

