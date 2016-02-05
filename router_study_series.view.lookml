- view: study_series
  fields:

  - dimension: id
    primary_key: true
    type: int
    hidden: true
    sql: ${TABLE}.id

  - dimension: img_count
    type: int
    sql: ${TABLE}.img_count

  - dimension: modality
    sql: ${TABLE}.modality

  - dimension: original
    type: yesno
    sql: ${TABLE}.original

  - dimension: required
    type: yesno
    sql: ${TABLE}.required

  - dimension: series_description
    sql: ${TABLE}.series_description

  - dimension: series_instance_uid
    sql: ${TABLE}.series_instance_uid

  - dimension: series_number
    type: int
    sql: ${TABLE}.series_number

  - dimension: study_id
    type: int
    hidden: true
    # hidden: true
    sql: ${TABLE}.study_id

  - measure: count
    type: count
    drill_fields: [id, study.id, document_upload.count, study_series_transfer.count]

