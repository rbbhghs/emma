- view: charge
  fields:

  - dimension: cloned_from_charge_id
    type: int
    hidden: true
    sql: ${TABLE}.cloned_from_charge_id
    
  - dimension: self_payer
    type: yesno  
    sql: ${charge_to_id} = ${patient_id}  

  - dimension: amount
    type: number
    hidden: true
    sql: ${TABLE}.amount

  - dimension: appointment_id
    type: int
    hidden: true
    sql: ${TABLE}.appointment_id

  - dimension: available_product_id
    type: int
    hidden: true
    sql: ${TABLE}.available_product_id

  - dimension: batch
    sql: ${TABLE}.batch

  - dimension: charge_id
    type: int
    primary_key: true
    hidden: true
    sql: ${TABLE}.charge_id

  - dimension: charge_to_id
    type: int
    hidden: true
    sql: ${TABLE}.charge_to_id

  - dimension: comments
    sql: ${TABLE}.comments

  - dimension: contract_id
    type: int
    hidden: true
    sql: ${TABLE}.contract_id

  - dimension: credit
    type: yesno
    sql: ${TABLE}.credit

  - dimension: currency
    sql: ${TABLE}.currency

  - dimension_group: effective
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.effective

  - dimension: invoice_id
    type: int
    hidden: true
    sql: ${TABLE}.invoice_id

  - dimension_group: invoiced
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.invoiced

  - dimension_group: last_modified
    type: time
    hidden: true
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: location_id
    type: int
    hidden: true
    sql: ${TABLE}.location_id

  - dimension: modified_by_function
    hidden: true
    sql: ${TABLE}.modified_by_function

  - dimension: patient_id
    type: int
    hidden: true
    sql: ${TABLE}.patient_id

  - dimension: price
    type: number
    sql: ${TABLE}.price

  - dimension: product_id
    type: int
    hidden: true
    sql: ${TABLE}.product_id

  - dimension: purchase_order_no
    sql: ${TABLE}.purchase_order_no

  - dimension: quantity
    type: int
    sql: ${TABLE}.quantity

  - dimension: status
    sql: ${TABLE}.status

  - measure: number_of_charges
    label: '# of Charges'
    type: count_distinct
    sql: ${charge_id}
    sql_distinct_key: ${charge_id}

    
  - measure: number_of_appts
    label: '# of Appts'
    type: count_distinct
    sql: ${appointment_id}
    
  - measure: number_of_invoices
    label: '# of Invoices'
    type: count_distinct
    sql: ${invoice_id}  
    sql_distinct_key: ${invoice_id}
    
  - measure: number_of_patients
    label: '# of Patients'
    type: count_distinct
    sql: ${patient_id}  
    sql_distinct_key: ${patient_id}  

    
  - measure: sum_charged
    label: 'Sum of Charges'
    type: sum_distinct
    sql: ${price} 
    sql_distinct_key: ${charge_id}

    


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - cloned_from_charge_id
    - charge.cloned_from_charge_id
    - product.product_id
    - product.product_name
    - contract.contract_id
    - contract.contract_name
    - available_product.available_product_id
    - appointment.appointment_id
    - patient.source_name
    - patient.nickname
    - patient.company_contact_name
    - patient.preferred_forename
    - patient.preferred_middlename
    - patient.preferred_surname
    - patient.provided_gp_name
    - location.location_name
    - location.billing_location_id
    - invoice.raised_by_invoice_id
    - appointment_booklet.count
    - charge.count
    - dashboard_event.count
    - dental_tooth_treatment.count
    - dental_tooth_treatment_charge.count
    - emr2_scheduled_service.count
    - invoice_item.count
    - preemp_response.count
    - prescription_item_charge.count
    - task_charge.count
    - _dashboard_distributions_without_emails.count

