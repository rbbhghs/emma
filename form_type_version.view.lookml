- view: form_type_version
  fields:

  - dimension: form_type_version_id
    primary_key: true
    type: int
    sql: ${TABLE}.form_type_version_id

  - dimension: anonymous
    type: yesno
    sql: ${TABLE}.anonymous

  - dimension: created_by_id
    type: int
    sql: ${TABLE}.created_by_id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_date

  - dimension: dp_link
    sql: ${TABLE}.dp_link

  - dimension: form_type_id
    type: int
    # hidden: true
    sql: ${TABLE}.form_type_id

  - dimension: form_type_name
    sql: ${TABLE}.form_type_name

  - dimension: is_company_form
    type: int
    sql: ${TABLE}.is_company_form

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

  - dimension: patient_accessible
    type: yesno
    sql: ${TABLE}.patient_accessible

  - dimension: save_whole_form
    type: yesno
    sql: ${TABLE}.save_whole_form

  - dimension: status
    sql: ${TABLE}.status

  - dimension: version_number
    type: int
    sql: ${TABLE}.version_number

  - dimension: view_history_access_mask
    type: int
    sql: ${TABLE}.view_history_access_mask

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - form_type_version_id
    - form_type_name
    - form_type.form_type_id
    - company_form.count
    - c_plan_form.count
    - emr2_clinical_form.count
    - emr2_custom_annotation_link.count
    - emr2_request_form.count
    - form.count
    - form_type_version_question.count
    - form_type_version_section.count

