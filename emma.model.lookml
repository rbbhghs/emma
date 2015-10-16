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
      
    - join: location
      type: left_outer
      relationship: many_to_one
      sql_on: ${treatment_cycle_referral.to_location_id} = ${location.location_id}

    - join: appointments
      type: left_outer
      relationship: many_to_one
      sql_on: ${treatment_cycle_referral.treatment_cycle_referral_id} = ${appointments.treatment_cycle_referral_id}
#       fields: [detail*]
      
    - join: referrer
      type: left_outer
      relationship: many_to_one
      sql_on: ${treatment_cycle_referral.from_practitioner_id} = ${referrer.individual_id}  
      
- explore: charge
  label: Charge
  fields: [amount, quantity, effective_time, effective_date, effective_week, price, status]
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
      fields: [location_name, status]
      
    - join: product
      type: left_outer
      view_label: 'Appointment'
      relationship: one_to_one
      sql_on: ${charge.product_id} = ${product.product_id}
      fields: [product_name, sage_reference]  
      
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
      fields: [appointment_id, status, start_date, start_time , end_date, end_time, arrive_date, arrive_time, leave_date, leave_time, view_date, view_time, dna, late_cancellation]
  
    - join: appointment_type
      view_label: 'Appointment'
      type: left_outer
      relationship: many_to_one
      sql_on: appointment.appointment_type_id = appointment_type.appointment_type_id
      fields: [appointment_type_name] 
      required_joins: [appointment]
  
  
- explore: appointments
  label: Appointments
  joins:
    - join: patient
      type: left_outer
      relationship: many_to_one
      sql_on: ${appointment.patient_id} = ${patient.individual_id}
      
    - join: charges
      type: left_outer
      relationship: one_to_many
      sql_on: ${appointments.appointment_id} = ${charges.appointment_id}  
             
            
