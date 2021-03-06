- connection: emma

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards

- explore: outcomes
  label: Outcomes

- explore: treatment_cycle_referral
  label: Referrals
  joins:
    - join: payor
      type: inner
      relationship: many_to_one
      sql_on: ${treatment_cycle_referral.charge_to_id} = ${payor.individual_id}
      
    - join: individual
      view_label: 'Patient'
      type: left_outer
      relationship: many_to_one
      sql_on: treatment_cycle_referral.patient_id = individual.individual_id
      fields: [full_name, dob_date, telephone_mobile, telephone_day, telephone_evening, email]

    - join: patient
      view_label: 'Patient'
      type: left_outer
      required_joins: [individual]
      relationship: one_to_one
      sql_on: patient.individual_id = individual.individual_id 

    - join: appointment
      view_label: 'Appointment'
      type: left_outer
      relationship: many_to_one
      sql_on: ${treatment_cycle_referral.treatment_cycle_referral_id} = ${appointment.treatment_cycle_referral_id}
      fields: [appointment_id, status, start_date, start_time, start_week, start_month, end_date, end_time, arrive_date, arrive_time, leave_date, leave_time, view_date, view_time, dna, late_cancellation, number_of_appts]
  
    - join: appointment_type
      view_label: 'Appointment'
      type: left_outer
      relationship: many_to_one
      sql_on: appointment.appointment_type_id = appointment_type.appointment_type_id
      fields: [appointment_type_name] 
      required_joins: [appointment]
      
    - join: location
      view_label: 'Appointment location'
      type: left_outer
      relationship: one_to_one
      sql_on: ${appointment.location_id} = ${location.location_id}
      fields: [location_name]
      
    - join: location_address
      from: address
      view_label: 'Appointment location'
      type: left_outer
      relationship: one_to_one
      sql_on: location.address_id=address.address_id
      required_joins: [location]
      fields: [address_1, address_2, address_3, address_4, address_5, town, postcode, country]
      
    - join: referrer
      type: left_outer
      relationship: many_to_one
      sql_on: ${treatment_cycle_referral.from_practitioner_id} = ${referrer.individual_id}  
           
           
- explore: radiology_referrals
  from: treatment_cycle_referral
  label: 'Radiology referrals'
  joins:
    - join: payor
      type: inner
      relationship: many_to_one
      sql_on: ${radiology_referrals.charge_to_id} = ${payor.individual_id}
      
    - join: patient
      type: inner
      relationship: many_to_one
      sql_on: ${radiology_referrals.patient_id} = ${patient.individual_id}

    - join: appointment
      view_label: 'Appointment'
      type: left_outer
      relationship: many_to_one
      sql_on: ${radiology_referrals.treatment_cycle_referral_id} = ${appointment.treatment_cycle_referral_id}
      fields: [appointment_id, status, start_date, start_time, start_week, start_month, end_date, end_time, arrive_date, arrive_time, leave_date, leave_time, view_date, view_time, dna, late_cancellation, number_of_appts]
  
    - join: appointment_type
      view_label: 'Appointment'
      type: left_outer
      relationship: many_to_one
      sql_on: appointment.appointment_type_id = appointment_type.appointment_type_id
      fields: [appointment_type_name] 
      required_joins: [appointment]  
      
    - join: location
      view_label: 'Appointment location'
      type: left_outer
      relationship: one_to_one
      sql_on: ${appointment.location_id} = ${location.location_id}
      fields: [location_name]
      
    - join: location_address
      from: address
      view_label: 'Appointment location'
      type: left_outer
      relationship: one_to_one
      sql_on: location.address_id=address.address_id
      required_joins: [location]
      fields: [address_1, address_2, address_3, address_4, address_5, town, postcode, country]
      
    - join: referrer
      type: left_outer
      relationship: many_to_one
      sql_on: ${radiology_referrals.from_practitioner_id} = ${referrer.individual_id}  
      
    - join: appointment_section
      view_label: 'Appointment'
      type: left_outer
      relationship: many_to_one
      sql_on: ${appointment.appointment_id} = ${appointment_section.appointment_id}
      required_joins: [appointment]
      
    - join: appointment_section_study
      view_label: 'Appointment'
      type: left_outer
      relationship: many_to_one
      sql_on: ${appointment_section.appointment_section_id} = ${appointment_section_study.appointment_section_id} 
      required_joins: [appointment_section,appointment]
      fields: []
      
    - join: dicom_procedure
      view_label: 'Procedure'
      type: left_outer
      relationship: many_to_one
      required_joins: [appointment_section_study,appointment_section,appointment]
      sql_on: ${appointment_section_study.dicom_procedure_id} = ${dicom_procedure.dicom_procedure_id}    
      fields: [procedure_description, procedure_description_list, procedure_code_list, procedure_code, count, dicom_procedure_id]
           
    - join: dashboard_event
      view_label: 'Activity'
      type: inner
      relationship: many_to_one
      sql_on: ${radiology_referrals.treatment_cycle_referral_id} = ${dashboard_event.treatment_cycle_referral_id}
      fields: [created_time, created_date, created_week, created_month, datetime,date, average_date, min_date,max_date]
      
    - join: dashboard_action
      type: left_outer
      view_label: 'Activity'
      relationship: one_to_one
      required_joins: [dashboard_event]
      sql_on: ${dashboard_event.dashboard_action_id} = ${dashboard_action.dashboard_action_id}
      fields: [dashboard_action_name]  
      
    - join: creator
      type: left_outer
      view_label: 'Activity'
      relationship: many_to_one
      required_joins: [dashboard_event]
      sql_on: ${dashboard_event.created_by_id} = ${creator.individual_id}
      fields: [created_by]          
      
