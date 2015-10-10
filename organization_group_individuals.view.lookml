- view: organization_group_individuals
  fields:

  - dimension: organization_group_individual_id
    primary_key: true
    type: int
    sql: ${TABLE}.organization_group_individual_id

  - dimension: individual_id
    type: int
    # hidden: true
    sql: ${TABLE}.individual_id

  - dimension: is_primary
    type: yesno
    sql: ${TABLE}.is_primary

  - dimension: organization_group_id
    type: int
    # hidden: true
    sql: ${TABLE}.organization_group_id

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - organization_group_individual_id
    - organization_group.organization_group_id
    - organization_group.organization_group_name
    - individual.individual_id
    - individual.forename
    - individual.middlename
    - individual.surname

