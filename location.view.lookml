- view: location
  fields:

  - dimension: billing_location_id
    primary_key: true
    type: int
    hidden: true
    sql: ${TABLE}.billing_location_id

  - dimension: access_key
    hidden: true
    sql: ${TABLE}.access_key

  - dimension: additional_detail
    sql: ${TABLE}.additional_detail

  - dimension: address_id
    type: int
    hidden: true
    sql: ${TABLE}.address_id

  - dimension: appointment_letter_template_id
    type: int
    hidden: true
    sql: ${TABLE}.appointment_letter_template_id

  - dimension: bupa_no
    hidden: true
    sql: ${TABLE}.bupa_no

  - dimension: bupa_payee_no
    hidden: true
    sql: ${TABLE}.bupa_payee_no

  - dimension: company_credit_note_template
    hidden: true
    sql: ${TABLE}.company_credit_note_template

  - dimension: company_invoice_template
    hidden: true
    sql: ${TABLE}.company_invoice_template

  - dimension: company_payment_template
    hidden: true
    sql: ${TABLE}.company_payment_template

  - dimension: company_refund_template
    hidden: true
    sql: ${TABLE}.company_refund_template

  - dimension: default_task_assign_to_id
    type: int
    hidden: true
    sql: ${TABLE}.default_task_assign_to_id

  - dimension: email
    sql: ${TABLE}.email

  - dimension: external_practitioner_credit_note_template
    hidden: true
    sql: ${TABLE}.external_practitioner_credit_note_template

  - dimension: external_practitioner_invoice_template
    hidden: true
    sql: ${TABLE}.external_practitioner_invoice_template

  - dimension: fax_no
    sql: ${TABLE}.fax_no

  - dimension: healthcode_id
    hidden: true
    sql: ${TABLE}.healthcode_id

  - dimension: individual_id
    type: int
    hidden: true
    sql: ${TABLE}.individual_id

  - dimension: insurance_credit_note_template
    hidden: true
    sql: ${TABLE}.insurance_credit_note_template

  - dimension: insurance_invoice_template
    hidden: true
    sql: ${TABLE}.insurance_invoice_template

  - dimension: insurance_payment_template
    hidden: true
    sql: ${TABLE}.insurance_payment_template

  - dimension: insurance_refund_template
    hidden: true
    sql: ${TABLE}.insurance_refund_template

  - dimension: issuing_company_id
    type: int
    hidden: true
    sql: ${TABLE}.issuing_company_id

  - dimension: lab_code
    hidden: true
    sql: ${TABLE}.lab_code

  - dimension_group: last_modified
    type: time
    hidden: true
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    hidden: true
    sql: ${TABLE}.last_modified_by

  - dimension: last_register
    type: int
    hidden: true
    sql: ${TABLE}.last_register

  - dimension: location_id
    type: int
    hidden: true
    sql: ${TABLE}.location_id

  - dimension: location_name
    sql: ${TABLE}.location_name

  - dimension: location_name_short
    sql: ${TABLE}.location_name_short

  - dimension: logo
    hidden: true
    sql: ${TABLE}.logo

  - dimension: map
    hidden: true
    sql: ${TABLE}.map

  - dimension: modified_by_function
    hidden: true
    sql: ${TABLE}.modified_by_function

  - dimension: notes
    sql: ${TABLE}.notes

  - dimension: organization_group_id
    type: int
    hidden: true
    sql: ${TABLE}.organization_group_id

  - dimension: patient_credit_note_template
    hidden: true
    sql: ${TABLE}.patient_credit_note_template

  - dimension: patient_invoice_template
    hidden: true
    sql: ${TABLE}.patient_invoice_template

  - dimension: patient_payment_template
    hidden: true
    sql: ${TABLE}.patient_payment_template

  - dimension: patient_refund_template
    hidden: true
    sql: ${TABLE}.patient_refund_template

  - dimension: status
    sql: ${TABLE}.status

  - dimension: tel
    sql: ${TABLE}.tel

  - dimension: telephone
    sql: ${TABLE}.telephone

  - dimension: time_zone_id
    type: int
    hidden: true
    sql: ${TABLE}.time_zone_id

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - billing_location_id
    - location_name
    - location.location_name
    - location.billing_location_id
    - address.address_id
    - issuing_company.issuing_company_id
    - issuing_company.issuing_company_name
    - organization_group.organization_group_id
    - organization_group.organization_group_name
    - individual.individual_id
    - individual.forename
    - individual.middlename
    - individual.surname
    - time_zone.time_zone_id
    - time_zone.name
    - allowed_location.count
    - appointment.count
    - appointment_search_location.count
    - appointment_search_result.count
    - cab_service.count
    - charge.count
    - class.count
    - cm_pricing_rule.count
    - cm_procedure_pricing_rule.count
    - cm_rule.count
    - cm_stc_rule.count
    - contract_location.count
    - cost_codes_lookups.count
    - cost_codes_lookups_backup.count
    - c_plan_pre_screen_counter_location.count
    - c_plan_pre_screen_instance.count
    - dicom_procedure_content.count
    - direct_debit_instruction.count
    - discount_location.count
    - emr2_encounter.count
    - emr2_order.count
    - emr2_procedure_type_location.count
    - emr2_study_type_location.count
    - healthcode_claim_message.count
    - healthcode_reference.count
    - individual.count
    - invoice.count
    - invoice_item.count
    - itb_invitation_location.count
    - lab_request.count
    - location.count
    - management_kpi_datum.count
    - news_item.count
    - observation_order.count
    - patient_medical_registration.count
    - payment.count
    - prescription.count
    - product_stock.count
    - report_scheduler.count
    - room.count
    - stock_level.count
    - task.count
    - went_to_bank.count
    - _appointments.count
    - _busies.count
    - _classes.count

