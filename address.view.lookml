- view: address
  fields:

  - dimension: address_id
    primary_key: true
    type: int
    sql: ${TABLE}.address_id

  - dimension: address_1
    sql: ${TABLE}.address_1

  - dimension: address_2
    sql: ${TABLE}.address_2

  - dimension: address_3
    sql: ${TABLE}.address_3

  - dimension: address_4
    sql: ${TABLE}.address_4

  - dimension: address_5
    sql: ${TABLE}.address_5

  - dimension: full_address_line
    sql: REPLACE(REPLACE(REPLACE(CONCAT(ifnull(${TABLE}.address_1,'N/A'),',',ifnull(${TABLE}.address_2,'N/A'),',',ifnull(${TABLE}.address_3,'N/A'),',',ifnull(${TABLE}.town,'N/A'),',',ifnull(${TABLE}.county,'N/A'),',',ifnull(${TABLE}.postcode,'N/A')),',,',','),',,',','),',,',',')

  - dimension: address_type_id
    type: int
    hidden: true
    sql: ${TABLE}.address_type_id

  - dimension: country
    sql: ${TABLE}.country

  - dimension: county
    sql: ${TABLE}.county

  - dimension_group: date_from
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.date_from

  - dimension_group: date_to
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.date_to

  - dimension: description
    sql: ${TABLE}.description

  - dimension: individual_id
    type: int
    # hidden: true
    sql: ${TABLE}.individual_id

  - dimension: is_inpatient
    type: yesno
    sql: ${TABLE}.is_inpatient

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified

  - dimension: last_modified_by
    sql: ${TABLE}.last_modified_by

  - dimension: latitude
    type: number
    sql: ${TABLE}.latitude

  - dimension: longitude
    type: number
    sql: ${TABLE}.longitude

  - dimension: modified_by_function
    sql: ${TABLE}.modified_by_function

  - dimension: pds_address
    type: yesno
    sql: ${TABLE}.pds_address

  - dimension: postcode
    sql: ${TABLE}.postcode

  - dimension: status
    sql: ${TABLE}.status

  - dimension: town
    sql: ${TABLE}.town

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - address_id
    - individual.individual_id
    - individual.forename
    - individual.middlename
    - individual.surname
    - address_type.address_type_id
    - address_type.address_type_name
    - external_practice.count
    - individual.count
    - location.count
    - stock_supplier.count

