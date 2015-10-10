- view: company_contact
  fields:

  - dimension: company_contact_type_id
    type: int
    # hidden: true
    sql: ${TABLE}.company_contact_type_id

  - dimension: company_id
    type: int
    # hidden: true
    sql: ${TABLE}.company_id

  - dimension: company_office_id
    type: int
    # hidden: true
    sql: ${TABLE}.company_office_id

  - dimension: contact_reference
    sql: ${TABLE}.contact_reference

  - dimension: dicom_ae_id
    type: int
    # hidden: true
    sql: ${TABLE}.dicom_ae_id

  - dimension: greeting
    sql: ${TABLE}.greeting

  - dimension: individual_id
    type: int
    # hidden: true
    sql: ${TABLE}.individual_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: notes
    sql: ${TABLE}.notes

  - dimension: parent_id
    type: int
    sql: ${TABLE}.parent_id

  - dimension: phone_ddi
    sql: ${TABLE}.phone_ddi

  - dimension: phone_switchboard
    sql: ${TABLE}.phone_switchboard

  - dimension: position
    sql: ${TABLE}.position

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - individual.individual_id
    - individual.forename
    - individual.middlename
    - individual.surname
    - company.company_name
    - company_office.office_name
    - company_contact_type.company_contact_type_id
    - company_contact_type.company_contact_type_name
    - dicom_ae.dicom_ae_id
    - dicom_ae.station_name
    - dicom_ae.host_name
    - invoice.count
    - treatment_cycle_referral.count

