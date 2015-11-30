- view: observation_order
  fields:

  - dimension: observation_order_id
    primary_key: true
    type: int
    sql: ${TABLE}.observation_order_id

  - dimension: appointment_id
    type: int
    # hidden: true
    sql: ${TABLE}.appointment_id

  - dimension: clinical_notes
    sql: ${TABLE}.clinical_notes

  - dimension: drug_regimen
    sql: ${TABLE}.drug_regimen

  - dimension: emr2_encounter_id
    type: int
    # hidden: true
    sql: ${TABLE}.emr2_encounter_id

  - dimension: included_in_appointment
    type: yesno
    sql: ${TABLE}.included_in_appointment

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

  - dimension_group: order_completed_utc
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.order_completed_utc

  - dimension: patient_id
    type: int
    # hidden: true
    sql: ${TABLE}.patient_id

  - dimension: placed_by_id
    type: int
    sql: ${TABLE}.placed_by_id

  - dimension_group: placed
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.placed_date

  - dimension: requires_review
    type: yesno
    sql: ${TABLE}.requires_review

  - dimension: results_complete
    type: yesno
    sql: ${TABLE}.results_complete

  - dimension: sample_containers
    sql: ${TABLE}.sample_containers

  - dimension: sample_fasted
    type: yesno
    sql: ${TABLE}.sample_fasted

  - dimension: sample_taken_by_id
    type: int
    sql: ${TABLE}.sample_taken_by_id

  - dimension_group: sample_taken
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.sample_taken_date

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - observation_order_id
    - patient.source_name
    - patient.nickname
    - patient.company_contact_name
    - patient.preferred_forename
    - patient.preferred_middlename
    - patient.preferred_surname
    - patient.provided_gp_name
    - appointment.appointment_id
    - location.location_name
    - location.billing_location_id
    - emr2_encounter.emr2_encounter_id
    - observation_message.count
    - observation_request.count
    - observation_set.count
    - task.count

