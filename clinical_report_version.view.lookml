- view: clinical_report_version
  fields:

  - dimension: created_by_id
    type: int
    hidden: true
    sql: ${TABLE}.created_by_id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_date

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    hidden: true
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    hidden: true
    sql: ${TABLE}.modified_by_function

  - dimension: pending_transcription
    type: yesno
    sql: ${TABLE}.pending_transcription

  - dimension_group: printed
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.printed_date

  - dimension_group: published
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.published_date

  - dimension: read_by_referrer
    type: yesno
    sql: ${TABLE}.read_by_referrer

  - dimension: report_classification_id
    type: int
    sql: ${TABLE}.report_classification_id

  - dimension: report_file
    sql: ${TABLE}.report_file

  - dimension: report_id
    type: int
    hidden: true
    sql: ${TABLE}.report_id

  - dimension: report_version_id
    type: int
    hidden: true
    primary_key: true
    sql: ${TABLE}.report_version_id

  - dimension: report_xml
    sql: ${TABLE}.report_xml

  - dimension: result_status
    sql: case when ${TABLE}.result_status = 'F' THEN 'Final' when ${TABLE}.result_status = 'A' THEN 'Active' when ${TABLE}.result_status = 'C' THEN 'Changed' 
          when ${TABLE}.result_status = 'P' THEN 'Pending' else 'Not Published' End

  - dimension: shared_by
    type: int
    sql: ${TABLE}.shared_by

  - dimension: status
    sql: ${TABLE}.status

  - dimension: version_number
    type: int
    sql: ${TABLE}.version_number

  - measure: count
    type: count
    drill_fields: [report.report_name, report.report_id, fax_message.count]
    
  - measure: addendum_count
    type: max
    sql: (${TABLE}.version_number)-1 #to obtain number of addendums for a clinical report once it has been published

