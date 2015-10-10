- view: emr_page
  fields:

  - dimension: from_emr_page_id
    primary_key: true
    type: int
    sql: ${TABLE}.from_emr_page_id

  - dimension: emr_page_id
    type: int
    # hidden: true
    sql: ${TABLE}.emr_page_id

  - dimension: historic
    type: yesno
    sql: ${TABLE}.historic

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: layout_type
    type: int
    sql: ${TABLE}.layout_type

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: modify_speciality_id
    type: int
    sql: ${TABLE}.modify_speciality_id

  - dimension: page_name
    sql: ${TABLE}.page_name

  - dimension: page_number
    type: int
    sql: ${TABLE}.page_number

  - dimension: page_type
    type: int
    sql: ${TABLE}.page_type

  - dimension: requires_validation
    type: yesno
    sql: ${TABLE}.requires_validation

  - dimension: response_date_question_id
    type: int
    sql: ${TABLE}.response_date_question_id

  - dimension: save_whole_page
    type: yesno
    sql: ${TABLE}.save_whole_page

  - dimension: speciality_id
    type: int
    # hidden: true
    sql: ${TABLE}.speciality_id

  - dimension: static
    type: yesno
    sql: ${TABLE}.static

  - dimension: status
    sql: ${TABLE}.status

  - dimension: validate_to_save
    type: yesno
    sql: ${TABLE}.validate_to_save

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - from_emr_page_id
    - page_name
    - emr_page.page_name
    - emr_page.from_emr_page_id
    - speciality.speciality_id
    - speciality.speciality_name
    - emr_page.count
    - emr_section.count
    - form_response.count
    - form_response_latest.count

