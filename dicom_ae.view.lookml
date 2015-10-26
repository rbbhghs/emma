- view: dicom_ae
  fields:

  - dimension: dicom_ae_id
    primary_key: true
    type: int
    sql: ${TABLE}.dicom_ae_id

  - dimension: ae_title
    sql: ${TABLE}.ae_title

  - dimension: host_name
    sql: ${TABLE}.host_name

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modality
    sql: ${TABLE}.modality

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: port
    type: int
    sql: ${TABLE}.port

  - dimension: station_name
    sql: ${TABLE}.station_name

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - dicom_ae_id
    - station_name
    - host_name
    - appointment_section_study.count
    - company_contact.count
    - reporting_group.count
    - room.count

