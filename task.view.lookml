- view: task
  fields:

  - dimension: task_id
    primary_key: true
    type: int
    sql: ${TABLE}.task_id

  - dimension: appointment_id
    type: int
    # hidden: true
    sql: ${TABLE}.appointment_id

  - dimension: appointment_review_id
    type: int
    # hidden: true
    sql: ${TABLE}.appointment_review_id

  - dimension: assigned_from_id
    type: int
    sql: ${TABLE}.assigned_from_id

  - dimension: assigned_to_id
    type: int
    sql: ${TABLE}.assigned_to_id

  - dimension: close_notes
    sql: ${TABLE}.close_notes

  - dimension_group: closed
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.closed

  - dimension: closed_by_id
    type: int
    sql: ${TABLE}.closed_by_id

  - dimension: company_event_id
    type: int
    sql: ${TABLE}.company_event_id

  - dimension: company_id
    type: int
    # hidden: true
    sql: ${TABLE}.company_id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created

  - dimension: created_by_id
    type: int
    sql: ${TABLE}.created_by_id

  - dimension: detail
    sql: ${TABLE}.detail

  - dimension_group: due
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.due

  - dimension: emr2_encounter_id
    type: int
    # hidden: true
    sql: ${TABLE}.emr2_encounter_id

  - dimension: event_id
    type: int
    # hidden: true
    sql: ${TABLE}.event_id

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

  - dimension: new_task
    type: yesno
    sql: ${TABLE}.new_task

  - dimension: observation_message_id
    type: int
    # hidden: true
    sql: ${TABLE}.observation_message_id

  - dimension: observation_order_id
    type: int
    # hidden: true
    sql: ${TABLE}.observation_order_id

  - dimension: patient_follow_up_id
    type: int
    # hidden: true
    sql: ${TABLE}.patient_follow_up_id

  - dimension: patient_id
    type: int
    # hidden: true
    sql: ${TABLE}.patient_id

  - dimension: priority
    type: int
    sql: ${TABLE}.priority

  - dimension: subject
    sql: ${TABLE}.subject

  - dimension: task_close_type_id
    type: int
    # hidden: true
    sql: ${TABLE}.task_close_type_id

  - dimension: task_type_id
    type: int
    # hidden: true
    sql: ${TABLE}.task_type_id

  - dimension: treatment_cycle_referral_id
    type: int
    # hidden: true
    sql: ${TABLE}.treatment_cycle_referral_id

  - dimension: user_notified
    type: yesno
    sql: ${TABLE}.user_notified

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - task_id
    - task_type.task_type_id
    - task_type.task_type_name
    - task_close_type.task_close_type_id
    - task_close_type.task_close_type_name
    - event.event_id
    - appointment.appointment_id
    - patient.source_name
    - patient.nickname
    - patient.company_contact_name
    - patient.preferred_forename
    - patient.preferred_middlename
    - patient.preferred_surname
    - patient.provided_gp_name
    - company.company_name
    - location.location_name
    - location.billing_location_id
    - observation_message.observation_message_id
    - observation_message.patient_forename
    - observation_message.patient_surname
    - observation_order.observation_order_id
    - patient_follow_up.patient_follow_up_id
    - emr2_encounter.emr2_encounter_id
    - appointment_review.appointment_review_id
    - treatment_cycle_referral.treatment_cycle_referral_id
    - task_attachment.count
    - task_charge.count
    - task_note.count
    - task_notification.count
    - user_message.count

