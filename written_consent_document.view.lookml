- view: written_consent_document
  fields:

  - dimension: written_consent_document_id
    primary_key: true
    type: int
    sql: ${TABLE}.written_consent_document_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: status
    sql: ${TABLE}.status

  - dimension: written_consent_document_name
    sql: ${TABLE}.written_consent_document_name

  - measure: count
    type: count
    drill_fields: [written_consent_document_id, written_consent_document_name, patient.count]

