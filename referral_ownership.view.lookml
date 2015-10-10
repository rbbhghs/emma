- view: referral_ownership
  fields:

  - dimension: referral_ownership_id
    primary_key: true
    type: int
    sql: ${TABLE}.referral_ownership_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: owned_by_id
    type: int
    sql: ${TABLE}.owned_by_id

  - dimension_group: owned_from_date_utc
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.owned_from_date_utc

  - dimension: referral_id
    type: int
    sql: ${TABLE}.referral_id

  - measure: count
    type: count
    drill_fields: [referral_ownership_id]

