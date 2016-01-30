- view: treatment_cycle_referral_external_practice
  fields:

  - dimension: treatment_cycle_referral_external_practice_id
    primary_key: true
    type: int
    sql: ${TABLE}.treatment_cycle_referral_external_practice_id

  - dimension: external_practice_id
    type: int
    # hidden: true
    sql: ${TABLE}.external_practice_id

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

  - dimension: treatment_cycle_referral_id
    type: int
    # hidden: true
    sql: ${TABLE}.treatment_cycle_referral_id

  - measure: count
    type: count
    drill_fields: [treatment_cycle_referral_external_practice_id, external_practice.external_practice_id, external_practice.practice_name, treatment_cycle_referral.treatment_cycle_referral_id]

