- view: external_practitioner
  fields:

  - dimension: accepts_fax
    type: int
    sql: ${TABLE}.accepts_fax

  - dimension: autopost_required
    type: yesno
    sql: ${TABLE}.autopost_required

  - dimension: external_practice_id
    type: int
    hidden: true
    sql: ${TABLE}.external_practice_id

  - dimension: gp_code
    sql: ${TABLE}.gp_code

  - dimension: individual_id
    type: int
    hidden: true
    primary_key: true
    sql: ${TABLE}.individual_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    hidden: true
    sql: ${TABLE}.last_modified_by

  - dimension: list_size
    type: int
    sql: ${TABLE}.list_size

  - dimension: modified_by_function
    hidden: true
    sql: ${TABLE}.modified_by_function

  - dimension: nhs_number
    type: int
    sql: ${TABLE}.nhs_number

  - dimension: notes
    sql: ${TABLE}.notes

  - dimension: patient_search_mode_id
    type: int
    hidden: true
    sql: ${TABLE}.patient_search_mode_id

  - dimension: practitioner_type_id
    type: int
    hidden: true
    sql: ${TABLE}.practitioner_type_id

  - dimension: preferred_reviewer_id
    type: int
    hidden: true
    sql: ${TABLE}.preferred_reviewer_id

  - dimension: ris_id
    sql: ${TABLE}.ris_id

  - dimension: surgery
    sql: ${TABLE}.surgery

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - individual.surname
    - individual.middlename
    - individual.forename
    - individual.individual_id
    - practitioner_type.practitioner_type_name
    - practitioner_type.practitioner_type_id
    - external_practice.external_practice_id
    - external_practice.practice_name
    - event.count