- explore: charge
  label: Charge
  #fields: [charge.amount, charge.quantity, charge.effective_time, charge.effective_date, charge.effective_week, charge.price, charge.status]  
  joins:
    - join: payor
      type: inner
      relationship: many_to_one
      sql_on: ${charge.charge_to_id} = ${payor.individual_id}
      
    - join: patients
      view_label: 'Patient'
      type: inner
      relationship: many_to_one
      sql_on: ${charge.patient_id} = ${individual_id}
      
    - join: location
      view_label: 'Location'
      type: left_outer
      relationship: many_to_one
      sql_on: ${charge.location_id} = ${location.location_id}
      
    - join: product
      type: left_outer
      view_label: 'Charge'
      relationship: one_to_one
      sql_on: ${charge.product_id} = ${product.product_id}
      fields: [product_name, sage_reference]  
      
    - join: contract
      type: left_outer
      view_label: 'Charge'
      relationship: many_to_one
      sql_on: ${charge.contract_id} = ${contract.contract_id}
      fields: [contract_name]    
      
    - join: location_address
      from: address
      view_label: 'Location'
      type: left_outer
      relationship: one_to_one
      sql_on: location.address_id=${address_id}
      required_joins: [location]
      fields: [address_1, address_2, address_3, address_4, address_5, town, postcode, country]
      
    - join: appointment
      view_label: 'Appointment'
      type: left_outer
      relationship: many_to_one
      sql_on: appointment.appointment_id = charge.appointment_id
      fields: [appointment_id, status, start_date, start_time, start_week, start_month, end_date, end_time, arrive_date, arrive_time, leave_date, leave_time, view_date, view_time, dna, late_cancellation, number_of_appts]
  
    - join: appointment_type
      view_label: 'Appointment'
      type: left_outer
      relationship: many_to_one
      sql_on: appointment.appointment_type_id = appointment_type.appointment_type_id
      fields: [appointment_type_name] 
      required_joins: [appointment]

