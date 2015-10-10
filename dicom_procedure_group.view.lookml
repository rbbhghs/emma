- view: dicom_procedure_group
  fields:

  - dimension: dicom_procedure_group_id
    primary_key: true
    type: int
    sql: ${TABLE}.dicom_procedure_group_id

  - dimension: additional_area_price
    type: number
    sql: ${TABLE}.additional_area_price

  - dimension: areas1
    type: number
    sql: ${TABLE}.areas1

  - dimension: areas2
    type: number
    sql: ${TABLE}.areas2

  - dimension: areas3
    type: number
    sql: ${TABLE}.areas3

  - dimension: areas4
    type: number
    sql: ${TABLE}.areas4

  - dimension: areas5
    type: number
    sql: ${TABLE}.areas5

  - dimension: available_product_id
    type: int
    # hidden: true
    sql: ${TABLE}.available_product_id

  - dimension: currency
    sql: ${TABLE}.currency

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: name
    sql: ${TABLE}.name

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: [dicom_procedure_group_id, name, available_product.available_product_id, dicom_procedure_group_areas.count, dicom_procedure_group_override.count]

