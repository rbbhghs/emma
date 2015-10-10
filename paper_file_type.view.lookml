- view: paper_file_type
  fields:

  - dimension: paper_file_type_id
    primary_key: true
    type: int
    sql: ${TABLE}.paper_file_type_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: paper_file_type_name
    sql: ${TABLE}.paper_file_type_name

  - dimension: require_review
    type: yesno
    sql: ${TABLE}.require_review

  - dimension: sort_order
    type: int
    sql: ${TABLE}.sort_order

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - paper_file_type_id
    - paper_file_type_name
    - emr2_report_setting.count
    - form_question_version.count
    - form_response_file.count
    - paper_file.count

