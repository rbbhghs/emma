- view: reviewer_reporting_group
  fields:

  - dimension: reviewer_reporting_group_id
    primary_key: true
    type: int
    sql: ${TABLE}.reviewer_reporting_group_id

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: pacs_id
    sql: ${TABLE}.pacs_id

  - dimension: reporting_group_id
    type: int
    # hidden: true
    sql: ${TABLE}.reporting_group_id

  - dimension: reviewer_id
    type: int
    sql: ${TABLE}.reviewer_id

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: [reviewer_reporting_group_id, reporting_group.reporting_group_id, reporting_group.reporting_group_name]

