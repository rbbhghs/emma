- view: dicom_procedure_tag
  fields:

  - dimension: dicom_procedure_tag_id
    primary_key: true
    type: int
    sql: ${TABLE}.dicom_procedure_tag_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    type: int
    sql: ${TABLE}.last_modified_by

  - dimension: name
    sql: ${TABLE}.name

  - measure: count
    type: count
    drill_fields: [dicom_procedure_tag_id, name, dicom_procedure_content.count]

