- view: clinical_report
  fields:

  - dimension: appointment_id
    type: int
    # hidden: true
    sql: ${TABLE}.appointment_id

  - dimension: appointment_review_id
    type: int
    # hidden: true
    sql: ${TABLE}.appointment_review_id

  - dimension: copy_to_id
    type: int
    sql: ${TABLE}.copy_to_id

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

  - dimension: report_id
    type: int
    # hidden: true
    sql: ${TABLE}.report_id

  - dimension: report_type_version_id
    type: int
    sql: ${TABLE}.report_type_version_id

  - dimension: review_report
    type: yesno
    sql: ${TABLE}.review_report

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - report.report_id
    - report.report_name
    - appointment.appointment_id
    - patient.source_name
    - patient.nickname
    - patient.company_contact_name
    - patient.preferred_forename
    - patient.preferred_middlename
    - patient.preferred_surname
    - patient.provided_gp_name
    - appointment_review.appointment_review_id
    - appointment_section_study_clinical_report.count

