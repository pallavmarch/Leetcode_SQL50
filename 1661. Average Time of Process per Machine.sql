--- #1
select  ac1.machine_id, 
    ROUND(avg(ac2.timestamp-ac1.timestamp)::numeric, 3) as processing_time 
from Activity ac1
join Activity ac2
on ac1.machine_id=ac2.machine_id
where ac1.process_id = ac2.process_id 
and ac1.activity_type  = 'start'
and ac2.activity_type  = 'end'
group by ac1.machine_id 

--- #2
select  ac1.machine_id, 
    ROUND(avg(ac2.timestamp-ac1.timestamp)::numeric, 3) as processing_time 
from Activity ac1
join Activity ac2
on ac1.machine_id=ac2.machine_id
where ac1.process_id = ac2.process_id 
and ac1.timestamp < ac2.timestamp 
group by ac1.machine_id 
