- connection: six_local

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards


      
      
- explore: Patients
  from: individual
  label: 'Patients'
  #fields: [charge.amount, charge.quantity, charge.effective_time, charge.effective_date, charge.effective_week, charge.price, charge.status]  
  joins:
    - join: patient
      type: inner
      view_label: 'Patients'
      relationship: one_to_one
      sql_on: ${patient.individual_id} = ${Patients.individual_id}
      
   # - join: contract
    #  view_label: 'Billing details'
  ##    type: left_outer
  #    relationship: one_to_many
   #   sql_on: ${contract.contract_id} = ${patient.contract_id}
    #  required_joins: [patient]
     # fields: [contract_name] 
      
    - join: company
      type: left_outer
      view_label: 'Billing details'
      relationship: one_to_many
      sql_on: ${patient.company_id} = ${company.individual_id}
      required_joins: [patient]
      fields: [company_name] 
      
    - join: insurance_company
      type: left_outer
      view_label: 'Billing details'
      relationship: one_to_many
      sql_on: ${patient.insurance_company_id} = ${insurance_company.individual_id}
      required_joins: [patient]
      fields: [insurance_company_name]  
      
    - join: patient_address
      from: address
      view_label: 'Address details'
      type: left_outer
      relationship: one_to_one
      sql_on: Patients.individual_id=patient_address.individual_id
      fields: [address_1, address_2, address_3, address_4, address_5, town, country]
      
    - join: location_coords  
      from: postcodelatlng
      view_label: 'Address details'
      type: left_outer
      relationship: one_to_one
      sql_on: patient_address.postcode=location_coords.postcode
      required_joins: [patient_address]
      fields: [postcode, coordinate]  
      
    - join: charge_summary
      type: left_outer
      view_label: 'Charges'
      relationship: many_to_one
      sql_on: ${Patients.individual_id} = ${charge_summary.patient_id}
      #fields: [price, quantity] 
      
    - join: product
      type: left_outer
      view_label: 'Charges'
      relationship: one_to_many
      sql_on: ${charge_summary.product_id} = ${product.product_id}
      fields: [product_name, sage_reference]   
