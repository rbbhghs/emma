- view: router_dicom_ae

  fields:
  - measure: count
    type: count
    drill_fields: detail*

  - dimension: id
    type: int
    sql: ${TABLE}.id

  - dimension: title
    type: string
    sql: ${TABLE}.title

  - dimension: hostname
    type: string
    sql: ${TABLE}.hostname

  - dimension: port
    type: string
    sql: ${TABLE}.port

  sets:
    detail:
      - id
      - title
      - hostname
      - port