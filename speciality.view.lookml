- view: speciality
  fields:

  - dimension: speciality_id
    primary_key: true
    type: int
    sql: ${TABLE}.speciality_id

  - dimension: enable_dental
    type: yesno
    sql: ${TABLE}.enable_dental

  - dimension: external_practitioner
    type: yesno
    sql: ${TABLE}.external_practitioner

  - dimension: hidden
    type: yesno
    sql: ${TABLE}.hidden

  - dimension: internal_practitioner
    type: yesno
    sql: ${TABLE}.internal_practitioner

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: refer_to
    type: yesno
    sql: ${TABLE}.refer_to

  - dimension: referral_close_form_type_id
    type: int
    sql: ${TABLE}.referral_close_form_type_id

  - dimension: referral_form_type_id
    type: int
    sql: ${TABLE}.referral_form_type_id

  - dimension: review
    type: yesno
    sql: ${TABLE}.review

  - dimension: review_criteria
    sql: ${TABLE}.review_criteria

  - dimension: speciality_name
    sql: ${TABLE}.speciality_name

  - dimension: speciality_name_short
    sql: ${TABLE}.speciality_name_short

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - speciality_id
    - speciality_name
    - appointment_search.count
    - appointment_type_participant_speciality.count
    - appointment_type_review_speciality.count
    - common_observation_service.count
    - dicom_procedure_speciality.count
    - doctor_speciality.count
    - emr2_referral.count
    - emr2_replacement.count
    - emr_page.count
    - form_type.count
    - individual_speciality.count
    - itb_invitation.count
    - referral_rejection_reason.count
    - specialty_form.count
    - treatment_cycle_close_type.count
    - triage_step.count

