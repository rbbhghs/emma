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
      