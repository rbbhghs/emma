- view: company_office
  fields:

  - dimension: company_id
    type: int
    # hidden: true
    sql: ${TABLE}.company_id

  - dimension: head_office
    type: yesno
    sql: ${TABLE}.head_office

  - dimension: individual_id
    type: int
    # hidden: true
    sql: ${TABLE}.individual_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: office_name
    sql: ${TABLE}.office_name

  - dimension: office_reference
    sql: ${TABLE}.office_reference

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - office_name
    - individual.individual_id
    - individual.forename
    - individual.middlename
    - individual.surname
    - company.company_name
    - company_contact.count
    - failed_patient_import.count
    - individual.count
    - patient.count