- explore: referral_log
  from: treatment_cycle_referral
  label: 'Referral log'
  joins:
    - join: dashboard_event
      label: 'Activity'
      type: inner
      relationship: many_to_one
      sql_on: ${treatment_cycle_referral_id} = ${dashboard_event.treatment_cycle_referral_id}
      fields: [created_time, created_date, created_week, created_month, datetime,date, average_date, min_date,max_date]
      
    - join: dashboard_action
      type: left_outer
      label: 'Activity'
      relationship: one_to_one
      required_joins: [dashboard_event]
      sql_on: ${dashboard_event.dashboard_action_id} = ${dashboard_action.dashboard_action_id}
      fields: [dashboard_action_name]  
      
    - join: creator
      type: left_outer
      label: 'Activity'
      relationship: many_to_one
      required_joins: [dashboard_event]
      sql_on: ${dashboard_event.created_by_id} = ${creator.individual_id}
      fields: [created_by]       
      
    - join: charge
      type: left_outer
      view_label: 'Charge'
      relationship: one_to_one
      required_joins: [dashboard_event]
      sql_on: ${dashboard_event.charge_id} = ${charge.charge_id}
      fields: [price, quantity] 
      
    - join: product
      type: left_outer
      view_label: 'Charge'
      relationship: one_to_one
      sql_on: ${charge.product_id} = ${product.product_id}
      fields: [product_name, sage_reference]    
      
    - join: location
      view_label: 'Referred to location'
      type: left_outer
      relationship: many_to_one
      sql_on: ${treatment_cycle_referral.to_location_id} = ${location.location_id}
      fields: [location_name]  
      
    - join: location_address
      from: address
      view_label: 'Referred to location'
      type: left_outer
      relationship: one_to_one
      sql_on: location.address_id=${address_id}
      required_joins: [location]
      fields: [address_1, address_2, address_3, address_4, address_5, town, postcode, country]  
    
    - join: payor
      type: inner
      relationship: many_to_one
      sql_on: ${charge_to_id} = ${payor.individual_id}  
      
    - join: referrer
      type: left_outer
      relationship: many_to_one
      sql_on: ${from_practitioner_id} = ${referrer.individual_id}    
  
  
  
- explore: form_data 
  from: form_response
  label: 'Form data'
  joins:
    - join: appointment
      view_label: 'Appointment'
      type: left_outer
      relationship: many_to_one
      sql_on: ${appointment_id} = ${appointment.appointment_id}
      fields: [appointment_id, status, start_date, start_time, start_week, start_month, end_date, end_time, arrive_date, arrive_time, leave_date, leave_time, view_date, view_time, dna, late_cancellation, number_of_appts]
  
    - join: appointment_type
      view_label: 'Appointment'
      type: left_outer
      relationship: many_to_one
      sql_on: appointment.appointment_type_id = appointment_type.appointment_type_id
      required_joins: [appointment]
      fields: [appointment_type_name] 

    - join: individual
      type: left_outer
      label: 'Patient'
      relationship: many_to_one
      sql_on: ${patient_id} = individual.individual_id
      fields: [full_name, dob_date]   
      
    - join: form_question_version 
      label: 'Form data'
      type: left_outer
      relationship: one_to_many
      sql_on: ${form_question_version_id}=${form_question_version.form_question_version_id}
      fields: [question_name]
      
  
- explore: appointment
  label: 'Appointments'
  joins:
    - join: individual
      view_label: 'Patient'
      type: left_outer
      relationship: many_to_one
      sql_on: appointment.patient_id = individual.individual_id
      
    - join: appointment_type
      view_label: 'Appointment'
      type: left_outer
      relationship: many_to_one
      sql_on: appointment.appointment_type_id = appointment_type.appointment_type_id
      fields: [appointment_type_name]   
      
    - join: charge
      view_label: 'Charges'
      type: left_outer
      relationship: one_to_many
      sql_on: ${appointment.appointment_id} = ${charge.appointment_id}  
      
   # - join: goal
    #  view_label: 'Goals'
    #  type: left_outer
    #  relationship: one_to_many
    #  sql_on: ${appointment.goal_id} = ${goal.goal_id}   
      
    #- join: goal_score
    #  view_label: 'Goal Scores'
    #  type: left_outer
    #  relationship: one_to_many
    #  sql_on: ${goal.goal_id} = ${goal_score.goal_id}     
    
    - join: patient
      view_label: 'Patient'
      type: left_outer
      required_joins: [individual]
      relationship: one_to_one
      sql_on: patient.individual_id = individual.individual_id 
      
    - join: insurance_company  
      view_label: 'Patient'
      type: left_outer
      required_joins: [patient]
      relationship: many_to_one
      sql_on: patient.insurance_company_id=insurance_company.individual_id
      fields: [insurance_company_name]
      
    - join: company  
      view_label: 'Patient'
      type: left_outer
      required_joins: [patient]
      relationship: many_to_one
      sql_on: patient.employer_id=company.individual_id
      fields: [company_name]  
      
    - join: practitioner
      from: individual
      view_label: 'Practitioner'
      type: inner
      relationship: one_to_one
      sql_on: ${appointment.primary_doctor_id} = practitioner.individual_id
      fields: [full_name, dob_date]
      
    - join: location
      view_label: 'Appointment Location'
      type: left_outer
      relationship: many_to_one
      sql_on: ${appointment.location_id} = ${location.location_id}
      
    - join: location_address
      from: address
      view_label: 'Appointment Location'
      type: left_outer
      relationship: one_to_one
      sql_on: location.address_id=location_address.address_id
      required_joins: [location]
      fields: [address_1, address_2, address_3, address_4, address_5, town, postcode, country] 
      
    - join: patient_address
      from: address
      view_label: 'Patient'
      type: left_outer
      relationship: one_to_one
      sql_on: patient.address_id=patient_address.address_id
      required_joins: [patient]
      fields: [address_1, address_2, address_3, address_4, address_5, town, postcode, country]  
      
      
