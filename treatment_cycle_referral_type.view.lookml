- view: treatment_cycle_referral_type
  fields:

  - dimension: treatment_cycle_referral_type_id
    primary_key: true
    type: int
    sql: ${TABLE}.treatment_cycle_referral_type_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: status
    sql: ${TABLE}.status

  - dimension: treatment_cycle_referral_type_name
    sql: ${TABLE}.treatment_cycle_referral_type_name

  - measure: count
    type: count
    drill_fields: [treatment_cycle_referral_type_id, treatment_cycle_referral_type_name, treatment_cycle_referral.count]

