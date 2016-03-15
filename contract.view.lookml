- view: contract
  fields:

  - dimension: contract_id
    primary_key: true
    type: int
    sql: ${TABLE}.contract_id

  - dimension: contract_name
    sql: ${TABLE}.contract_name

  - dimension: contract_notes
    sql: ${TABLE}.contract_notes

  - dimension: is_enabled_first_available_appointment
    type: int
    hidden: true
    sql: ${TABLE}.is_enabled_first_available_appointment

  - dimension: is_template
    type: yesno
    hidden: true
    sql: ${TABLE}.is_template

  - dimension: issuing_company_payment_detail_type_id
    type: int
    hidden: true
    sql: ${TABLE}.issuing_company_payment_detail_type_id

  - dimension_group: last_modified
    type: time
    hidden: true
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    hidden: true
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    hidden: true
    sql: ${TABLE}.modified_by_function

  - dimension: status
    sql: case when ${TABLE}.status = 'A' then 'Active' when ${TABLE}.status = 'C' then 'Cancelled' when ${TABLE}.status = 'P' then 'Pending' else 'Unknown' End 

  - dimension: workflow_id
    type: int
    hidden: true
    sql: ${TABLE}.workflow_id

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - contract_id
    - contract_name
    - issuing_company_payment_detail_type.issuing_company_payment_detail_type_id
    - issuing_company_payment_detail_type.name
    - workflow.workflow_id
    - workflow.workflow_name
    - appointment.count
    - appointment_search.count
    - appointment_type.count
    - available_product.count
    - available_product_set.count
    - charge.count
    - clinical_report_type_contract.count
    - communication_preference_entity.count
    - communication_reminder_preference_entity.count
    - company.count
    - contract_event.count
    - contract_location.count
    - contract_parameter_instances.count
    - c_plan_study.count
    - c_plan_study_plan.count
    - failed_patient_import.count
    - insurance_company.count
    - itb_invitation.count
    - membership_type.count
    - organization_group_contract.count
    - patient.count
    - procedure_billing_policy.count

