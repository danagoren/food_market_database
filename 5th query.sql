--mmn 11 d5
select Branch.bid, bname
from Branch, Receipt
where (Branch.bid = Receipt.bid and
total >= all (select total from receipt));