- explore: appointment_section
  label: 'Practitioner Activity'
  joins:
  - join: practitioner
    from: individual
    view_label: 'Practitioner'
    type: left_outer
    relationship: many_to_one
    sql_on: ${appointment_section.doctor_id} = ${individual_id}
    
  - join: creator
    from: individual
    view_label: 'Created by'
    type: left_outer
    relationship: many_to_one
    sql_on: ${appointment_section.created_by_id} = ${creator.individual_id} 
    fields: [full_name]
      
  - join: appointment
    view_label: 'Appointments'
    type: left_outer
    relationship: many_to_one
    sql_on: appointment_section.appointment_id = appointment.appointment_id
      
  - join: appointment_type
    view_label: 'Appointments'
    type: left_outer
    relationship: many_to_one
    required_joins: appointment
    sql_on: appointment.appointment_type_id = appointment_type.appointment_type_id
    fields: [appointment_type_name]  
    
  - join: class
    view_label: 'Appointments'
    type: left_outer
    relationship: many_to_one
    sql_on: appointment_section.class_id = class.class_id  
      
  - join: class_type
    view_label: 'Appointments'
    type: left_outer
    relationship: many_to_one
    sql_on: class.class_type_id = class_type.class_type_id  
    
  - join: location
    view_label: 'Appointments'
    type: left_outer
    relationship: many_to_one
    sql_on: ${appointment.location_id} = ${location.location_id}
    fields: [location_name]
      
  - join: location_address
    from: address
    view_label: 'Appointments'
    type: left_outer
    relationship: one_to_one
    sql_on: ${location.address_id} = ${location_address.address_id}
    required_joins: [location]
    fields: [address_1, address_2, address_3, address_4, address_5, town, postcode, country]  
      
  - join: contract
    type: left_outer
    view_label: 'Appointments'
    relationship: many_to_one
    sql_on: ${appointment.contract_id} = ${appointment.contract_id}
    fields: [contract_name]  
    
- explore: diary
  label: 'Diary Utilisation'  
  joins:
  - join: diary_section
    view_label: 'Diary Utilisation'
    type: left_outer
    relationship: many_to_one
    sql_on: ${diary_section.diary_id} = ${diary.diary_id}
  
  - join: practitioner
    from: individual
    view_label: 'Practitioner'
    type: left_outer
    relationship: many_to_one
    sql_on: ${doctor_id} = ${individual.individual_id}
    
  - join: diary_template
    view_label: 'Diary Template'
    type: left_outer
    relationship: many_to_one
    sql_on: ${diary_template_id} = ${diary_template.diary_template_id} 
    
  - join: appointment_section
    view_label: 'Appointment Activity'
    type: left_outer
    relationship: many_to_one
    sql_on: ${diary.diary_id} = ${appointment_section.diary_id} 
    fields: [start_time, end_time, reservation]
    
  - join: appointment
    view_label: 'Appointment Activity'
    type: left_outer
    relationship: many_to_one
    required_joins: appointment_section
    sql_on: ${appointment_section.appointment_id} = ${appointment.appointment_id}
      
  - join: appointment_type
    view_label: 'Appointment Activity'
    type: left_outer
    relationship: many_to_one
    sql_on: ${appointment.appointment_type_id} = ${appointment_type.appointment_type_id}
    fields: [appointment_type_name]  
    
  - join: class
    view_label: 'Appointment Activity'
    type: left_outer
    relationship: many_to_one
    sql_on: ${appointment_section.class_id} = ${class.class_id} 
    fields: [class_id]
      
  - join: class_type
    view_label: 'Appointment Activity'
    type: left_outer
    relationship: many_to_one
    required_joins: class
    sql_on: ${class.class_type_id} = ${class_type.class_type_id} 
    fields: [class_type_name]
   
  - join: room
    view_label: 'Location'
    type: left_outer
    relationship: many_to_one
    sql_on: ${diary.room_id} = ${room.room_id}
    fields: [room_name]  
  
  - join: location
    view_label: 'Location'
    type: left_outer
    relationship: many_to_one
    required_joins: room
    sql_on: ${room.location_id} = ${location.location_id}
    fields: [location_name]  
    
    
