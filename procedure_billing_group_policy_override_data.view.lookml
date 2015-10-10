- view: procedure_billing_group_policy_override_data
  fields:

  - dimension: procedure_billing_group_policy_override_data_id
    primary_key: true
    type: int
    sql: ${TABLE}.procedure_billing_group_policy_override_data_id

  - dimension: dicom_procedure_id
    type: int
    # hidden: true
    sql: ${TABLE}.dicom_procedure_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: procedure_billing_group_policy_override_id
    type: int
    # hidden: true
    sql: ${TABLE}.procedure_billing_group_policy_override_id

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: [procedure_billing_group_policy_override_data_id, procedure_billing_group_policy_override.procedure_billing_group_policy_override_id, dicom_procedure.dicom_procedure_id]

