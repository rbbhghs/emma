- view: treatment_cycle_referral
  fields:

  - dimension: treatment_cycle_referral_id
    primary_key: true
    type: int
    #hidden: true
    sql: ${TABLE}.treatment_cycle_referral_id

  - dimension_group: appointment
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.appointment_date_test

  - dimension: appointment_type_id
    type: int
    hidden: true
    sql: ${TABLE}.appointment_type_id

  - dimension: assigned_to_id
    type: int
    hidden: true
    sql: ${TABLE}.assigned_to_id

  - dimension: charge_to_id
    type: int
    hidden: true
    sql: ${TABLE}.charge_to_id

  - dimension: company_contact_id
    type: int
    hidden: true
    sql: ${TABLE}.company_contact_id

  - dimension: contact_method_id
    type: int
    hidden: true
    sql: ${TABLE}.contact_method_id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_date


  - dimension: escalated
    type: yesno
    sql: ${TABLE}.escalated

  - dimension: from_company_id
    type: int
    hidden: true
    sql: ${TABLE}.from_company_id

  - dimension: from_practitioner_id
    type: int
    hidden: true
    sql: ${TABLE}.from_practitioner_id

  - dimension: from_treatment_cycle_id
    type: int
    hidden: true
    sql: ${TABLE}.from_treatment_cycle_id

  - dimension: gp_code
    sql: ${TABLE}.gp_code

  - dimension: incomplete
    type: yesno
    sql: ${TABLE}.incomplete

  - dimension: insurance_authorisation_code
    sql: ${TABLE}.insurance_authorisation_code

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: marketing_source_id
    type: int
    hidden: true
    sql: ${TABLE}.marketing_source_id

  - dimension: modified_by_function
    hidden: true
    sql: ${TABLE}.modified_by_function

  - dimension: nhs_no
    sql: ${TABLE}.nhs_no

  - dimension: notes
    sql: ${TABLE}.notes

  - dimension: patient_id
    type: int
    hidden: true
    sql: ${TABLE}.patient_id

  - dimension_group: pre_rejected
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.pre_rejected

  - dimension: priority_code_id
    type: int
    hidden: true
    sql: ${TABLE}.priority_code_id

  - dimension: product_id
    type: int
    hidden: true
    sql: ${TABLE}.product_id

  - dimension: purchase_order_no
    sql: ${TABLE}.purchase_order_no

  - dimension_group: received
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.received

  - dimension: referral_method_id
    type: int
    hidden: true
    sql: ${TABLE}.referral_method_id

  - dimension: referral_rejection_reason_id
    type: int
    hidden: true
    sql: ${TABLE}.referral_rejection_reason_id

  - dimension_group: referred
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.referred

  - dimension_group: rejected
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.rejected

  - dimension: rejection_notes
    sql: ${TABLE}.rejection_notes

  - dimension: requires_booking
    type: yesno
    sql: ${TABLE}.requires_booking

  - dimension: status
    sql: ${TABLE}.status

  - dimension: to_location_id
    type: int
    hidden: true
    sql: ${TABLE}.to_location_id

  - dimension: to_practitioner_id
    type: int
    hidden: true
    sql: ${TABLE}.to_practitioner_id

  - dimension: to_speciality_id
    type: int
    hidden: true
    sql: ${TABLE}.to_speciality_id

  - dimension: to_treatment_cycle_id
    type: int
    hidden: true
    sql: ${TABLE}.to_treatment_cycle_id

  - dimension: treatment_cycle_referral_source_id
    type: int
    hidden: true
    sql: ${TABLE}.treatment_cycle_referral_source_id

  - dimension: treatment_cycle_referral_type_id
    type: int
    hidden: true
    sql: ${TABLE}.treatment_cycle_referral_type_id

  - dimension: ubrn
    sql: ${TABLE}.ubrn

  - dimension: user_id
    type: int
    hidden: true
    sql: ${TABLE}.user_id
    
  - measure: created_date_avg
    type: date
    sql: AVG(${TABLE}.created_date)  
    
  - measure: received_date_avg
    type: date
    sql: AVG(${TABLE}.received) 
    
  - measure: referred_date_avg
    type: date
    sql: AVG(${TABLE}.referred)   
    
#  - measure: created_date
 #   type: date_time
#    sql: cast(${TABLE}.created_date as datetime)  

 # - measure: received_date
#    type: date_time
#    sql: cast(${TABLE}.received as datetime)  

 # - measure: referred_date
#    type: date_time
#    sql: cast(${TABLE}.referred as datetime)

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - treatment_cycle_referral_id
    - treatment_cycle_referral_type.treatment_cycle_referral_type_id
    - treatment_cycle_referral_type.treatment_cycle_referral_type_name
    - patient.source_name
    - patient.nickname
    - patient.company_contact_name
    - patient.preferred_forename
    - patient.preferred_middlename
    - patient.preferred_surname
    - patient.provided_gp_name
    - appointment_type.appointment_type_id
    - appointment_type.appointment_type_name
    - referral_rejection_reason.referral_rejection_reason_id
    - referral_rejection_reason.referral_rejection_reason_name
    - referral_method.referral_method_id
    - referral_method.referral_method_name
    - contact_method.contact_method_id
    - contact_method.contact_method_name
    - emr2_encounter.emr2_encounter_id
    - treatment_cycle_referral_source.treatment_cycle_referral_source_id
    - treatment_cycle_referral_source.treatment_cycle_referral_source_name
    - product.product_id
    - product.product_name
    - appointment.count
    - appointment_search.count
    - c_plan_instance.count
    - dashboard_event.count
    - emr2_note_entry.count
    - form.count
    - patient_letter.count
    - referral_escalation.count
    - task.count
    - treatment_cycle_referral_procedure.count
    - workflow_log.count
    - workflow_state_treatment_cycle_referral_link.count
    - _appointment_procedure.count
    - _dashboard_distributions_without_emails.count
    - _outcomes.count

