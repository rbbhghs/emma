- view: dashboard_event
  fields:

  - dimension: dashboard_event_id
    primary_key: true
    type: int
    sql: ${TABLE}.dashboard_event_id

  - dimension: appointment_id
    type: int
    # hidden: true
    sql: ${TABLE}.appointment_id

  - dimension: charge_id
    type: int
    # hidden: true
    sql: ${TABLE}.charge_id

  - dimension: comments
    sql: ${TABLE}.comments

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created

  - dimension: created_by_id
    type: int
    sql: ${TABLE}.created_by_id

  - dimension: dashboard_action_id
    type: int
    # hidden: true
    sql: ${TABLE}.dashboard_action_id

  - dimension: dashboard_event_follow_up_id
    type: int
    # hidden: true
    sql: ${TABLE}.dashboard_event_follow_up_id

  - dimension: dashboard_view_id
    type: int
    # hidden: true
    sql: ${TABLE}.dashboard_view_id

  - dimension_group: deleted
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.deleted

  - dimension: deleted_by_id
    type: int
    sql: ${TABLE}.deleted_by_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: patient_id
    type: int
    # hidden: true
    sql: ${TABLE}.patient_id

  - dimension: treatment_cycle_referral_id
    type: int
    # hidden: true
    sql: ${TABLE}.treatment_cycle_referral_id

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - dashboard_event_id
    - patient.source_name
    - patient.nickname
    - patient.company_contact_name
    - patient.preferred_forename
    - patient.preferred_middlename
    - patient.preferred_surname
    - patient.provided_gp_name
    - dashboard_view.dashboard_view_id
    - dashboard_view.dashboard_view_name
    - dashboard_action.dashboard_action_id
    - dashboard_action.dashboard_action_name
    - dashboard_action.canonical_name
    - treatment_cycle_referral.treatment_cycle_referral_id
    - charge.cloned_from_charge_id
    - dashboard_event_follow_up.dashboard_event_follow_up_id
    - appointment.appointment_id
    - dashboard_event_follow_up.count
    - _dashboard_distributions_without_emails.count

