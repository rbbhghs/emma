- view: study_sop_instance
  fields:

  - dimension: id
    primary_key: true
    type: int
    sql: ${TABLE}.id

  - dimension: content_sha224
    sql: ${TABLE}.content_sha224

  - dimension: sop_instance_uid
    sql: ${TABLE}.sop_instance_uid

  - dimension: study_id
    type: int
    # hidden: true
    sql: ${TABLE}.study_id

  - measure: count
    type: count
    drill_fields: [id, study.id]

