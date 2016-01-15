- view: treatment_cycle
  fields:

  - dimension: treatment_cycle_id
    primary_key: true
    type: int
    sql: ${TABLE}.treatment_cycle_id

  - dimension: close_form_id
    type: int
    sql: ${TABLE}.close_form_id

  - dimension: close_notes
    sql: ${TABLE}.close_notes

  - dimension_group: closed
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.closed

  - dimension: closed_by_id
    type: int
    sql: ${TABLE}.closed_by_id

  - dimension: comments
    sql: ${TABLE}.comments

  - dimension: diagnosis_type_id
    type: int
    sql: ${TABLE}.diagnosis_type_id

  - dimension_group: earliest_reasonable_offer
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.earliest_reasonable_offer

  - dimension: insurance_authorisation_code
    sql: ${TABLE}.insurance_authorisation_code

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension_group: opened
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.opened

  - dimension: opened_by_id
    type: int
    sql: ${TABLE}.opened_by_id

  - dimension: owner_id
    type: int
    sql: ${TABLE}.owner_id

  - dimension_group: patient_available
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.patient_available

  - dimension: patient_id
    type: int
    # hidden: true
    sql: ${TABLE}.patient_id

  - dimension: preferred_practitioner_id
    type: int
    sql: ${TABLE}.preferred_practitioner_id

  - dimension: problem_body_part_id
    type: int
    sql: ${TABLE}.problem_body_part_id

  - dimension: problem_further_info_id
    type: int
    sql: ${TABLE}.problem_further_info_id

  - dimension: problem_symptomatic_area_id
    type: int
    sql: ${TABLE}.problem_symptomatic_area_id

  - dimension: status
    sql: ${TABLE}.status

  - dimension: treatment_cycle_close_type_id
    type: int
    sql: ${TABLE}.treatment_cycle_close_type_id

  - dimension: treatment_cycle_name
    sql: ${TABLE}.treatment_cycle_name

  - measure: count
    type: count
    drill_fields: detail*
    
  - measure: number_of_treatments
    label: '# of Treatments'
    type: count_distinct
    sql: ${treatment_cycle_id}  
    
  - measure: number_of_patients
    label: '# of Patients'
    type: count_distinct
    sql: ${patient_id}   


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - treatment_cycle_id
    - treatment_cycle_name
    - patient.preferred_forename
    - patient.preferred_middlename
    - patient.preferred_surname
    - patient.provided_gp_name
    - patient.company_contact_name
    - patient.nickname
    - patient.source_name
    - appointment.count