- explore: invoices
  from: invoice
  label: 'Invoices'
  #fields: [charge.amount, charge.quantity, charge.effective_time, charge.effective_date, charge.effective_week, charge.price, charge.status]  
  joins:
    - join: payor
      view_label: 'Invoices'
      type: inner
      relationship: one_to_many
      sql_on: ${invoices.invoicee_id} = ${payor.individual_id}
      fields: [payor]
      
    - join: issuing_company
      view_label: 'Invoices'
      type: left_outer
      relationship: one_to_many
      sql_on: ${invoices.issued_by_id} = ${issuing_company.issuing_company_id}
      fields: [issuing_company_name]
      
    - join: patient
      from: individual
      view_label: 'Patient'
      type: inner
      relationship: many_to_one
      sql_on: ${invoices.patient_id} = ${patient.individual_id}
      fields: [full_name, dob_date, telephone_mobile, telephone_day, telephone_evening, email]
      
    - join: invoice_item
      view_label: 'Invoice Items'
      type: inner
      relationship: many_to_one
      sql_on: ${invoices.invoice_id} = ${invoice_item.invoice_id}
      
    - join: charge
      view_label: 'Charges'
      type: inner
      relationship: many_to_one
      sql_on: ${charge.charge_id} = ${invoice_item.charge_id}  

    - join: location
      view_label: 'Invoice Location'
      type: left_outer
      relationship: many_to_one
      sql_on: ${invoices.location_id} = ${location.location_id}
      fields: [location_name]
      
    - join: product
      type: left_outer
      view_label: 'Charges'
      relationship: one_to_one
      sql_on: ${charge.product_id} = ${product.product_id}
      fields: [product_name, sage_reference]  
      
    - join: contract
      type: left_outer
      view_label: 'Charges'
      relationship: many_to_one
      sql_on: ${charge.contract_id} = ${contract.contract_id}
      fields: [contract_name]    
      
    - join: location_address
      from: address
      view_label: 'Invoice Location'
      type: left_outer
      relationship: one_to_one
      sql_on: ${location.address_id}=location_address.address_id
      required_joins: [location]
      fields: [address_1, address_2, address_3, address_4, address_5, town, postcode, country]
      
    - join: appointment
      view_label: 'Appointment Information'
      type: left_outer
      relationship: many_to_one
      sql_on: ${appointment.appointment_id} = ${charge.appointment_id}
      fields: [appointment_id, status, start_date, start_time, start_week, start_month, end_date, end_time, arrive_date, arrive_time, leave_date, leave_time, view_date, view_time, dna, late_cancellation, number_of_appts]
  
    - join: practitioner
      from: individual
      view_label: 'Appointment Information'
      type: left_outer
      relationship: many_to_one
      sql_on: ${appointment.primary_doctor_id} = ${practitioner.individual_id}
      fields: [full_name]  
      
    - join: appointment_location
      from: location
      view_label: 'Appointment Information'
      type: left_outer
      relationship: many_to_one
      sql_on: ${appointment.location_id} = ${location.location_id} 
      fields: [location_name]
  
    - join: appointment_type
      view_label: 'Appointment Information'
      type: left_outer
      relationship: many_to_one
      sql_on: ${appointment.appointment_type_id} = ${appointment_type.appointment_type_id}
      fields: [appointment_type_name] 
      required_joins: [appointment]   
      
    - join: payment_allocation
      view_label: 'Payment Allocation'
      type: left_outer
      relationship: many_to_one
      sql_on: ${invoices.invoice_id} = ${payment_allocation.to_id} and ${payment_allocation.from_type}='3' and ${payment_allocation.to_type}='1' and ${payment_allocation.status}='A'
    
    - join: payment
      view_label: 'Payment Allocation'
      type: left_outer
      relationship: many_to_one
      sql_on: ${payment.payment_id} = ${payment_allocation.from_id} #and ${payment_allocation.from_type}='3' and ${payment_allocation.to_type}='1' and ${payment_allocation.status}='A'
      required_joins: [payment_allocation]   
      
    - join: payment_location
      from: location
      view_label: 'Payment Allocation'
      type: left_outer
      relationship: many_to_one
      sql_on: ${payment.location_id} = ${location.location_id} 
      fields: [location_name]
      required_joins: [payment, payment_allocation] 
      
    - join: refund_allocation
      from: payment_allocation
      view_label: 'Refund Allocation'
      type: left_outer
      relationship: many_to_one
      sql_on: ${payment.payment_id} = ${refund_allocation.from_id} and ${refund_allocation.from_type}='3' and ${refund_allocation.to_type}='4' and ${refund_allocation.status}='A'
    
    - join: refund
      from: payment
      view_label: 'Refund Allocation'
      type: left_outer
      relationship: many_to_one
      sql_on: ${refund.payment_id} = ${refund_allocation.to_id} #and ${refund_allocation.from_type}='4' and ${payment_allocation.to_type}='1' and ${refund_allocation.status}='A'
      required_joins: [refund_allocation]     
      
    - join: cn_allocation
      from: payment_allocation
      view_label: 'Credit Note Allocation'
      type: left_outer
      relationship: many_to_one
      sql_on: invoice.invoice_id = cn_allocation.from_id and cn_allocation.from_type='3' and cn_allocation.to_type='4' and cn_allocation.status='A'

  
    - join: credit_note
      from: invoice
      view_label: 'Credit Note Allocation'
      type: left_outer
      relationship: one_to_many
      sql_on: ${credit_note.invoice_id} = ${cn_allocation.to_id}  
      required_joins: [cn_allocation]
      fields: [external_invoice_number, invoice_id, created_date, created_time, created_week, created_month, total_price, total_price_net, outstanding]
  
      
  
