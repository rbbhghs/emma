- view: prescription
  fields:

  - dimension: prescription_id
    primary_key: true
    type: int
    sql: ${TABLE}.prescription_id

  - dimension: appointment_id
    type: int
    # hidden: true
    sql: ${TABLE}.appointment_id

  - dimension: created_by_id
    type: int
    sql: ${TABLE}.created_by_id

  - dimension: dispense_locally
    type: yesno
    sql: ${TABLE}.dispense_locally

  - dimension: emr2_encounter_id
    type: int
    # hidden: true
    sql: ${TABLE}.emr2_encounter_id

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

  - dimension: patient_id
    type: int
    # hidden: true
    sql: ${TABLE}.patient_id

  - dimension: prescriber_id
    type: int
    sql: ${TABLE}.prescriber_id

  - dimension_group: prescription
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.prescription_date

  - dimension: read_only
    type: yesno
    sql: ${TABLE}.read_only

  - dimension: repeat_of_id
    type: int
    sql: ${TABLE}.repeat_of_id

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - prescription_id
    - emr2_encounter.emr2_encounter_id
    - patient.preferred_forename
    - patient.preferred_middlename
    - patient.preferred_surname
    - patient.provided_gp_name
    - patient.company_contact_name
    - patient.nickname
    - patient.source_name
    - appointment.appointment_id
    - location.location_name
    - location.location_id
    - prescription_item.count

