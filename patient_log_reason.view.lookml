- view: patient_log_reason
  fields:

  - dimension: id
    primary_key: true
    type: int
    sql: ${TABLE}.id

  - dimension: comment_required
    type: int
    sql: ${TABLE}.comment_required

  - dimension: value
    sql: ${TABLE}.value

  - measure: count
    type: count
    drill_fields: [id]

