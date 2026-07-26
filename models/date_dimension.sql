with cte as (

select 
TO_DATE(started_at) AS date,
YEAR(TO_DATE(started_at)) AS year,
month(TO_DATE(started_at)) AS month,
hour(to_timestamp(started_at)) as week,

case when month(TO_DATE(started_at)) in (11,12,1,2,3,4) then 'WINTER'
     when month(TO_DATE(started_at)) in (5,6,7,8) then 'SUMMER'
     else 'FALL'
     end as season
from {{ source('bike', 'bike') }}

)

select *
from cte