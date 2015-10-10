- view: patient_merge_log_other
  fields:

  - dimension: patient_merge_log_other_id
    primary_key: true
    type: int
    sql: ${TABLE}.patient_merge_log_other_id

  - dimension: column_name
    sql: ${TABLE}.column_name

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: patient_id
    type: int
    # hidden: true
    sql: ${TABLE}.patient_id

  - dimension: patient_id_old
    type: int
    sql: ${TABLE}.patient_id_old

  - dimension: row_id
    type: int
    sql: ${TABLE}.row_id

  - dimension: table_name
    sql: ${TABLE}.table_name

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - patient_merge_log_other_id
    - table_name
    - column_name
    - patient.source_name
    - patient.nickname
    - patient.company_contact_name
    - patient.preferred_forename
    - patient.preferred_middlename
    - patient.preferred_surname
    - patient.provided_gp_name

