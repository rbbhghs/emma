- connection: router

- include: "router*.view.lookml"       # include all views in this project
#- include: "*.dashboard.lookml"  # include all dashboards in this project


- explore: router_job
  label: DICOM Log
  #fields: [charge.amount, charge.quantity, charge.effective_time, charge.effective_date, charge.effective_week, charge.price, charge.status]  
  joins:
    - join: study_series
      view_label: 'Study Series'
      type: inner
      relationship: many_to_one
      sql_on: ${router_job.study_id} = ${study_series.study_id} 
      #fields: [full_name]
      
    - join: source_dicom_ae
      from: dicom_ae
      view_label: 'Source AE'
      type: inner
      relationship: many_to_one
      sql_on: ${router_job.source_ae_id} = ${source_dicom_ae.id} 
      
    - join: target_dicom_ae
      from: dicom_ae
      view_label: 'Target AE'
      type: inner
      relationship: many_to_one
      sql_on: ${router_job.destination_ae_id} = ${target_dicom_ae.id}   
      
    - join: study
      view_label: 'Study'
      type: inner
      relationship: one_to_many
      sql_on: ${study.id} = ${router_job.study_id}     
      
    - join: study_series_transfer
      view_label: 'Study series transfer'
      type: left_outer
      relationship: many_to_one
      sql_on: ${router_job.id} = ${study_series_transfer.router_job_id}   
      
      
- explore: study_series_transfer
  label: Study Log
  #fields: [charge.amount, charge.quantity, charge.effective_time, charge.effective_date, charge.effective_week, charge.price, charge.status]  
  joins:
    - join: router_job
      view_label: 'Router Job'
      type: left_outer
      relationship: many_to_one
      sql_on: ${router_job.id} = ${study_series_transfer.router_job_id}     
      
    - join: study_series
      view_label: 'Study Series'
      type: inner
      relationship: many_to_one
      required_joins: [router_job]
      sql_on: ${router_job.study_id} = ${study_series.study_id} 
      #fields: [full_name]
      
    - join: source_dicom_ae
      from: dicom_ae
      view_label: 'Source AE'
      type: inner
      required_joins: [router_job]
      relationship: many_to_one
      sql_on: ${router_job.source_ae_id} = ${source_dicom_ae.id} 
      
    - join: target_dicom_ae
      from: dicom_ae
      view_label: 'Target AE'
      required_joins: [router_job]
      type: inner
      relationship: many_to_one
      sql_on: ${router_job.destination_ae_id} = ${target_dicom_ae.id}   
      
    - join: study
      view_label: 'Study'
      type: inner
      required_joins: [router_job]
      relationship: one_to_many
      sql_on: ${study.id} = ${router_job.study_id}     
      
      
     