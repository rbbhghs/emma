- view: patient_letter
  fields:

  - dimension: appointment_id
    type: int
    # hidden: true
    sql: ${TABLE}.appointment_id

  - dimension: batch_print
    type: yesno
    sql: ${TABLE}.batch_print

  - dimension: creator_id
    type: int
    sql: ${TABLE}.creator_id

  - dimension: emr2_note_entry_id
    type: int
    # hidden: true
    sql: ${TABLE}.emr2_note_entry_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: letter_id
    type: int
    sql: ${TABLE}.letter_id

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

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
    - patient.source_name
    - patient.nickname
    - patient.company_contact_name
    - patient.preferred_forename
    - patient.preferred_middlename
    - patient.preferred_surname
    - patient.provided_gp_name
    - treatment_cycle_referral.treatment_cycle_referral_id
    - appointment.appointment_id
    - emr2_note_entry.emr2_note_entry_id
    - emr2_note_entry.entry_name

