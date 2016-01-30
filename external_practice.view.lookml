- view: external_practice
  fields:

  - dimension: external_practice_id
    primary_key: true
    type: int
    sql: ${TABLE}.external_practice_id

  - dimension: accepts_fax
    type: int
    sql: ${TABLE}.accepts_fax

  - dimension: address_id
    type: int
    hidden: true
    sql: ${TABLE}.address_id

  - dimension: autopost_required
    type: yesno
    sql: ${TABLE}.autopost_required

  - dimension: company_id
    type: int
    hidden: true
    sql: ${TABLE}.company_id

  - dimension: email
    sql: ${TABLE}.email

  - dimension: external_practice_type_id
    type: int
    hidden: true
    sql: ${TABLE}.external_practice_type_id

  - dimension: fax
    sql: ${TABLE}.fax

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    hidden: true
    sql: ${TABLE}.last_modified_by

  - dimension: list_size
    type: int
    sql: ${TABLE}.list_size

  - dimension: marketing_campaign_status
    type: yesno
    sql: ${TABLE}.marketing_campaign_status

  - dimension: modified_by_function
    hidden: true
    sql: ${TABLE}.modified_by_function

  - dimension: nhs_number
    sql: ${TABLE}.nhs_number

  - dimension: practice_code
    sql: ${TABLE}.practice_code

  - dimension: practice_name
    sql: ${TABLE}.practice_name

  - dimension: status
    sql: ${TABLE}.status

  - dimension: telephone_day
    sql: ${TABLE}.telephone_day

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - external_practice_id
    - practice_name
    - external_practice_type.canonical_name
    - external_practice_type.name
    - external_practice_type.external_practice_type_id
    - address.address_id
    - company.company_name
    - external_practitioner.count
    - external_practitioner_practice_link.count
    - patient_external_practice.count
    - practice_mapping.count
    - smart_list_marketing_container_external_practice.count
    - treatment_cycle_referral_external_practice.count

