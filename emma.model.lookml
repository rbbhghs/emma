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
      
    - join: referrer
      type: left_outer
      relationship: many_to_one
      sql_on: ${treatment_cycle_referral.from_practitioner_id} = ${referrer.individual_id}      
            
            