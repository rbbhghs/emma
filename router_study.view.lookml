- view: study
  fields:

  - dimension: id
    primary_key: true
    type: int
    hidden: true
    sql: ${TABLE}.id

  - dimension: patient_accession
    sql: ${TABLE}.patient_accession

  - dimension: patient_mrn
    sql: ${TABLE}.patient_mrn

  - dimension: study_description
    sql: ${TABLE}.study_description

  - dimension: study_instance_uid
    sql: ${TABLE}.study_instance_uid

  - measure: study_size_kb
    type: sum
    sql: ${TABLE}.study_size_kb

  - measure: count
    type: count
    drill_fields: [id, document_upload.count, router_job.count, study_series.count, study_sop_instance.count]

