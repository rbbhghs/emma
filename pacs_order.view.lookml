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

