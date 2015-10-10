- view: dicom_procedure
  fields:

  - dimension: dicom_procedure_id
    primary_key: true
    type: int
    sql: ${TABLE}.dicom_procedure_id

  - dimension: default_areas_count
    type: yesno
    sql: ${TABLE}.default_areas_count

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: length
    type: number
    sql: ${TABLE}.length

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: procedure_billing_group_id
    type: int
    # hidden: true
    sql: ${TABLE}.procedure_billing_group_id

  - dimension: procedure_code
    sql: ${TABLE}.procedure_code

  - dimension: procedure_description
    sql: ${TABLE}.procedure_description

  - dimension: procedure_step_code
    sql: ${TABLE}.procedure_step_code

  - dimension: procedure_step_description
    sql: ${TABLE}.procedure_step_description

  - dimension: snomed_concept_id
    sql: ${TABLE}.snomed_concept_id

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - dicom_procedure_id
    - procedure_billing_group.procedure_billing_group_id
    - procedure_billing_group.name
    - appointment_section_study.count
    - dicom_procedure_content.count
    - dicom_procedure_group_override_codes.count
    - dicom_procedure_product.count
    - dicom_procedure_speciality.count
    - procedure_billing_group_policy_override_data.count
    - treatment_cycle_referral_procedure.count

