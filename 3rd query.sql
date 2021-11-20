--mmn 11 d3
select bid, rdate, rtime
from Purchase
where date_part('month',rdate)=date_part('month',current_date)
group by bid,rdate,rtime having count(bid)<3;