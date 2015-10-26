- view: creator
  fields:

  - dimension: individual_id
    primary_key: true
    type: int
    hidden: true
    sql: ${TABLE}.individual_id

  - dimension: created_by
    type: string
    sql: CONCAT(${title},' ', ${forename}, ' ', ${surname})

  - dimension: forename
    sql: ${TABLE}.forename
    
  - dimension: surname
    sql: ${TABLE}.surname  

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

  - measure: count
    type: count
    drill_fields: detail*


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

