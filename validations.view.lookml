- view: validations
  fields:

  - dimension: validations_id
    primary_key: true
    type: int
    sql: ${TABLE}.validations_id

  - dimension: appointment_import_only
    type: yesno
    sql: ${TABLE}.appointment_import_only

  - dimension: company_id
    type: int
    # hidden: true
    sql: ${TABLE}.company_id

  - dimension: control_name
    sql: ${TABLE}.control_name

  - dimension: error_message
    sql: ${TABLE}.error_message

  - dimension: individual_type
    type: int
    sql: ${TABLE}.individual_type

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: patient_import_include
    type: int
    sql: ${TABLE}.patient_import_include

  - dimension: patient_import_only
    type: yesno
    sql: ${TABLE}.patient_import_only

  - dimension: status
    sql: ${TABLE}.status

  - dimension: validator
    sql: ${TABLE}.validator

  - measure: count
    type: count
    drill_fields: [validations_id, control_name, company.company_name, import_failure_validation_rule.count]

