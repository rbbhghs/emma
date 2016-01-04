- view: patient
  fields:

  - dimension: activities
    sql: ${TABLE}.activities
    hidden: true

  - dimension: alternate_invoicee_id
    type: int
    sql: ${TABLE}.alternate_invoicee_id
    hidden: true

  - dimension: annual_frequency
    sql: ${TABLE}.annual_frequency

  - dimension: annual_reminder
    sql: ${TABLE}.annual_reminder
    hidden: true

  - dimension: balance
    type: number
    hidden: true
    sql: ${TABLE}.balance

  - dimension: barcode
    sql: ${TABLE}.barcode

  - dimension: birthplace
    hidden: true
    sql: ${TABLE}.birthplace

  - dimension: clinic_code
    sql: ${TABLE}.clinic_code
    hidden: true

  - dimension: comments
    sql: ${TABLE}.comments

  - dimension: comments_critical
    sql: ${TABLE}.comments_critical

  - dimension: comments_important
    sql: ${TABLE}.comments_important

  - dimension: company_contact_name
    hidden: true
    sql: ${TABLE}.company_contact_name

  - dimension: company_id
    type: int
    hidden: true
    sql: ${TABLE}.company_id

  - dimension: company_office_id
    type: int
    hidden: true
    sql: ${TABLE}.company_office_id

  - dimension: confidentiality_code
    sql: ${TABLE}.confidentiality_code

  - dimension: consent
    type: int
    hidden: true
    sql: ${TABLE}.consent

  - dimension_group: consent
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    hidden: true
    sql: ${TABLE}.consent_date

  - dimension: contact_method
    type: yesno
    hidden: true
    sql: ${TABLE}.contact_method

  - dimension: contract_id
    type: int
    hidden: true
    sql: ${TABLE}.contract_id

  - dimension: cost_centre
    sql: ${TABLE}.cost_centre

  - dimension: cost_code
    sql: ${TABLE}.cost_code

  - dimension_group: date_added
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.date_added

  - dimension: default_invoicee_id
    type: int
    hidden: true
    sql: ${TABLE}.default_invoicee_id

  - dimension: disability
    hidden: true
    sql: ${TABLE}.disability

  - dimension: eligibility_level
    sql: ${TABLE}.eligibility_level

  - dimension: email_marketing
    type: yesno
    sql: ${TABLE}.email_marketing

  - dimension: email_reminder_hours
    type: int
    sql: ${TABLE}.email_reminder_hours

  - dimension: employee_company_reference
    sql: ${TABLE}.employee_company_reference

  - dimension: employee_reference
    sql: ${TABLE}.employee_reference

  - dimension: employee_sequence_number
    type: int
    hidden: true
    sql: ${TABLE}.employee_sequence_number

  - dimension: employer_id
    type: int
    hidden: true
    sql: ${TABLE}.employer_id

  - dimension: enquiry_source_id
    type: int
    hidden: true
    sql: ${TABLE}.enquiry_source_id

  - dimension: entered_company
    hidden: true
    sql: ${TABLE}.entered_company

  - dimension: ethnicity
    type: yesno
    hidden: true
    sql: ${TABLE}.ethnicity

  - dimension: ethnicity_id
    type: int
    hidden: true
    sql: ${TABLE}.ethnicity_id

  - dimension: extended_eligibility_level
    hidden: true
    sql: ${TABLE}.extended_eligibility_level

  - dimension_group: extended_eligibility_level_end
    hidden: true
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.extended_eligibility_level_end

  - dimension_group: extended_eligibility_level_start
    hidden: true
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.extended_eligibility_level_start

  - dimension: gp
    hidden: true
    sql: ${TABLE}.gp

  - dimension: gp_id
    type: int
    hidden: true
    sql: ${TABLE}.gp_id

  - dimension: ibs_booking_id
    sql: ${TABLE}.ibs_booking_id

  - dimension: individual_id
    type: int
    primary_key: true
    hidden: true
    sql: ${TABLE}.individual_id

  - dimension_group: initial_payment
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.initial_payment_date

  - dimension: insurance_company_id
    type: int
    hidden: true
    sql: ${TABLE}.insurance_company_id

  - dimension: insurance_excess
    type: number
    sql: ${TABLE}.insurance_excess

  - dimension: insurance_policy_reference
    sql: ${TABLE}.insurance_policy_reference

  - dimension_group: insurance_renewal
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.insurance_renewal_date

  - dimension: interpreter_language
    sql: ${TABLE}.interpreter_language

  - dimension: issuing_company_id
    type: int
    hidden: true
    sql: ${TABLE}.issuing_company_id

  - dimension: job_title
    sql: ${TABLE}.job_title

  - dimension_group: joined_scheme
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.joined_scheme

  - dimension_group: last_annual
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    hidden: true
    sql: ${TABLE}.last_annual_date

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension_group: left_scheme
    type: time
    hidden: true
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.left_scheme

  - dimension: mags_and_clinical
    type: yesno
    sql: ${TABLE}.mags_and_clinical

  - dimension: mailshots
    type: yesno
    sql: ${TABLE}.mailshots

  - dimension: managing_practitioner_id
    type: int
    hidden: true
    sql: ${TABLE}.managing_practitioner_id

  - dimension: marital_status
    type: yesno
    sql: ${TABLE}.marital_status

  - dimension: max_visits_per_month
    hidden: true
    sql: ${TABLE}.max_visits_per_month

  - dimension: medical_record_number
    sql: ${TABLE}.medical_record_number

  - dimension: membership_cancellation_reason_id
    type: int
    hidden: true
    sql: ${TABLE}.membership_cancellation_reason_id

  - dimension: membership_status_id
    type: int
    hidden: true
    sql: ${TABLE}.membership_status_id

  - dimension: min_appointment_time
    sql: ${TABLE}.min_appointment_time

  - dimension: mobility_issues
    type: yesno
    sql: ${TABLE}.mobility_issues

  - dimension: modified_by_function
    hidden: true
    sql: ${TABLE}.modified_by_function

  - dimension: next_of_kin
    hidden: true
    sql: ${TABLE}.next_of_kin

  - dimension: nhs_number
    sql: ${TABLE}.nhs_number

  - dimension: nickname
    sql: ${TABLE}.nickname

  - dimension: no_insurance_company
    type: yesno
    hidden: true
    sql: ${TABLE}.no_insurance_company

  - dimension: no_recall
    type: int
    sql: ${TABLE}.no_recall

  - dimension: non_disclosure_of_patient_information
    type: yesno
    sql: ${TABLE}.non_disclosure_of_patient_information

  - dimension: notes_location_id
    type: int
    hidden: true
    sql: ${TABLE}.notes_location_id

  - dimension: occupation_id
    type: int
    hidden: true
    sql: ${TABLE}.occupation_id

  - dimension: office_reference
    sql: ${TABLE}.office_reference

  - dimension: old_patient
    type: yesno
    hidden: true
    sql: ${TABLE}.old_patient

  - dimension: on_hold
    type: yesno
    hidden: true
    sql: ${TABLE}.on_hold

  - dimension: optometrist_id
    type: int
    hidden: true
    sql: ${TABLE}.optometrist_id

  - dimension: owner_id
    type: int
    hidden: true
    sql: ${TABLE}.owner_id

  - dimension: patient_status_id
    type: int
    hidden: true
    sql: ${TABLE}.patient_status_id

  - dimension: payment_day_of_month
    type: int
    hidden: true
    sql: ${TABLE}.payment_day_of_month

  - dimension: pesel_number
    sql: ${TABLE}.pesel_number

  - dimension: postal_marketing
    type: yesno
    sql: ${TABLE}.postal_marketing

  - dimension: practitioner_gender_preference
    sql: ${TABLE}.practitioner_gender_preference

  - dimension: preferred_forename
    sql: ${TABLE}.preferred_forename

  - dimension: preferred_location_id
    type: int
    hidden: true
    sql: ${TABLE}.preferred_location_id

  - dimension: preferred_middlename
    sql: ${TABLE}.preferred_middlename

  - dimension: preferred_practitioner_id
    type: int
    hidden: true
    sql: ${TABLE}.preferred_practitioner_id

  - dimension: preferred_surname
    sql: ${TABLE}.preferred_surname

  - dimension: preferred_title
    sql: ${TABLE}.preferred_title

  - dimension: provided_gp_address
    sql: ${TABLE}.provided_gp_address

  - dimension: provided_gp_name
    sql: ${TABLE}.provided_gp_name

  - dimension: referral_method_comments
    sql: ${TABLE}.referral_method_comments

  - dimension: referral_method_id
    type: int
    hidden: true
    sql: ${TABLE}.referral_method_id

  - dimension: referral_source_id
    type: int
    hidden: true
    sql: ${TABLE}.referral_source_id

  - dimension: religion
    type: yesno
    hidden: true
    sql: ${TABLE}.religion

  - dimension: reminder
    type: yesno
    hidden: true
    sql: ${TABLE}.reminder

  - dimension: requires_guardian
    type: yesno
    sql: ${TABLE}.requires_guardian

  - dimension: requires_review
    type: yesno
    sql: ${TABLE}.requires_review

  - dimension: requires_transport
    type: yesno
    sql: ${TABLE}.requires_transport

  - dimension: scn
    type: int
    hidden: true
    sql: ${TABLE}.scn

  - dimension: signed_data_consent_form
    type: yesno
    sql: ${TABLE}.signed_data_consent_form

  - dimension: sms_marketing
    type: yesno
    sql: ${TABLE}.sms_marketing

  - dimension: sms_reminder_hours
    type: int
    sql: ${TABLE}.sms_reminder_hours

  - dimension: source_gp_id
    type: int
    hidden: true
    sql: ${TABLE}.source_gp_id

  - dimension: source_id
    type: int
    hidden: true
    sql: ${TABLE}.source_id

  - dimension: source_insurance_company_id
    type: int
    hidden: true
    sql: ${TABLE}.source_insurance_company_id

  - dimension: source_name
    sql: ${TABLE}.source_name

  - dimension: source_ref
    sql: ${TABLE}.source_ref

  - dimension: telephone_marketing
    type: yesno
    sql: ${TABLE}.telephone_marketing

  - dimension: written_communication
    type: int
    sql: ${TABLE}.written_communication

  - dimension: written_consent_document_id
    type: int
    hidden: true
    sql: ${TABLE}.written_consent_document_id

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - source_name
    - nickname
    - company_contact_name
    - preferred_forename
    - preferred_middlename
    - preferred_surname
    - provided_gp_name
    - individual.individual_id
    - individual.forename
    - individual.middlename
    - individual.surname
    - company.company_name
    - contract.contract_id
    - contract.contract_name
    - referral_method.referral_method_id
    - referral_method.referral_method_name
    - insurance_company.insurance_company_name
    - occupation.occupation_id
    - occupation.occupation_name
    - company_office.office_name
    - membership_status.membership_status_id
    - membership_status.membership_status_name
    - membership_cancellation_reason.membership_cancellation_reason_id
    - membership_cancellation_reason.membership_cancellation_reason_name
    - issuing_company.issuing_company_id
    - issuing_company.issuing_company_name
    - patient_status.patient_status_id
    - patient_status.patient_status_name
    - written_consent_document.written_consent_document_id
    - written_consent_document.written_consent_document_name
    - appointment.count
    - appointment_booklet.count
    - appointment_search.count
    - charge.count
    - clinical_report.count
    - dashboard_event.count
    - dental_emr_settings.count
    - dental_tooth_treatment.count
    - diary_waitinglist.count
    - email.count
    - emr2_encounter.count
    - emr2_note.count
    - emr2_order.count
    - emr2_problem.count
    - emr2_report_setting.count
    - emr2_scheduled_service.count
    - emr2_topic.count
    - emr_history.count
    - event.count
    - form.count
    - form_response.count
    - form_response_latest.count
    - id_domain_patient_medical_record_number.count
    - invoice.count
    - itb_invitation.count
    - lab_request.count
    - lab_test.count
    - letter_cc_group.count
    - letter_recipient.count
    - member.count
    - non_conversion.count
    - observation_message.count
    - observation_order.count
    - observation_set.count
    - outcomes.count
    - pacs_message.count
    - paper_file.count
    - paper_folder.count
    - past_present_medication.count
    - patient_exercise_programme.count
    - patient_follow_up.count
    - patient_letter.count
    - patient_medical_registration.count
    - patient_merge_log_individual.count
    - patient_merge_log_other.count
    - patient_problem.count
    - payment.count
    - physio_examination.count
    - preferred_patient_card.count
    - prescription.count
    - task.count
    - transcription.count
    - treatment_cycle.count
    - treatment_cycle_referral.count
    - user_message.count
    - _appointments.count
    - _appointment_procedure.count
    - _charges.count
    - _classes.count
    - _company_data.count
    - _dashboard_distributions_without_emails.count
    - _detailed_charges.count
    - _members.count
    - _outcomes.count
    - _pacs_log.count
    - _treatment_cycle.count

