- view: invoice
  fields:

  - dimension: raised_by_invoice_id
    primary_key: true
    type: int
    hidden: true
    sql: ${TABLE}.raised_by_invoice_id

  - dimension: collect_by_direct_debit
    type: yesno
    sql: ${TABLE}.collect_by_direct_debit

  - dimension: comments
    sql: ${TABLE}.comments

  - dimension: company_contact_id
    type: int
    hidden: true
    sql: ${TABLE}.company_contact_id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created

  - dimension: currency
    sql: ${TABLE}.currency

  - dimension_group: due
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.due

  - dimension: emailed
    type: yesno
    sql: ${TABLE}.emailed

  - dimension: external_invoice_id
    type: int
    hidden: true
    sql: ${TABLE}.external_invoice_id

  - dimension: external_invoice_number
    sql: ${TABLE}.external_invoice_number

  - dimension: external_invoice_reference_1
    hidden: true
    sql: ${TABLE}.external_invoice_reference_1

  - dimension: external_invoice_reference_2
    hidden: true
    sql: ${TABLE}.external_invoice_reference_2

  - dimension: invoice_id
    type: int
    hidden: true
    sql: ${TABLE}.invoice_id

  - dimension: invoice_reissue_reason_id
    type: int
    hidden: true
    sql: ${TABLE}.invoice_reissue_reason_id

  - dimension: invoice_status_id
    type: int
    hidden: true
    sql: ${TABLE}.invoice_status_id

  - dimension: invoice_text
    sql: ${TABLE}.invoice_text

  - dimension: invoicee_id
    type: int
    sql: ${TABLE}.invoicee_id

  - dimension: invoicee_reference
    sql: ${TABLE}.invoicee_reference

  - dimension: issued_by_id
    type: int
    sql: ${TABLE}.issued_by_id

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

  - dimension: notes
    sql: ${TABLE}.notes

  - dimension: outstanding
    type: number
    sql: ${TABLE}.outstanding

  - dimension: patient_id
    type: int
    hidden: true
    sql: ${TABLE}.patient_id

  - dimension: payment_method_detail
    sql: ${TABLE}.payment_method_detail

  - dimension: payment_method_id
    type: int
    hidden: true
    sql: ${TABLE}.payment_method_id

  - dimension: purchase_order_no
    sql: ${TABLE}.purchase_order_no

  - dimension: reissue_of_id
    type: int
    hidden: true
    sql: ${TABLE}.reissue_of_id

  - dimension: removal_invoice
    type: yesno
    hidden: true
    sql: ${TABLE}.removal_invoice

  - dimension: show_patient_details
    type: yesno
    hidden: true
    sql: ${TABLE}.show_patient_details

  - dimension: show_patient_names
    type: yesno
    hidden: true
    sql: ${TABLE}.show_patient_names

  - dimension: status
    sql: ${TABLE}.status

  - dimension: total_price
    type: number
    sql: ${TABLE}.total_price

  - dimension: total_price_net
    type: number
    sql: ${TABLE}.total_price_net

  - dimension: total_vat
    type: number
    sql: ${TABLE}.total_vat
    
  - dimension: payments_allocated
    type: number
    sql: ${TABLE}.total_price-${TABLE}.outstanding
      
  - dimension_group: written_off
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.written_off

  - measure: count
    label: 'Number of invoices raised'
    type: count_distinct
    sql_distinct_key: ${invoice_id}
    drill_fields: detail*
    
  - measure: sum_outstanding
    label: 'Sum Outstanding'
    type: sum_distinct
    sql_distinct_key: ${invoice_id}
    sql: ${outstanding}   
    
  - measure: total_billed
    label: 'Sum Billed (incl VAT)'
    type: sum_distinct
    sql_distinct_key: ${invoice_id}
    sql: ${total_price} 
    
  - measure: sum_total_vat
    label: 'Total VAT'
    type: sum_distinct
    sql_distinct_key: ${invoice_id}
    sql: ${total_vat} 
    
  - measure: avg_total_vat
    label: 'Avg VAT'
    type: avg_distinct
    sql_distinct_key: ${invoice_id}
    sql: ${total_vat}   
    
  - measure: total_billed_net
    label: 'Sum Billed (excl VAT)'
    type: sum_distinct
    sql_distinct_key: ${invoice_id}
    sql: ${total_price_net}  
    
  - measure: avg_outstanding
    label: 'Avg Outstanding'
    type: avg_distinct
    sql_distinct_key: ${invoice_id}
    sql: ${outstanding}   
    
  - measure: avg_billed_net
    label: 'Avg Billed (incl VAT)'
    type: avg_distinct
    sql_distinct_key: ${invoice_id}
    sql: ${total_price}  
    
  - measure: avg_billed
    label: 'Avg Billed (excl VAT)'
    type: avg_distinct
    sql_distinct_key: ${invoice_id}
    sql: ${total_price_net} 
    


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - raised_by_invoice_id
    - invoice.raised_by_invoice_id
    - patient.source_name
    - patient.nickname
    - patient.company_contact_name
    - patient.preferred_forename
    - patient.preferred_middlename
    - patient.preferred_surname
    - patient.provided_gp_name
    - location.location_name
    - location.billing_location_id
    - invoice_status.invoice_status_id
    - invoice_status.name
    - invoice_reissue_reason.invoice_reissue_reason_id
    - invoice_reissue_reason.invoice_reissue_reason_name
    - payment_method.payment_method_id
    - payment_method.payment_method_name
    - charge.count
    - healthcode_claim.count
    - invoice.count
    - invoice_item.count
    - _charges.count
    - _detailed_charges.count

