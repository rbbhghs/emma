- view: referral_rejection_reason
  fields:

  - dimension: referral_rejection_reason_id
    primary_key: true
    type: int
    sql: ${TABLE}.referral_rejection_reason_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: referral_rejection_reason_name
    sql: ${TABLE}.referral_rejection_reason_name

  - dimension: speciality_id
    type: int
    # hidden: true
    sql: ${TABLE}.speciality_id

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: [referral_rejection_reason_id, referral_rejection_reason_name, speciality.speciality_id, speciality.speciality_name, treatment_cycle_referral.count]

