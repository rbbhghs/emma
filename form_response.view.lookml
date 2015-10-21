- view: form_response
  fields:

  - dimension: form_response_id
    primary_key: true
    type: int
    sql: ${TABLE}.form_response_id

  - dimension: appointment_id
    type: int
    hidden: true
    sql: ${TABLE}.appointment_id

  - dimension: created_by_id
    type: int
    sql: ${TABLE}.created_by_id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_date

  - dimension_group: delete
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.delete_date

  - dimension: deleted_by_id
    type: int
    sql: ${TABLE}.deleted_by_id

  - dimension: emr_page_id
    type: int
    hidden: true
    sql: ${TABLE}.emr_page_id

  - dimension: form_question_id
    type: int
    hidden: true
    sql: ${TABLE}.form_question_id

  - dimension: form_question_instance_id
    type: int
    hidden: true
    sql: ${TABLE}.form_question_instance_id

  - dimension: form_question_version_id
    type: int
    hidden: true
    sql: ${TABLE}.form_question_version_id

  - dimension: form_type_category_id
    type: int
    hidden: true
    sql: ${TABLE}.form_type_category_id

  - dimension: historic
    type: yesno
    hidden: true
    sql: ${TABLE}.historic

  - dimension: importance
    type: int
    sql: ${TABLE}.importance

  - dimension_group: last_modified
    type: time
    hidden: true
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    hidden: true
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    hidden: true
    sql: ${TABLE}.modified_by_function

  - dimension: notes
    sql: ${TABLE}.notes

  - dimension: patient_id
    type: int
    hidden: true
    sql: ${TABLE}.patient_id

  - dimension: response
    sql: ${TABLE}.response
    
  - measure: response_measure
    type: string
    sql: ${TABLE}.response  

  - dimension: response_long
    sql: ${TABLE}.response_long
    
  - dimension: best_response
    type: string
    sql: COALESCE(${TABLE}.response,${TABLE}.response_long)  
    
  - measure: response_long_measure
    type: string
    sql: ${TABLE}.response_long
    
  - measure: best_response_measure
    type: string
    sql: COALESCE(${TABLE}.response,${TABLE}.response_long)   

  - dimension_group: valid_until
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.valid_until

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - form_response_id
    - form_question_instance.form_question_instance_id
    - form_question_version.form_question_version_id
    - form_question_version.question_name
    - form_question_version.response_name
    - form_question_version.sub_response_name
    - form_question_version.sub_response_2_name
    - form_question_version.sub_response_3_name
    - form_question_version.order_interface_name
    - form_question_version.report_question_name
    - patient.source_name
    - patient.nickname
    - patient.company_contact_name
    - patient.preferred_forename
    - patient.preferred_middlename
    - patient.preferred_surname
    - patient.provided_gp_name
    - appointment.appointment_id
    - emr_page.page_name
    - emr_page.from_emr_page_id
    - form_question.form_question_id
    - form_response_file.count
    - form_response_image.count
    - form_response_latest.count
    - form_sub_response.count

