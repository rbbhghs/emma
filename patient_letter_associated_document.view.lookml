- view: patient_letter_associated_document
  fields:

  - dimension: patient_letter_associated_document_id
    primary_key: true
    type: int
    sql: ${TABLE}.patient_letter_associated_document_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: letter_id
    type: int
    sql: ${TABLE}.letter_id

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: [patient_letter_associated_document_id]