- explore: payments
  from: payment
  label: 'Payments'
  joins:
    - join: payor
      view_label: 'Payments'
      type: inner
      relationship: one_to_many
      sql_on: ${payments.payer_id} = ${payor.individual_id}
      fields: [payor]
      
    - join: issuing_company
      view_label: 'Payments'
      type: left_outer
      relationship: one_to_many
      sql_on: ${payments.issuing_company_id} = ${issuing_company.issuing_company_id}
      fields: [issuing_company_name]
      
    - join: payment_method
      view_label: 'Payments'
      type: left_outer
      relationship: one_to_many
      sql_on: ${payments.payment_method_id} = ${payment_method.payment_method_id}
      fields: [payment_method_name]  
      
    - join: payment_location
      from: location
      view_label: 'Payments'
      type: left_outer
      relationship: many_to_one
      sql_on: ${payments.location_id} = ${location.location_id} 
      fields: [location_name]
    
    - join: patient
      from: individual
      view_label: 'Patient'
      type: inner
      relationship: many_to_one
      sql_on: ${payments.patient_id} = ${patient.individual_id}
      fields: [full_name, dob_date, telephone_mobile, telephone_day, telephone_evening, email]
      
    - join: appointment
      view_label: 'Appointment paid in advance'
      type: left_outer
      relationship: many_to_one
      sql_on: ${payments.appointment_id} = ${appointment.appointment_id}    
      
    - join: payment_allocation
      view_label: 'Payment Allocation'
      type: left_outer
      relationship: many_to_one
      sql_on: ${payments.payment_id} = ${payment_allocation.from_id} and ${payment_allocation.from_type}='3' and ${payment_allocation.to_type}='1' and ${payment_allocation.status}='A'
  
    - join: invoice
      view_label: 'Invoice allocated'
      type: left_outer
      relationship: one_to_many
      sql_on: ${invoice.invoice_id} = ${payment_allocation.to_id}  
      required_joins: [payment_allocation]
      fields: [external_invoice_number, invoice_id, created_date, created_time, created_week, created_month, total_price, total_price_net, outstanding]
      
    - join: location
      view_label: 'Invoice allocated'
      type: left_outer
      relationship: many_to_one
      sql_on: ${invoice.location_id} = ${location.location_id}
      fields: [location_name]  
      
    - join: invoice_item
      view_label: 'Invoice Items'
      type: left_outer
      relationship: many_to_one
      sql_on: ${invoice.invoice_id} = ${invoice_item.invoice_id}  
