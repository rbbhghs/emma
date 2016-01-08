- view: postcodelatlng
  fields:

  - dimension: id
    primary_key: true
    type: int
    hidden: true
    sql: ${TABLE}.id

  - dimension: latitude
    type: number
    sql: ${TABLE}.latitude

  - dimension: longitude
    type: number
    sql: ${TABLE}.longitude

  - dimension: postcode
    type: zipcode
    sql: ${TABLE}.postcode

  - measure: count
    type: count
    drill_fields: [id]
    
  - dimension: coordinate
    type: location
    sql_latitude: ${TABLE}.latitude
    sql_longitude: ${TABLE}.longitude

  

