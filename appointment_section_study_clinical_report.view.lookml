- view: appointment_section_study_clinical_report
  fields:

  - dimension: appointment_section_study_clinical_report_id
    primary_key: true
    type: int
    sql: ${TABLE}.appointment_section_study_clinical_report_id

  - dimension: appointment_section_study_id
    type: int
    # hidden: true
    sql: ${TABLE}.appointment_section_study_id

  - dimension: clinical_report_id
    type: int
    # hidden: true
    sql: ${TABLE}.clinical_report_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - measure: count
    type: count
    drill_fields: [appointment_section_study_clinical_report_id, appointment_section_study.appointment_section_study_id]

