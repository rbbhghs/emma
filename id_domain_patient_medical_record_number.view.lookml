- view: id_domain_patient_medical_record_number
  fields:

  - dimension: id_domain_patient_medical_record_number_id
    primary_key: true
    type: int
    sql: ${TABLE}.id_domain_patient_medical_record_number_id

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

  - dimension: patient_id
    type: int
    # hidden: true
    sql: ${TABLE}.patient_id

  - dimension: patient_medical_record_number
    sql: ${TABLE}.patient_medical_record_number

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - id_domain_patient_medical_record_number_id
    - patient.source_name
    - patient.nickname
    - patient.company_contact_name
    - patient.preferred_forename
    - patient.preferred_middlename
    - patient.preferred_surname
    - patient.provided_gp_name
    - id_domain.id_domain_id
    - id_domain.name

