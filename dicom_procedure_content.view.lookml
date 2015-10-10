- view: dicom_procedure_content
  fields:

  - dimension: dicom_procedure_content_id
    primary_key: true
    type: int
    sql: ${TABLE}.dicom_procedure_content_id

  - dimension: content
    sql: ${TABLE}.content

  - dimension: dicom_procedure_id
    type: int
    # hidden: true
    sql: ${TABLE}.dicom_procedure_id

  - dimension: dicom_procedure_tag_id
    type: int
    # hidden: true
    sql: ${TABLE}.dicom_procedure_tag_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    type: int
    sql: ${TABLE}.last_modified_by

  - dimension: location_id
    type: int
    # hidden: true
    sql: ${TABLE}.location_id

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - dicom_procedure_content_id
    - dicom_procedure_tag.dicom_procedure_tag_id
    - dicom_procedure_tag.name
    - dicom_procedure.dicom_procedure_id
    - location.location_name
    - location.billing_location_id

