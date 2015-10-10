- view: cost_codes_lookups_backup
  fields:

  - dimension: cost_centre_new
    sql: ${TABLE}.cost_centre_new

  - dimension: cost_centre_old
    sql: ${TABLE}.cost_centre_old

  - dimension: division
    sql: ${TABLE}.division

  - dimension: entity
    sql: ${TABLE}.entity

  - dimension: issuing_company_id
    type: int
    # hidden: true
    sql: ${TABLE}.issuing_company_id

  - dimension: location_id
    type: int
    # hidden: true
    sql: ${TABLE}.location_id

  - dimension: region
    sql: ${TABLE}.region

  - dimension: site_name
    sql: ${TABLE}.site_name

  - measure: count
    type: count
    drill_fields: [site_name, location.location_name, location.billing_location_id, issuing_company.issuing_company_id, issuing_company.issuing_company_name]

