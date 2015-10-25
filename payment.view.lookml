- view: payment
  fields:

  - dimension: previous_payment_id
    primary_key: true
    type: int
    hidden: true
    sql: ${TABLE}.previous_payment_id

  - dimension: amount
    type: number
    sql: ${TABLE}.amount

  - dimension: appointment_id
    type: int
    hidden: true
    sql: ${TABLE}.appointment_id

  - dimension: card_address_id
    type: int
    hidden: true
    sql: ${TABLE}.card_address_id

  - dimension: card_expires
    sql: ${TABLE}.card_expires

  - dimension: card_pan
    sql: ${TABLE}.card_pan

  - dimension: card_scheme
    sql: ${TABLE}.card_scheme

  - dimension: comments
    sql: ${TABLE}.comments

  - dimension: datacash_auth_code
    sql: ${TABLE}.datacash_auth_code

  - dimension: datacash_card_token
    sql: ${TABLE}.datacash_card_token

  - dimension: datacash_reference
    sql: ${TABLE}.datacash_reference

  - dimension: direct_debit_instruction_id
    type: int
    hidden: true
    sql: ${TABLE}.direct_debit_instruction_id

  - dimension: expired_by_card_policy
    type: yesno
    hidden: true
    sql: ${TABLE}.expired_by_card_policy

  - dimension: issuing_company_id
    type: int
    hidden: true
    sql: ${TABLE}.issuing_company_id

  - dimension_group: last_modified
    type: time
    hidden: true
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    hidden: true
    sql: ${TABLE}.last_modified_by

  - dimension: location_id
    type: int
    hidden: true
    sql: ${TABLE}.location_id

  - dimension: modified_by_function
    hidden: true
    sql: ${TABLE}.modified_by_function

  - dimension: original_datacash_reference
    sql: ${TABLE}.original_datacash_reference

  - dimension: outstanding
    type: number
    hidden: true
    sql: ${TABLE}.outstanding

  - dimension: patient_id
    type: int
    hidden: true
    sql: ${TABLE}.patient_id

  - dimension: payer_id
    type: int
    hidden: true
    sql: ${TABLE}.payer_id

  - dimension_group: payment_date
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.payment_date

  - dimension: payment_id
    type: int
    #hidden: true
    sql: ${TABLE}.payment_id

  - dimension: payment_method_id
    type: int
    hidden: true
    sql: ${TABLE}.payment_method_id

  - dimension: recurring_payment
    sql: ${TABLE}.recurring_payment

  - dimension: reference
    sql: ${TABLE}.reference

  - dimension: status
    sql: ${TABLE}.status

  - dimension: went_to_bank_id
    type: int
    hidden: true
    sql: ${TABLE}.went_to_bank_id

  - measure: count
    type: count
    drill_fields: detail*
    
  - measure: sum_paid
    type: sum
    sql: ${TABLE}.amount  


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - previous_payment_id
    - payment.previous_payment_id
    - payment_method.payment_method_id
    - payment_method.payment_method_name
    - location.location_name
    - location.billing_location_id
    - went_to_bank.went_to_bank_id
    - patient.source_name
    - patient.nickname
    - patient.company_contact_name
    - patient.preferred_forename
    - patient.preferred_middlename
    - patient.preferred_surname
    - patient.provided_gp_name
    - issuing_company.issuing_company_id
    - issuing_company.issuing_company_name
    - direct_debit_instruction.direct_debit_instruction_id
    - direct_debit_instruction.account_name
    - appointment.appointment_id
    - healthcode_payment.count
    - payment.count
    - payment_credit_item_allocation.count
    - payment_schedule.count
    - refund_payment_link.count
    - remittance_payment.count

