- view: emr_section
  fields:

  - dimension: emr_section_id
    primary_key: true
    type: int
    sql: ${TABLE}.emr_section_id

  - dimension: copy_left_to_right_message
    sql: ${TABLE}.copy_left_to_right_message

  - dimension: copy_right_to_left_message
    sql: ${TABLE}.copy_right_to_left_message

  - dimension: emr_page_id
    type: int
    # hidden: true
    sql: ${TABLE}.emr_page_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: layout_type
    type: int
    sql: ${TABLE}.layout_type

  - dimension: left_column_name
    sql: ${TABLE}.left_column_name

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: pane_number
    type: int
    sql: ${TABLE}.pane_number

  - dimension: right_column_name
    sql: ${TABLE}.right_column_name

  - dimension: section_name
    sql: ${TABLE}.section_name

  - dimension: section_number
    type: int
    sql: ${TABLE}.section_number

  - dimension: static
    type: yesno
    sql: ${TABLE}.static

  - dimension: suppress_history
    type: yesno
    sql: ${TABLE}.suppress_history

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - emr_section_id
    - section_name
    - left_column_name
    - right_column_name
    - emr_page.page_name
    - emr_page.from_emr_page_id
    - emr_question.count

