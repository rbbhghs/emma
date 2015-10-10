- view: communication_preference_entity
  fields:

  - dimension: communication_preference_entity_id
    primary_key: true
    type: int
    sql: ${TABLE}.communication_preference_entity_id

  - dimension: contract_id
    type: int
    # hidden: true
    sql: ${TABLE}.contract_id

  - dimension: dispatch_method_id
    type: int
    sql: ${TABLE}.dispatch_method_id

  - dimension: document_type_id
    type: int
    sql: ${TABLE}.document_type_id

  - dimension: individual_id
    type: int
    # hidden: true
    sql: ${TABLE}.individual_id

  - dimension: individual_type_id
    type: int
    # hidden: true
    sql: ${TABLE}.individual_type_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - communication_preference_entity_id
    - individual.individual_id
    - individual.forename
    - individual.middlename
    - individual.surname
    - contract.contract_id
    - contract.contract_name
    - individual_type.individual_type_id
    - individual_type.individual_type_name

