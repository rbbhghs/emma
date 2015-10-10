- view: cm_rule
  fields:

  - dimension: cm_rule_id
    primary_key: true
    type: int
    sql: ${TABLE}.cm_rule_id

  - dimension: age_from
    type: int
    sql: ${TABLE}.age_from

  - dimension: age_to
    type: int
    sql: ${TABLE}.age_to

  - dimension: cm_policy_id
    type: int
    # hidden: true
    sql: ${TABLE}.cm_policy_id

  - dimension_group: effective
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.effective

  - dimension: el_from
    type: int
    sql: ${TABLE}.el_from

  - dimension: el_to
    type: int
    sql: ${TABLE}.el_to

  - dimension_group: expires
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.expires

  - dimension: is_default
    type: yesno
    sql: ${TABLE}.is_default

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: location_id
    type: int
    # hidden: true
    sql: ${TABLE}.location_id

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: procedure_billing_policy_id
    type: int
    # hidden: true
    sql: ${TABLE}.procedure_billing_policy_id

  - dimension: sex
    sql: ${TABLE}.sex

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - cm_rule_id
    - cm_policy.cm_policy_id
    - location.location_name
    - location.billing_location_id
    - procedure_billing_policy.procedure_billing_policy_id
    - procedure_billing_policy.name
    - cm_booking_rule.count
    - cm_cancellation_rule.count
    - cm_copayment_rule.count
    - cm_creditcard_rule.count
    - cm_email_rule.count
    - cm_fee_split_rule.count
    - cm_limit_rule.count
    - cm_online_booking_rule.count
    - cm_price_rule.count
    - cm_pricing_rule.count
    - cm_repeat_rule.count
    - cm_sms_rule.count
    - cm_stc_rule.count

