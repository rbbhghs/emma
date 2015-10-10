- view: news_item
  fields:

  - dimension: news_item_id
    primary_key: true
    type: int
    sql: ${TABLE}.news_item_id

  - dimension: access_mask
    type: int
    sql: ${TABLE}.access_mask

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created

  - dimension: created_by_id
    type: int
    sql: ${TABLE}.created_by_id

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

  - dimension: news_item_body
    sql: ${TABLE}.news_item_body

  - dimension: news_item_subject
    sql: ${TABLE}.news_item_subject

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: [news_item_id, location.location_name, location.billing_location_id]

