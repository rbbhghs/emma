- view: appointment_type
  fields:

  - dimension: appointment_type_id
    primary_key: true
    type: int
    sql: ${TABLE}.appointment_type_id

  - dimension: appointment_type_category_id
    type: int
    # hidden: true
    sql: ${TABLE}.appointment_type_category_id

  - dimension: appointment_type_name
    sql: ${TABLE}.appointment_type_name

  - dimension: appointment_type_name_short
    sql: ${TABLE}.appointment_type_name_short

  - dimension: book_online
    type: yesno
    sql: ${TABLE}.book_online

  - dimension: book_online_unregistered
    type: yesno
    sql: ${TABLE}.book_online_unregistered

  - dimension: booking_information
    sql: ${TABLE}.booking_information

  - dimension: combine_emr_tabs
    type: yesno
    sql: ${TABLE}.combine_emr_tabs

  - dimension: come_early_for_preparations
    type: yesno
    sql: ${TABLE}.come_early_for_preparations

  - dimension: complete_a_safety_questionnaire
    type: yesno
    sql: ${TABLE}.complete_a_safety_questionnaire

  - dimension: complete_a_safety_questionnaire_form_id
    type: int
    sql: ${TABLE}.complete_a_safety_questionnaire_form_id

  - dimension: complete_pre_scan_questionnaire
    type: yesno
    sql: ${TABLE}.complete_pre_scan_questionnaire

  - dimension: complete_pre_scan_questionnaire_form_id
    type: int
    sql: ${TABLE}.complete_pre_scan_questionnaire_form_id

  - dimension: contract_id
    type: int
    # hidden: true
    sql: ${TABLE}.contract_id

  - dimension: copy_of_id
    type: int
    sql: ${TABLE}.copy_of_id

  - dimension: default_review_speciality_id
    type: int
    sql: ${TABLE}.default_review_speciality_id

  - dimension: default_reviewer_id
    type: int
    sql: ${TABLE}.default_reviewer_id

  - dimension: email_comments
    sql: ${TABLE}.email_comments

  - dimension: encounter_type_id
    type: int
    sql: ${TABLE}.encounter_type_id

  - dimension: family_notes
    sql: ${TABLE}.family_notes

  - dimension: fast
    type: yesno
    sql: ${TABLE}.fast

  - dimension: fast_comment
    sql: ${TABLE}.fast_comment

  - dimension: feedback_form_type_id
    type: int
    sql: ${TABLE}.feedback_form_type_id

  - dimension: fit_first_id
    type: int
    sql: ${TABLE}.fit_first_id

  - dimension: hide_name_on_insurance_invoice
    type: yesno
    sql: ${TABLE}.hide_name_on_insurance_invoice

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: participant_count
    type: int
    sql: ${TABLE}.participant_count

  - dimension: primary_participant_id
    type: int
    sql: ${TABLE}.primary_participant_id

  - dimension: primary_participant_index
    type: int
    sql: ${TABLE}.primary_participant_index

  - dimension: product_id
    type: int
    # hidden: true
    sql: ${TABLE}.product_id

  - dimension: recallable
    type: yesno
    sql: ${TABLE}.recallable

  - dimension: requires_injection
    type: yesno
    sql: ${TABLE}.requires_injection

  - dimension: requires_injection_comment
    sql: ${TABLE}.requires_injection_comment

  - dimension: requires_review
    type: yesno
    sql: ${TABLE}.requires_review

  - dimension: review_criteria
    sql: ${TABLE}.review_criteria

  - dimension: review_hours
    type: int
    sql: ${TABLE}.review_hours

  - dimension: review_report_type_id
    type: int
    sql: ${TABLE}.review_report_type_id

  - dimension: section_count
    type: int
    sql: ${TABLE}.section_count

  - dimension: appointment_type_status
    sql: ${TABLE}.status

  - dimension: superseded_by_id
    type: int
    sql: ${TABLE}.superseded_by_id

  - dimension: type_comments
    sql: ${TABLE}.type_comments

  - dimension: variable_length
    type: yesno
    sql: ${TABLE}.variable_length

  - dimension: variable_length_default
    type: int
    sql: ${TABLE}.variable_length_default

  - dimension: variable_length_max
    type: int
    sql: ${TABLE}.variable_length_max

  - dimension: variable_length_multiple
    type: int
    sql: ${TABLE}.variable_length_multiple

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - appointment_type_id
    - appointment_type_name
    - appointment_type_category.appointment_type_category_id
    - appointment_type_category.appointment_type_category_name
    - product.product_id
    - product.product_name
    - contract.contract_id
    - contract.contract_name
    - appointment.count
    - appointment_booklet_type_appointment_type.count
    - appointment_search.count
    - appointment_type_observation_service.count
    - appointment_type_participant.count
    - appointment_type_preparation.count
    - appointment_type_problem.count
    - appointment_type_review_speciality.count
    - appointment_type_section.count
    - cab_service.count
    - clinical_report_type_appointment_type.count
    - form_type_appointment_type.count
    - itb_invitation.count
    - product.count
    - recall.count
    - recall_rule.count
    - report_scheduler.count
    - treatment_cycle_referral.count

