- view: paper_file
  fields:

  - dimension: appointment_section_study_id
    type: int
    # hidden: true
    sql: ${TABLE}.appointment_section_study_id

  - dimension: description
    sql: ${TABLE}.description

  - dimension: description_xml
    sql: ${TABLE}.description_xml

  - dimension_group: document
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.document_date

  - dimension: extension
    sql: ${TABLE}.extension

  - dimension: file_id
    type: int
    sql: ${TABLE}.file_id

  - dimension: folder_id
    type: int
    sql: ${TABLE}.folder_id

  - dimension: generated_name
    sql: ${TABLE}.generated_name

  - dimension: given_name
    sql: ${TABLE}.given_name

  - dimension: is_set
    type: yesno
    sql: ${TABLE}.is_set

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: paper_file_type_id
    type: int
    # hidden: true
    sql: ${TABLE}.paper_file_type_id

  - dimension: patient_id
    type: int
    # hidden: true
    sql: ${TABLE}.patient_id

  - dimension: pending
    type: yesno
    sql: ${TABLE}.pending

  - dimension: pool_skip_count
    type: int
    sql: ${TABLE}.pool_skip_count

  - dimension: position
    type: int
    sql: ${TABLE}.position

  - dimension: review_required
    type: yesno
    sql: ${TABLE}.review_required

  - dimension_group: reviewed
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.reviewed

  - dimension: reviewed_by_id
    type: int
    sql: ${TABLE}.reviewed_by_id

  - dimension: sensitive_file
    type: yesno
    sql: ${TABLE}.sensitive_file

  - dimension: set_id
    type: int
    sql: ${TABLE}.set_id

  - dimension: shared_by
    type: int
    sql: ${TABLE}.shared_by

  - dimension: trashed
    type: yesno
    sql: ${TABLE}.trashed

  - dimension: upload_id
    type: int
    sql: ${TABLE}.upload_id

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - given_name
    - generated_name
    - appointment_section_study.appointment_section_study_id
    - paper_file_type.paper_file_type_name
    - paper_file_type.paper_file_type_id
    - patient.preferred_forename
    - patient.preferred_middlename
    - patient.preferred_surname
    - patient.company_contact_name
    - patient.nickname
    - patient.provided_gp_name
    - patient.source_name
    - emr2_report_setting.count
    - paper_file_comment_revision.count

