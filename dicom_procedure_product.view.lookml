- view: dicom_procedure_product
  fields:

  - dimension: dicom_procedure_product_id
    primary_key: true
    type: int
    sql: ${TABLE}.dicom_procedure_product_id

  - dimension: dicom_procedure_id
    type: int
    # hidden: true
    sql: ${TABLE}.dicom_procedure_id

  - dimension: name
    type: int
    sql: ${TABLE}.name

  - measure: count
    type: count
    drill_fields: [dicom_procedure_product_id, name, dicom_procedure.dicom_procedure_id]

