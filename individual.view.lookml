- view: individual
  fields:

  - dimension: individual_id
    primary_key: true
    type: int
    sql: ${TABLE}.individual_id

  - dimension: access_key
    sql: ${TABLE}.access_key
    hidden: true    

  - dimension: address_id
    type: int
    hidden: true
    sql: ${TABLE}.address_id

  - dimension: assistant
    type: int
    hidden: true
    sql: ${TABLE}.assistant

  - dimension: business_school_depot
    hidden: true
    sql: ${TABLE}.business_school_depot

  - dimension: colour
    hidden: true
    sql: ${TABLE}.colour

  - dimension: company_office_id
    type: int
    hidden: true
    sql: ${TABLE}.company_office_id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension_group: dob
    type: time
    timeframes: [date, week, month, year]
    convert_tz: false
    sql: if(${TABLE}.dob,'0000-00-00','1900-00-00')

  - dimension: age
    type: int
    sql: YEAR(CURRENT_TIMESTAMP) - YEAR(${TABLE}.dob) - (RIGHT(CURRENT_TIMESTAMP, 5) < RIGHT(${TABLE}.dob, 5))

  - dimension: email
    sql: ${TABLE}.email

  - dimension: enable_automatic_appointment_payments
    type: yesno
    sql: ${TABLE}.enable_automatic_appointment_payments

  - dimension: ext_number
    sql: ${TABLE}.ext_number

  - dimension: external_system_id
    sql: ${TABLE}.external_system_id

  - dimension: fax
    sql: ${TABLE}.fax
    
  - dimension: full_name
    type: string
    sql: CONCAT(${title},' ', ${forename}, ' ', ${surname})
    
  - dimension: full_patient_name
    type: string
    sql: CONCAT(${title},' ', ${forename}, ' ', ${surname})
    
  - dimension: full_practitioner_name
    type: string
    sql: CONCAT(${title},' ', ${forename}, ' ', ${surname})
    
  - dimension: full_user_name
    type: string
    sql: CONCAT(${title},' ', ${forename}, ' ', ${surname})
    
  - dimension: full_creator_name
    type: string
    sql: CONCAT(${title},' ', ${forename}, ' ', ${surname})  

  - dimension: full_referrer_name
    type: string
    sql: CONCAT(${title},' ', ${forename}, ' ', ${surname})
    
  - dimension: user_name_last_modified
    type: string
    sql: CONCAT(${title},' ', ${forename}, ' ', ${surname})    
    
  - dimension: forename
    sql: ${TABLE}.forename

  - dimension: ibs_id
    sql: ${TABLE}.ibs_id

  - dimension: id_domain_id
    type: int
    hidden: true
    sql: ${TABLE}.id_domain_id

  - dimension: individual_type_id
    type: int
    hidden: true
    sql: ${TABLE}.individual_type_id

  - dimension: job_title
    sql: ${TABLE}.job_title

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    hidden: true
    sql: ${TABLE}.last_modified_by

  - dimension: location_id
    type: int
    hidden: true
    sql: ${TABLE}.location_id

  - dimension: middlename
    sql: ${TABLE}.middlename

  - dimension: modified_by_function
    hidden: true
    sql: ${TABLE}.modified_by_function

  - dimension: nationality_id
    type: int
    hidden: true
    sql: ${TABLE}.nationality_id

  - dimension: no_email
    type: yesno
    sql: ${TABLE}.no_email

  - dimension: no_telephone
    type: yesno
    sql: ${TABLE}.no_telephone

  - dimension: notes
    sql: ${TABLE}.notes

  - dimension: payment_terms
    type: int
    sql: ${TABLE}.payment_terms

  - dimension: sex
    sql: ${TABLE}.sex

  - dimension: status
    sql: ${TABLE}.status

  - dimension: surname
    sql: ${TABLE}.surname

  - dimension: telephone_day
    sql: ${TABLE}.telephone_day

  - dimension: telephone_evening
    sql: ${TABLE}.telephone_evening

  - dimension: telephone_mobile
    sql: ${TABLE}.telephone_mobile

  - dimension: telephone_search
    sql: ${TABLE}.telephone_search

  - dimension: title
    sql: ${TABLE}.title

  - dimension: user_permission_id
    type: yesno
    hidden: true
    sql: ${TABLE}.user_permission_id

  - measure: number_of_individuals
    label: '# of Individuals'
    type: count_distinct
    sql: ${individual_id}  
    sql_distinct_key: ${individual_id}  


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - individual_id
    - forename
    - middlename
    - surname
    - individual_type.individual_type_id
    - individual_type.individual_type_name
    - address.address_id
    - location.location_name
    - location.billing_location_id
    - company_office.office_name
    - nationality.nationality_id
    - id_domain.id_domain_id
    - id_domain.name
    - address.count
    - adhoc_report.count
    - allowed_location.count
    - appointment_dictation.count
    - appointment_reviewer.count
    - authentication.count
    - click_tracking.count
    - communication_preference_entity.count
    - communication_reminder_preference_entity.count
    - company.count
    - company_contact.count
    - company_office.count
    - company_reference_question_answers.count
    - c_plan_instance.count
    - c_plan_instance_log.count
    - c_plan_owner.count
    - c_plan_pre_screen_instance.count
    - emr_user_settings.count
    - external_practitioner.count
    - favourite_phrase.count
    - import.count
    - individual_availability.count
    - individual_file.count
    - individual_ldap.count
    - individual_speciality.count
    - insurance_company.count
    - letter_cc_group.count
    - letter_cc_group_member.count
    - letter_recipient.count
    - location.count
    - lrmq1_e9_gjhegxet05_syjgpb_payor.count
    - lrmqzje1_gf6_h5_d0_x3_zsl76_d_referrer.count
    - organization_group_individuals.count
    - patient.count
    - patient_change_log.count
    - patient_effective_dates.count
    - patient_log.count
    - practitioner.count
    - professional_registration.count
    - recall.count
    - recall_work_item.count
    - remittance_message.count
    - security_question.count
    - smart_list_item.count
    - smslog.count
    - staff_team_member.count
    - transport_provider.count
    - user_access.count
    - _primary_company_contacts.count

