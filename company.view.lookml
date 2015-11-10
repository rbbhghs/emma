- view: company
  fields:

  - dimension: alternate_contact_id
    type: int
    sql: ${TABLE}.alternate_contact_id

  - dimension: billing_contact_id
    type: int
    sql: ${TABLE}.billing_contact_id

  - dimension: billing_frequency
    type: int
    sql: ${TABLE}.billing_frequency

  - dimension_group: billing_start
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.billing_start

  - dimension: broker_contact_id
    type: int
    sql: ${TABLE}.broker_contact_id

  - dimension: company_bookings
    type: yesno
    sql: ${TABLE}.company_bookings

  - dimension: company_contact_method_id
    type: int
    # hidden: true
    sql: ${TABLE}.company_contact_method_id

  - dimension: company_name
    sql: ${TABLE}.company_name

  - dimension: company_notes
    sql: ${TABLE}.company_notes

  - dimension: company_reference
    sql: ${TABLE}.company_reference

  - dimension: company_sales_channel_id
    type: int
    # hidden: true
    sql: ${TABLE}.company_sales_channel_id

  - dimension: company_sector_id
    type: int
    # hidden: true
    sql: ${TABLE}.company_sector_id

  - dimension_group: company_start
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.company_start

  - dimension: contract_contact
    sql: ${TABLE}.contract_contact

  - dimension_group: contract_expiry
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.contract_expiry

  - dimension: contract_id
    type: int
    # hidden: true
    sql: ${TABLE}.contract_id

  - dimension: contract_notes
    sql: ${TABLE}.contract_notes

  - dimension_group: contract_reminder
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.contract_reminder

  - dimension_group: contract_renewal
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.contract_renewal

  - dimension_group: contract_start
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.contract_start

  - dimension: employee_email_address_template
    sql: ${TABLE}.employee_email_address_template

  - dimension: individual_id
    type: int
    # hidden: true
    sql: ${TABLE}.individual_id

  - dimension: invoice_reference
    sql: ${TABLE}.invoice_reference

  - dimension: invoicing_frequency
    type: yesno
    sql: ${TABLE}.invoicing_frequency

  - dimension: is_zero_vat_rated
    type: yesno
    sql: ${TABLE}.is_zero_vat_rated

  - dimension: issue_own_invoice
    type: yesno
    sql: ${TABLE}.issue_own_invoice

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: lay_report_contact_id
    type: int
    sql: ${TABLE}.lay_report_contact_id

  - dimension: lay_report_required
    type: yesno
    sql: ${TABLE}.lay_report_required

  - dimension: local_contact_id
    type: int
    sql: ${TABLE}.local_contact_id

  - dimension: locked
    type: yesno
    sql: ${TABLE}.locked

  - dimension: logo_mime_type
    sql: ${TABLE}.logo_mime_type

  - dimension: medical_report_contact_id
    type: int
    sql: ${TABLE}.medical_report_contact_id

  - dimension: medical_report_required
    type: yesno
    sql: ${TABLE}.medical_report_required

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: no_recall
    type: yesno
    sql: ${TABLE}.no_recall

  - dimension: online_booking_comment
    sql: ${TABLE}.online_booking_comment

  - dimension: online_bookings
    type: yesno
    sql: ${TABLE}.online_bookings

  - dimension: parent_id
    type: int
    sql: ${TABLE}.parent_id

  - dimension: patient_details_on_invoices
    type: yesno
    sql: ${TABLE}.patient_details_on_invoices

  - dimension: patient_instructions
    sql: ${TABLE}.patient_instructions

  - dimension: patient_names_on_invoices
    type: yesno
    sql: ${TABLE}.patient_names_on_invoices

  - dimension: primary_contact_id
    type: int
    sql: ${TABLE}.primary_contact_id

  - dimension: purchase_order_no
    sql: ${TABLE}.purchase_order_no

  - dimension: receive_confirmation_cancellation
    type: yesno
    sql: ${TABLE}.receive_confirmation_cancellation

  - dimension: removal_enabled
    type: yesno
    sql: ${TABLE}.removal_enabled

  - dimension: ris_id
    sql: ${TABLE}.ris_id

  - dimension: sage_reference
    sql: ${TABLE}.sage_reference

  - dimension: staff_team_id
    type: int
    # hidden: true
    sql: ${TABLE}.staff_team_id

  - dimension: subsidiaries
    sql: ${TABLE}.subsidiaries

  - dimension: vat_number
    sql: ${TABLE}.vat_number

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - company_name
    - individual.individual_id
    - individual.forename
    - individual.middlename
    - individual.surname
    - contract.contract_id
    - contract.contract_name
    - company_sector.company_sector_id
    - company_sector.company_sector_name
    - staff_team.staff_team_id
    - staff_team.staff_team_name
    - company_contact_method.company_contact_method_id
    - company_contact_method.name
    - company_sales_channel.company_sales_channel_id
    - company_sales_channel.name
    - company_contact.count
    - company_eligibility_level.count
    - company_form.count
    - company_office.count
    - company_report.count
    - c_plan_study_company.count
    - email_template.count
    - event.count
    - external_practice.count
    - failed_patient_import.count
    - import.count
    - patient.count
    - patient_import_field_mapping.count
    - patient_import_file_format.count
    - patient_import_file_mapping.count
    - recall_frequency.count
    - recall_rule.count
    - recall_string.count
    - report_scheduler.count
    - task.count
    - validations.count
    - _outcomes.count

