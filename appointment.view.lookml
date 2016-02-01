- view: appointment
  fields:

  - dimension: appointment_id
    primary_key: true
    type: int
    sql: ${TABLE}.appointment_id

  - dimension: account_number
    hidden: true
    sql: ${TABLE}.account_number

  - dimension: alternate_destination
    hidden: true
    sql: ${TABLE}.alternate_destination

  - dimension: alternate_pickup_location
    hidden: true
    sql: ${TABLE}.alternate_pickup_location

  - dimension: appointment_booklet_id
    type: int
    hidden: true
    sql: ${TABLE}.appointment_booklet_id

  - dimension: appointment_price
    type: number
    sql: ${TABLE}.appointment_price

  - dimension: appointment_requires_transport
    type: yesno
    hidden: true
    sql: ${TABLE}.appointment_requires_transport

  - dimension: appointment_type_id
    type: int
    hidden: true
    sql: ${TABLE}.appointment_type_id

  - dimension: appointment_type_problem_id
    type: int
    hidden: true
    sql: ${TABLE}.appointment_type_problem_id

  - dimension_group: arrive
    type: time
    timeframes: [time, date, day_of_week, week, month, month_num]
    sql: ${TABLE}.arrive
    

  - dimension: month_name
    sql_case:
      January: ${arrive_month_num} = 1
      Febuary: ${arrive_month_num} = 2
      March: ${arrive_month_num} = 3
      April: ${arrive_month_num} = 4
      May: ${arrive_month_num} = 5
      June: ${arrive_month_num} = 6
      July: ${arrive_month_num} = 7
      August: ${arrive_month_num} = 8
      September: ${arrive_month_num} = 9
      October: ${arrive_month_num} = 10
      November: ${arrive_month_num} = 11
      December: ${arrive_month_num} = 12

  - dimension: formatted_month_name
    sql: CONCAT(CASE WHEN ${arrive_month_num} = 1 then 'Jan' 
              WHEN ${arrive_month_num} = 2 then 'Feb' 
              WHEN ${arrive_month_num} = 3 then 'Mar' 
              WHEN ${arrive_month_num} = 4 then 'Apr' 
              WHEN ${arrive_month_num} = 5 then 'May' 
              WHEN ${arrive_month_num} = 6 then 'Jun' 
              WHEN ${arrive_month_num} = 7 then 'Jul' 
              WHEN ${arrive_month_num} = 8 then 'Aug' 
              WHEN ${arrive_month_num} = 9 then 'Sept' 
              WHEN ${arrive_month_num} = 10 then 'Oct' 
              WHEN ${arrive_month_num} = 11 then 'Nov' 
              WHEN ${arrive_month_num} = 12 then 'Dec' else '' End,'-',DATE_FORMAT(${TABLE}.arrive,'%y'))

  - dimension: billed
    type: yesno
    sql: ${TABLE}.billed
  
  - dimension: booked_manually
    type: yesno
    hidden: true
    sql: ${TABLE}.booked_manually

  - dimension: booking_information_accepted
    hidden: true
    sql: ${TABLE}.booking_information_accepted

  - dimension: cab_cancellation_reason_code
    type: int
    sql: ${TABLE}.cab_cancellation_reason_code

  - dimension: cab_cancellation_reason_text
    sql: ${TABLE}.cab_cancellation_reason_text

  - dimension: cab_dna_reason_code
    type: int
    hidden: true
    sql: ${TABLE}.cab_dna_reason_code

  - dimension: cab_priority_type_code
    type: int
    hidden: true
    sql: ${TABLE}.cab_priority_type_code

  - dimension: cab_ubrn
    sql: ${TABLE}.cab_ubrn

  - dimension: cancellation_charge_to
    type: yesno
    hidden: true
    sql: ${TABLE}.cancellation_charge_to

  - dimension: cancellation_late_hours
    type: int
    hidden: true
    sql: ${TABLE}.cancellation_late_hours

  - dimension: cancellation_late_hours_tier3
    type: int
    hidden: true
    sql: ${TABLE}.cancellation_late_hours_tier3

  - dimension: cancellation_late_price
    type: number
    hidden: true
    sql: ${TABLE}.cancellation_late_price

  - dimension: cancellation_late_price_tier3
    type: number
    hidden: true
    sql: ${TABLE}.cancellation_late_price_tier3

  - dimension: cancellation_price
    type: number
    hidden: true
    sql: ${TABLE}.cancellation_price

  - dimension: cc_waive_individual
    type: int
    hidden: true
    sql: ${TABLE}.cc_waive_individual

  - dimension: cc_waive_reason
    type: int
    sql: ${TABLE}.cc_waive_reason

  - dimension: charge_to_id
    type: int
    hidden: true
    sql: ${TABLE}.charge_to_id
    
  - dimension: self_payer
    type: yesno  
    sql: ${charge_to_id} = ${patient_id}

  - dimension: class_id
    type: int
    hidden: true
    sql: ${TABLE}.class_id

  - dimension: comments
    sql: ${TABLE}.comments

  - dimension: contract_id
    type: int
    hidden: true
    sql: ${TABLE}.contract_id

  - dimension_group: discharge
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.discharge

  - dimension: discount_amount
    type: number
    sql: ${TABLE}.discount_amount

  - dimension: discount_code
    sql: ${TABLE}.discount_code

  - dimension: dna
    type: yesno
    sql: ${TABLE}.dna

  - dimension_group: email_reminder
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.email_reminder

  - dimension: email_reminder_hours
    type: int
    sql: ${TABLE}.email_reminder_hours

  - dimension_group: end
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.end

  - dimension: ignore_diary_limits_authorised_by
    type: int
    hidden: true
    sql: ${TABLE}.ignore_diary_limits_authorised_by

  - dimension: ignore_diary_limits_reason
    hidden: true
    sql: ${TABLE}.ignore_diary_limits_reason

  - dimension: insurance_authorisation_code
    sql: ${TABLE}.insurance_authorisation_code

  - dimension: is_abandoned
    type: yesno
    sql: ${TABLE}.is_abandoned

  - dimension: is_closed
    type: yesno
    sql: ${TABLE}.is_closed

  - dimension: journey_time
    sql: ${TABLE}.journey_time

  - dimension_group: last_modified
    type: time
    hidden: true
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    hidden: true
    sql: ${TABLE}.last_modified_by

  - dimension: late_cancellation
    type: yesno
    sql: ${TABLE}.late_cancellation

  - dimension_group: leave
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.`leave`

  - dimension: location_id
    type: int
    hidden: true
    sql: ${TABLE}.location_id

  - dimension: modified_by_function
    hidden: true
    sql: ${TABLE}.modified_by_function

  - dimension_group: notes_pulled
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.notes_pulled

  - dimension: online_booking
    type: yesno
    sql: ${TABLE}.online_booking

  - dimension: original_appointment_price
    type: number
    sql: ${TABLE}.original_appointment_price

  - dimension: original_appointment_type_id
    type: int
    hidden: true
    sql: ${TABLE}.original_appointment_type_id

  - dimension: patient_comments
    sql: ${TABLE}.patient_comments

  - dimension: patient_id
    type: int
    hidden: true
    sql: ${TABLE}.patient_id

  - dimension: primary_diary_id
    type: int
    hidden: true
    sql: ${TABLE}.primary_diary_id

  - dimension: primary_doctor_id
    type: int
    hidden: true
    sql: ${TABLE}.primary_doctor_id

  - dimension: referring_practitioner_id
    type: int
    hidden: true
    sql: ${TABLE}.referring_practitioner_id

  - dimension: repeat_days
    type: int
    hidden: true
    sql: ${TABLE}.repeat_days

  - dimension_group: requested
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.requested_date

  - dimension: send_email_reminder
    type: yesno
    sql: ${TABLE}.send_email_reminder

  - dimension: send_sms
    type: yesno
    sql: ${TABLE}.send_sms

  - dimension: send_sms_reminder
    type: yesno
    sql: ${TABLE}.send_sms_reminder

  - dimension: simple_diagnosis_type_id
    type: int
    hidden: true
    sql: ${TABLE}.simple_diagnosis_type_id

  - dimension: simple_referral_type_id
    type: int
    hidden: true
    sql: ${TABLE}.simple_referral_type_id

  - dimension: sms_reminder_hours
    type: int
    sql: ${TABLE}.sms_reminder_hours

  - dimension_group: start
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.start

  - dimension: status
    sql: ${TABLE}.status

  - dimension: text_notes
    sql: ${TABLE}.text_notes

  - dimension: transport_provider_id
    type: int
    hidden: true
    sql: ${TABLE}.transport_provider_id

  - dimension: transport_provider_processed
    type: yesno
    sql: ${TABLE}.transport_provider_processed

  - dimension: treatment_cycle_id
    type: int
    hidden: true
    sql: ${TABLE}.treatment_cycle_id

  - dimension: treatment_cycle_referral_id
    type: int
    hidden: true
    sql: ${TABLE}.treatment_cycle_referral_id

  - dimension: upgrade_cancellation_price
    type: number
    sql: ${TABLE}.upgrade_cancellation_price

  - dimension_group: view
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.view

  - measure: status_a
    label: 'a status count'
    type: count_distinct
    sql: ${appointment_id}
    filters:
      status: 'A'

    
  - measure: number_of_appts
    label: '# of Appts'
    type: count_distinct
    sql: ${appointment_id}
    
  - measure: number_of_locations
    label: '# of Locations'
    type: count_distinct
    sql: ${location_id}
    
  - measure: appt_duration
    label: 'Appointment Duration in Mins'
    type: sum
    sql: TIMESTAMPDIFF(SECOND,(${TABLE}.end),(${TABLE}.start))/60.00
    
  - measure: actual_appt_duration
    label: 'Actual Appointment Duration in Mins'
    type: sum
    sql: TIMESTAMPDIFF(SECOND,ifnull((${TABLE}.leave),(${TABLE}.end)),ifnull((${TABLE}.view),(${TABLE}.start)))/60.00    
    
  - measure: time_to_view
    label: 'Time to be Seen in Mins'
    type: sum
    sql: TIMESTAMPDIFF(SECOND,(${TABLE}.view),(${TABLE}.start))/60.00    
    
  - measure: number_of_patients
    label: '# of Patients'
    type: count_distinct
    sql: ${patient_id}  
    sql_distinct_key: ${patient_id}    
    
  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - appointment_id
    - appointment_type.appointment_type_id
    - appointment_type.appointment_type_name
    - patient.source_name
    - patient.nickname
    - patient.company_contact_name
    - patient.preferred_forename
    - patient.preferred_middlename
    - patient.preferred_surname
    - patient.provided_gp_name
    - location.location_name
    - location.billing_location_id
    - contract.contract_id
    - contract.contract_name
    - class.class_id
    - simple_diagnosis_type.diagnosis_type_short_name
    - simple_diagnosis_type.diagnosis_type_name
    - simple_referral_type.referral_type_short_name
    - simple_referral_type.referral_type_name
    - treatment_cycle.treatment_cycle_id
    - treatment_cycle.treatment_cycle_name
    - appointment_booklet.appointment_booklet_id
    - treatment_cycle_referral.treatment_cycle_referral_id
    - appointment_type_problem.appointment_type_problem_id
    - transport_provider.transport_provider_id
    - transport_provider.provider_name
    - appointment_dictation.count
    - appointment_review.count
    - appointment_search.count
    - appointment_section.count
    - charge.count
    - clinical_report.count
    - company_reference_answers.count
    - c_plan_pre_screen_instance.count
    - dashboard_event.count
    - dental_appointment_note.count
    - dental_periodontal_chart.count
    - dental_print_journal.count
    - dental_tooth_treatment.count
    - dental_tooth_treatment_sort_order.count
    - emr2_encounter.count
    - emr_history.count
    - form.count
    - form_response.count
    - form_response_latest.count
    - goal_score.count
    - ical_state.count
    - invoice_item.count
    - itb_invitation.count
    - manipulation.count
    - observation_order.count
    - pacs_message.count
    - patient_exercise_programme.count
    - patient_follow_up.count
    - patient_letter.count
    - payment.count
    - payment_schedule.count
    - physio_examination.count
    - portal_referral_form.count
    - prescription.count
    - recall.count
    - smslog.count
    - task.count
    - transcription.count
    - treatment_cycle_event.count
    - _appointments.count
    - _appointment_procedure.count
    - _charges.count
    - _classes.count
    - _dashboard_distributions_without_emails.count
    - _detailed_charges.count

