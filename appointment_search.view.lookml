- view: appointment_search
  fields:

  - dimension: appointment_search_id
    primary_key: true
    type: int
    sql: ${TABLE}.appointment_search_id

  - dimension: appointment_id
    type: int
    # hidden: true
    sql: ${TABLE}.appointment_id

  - dimension: appointment_search_decline_notes
    sql: ${TABLE}.appointment_search_decline_notes

  - dimension: appointment_search_decline_reason_id
    type: int
    # hidden: true
    sql: ${TABLE}.appointment_search_decline_reason_id

  - dimension: appointment_type_id
    type: int
    # hidden: true
    sql: ${TABLE}.appointment_type_id

  - dimension: contract_id
    type: int
    # hidden: true
    sql: ${TABLE}.contract_id

  - dimension_group: date_searched
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.date_searched

  - dimension: first_offered_taken
    type: int
    sql: ${TABLE}.first_offered_taken

  - dimension: gender_preference
    sql: ${TABLE}.gender_preference

  - dimension: is_ignore_diary_limits
    type: int
    sql: ${TABLE}.is_ignore_diary_limits

  - dimension: is_out_of_hours
    type: int
    sql: ${TABLE}.is_out_of_hours

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: non_conversion_id
    type: int
    # hidden: true
    sql: ${TABLE}.non_conversion_id

  - dimension: patient_id
    type: int
    # hidden: true
    sql: ${TABLE}.patient_id

  - dimension: payer_id
    type: int
    sql: ${TABLE}.payer_id

  - dimension_group: search_timestamp
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.search_timestamp

  - dimension: speciality_id
    type: int
    # hidden: true
    sql: ${TABLE}.speciality_id

  - dimension: total_appointments_offered
    type: int
    sql: ${TABLE}.total_appointments_offered

  - dimension: treatment_cycle_referral_id
    type: int
    # hidden: true
    sql: ${TABLE}.treatment_cycle_referral_id

  - dimension: user_id
    type: int
    sql: ${TABLE}.user_id

  - dimension: weeks_searched
    type: int
    sql: ${TABLE}.weeks_searched

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - appointment_search_id
    - patient.source_name
    - patient.nickname
    - patient.company_contact_name
    - patient.preferred_forename
    - patient.preferred_middlename
    - patient.preferred_surname
    - patient.provided_gp_name
    - contract.contract_id
    - contract.contract_name
    - speciality.speciality_id
    - speciality.speciality_name
    - treatment_cycle_referral.treatment_cycle_referral_id
    - appointment.appointment_id
    - appointment_type.appointment_type_id
    - appointment_type.appointment_type_name
    - appointment_search_decline_reason.appointment_search_decline_reason_id
    - non_conversion.non_conversion_id
    - non_conversion.forename
    - non_conversion.surname
    - appointment_search_location.count
    - appointment_search_result.count

