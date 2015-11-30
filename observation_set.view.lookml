- view: observation_set
  fields:

  - dimension: observation_set_id
    primary_key: true
    type: int
    sql: ${TABLE}.observation_set_id

  - dimension: cancelled_by_id
    type: int
    sql: ${TABLE}.cancelled_by_id

  - dimension_group: cancelled
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.cancelled_date

  - dimension: filler_order_number
    sql: ${TABLE}.filler_order_number

  - dimension: hca_requisition_no
    sql: ${TABLE}.hca_requisition_no

  - dimension: lab_request_id
    type: int
    # hidden: true
    sql: ${TABLE}.lab_request_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: linked_by_id
    type: int
    sql: ${TABLE}.linked_by_id

  - dimension_group: linked
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.linked_date

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension_group: observation
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.observation_date

  - dimension: observation_message_id
    type: int
    # hidden: true
    sql: ${TABLE}.observation_message_id

  - dimension: observation_order_id
    type: int
    # hidden: true
    sql: ${TABLE}.observation_order_id

  - dimension: observation_request_id
    type: int
    # hidden: true
    sql: ${TABLE}.observation_request_id

  - dimension: ordered_by_name
    sql: ${TABLE}.ordered_by_name

  - dimension: patient_id
    type: int
    # hidden: true
    sql: ${TABLE}.patient_id

  - dimension: print_order
    sql: ${TABLE}.print_order

  - dimension_group: received
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.received

  - dimension: requires_review
    type: yesno
    sql: ${TABLE}.requires_review

  - dimension: review_notes
    sql: ${TABLE}.review_notes

  - dimension_group: reviewed
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.reviewed

  - dimension: reviewed_by_id
    type: int
    sql: ${TABLE}.reviewed_by_id

  - dimension: service_code
    sql: ${TABLE}.service_code

  - dimension: service_name
    sql: ${TABLE}.service_name

  - dimension: set_number
    type: int
    sql: ${TABLE}.set_number

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - observation_set_id
    - service_name
    - ordered_by_name
    - observation_order.observation_order_id
    - observation_request.observation_request_id
    - patient.source_name
    - patient.nickname
    - patient.company_contact_name
    - patient.preferred_forename
    - patient.preferred_middlename
    - patient.preferred_surname
    - patient.provided_gp_name
    - observation_message.observation_message_id
    - observation_message.patient_forename
    - observation_message.patient_surname
    - lab_request.lab_request_id
    - observation.count
    - observation_set_note.count
    - observation_set_notification.count
    - observation_set_notification_abnormal.count

