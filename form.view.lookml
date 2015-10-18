- view: form
  fields:

  - dimension: form_id
    primary_key: true
    type: int
    sql: ${TABLE}.form_id

  - dimension: appointment_id
    type: int
    # hidden: true
    sql: ${TABLE}.appointment_id

  - dimension: created_by_id
    type: int
    sql: ${TABLE}.created_by_id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_date

  - dimension: form_type_version_id
    type: int
    # hidden: true
    sql: ${TABLE}.form_type_version_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: locked
    type: int
    sql: ${TABLE}.locked

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: patient_accessible
    type: yesno
    sql: ${TABLE}.patient_accessible

  - dimension: patient_id
    type: int
    # hidden: true
    sql: ${TABLE}.patient_id

  - dimension: status
    sql: ${TABLE}.status

  - dimension: treatment_cycle_referral_id
    type: int
    # hidden: true
    sql: ${TABLE}.treatment_cycle_referral_id

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - form_id
    - form_type_version.form_type_version_id
    - form_type_version.form_type_name
    - patient.source_name
    - patient.nickname
    - patient.company_contact_name
    - patient.preferred_forename
    - patient.preferred_middlename
    - patient.preferred_surname
    - patient.provided_gp_name
    - appointment.appointment_id
    - treatment_cycle_referral.treatment_cycle_referral_id
    - form_question_instance.count

