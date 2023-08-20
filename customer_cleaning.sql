 alter table customer_orders
 modify column extras text,
 modify column exclusions text;
 
update customer_orders
set extras = case 	
	when extras = '' then 'null'
    when extras is null then 'null'
    when extras = 'null' then 'null'
    else extras
    end,
    exclusions = case 
    when exclusions = '' then 'null'
    when exclusions = 'null' then 'null'
    else exclusions
    end;


DROP TABLE IF EXISTS runner_ratings;
CREATE TABLE runner_ratings AS 
SELECT *, FLOOR(1 + RAND() * 5) AS rating
FROM runner_orders
WHERE cancellation = 'Not cancelled';
