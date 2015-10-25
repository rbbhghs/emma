- view: issuing_company
  fields:

  - dimension: issuing_company_id
    primary_key: true
    type: int
    sql: ${TABLE}.issuing_company_id

  - dimension: company_credit_note_template
    hidden: true
    sql: ${TABLE}.company_credit_note_template

  - dimension: company_invoice_template
    hidden: true
    sql: ${TABLE}.company_invoice_template

  - dimension: company_payment_template
    hidden: true
    sql: ${TABLE}.company_payment_template

  - dimension: company_statement_template
    hidden: true
    sql: ${TABLE}.company_statement_template

  - dimension: datacash_password
    hidden: true
    sql: ${TABLE}.datacash_password

  - dimension: datacash_vtid
    hidden: true
    sql: ${TABLE}.datacash_vtid

  - dimension: external_practitioner_credit_note_template
    hidden: true
    sql: ${TABLE}.external_practitioner_credit_note_template

  - dimension: external_practitioner_invoice_template
    hidden: true
    sql: ${TABLE}.external_practitioner_invoice_template

  - dimension: insurance_credit_note_template
    hidden: true
    sql: ${TABLE}.insurance_credit_note_template

  - dimension: insurance_invoice_template
    hidden: true
    sql: ${TABLE}.insurance_invoice_template

  - dimension: insurance_statement_template
    hidden: true
    sql: ${TABLE}.insurance_statement_template

  - dimension: invoice_number_format
    hidden: true
    sql: ${TABLE}.invoice_number_format

  - dimension: issuing_company_name
    sql: ${TABLE}.issuing_company_name

  - dimension: issuing_company_type
    hidden: true
    type: int
    sql: ${TABLE}.issuing_company_type

  - dimension_group: last_modified
    hidden: true
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    hidden: true
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    hidden: true
    sql: ${TABLE}.modified_by_function

  - dimension: next_invoice_id
    label: 'Next invoice number'
    type: int
    sql: ${TABLE}.next_invoice_id

  - dimension: patient_credit_note_template
    hidden: true
    sql: ${TABLE}.patient_credit_note_template

  - dimension: patient_invoice_template
    hidden: true
    sql: ${TABLE}.patient_invoice_template

  - dimension: patient_statement_template
    hidden: true
    sql: ${TABLE}.patient_statement_template

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - issuing_company_id
    - issuing_company_name
    - cost_codes_lookups.count
    - cost_codes_lookups_backup.count
    - direct_debit_instruction.count
    - issuing_company_payment_detail.count
    - location.count
    - patient.count
    - payment.count
    - practitioner.count
    - report_scheduler.count
    - went_to_bank.count

