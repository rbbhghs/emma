- view: company_sector
  fields:

  - dimension: company_sector_id
    primary_key: true
    type: int
    sql: ${TABLE}.company_sector_id

  - dimension: company_sector_name
    sql: ${TABLE}.company_sector_name

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: status
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: [company_sector_id, company_sector_name, company.count]

