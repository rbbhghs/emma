- view: referrer

  derived_table:
    sql: 
      select 
        individual.individual_id,
        title,
        forename,
        surname,
        concat(title, ' ' ,forename, ' ',surname) as referrer_full_name,
        dob,
        sex,
        email,
        address_1,
        address_2,
        address_3,
        address_4,
        address_5,
        postcode,
        town,
        country,
        individual.status as referrer_status
        from
        individual
        inner join external_practitioner on individual.individual_id=external_practitioner.individual_id
        left join address on address.individual_id=individual.individual_id and address_type_id='1'
    sql_trigger_value: SELECT CURDATE()
    indexes: [individual_id]   

  fields:
  
     - dimension: individual_id
       type: int
       primary_key: true
       sql: ${TABLE}.individual_id
       
     - dimension: title
       sql: ${TABLE}.title
      
     - dimension: forename
       sql: ${TABLE}.forename

     - dimension: surname
       sql: ${TABLE}.surname
       
     - dimension: referrer_full_name
       sql: ${TABLE}.referrer_full_name
       
     - dimension: sex
       sql: ${TABLE}.sex 
       
     - dimension: email
       sql: ${TABLE}.email
       
     - dimension: dob
       type: time
       timeframes: [date, week, month, year]
       sql: ${TABLE}.dob
       
     - dimension: address_1
       sql: ${TABLE}.address_1  
       
     - dimension: address_2
       sql: ${TABLE}.address_2    
       
     - dimension: address_3
       sql: ${TABLE}.address_3   
       
     - dimension: address_4
       sql: ${TABLE}.address_4 
       
     - dimension: postcode
       type: zipcode
       sql: ${TABLE}.postcode 
       
     - dimension: town
       sql: ${TABLE}.country 
       
     - dimension: referrer_status
       sql: ${TABLE}.referrer_status    