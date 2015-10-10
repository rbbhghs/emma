- view: id_domain
  fields:

  - dimension: id_domain_id
    primary_key: true
    type: int
    sql: ${TABLE}.id_domain_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: name
    sql: ${TABLE}.name

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: [id_domain_id, name, id_domain_patient_medical_record_number.count, individual.count, study_identifier.count]

