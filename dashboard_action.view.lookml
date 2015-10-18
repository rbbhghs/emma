- view: dashboard_action
  fields:

  - dimension: dashboard_action_id
    primary_key: true
    type: int
    sql: ${TABLE}.dashboard_action_id

  - dimension: absolute_price
    type: yesno
    hidden: true
    sql: ${TABLE}.absolute_price

  - dimension: attach_clinical_reports
    type: yesno
    hidden: true
    sql: ${TABLE}.attach_clinical_reports

  - dimension: canonical_name
    hidden: true
    sql: ${TABLE}.canonical_name

  - dimension: confirmation_message
    hidden: true
    sql: ${TABLE}.confirmation_message

  - dimension: create_event
    type: yesno
    hidden: true
    sql: ${TABLE}.create_event

  - dimension: dashboard_action_name
    sql: ${TABLE}.dashboard_action_name

  - dimension: dashboard_action_type
    type: int
    sql: ${TABLE}.dashboard_action_type

  - dimension: email_template_group_id
    type: int
    hidden: true
    sql: ${TABLE}.email_template_group_id

  - dimension: form_type_id
    type: int
    hidden: true
    sql: ${TABLE}.form_type_id

  - dimension: letter_template_id
    type: int
    hidden: true
    sql: ${TABLE}.letter_template_id

  - dimension: move_to_workflow_state_id
    type: int
    hidden: true
    sql: ${TABLE}.move_to_workflow_state_id

  - dimension: payor_company_contact_email_template_group_id
    hidden: true
    type: int
    sql: ${TABLE}.payor_company_contact_email_template_group_id

  - dimension: payor_company_contact_letter_template_id
    type: int
    hidden: true
    sql: ${TABLE}.payor_company_contact_letter_template_id

  - dimension: payor_company_contact_send_report_via_dicom
    type: yesno
    hidden: true
    sql: ${TABLE}.payor_company_contact_send_report_via_dicom

  - dimension: payor_company_contact_type_id
    type: int
    hidden: true
    sql: ${TABLE}.payor_company_contact_type_id

  - dimension: price
    type: number
    sql: ${TABLE}.price

  - dimension: product_id
    type: int
    hidden: true
    sql: ${TABLE}.product_id

  - dimension: publish_reports
    type: yesno
    hidden: true
    sql: ${TABLE}.publish_reports

  - dimension: redirect_home
    type: yesno
    hidden: true
    sql: ${TABLE}.redirect_home

  - dimension: referrer_email_template_group_id
    type: int
    hidden: true
    sql: ${TABLE}.referrer_email_template_group_id

  - dimension: referrer_letter_template_id
    type: int
    hidden: true
    sql: ${TABLE}.referrer_letter_template_id

  - dimension: require_comments
    type: yesno
    hidden: true
    sql: ${TABLE}.require_comments

  - dimension: secure_email
    type: int
    hidden: true
    sql: ${TABLE}.secure_email

  - dimension: status
    hidden: true
    sql: ${TABLE}.status

  - dimension: task_default_assigned_to_id
    type: int
    hidden: true
    sql: ${TABLE}.task_default_assigned_to_id

  - dimension: task_default_task_type_id
    type: int
    hidden: true
    sql: ${TABLE}.task_default_task_type_id

  - dimension: uuid
    hidden: true
    sql: ${TABLE}.uuid

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - dashboard_action_id
    - dashboard_action_name
    - canonical_name
    - form_type.form_type_id
    - product.product_id
    - product.product_name
    - email_template_group.email_template_group_id
    - email_template_group.email_template_group_name
    - dashboard_event.count
    - dashboard_event_follow_up.count
    - dashboard_view_field.count
    - workflow_state_dashboard_action.count
    - _dashboard_distributions_without_emails.count

