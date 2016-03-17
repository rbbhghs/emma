- view: derived_appt_metrics
  derived_table:
    sql: |
      select location_id,
      #scans
      sum(case when year(start) = 2014 and dna = 1 and status = 'A' then 1 else 0 End)/count(distinct DATE_FORMAT(case when year(start) = 2014 and start < now() then start else null End,'%M-%Y')) dna_2014,
      sum(case when year(start) = 2015 and dna = 1 and status = 'A' then 1 else 0 End)/count(distinct DATE_FORMAT(case when year(start) = 2015 and start < now() then start else null End,'%M-%Y')) dna_2015,
      sum(case when year(start) = 2016 and dna = 1 and status = 'A' then 1 else 0 End)/count(distinct DATE_FORMAT(case when year(start) = 2016 and start < now() then start else null End,'%M-%Y')) dna_2016,
      #appts
      sum(case when year(start) = 2014 and dna = 0 and status = 'A' then 1 else 0 End)/count(distinct DATE_FORMAT(case when year(start) = 2014 and start < now() then start else null End,'%M-%Y')) appts_2014,
      sum(case when year(start) = 2015 and dna = 0 and status = 'A' then 1 else 0 End)/count(distinct DATE_FORMAT(case when year(start) = 2015 and start < now() then start else null End,'%M-%Y')) appts_2015,
      sum(case when year(start) = 2016 and dna = 0 and status = 'A' then 1 else 0 End)/count(distinct DATE_FORMAT(case when year(start) = 2016 and start < now() then start else null End,'%M-%Y')) appts_2016    
      from appointment 
      group by location_id 
      ;
    sql_trigger_value: SELECT CURDATE()
    indexes: [location_id]      

  fields:
  - measure: dna_2014
    type: number 
    value_format: '#,##0'    
    drill_fields: detail*

  - measure: dna_2015
    type: number 
    value_format: '#,##0'    
    drill_fields: detail*

  - measure: dna_2016
    type: number 
    value_format: '#,##0'    
    drill_fields: detail*


  - dimension: location_id
    type: int
    primary_key: true
    sql: ${TABLE}.location_id

    
  sets:
    detail:
      - location_id
