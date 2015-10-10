- view: reporting_group
  fields:

  - dimension: reporting_group_id
    primary_key: true
    type: int
    sql: ${TABLE}.reporting_group_id

  - dimension: dicom_ae_id
    type: int
    # hidden: true
    sql: ${TABLE}.dicom_ae_id

  - dimension: hl7_connection_id
    type: int
    # hidden: true
    sql: ${TABLE}.hl7_connection_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: reporting_group_name
    sql: ${TABLE}.reporting_group_name

  - dimension: second_read_provider
    type: yesno
    sql: ${TABLE}.second_read_provider

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - reporting_group_id
    - reporting_group_name
    - dicom_ae.dicom_ae_id
    - dicom_ae.station_name
    - dicom_ae.host_name
    - hl7_connection.hl7_connection_id
    - hl7_connection.hl7_connection_name
    - hl7_connection.dicom_mirth_host_name
    - hl7_connection.facility_name
    - hl7_connection.application_name
    - appointment_section_study.count
    - procedure_billing_group_policy.count
    - reviewer_reporting_group.count
    - treatment_cycle_referral_procedure.count

