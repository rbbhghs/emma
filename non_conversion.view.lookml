- view: non_conversion
  fields:

  - dimension: non_conversion_id
    primary_key: true
    type: int
    sql: ${TABLE}.non_conversion_id

  - dimension_group: dob
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.dob

  - dimension: enquiry_reason
    sql: ${TABLE}.enquiry_reason

  - dimension: forename
    sql: ${TABLE}.forename

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: patient_id
    type: int
    # hidden: true
    sql: ${TABLE}.patient_id

  - dimension: postcode
    sql: ${TABLE}.postcode

  - dimension: reason_id
    type: int
    sql: ${TABLE}.reason_id

  - dimension: surname
    sql: ${TABLE}.surname

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - non_conversion_id
    - surname
    - forename
    - patient.preferred_forename
    - patient.preferred_middlename
    - patient.preferred_surname
    - patient.company_contact_name
    - patient.nickname
    - patient.provided_gp_name
    - patient.source_name
    - appointment_search.count

