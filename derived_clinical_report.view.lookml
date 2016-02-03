- view: derived_clinical_report
  derived_table:
    sql: |
      select appointment_section_study_id, cr.report_id, crv.created_date, crtv.name report_name, crv.published_date, crv.report_version_id
      from appointment_section_study_clinical_report 
      LEFT JOIN clinical_report cr ON clinical_report_id = cr.report_id
      LEFT JOIN clinical_report_version crv ON cr.report_id = crv.report_id AND crv.version_number = (SELECT MAX(version_number) FROM clinical_report_version crv2 WHERE crv2.report_id = crv.report_id AND crv2.status = 'A')
      LEFT JOIN clinical_report_type_version crtv ON cr.report_type_version_id = crtv.report_type_version_id;
    sql_trigger_value: SELECT CURDATE()
    indexes: [appointment_section_study_id]


  fields:
#  - measure: state_duration_in_seconds
#    type: sum
#    drill_fields: detail*

#  - measure: report_id
#    type: count
#    drill_fields: detail*

#  - measure: appointment_section_study_id
#    type: count
#    drill_fields: detail*
    
  - dimension: appointment_section_study_id
    type: int
    primary_key: true
    sql: ${TABLE}.appointment_section_study_id

  - dimension: report_id
    sql: ${TABLE}.report_id

#  - dimension: created_date
#    sql: ${TABLE}.created_date

  - dimension_group: created_date
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_date
    
  - dimension: report_name
    sql: ${TABLE}.report_name
    
#  - dimension: published_date
#    sql: ${TABLE}.published_date    

  - dimension_group: published_date
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.published_date


  - dimension: report_version_id
    sql: ${TABLE}.report_version_id   
    
#  - dimension: new_appointments
#    type: int
#    sql: ${TABLE}.new_appointments

  sets:
    detail:
      - report_id
      - appointment_section_study_id
      - created_date
      - report_name 
      - published_date 
      - report_version_id

