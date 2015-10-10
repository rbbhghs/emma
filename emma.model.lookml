- connection: emma

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards


- explore: treatment_cycle_referral
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

    - join: appointment
      type: left_outer
      relationship: many_to_one
      sql_on: ${treatment_cycle_referral.treatment_cycle_referral_id} = ${appointment.treatment_cycle_referral_id}
      
    - join: appointment_type
      type: left_outer
      relationship: many_to_one
      sql_on: ${appointment.appointment_type_id} = ${appointment_type.appointment_type_id}
      
    - join: referrer
      type: left_outer
      relationship: many_to_one
      sql_on: ${treatment_cycle_referral.from_id} = ${referrer.individual_id}      
            
            