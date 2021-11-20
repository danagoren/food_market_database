--mmn 11 b
create or replace function trigf1() returns trigger as
$$
declare
final_units float;

begin
select (units-new.units)
from stock
into final_units
where bid=new.bid and code=new.code;

if final_units < 0
then raise exception 'there is not enough items in the store';
end if;

update stock
set units = final_units
where bid=new.bid and code=new.code;

update receipt
set total = total+new.units*(select uprice from product where code=new.code)
where bid=new.bid and rdate=new.rdate and rtime=new.rtime;

return new;
end;
$$
LANGUAGE plpgsql;

create trigger T1
before insert
on purchase
for each row
execute procedure trigf1()