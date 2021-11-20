--mmn 11 d6
select distinct bid
from Stock, Product
where not exists
(select code
from Product)
except
(select Product.code
from Stock, Product
where Stock.code=Product.code);