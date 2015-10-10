- view: patient_letter_template_associated_document
  fields:

  - dimension: patient_letter_template_associated_document_id
    primary_key: true
    type: int
    sql: ${TABLE}.patient_letter_template_associated_document_id

  - dimension: document_name
    sql: ${TABLE}.document_name

  - dimension: filter_by
    type: int
    sql: ${TABLE}.filter_by

  - dimension: filter_for
    type: int
    sql: ${TABLE}.filter_for

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: letter_template_id
    type: int
    sql: ${TABLE}.letter_template_id

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: [patient_letter_template_associated_document_id, document_name]

