- view: form_type
  fields:

  - dimension: form_type_id
    primary_key: true
    type: int
    sql: ${TABLE}.form_type_id

  - dimension: created_by_id
    type: int
    sql: ${TABLE}.created_by_id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_date

  - dimension: form_reference
    sql: ${TABLE}.form_reference

  - dimension: form_type_category_id
    type: int
    sql: ${TABLE}.form_type_category_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: speciality_id
    type: int
    # hidden: true
    sql: ${TABLE}.speciality_id

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - form_type_id
    - speciality.speciality_id
    - speciality.speciality_name
    - anoto_form_type.count
    - dashboard_action.count
    - emr2_derived_form.count
    - emr2_note_type_section_form_type.count
    - emr2_procedure_type.count
    - emr2_study_type.count
    - form_type_appointment_type.count
    - form_type_appointment_type_problem.count
    - form_type_version.count
    - smart_list_form_response_criterion.count
    - specialty_form.count
    - triage_step.count

