- view: appointment_type_section
  fields:

  - dimension: appointment_type_section_id
    primary_key: true
    type: int
    sql: ${TABLE}.appointment_type_section_id

  - dimension: appointment_type_id
    type: int
    # hidden: true
    sql: ${TABLE}.appointment_type_id

  - dimension: appointment_type_participant_id
    type: int
    # hidden: true
    sql: ${TABLE}.appointment_type_participant_id

  - dimension: end
    type: int
    sql: ${TABLE}.end

  - dimension: externally_reported
    type: yesno
    sql: ${TABLE}.externally_reported

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: report_type_id
    type: int
    sql: ${TABLE}.report_type_id

  - dimension: section_name
    sql: ${TABLE}.section_name

  - dimension: start
    type: int
    sql: ${TABLE}.start

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - appointment_type_section_id
    - section_name
    - appointment_type_participant.appointment_type_participant_id
    - appointment_type.appointment_type_id
    - appointment_type.appointment_type_name
    - appointment_section.count
    - appointment_section_limit.count
    - appointment_type_section_group_member.count

