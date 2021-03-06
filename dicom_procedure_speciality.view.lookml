- view: dicom_procedure_speciality
  fields:

  - dimension: dicom_procedure_speciality_id
    primary_key: true
    type: int
    sql: ${TABLE}.dicom_procedure_speciality_id

  - dimension: dicom_procedure_id
    type: int
    # hidden: true
    sql: ${TABLE}.dicom_procedure_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: speciality_id
    type: int
    # hidden: true
    sql: ${TABLE}.speciality_id

  - measure: count
    type: count
    drill_fields: [dicom_procedure_speciality_id, dicom_procedure.dicom_procedure_id, speciality.speciality_id, speciality.speciality_name]

