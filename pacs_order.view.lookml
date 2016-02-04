- view: pacs_order
  fields:

  - dimension: id
    primary_key: true
    type: int
    sql: ${TABLE}.id

  - dimension: accession_number
    sql: ${TABLE}.accession_number

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: pacs_order_status
    sql: ${TABLE}.pacs_order_status

  - measure: count
    type: count
    drill_fields: [id, appointment_section_study.count, study_identifier.count, treatment_cycle_referral_procedure.count]

  - measure: accession_number_list 
    type: list 
    list_field: ${TABLE}.accession_number

  - measure: pacs_order_status_list 
    type: list 
    list_field: ${TABLE}.pacs_order_status

  - measure: accession_number_pacs_order_status_list 
    type: string 
    sql: group_concat(distinct ${TABLE}.accession_number,${TABLE}.pacs_order_status)    
    
    