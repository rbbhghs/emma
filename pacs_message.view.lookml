- view: pacs_message
  fields:

  - dimension: pacs_message_id
    primary_key: true
    type: int
    hidden: true
    sql: ${TABLE}.pacs_message_id

  - dimension: accession_number
    sql: ${TABLE}.accession_number

  - dimension: application_name
    sql: ${TABLE}.application_name

  - dimension: appointment_id
    type: int
    # hidden: true
    sql: ${TABLE}.appointment_id

  - dimension: appointment_section_study_id
    type: int
    # hidden: true
    sql: ${TABLE}.appointment_section_study_id

  - dimension: content_type
    sql: ${TABLE}.content_type

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created

  - dimension: document_completion_status
    sql: ${TABLE}.document_completion_status

  - dimension: external_document_id
    # hidden: true
    sql: ${TABLE}.external_document_id

  - dimension: facility_name
    sql: ${TABLE}.facility_name

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: medical_record_number
    sql: ${TABLE}.medical_record_number

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: order_number
    type: int
    sql: ${TABLE}.order_number

  - dimension: order_status
    sql: ${TABLE}.order_status

  - dimension_group: patient_dob
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.patient_dob

  - dimension: patient_forename
    sql: ${TABLE}.patient_forename

  - dimension: patient_id
    type: int
    # hidden: true
    sql: ${TABLE}.patient_id

  - dimension: patient_sex
    sql: ${TABLE}.patient_sex

  - dimension: patient_surname
    sql: ${TABLE}.patient_surname

  - dimension: patient_title
    sql: ${TABLE}.patient_title

  - dimension: priority_code_id
    type: int
    sql: ${TABLE}.priority_code_id

  - dimension: report_content
    sql: ${TABLE}.report_content

  - dimension: report_id
    type: int
    # hidden: true
    sql: ${TABLE}.report_id

  - dimension_group: reported
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.reported

  - dimension: reporter_forename
    sql: ${TABLE}.reporter_forename

  - dimension: reporter_id
    sql: ${TABLE}.reporter_id

  - dimension: reporter_surname
    sql: ${TABLE}.reporter_surname

  - dimension: reporter_title
    sql: ${TABLE}.reporter_title

  - dimension: requested_procedure_id
    type: int
    sql: ${TABLE}.requested_procedure_id

  - dimension: result_status
    sql: ${TABLE}.result_status

  - dimension: scheduled_step_id
    type: int
    sql: ${TABLE}.scheduled_step_id

  - dimension: secondary_reporter_forename
    sql: ${TABLE}.secondary_reporter_forename

  - dimension: secondary_reporter_id
    sql: ${TABLE}.secondary_reporter_id

  - dimension: secondary_reporter_surname
    sql: ${TABLE}.secondary_reporter_surname

  - dimension: secondary_reporter_title
    sql: ${TABLE}.secondary_reporter_title

  - dimension: study_uid
    sql: ${TABLE}.study_uid

  - dimension_group: transcribed
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.transcribed

  - dimension: transcriptionist_forename
    sql: ${TABLE}.transcriptionist_forename

  - dimension: transcriptionist_id
    sql: ${TABLE}.transcriptionist_id

  - dimension: transcriptionist_surname
    sql: ${TABLE}.transcriptionist_surname

  - dimension: transcriptionist_title
    sql: ${TABLE}.transcriptionist_title

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - pacs_message_id
    - secondary_reporter_surname
    - secondary_reporter_forename
    - application_name
    - facility_name
    - transcriptionist_surname
    - transcriptionist_forename
    - patient_surname
    - patient_forename
    - reporter_surname
    - reporter_forename
    - appointment.appointment_id
    - report.report_name
    - report.report_id
    - patient.preferred_forename
    - patient.preferred_middlename
    - patient.preferred_surname
    - patient.company_contact_name
    - patient.nickname
    - patient.provided_gp_name
    - patient.source_name
    - appointment_section_study.appointment_section_study_id

