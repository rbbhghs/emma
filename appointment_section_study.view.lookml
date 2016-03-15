- view: appointment_section_study
  fields:

  - dimension: appointment_section_study_id
    primary_key: true
    type: int
    sql: ${TABLE}.appointment_section_study_id

  - dimension: appointment_section_id
    type: int
    hidden: true
    sql: ${TABLE}.appointment_section_id

  - dimension: dicom_ae_id
    type: int
    hidden: true
    sql: ${TABLE}.dicom_ae_id

  - dimension: dicom_procedure_id
    type: int
    hidden: true
    sql: ${TABLE}.dicom_procedure_id

  - dimension_group: last_modified
    type: time
    hidden: true
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    hidden: true
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    hidden: true
    sql: ${TABLE}.modified_by_function

  - dimension: pacs_order_id
    type: int
    # hidden: true
    sql: ${TABLE}.pacs_order_id

  - dimension: report_id
    type: int
    hidden: true
    sql: ${TABLE}.report_id

  - dimension: reporting_group_id
    type: int
    hidden: true
    sql: ${TABLE}.reporting_group_id

  - dimension: reviewer_id
    type: int
    hidden: true
    sql: ${TABLE}.reviewer_id

  - dimension: secondary_reporting_group_id
    type: int
    hidden: true
    sql: ${TABLE}.secondary_reporting_group_id

  - dimension: secondary_reviewer_id
    type: int
    hidden: true
    sql: ${TABLE}.secondary_reviewer_id

  - dimension: appointment_section_study_status
    sql: case when ${TABLE}.status = 'A' then 'Active' when ${TABLE}.status = 'C' then 'Cancelled' when ${TABLE}.status = 'N' then 'Cancelled' else 'Unknown' End

  - dimension: study_uid
    sql: ${TABLE}.study_uid

  - dimension: study_uid_desc
    sql: CASE WHEN ${TABLE}.study_uid is not null then 'Matched' else 'Unmatched' End

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - appointment_section_study_id
    - appointment_section.appointment_section_id
    - dicom_ae.dicom_ae_id
    - dicom_ae.station_name
    - dicom_ae.host_name
    - dicom_procedure.dicom_procedure_id
    - report.report_id
    - report.report_name
    - pacs_order.id
    - reporting_group.reporting_group_id
    - reporting_group.reporting_group_name
    - appointment_section_study_clinical_report.count
    - pacs_message.count
    - paper_file.count

