- view: mime_type
  fields:

  - dimension: id
    primary_key: true
    type: int
    sql: ${TABLE}.id

  - dimension: mimetype
    sql: ${TABLE}.mimetype

  - dimension: subtype
    sql: ${TABLE}.subtype

  - measure: count
    type: count
    drill_fields: [id, document_upload.count]

