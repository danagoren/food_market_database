--mmn 11 d7
select bid, rdate, rtime
from Purchase natural join Receipt, product
where purchase.code=Product.code and receipt.total>50 and 'Cucumbers' not in
(select pname
from product
where purchase.code=product.code)

group by (bid, rdate, rtime)
having count (distinct product.sid)<=all
(select count (distinct sid)
from Purchase natural join Product
group by (bid, rdate, rtime));