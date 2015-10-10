- view: study_identifier
  fields:

  - dimension: study_identifier_id
    primary_key: true
    type: int
    sql: ${TABLE}.study_identifier_id

  - dimension: accession_number
    sql: ${TABLE}.accession_number

  - dimension: id_domain_id
    type: int
    # hidden: true
    sql: ${TABLE}.id_domain_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: pacs_order_id
    type: int
    # hidden: true
    sql: ${TABLE}.pacs_order_id

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: [study_identifier_id, pacs_order.id, id_domain.id_domain_id, id_domain.name]

