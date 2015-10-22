- connection: emma

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards


- explore: treatment_cycle_referral
  label: Referrals
  joins:
    - join: payor
      type: inner
      relationship: many_to_one
      sql_on: ${treatment_cycle_referral.charge_to_id} = ${payor.individual_id}
      
    - join: patient
      type: inner
      relationship: many_to_one
      sql_on: ${treatment_cycle_referral.patient_id} = ${patient.individual_id}

    - join: appointment
      view_label: 'Appointment'
      type: left_outer
      relationship: many_to_one
      sql_on: ${treatment_cycle_referral.treatment_cycle_referral_id} = ${appointment.treatment_cycle_referral_id}
      fields: [appointment_id, status, start_date, start_time, start_week, start_month, end_date, end_time, arrive_date, arrive_time, leave_date, leave_time, view_date, view_time, dna, late_cancellation, number_of_appts]
  
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
      
- explore: charge
  label: Charge
  #fields: [charge.amount, charge.quantity, charge.effective_time, charge.effective_date, charge.effective_week, charge.price, charge.status]  
  joins:
    - join: payor
      type: inner
      relationship: many_to_one
      sql_on: ${charge.charge_to_id} = ${payor.individual_id}
      
    - join: patient
      view_label: 'Patient'
      type: inner
      relationship: many_to_one
      sql_on: ${charge.patient_id} = ${patient.individual_id}
      
    - join: location
      view_label: 'Location'
      type: left_outer
      relationship: many_to_one
      sql_on: ${charge.location_id} = ${location.location_id}
      
    - join: product
      type: left_outer
      view_label: 'Appointment'
      relationship: one_to_one
      sql_on: ${charge.product_id} = ${product.product_id}
      fields: [product_name, sage_reference]  
      
    - join: contract
      type: left_outer
      view_label: 'Appointment'
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
      
    - join: individual
      type: left_outer
      label: 'Activity'
      relationship: many_to_one
      required_joins: [dashboard_event]
      sql_on: ${dashboard_event.created_by_id} = ${individual.individual_id}
      fields: [full_name, dob_date]       
      
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
      sql_on: ${patient_id} = ${individual.individual_id}
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
      sql_on: ${appointment.patient_id} = ${patient.individual_id}
      
    - join: appointment_type
      view_label: 'Appointments'
      type: left_outer
      relationship: many_to_one
      sql_on: appointment.appointment_type_id = appointment_type.appointment_type_id
      fields: [appointment_type_name]   
      
    - join: charge
      view_label: 'Charges'
      type: left_outer
      relationship: one_to_many
      sql_on: ${appointment.appointment_id} = ${charges.appointment_id}  
    
    - join: patient
      view_label: 'Patient'
      type: left_outer
      required_joins: [individual]
      relationship: one_to_one
      sql_on: ${patient_id} = ${individual.individual_id}  
      
    - join: practitioner
      from: individual
      view_label: 'Practitioner'
      type: inner
      relationship: one_to_one
      sql_on: ${appointment.primary_doctor_id} = ${individual_id} 
      fields: [full_name, dob_date]
      
    - join: location
      view_label: 'Appointment Location'
      type: left_outer
      relationship: many_to_one
      sql_on: ${appointment.location_id} = ${location.location_id}
      
    - join: location_address
      from: address
      view_label: 'Appointment location'
      type: left_outer
      relationship: one_to_one
      sql_on: location.address_id=address.address_id
      required_joins: [location]
      fields: [address_1, address_2, address_3, address_4, address_5, town, postcode, country] 
      
    - join: patient_address
      from: address
      view_label: 'Patient'
      type: left_outer
      relationship: one_to_one
      sql_on: patient.address_id=${address_id}
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
    requires: appointment
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
    
  
  
