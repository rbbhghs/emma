- view: derived_pss
  derived_table:
    sql: |
      select fr.form_response_id,fqv2.question_name,fqv2.question_text,ifnull(fr.response,fr.response_long) response_answer
      from form_response fr 
      JOIN
        (select fr.form_question_instance_id,max(fr.form_response_id) max_form_response_id 
        from form_type_version ftv 
        JOIN form_type_version_question ftvq ON (ftv.form_type_version_id = ftvq.form_type_version_id) 
        JOIN form_question_version fqv ON (fqv.form_question_id = ftvq.form_question_id) 
        JOIN form_response fr ON (fqv.form_question_version_id = fr.form_question_version_id) 
        where form_type_name like '%survey%' 
        group by fr.form_question_instance_id)x ON (fr.form_response_id = x.max_form_response_id) 
      JOIN form_question_version fqv2 ON (fqv2.form_question_version_id = fr.form_question_version_id)
      ;
    sql_trigger_value: SELECT CURDATE()
    indexes: [form_response_id]      

  fields:

  - dimension: form_response_id
    type: int
    primary_key: true
    sql: ${TABLE}.form_response_id

  - dimension: survey_question_name
    type: int
    sql: ${TABLE}.question_name
    
  - dimension: survey_question_text
    type: int
    sql: ${TABLE}.question_text    

  - dimension: survey_response
    type: int
#    primary_key: true
    sql: ${TABLE}.response_answer
    
  sets:
    detail:
      - form_response_id