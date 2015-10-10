- view: referral_method
  fields:

  - dimension: referral_method_id
    primary_key: true
    type: int
    sql: ${TABLE}.referral_method_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: referral_method_name
    sql: ${TABLE}.referral_method_name

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: [referral_method_id, referral_method_name, failed_patient_import.count, patient.count, treatment_cycle_referral.count]

