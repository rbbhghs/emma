- view: individual_type_access_link
  fields:

  - dimension: access_type_id
    type: int
    # hidden: true
    sql: ${TABLE}.access_type_id

  - dimension: individual_type_id
    type: int
    # hidden: true
    sql: ${TABLE}.individual_type_id

  - measure: count
    type: count
    drill_fields: [access_type.access_type_id, access_type.access_type_name, individual_type.individual_type_id, individual_type.individual_type_name]

