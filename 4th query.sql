--mmn 11 d4
select pname, sname
from Product, Supplier
where product.sid=supplier.sid and product.sid in (select sid
from product
group by sid
having count (sid)=1);