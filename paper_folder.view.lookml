- view: paper_folder
  fields:

  - dimension: folder_id
    type: int
    sql: ${TABLE}.folder_id

  - dimension: folder_name
    sql: ${TABLE}.folder_name

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: parent_id
    type: int
    sql: ${TABLE}.parent_id

  - dimension: patient_id
    type: int
    # hidden: true
    sql: ${TABLE}.patient_id

  - dimension: pending
    type: yesno
    sql: ${TABLE}.pending

  - dimension: position
    type: int
    sql: ${TABLE}.position

  - dimension: special_type
    sql: ${TABLE}.special_type

  - dimension: upload_id
    type: int
    sql: ${TABLE}.upload_id

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - folder_name
    - patient.source_name
    - patient.nickname
    - patient.company_contact_name
    - patient.preferred_forename
    - patient.preferred_middlename
    - patient.preferred_surname
    - patient.provided_gp_name

