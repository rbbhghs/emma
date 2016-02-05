- view: document_upload
  fields:

  - dimension: id
    primary_key: true
    type: int
    sql: ${TABLE}.id

  - dimension: content_sha224
    sql: ${TABLE}.content_sha224

  - dimension: destination_ae_id
    type: int
    sql: ${TABLE}.destination_ae_id

  - dimension: filename
    sql: ${TABLE}.filename

  - dimension: mime_type_id
    type: int
    # hidden: true
    sql: ${TABLE}.mime_type_id

  - dimension_group: received
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.received

  - dimension: status
    type: int
    sql: ${TABLE}.status

  - dimension: study_id
    type: int
    # hidden: true
    sql: ${TABLE}.study_id

  - dimension: study_series_id
    type: int
    # hidden: true
    sql: ${TABLE}.study_series_id

  - measure: count
    type: count
    drill_fields: [id, filename, study_series.id, study.id, mime_type.id]

