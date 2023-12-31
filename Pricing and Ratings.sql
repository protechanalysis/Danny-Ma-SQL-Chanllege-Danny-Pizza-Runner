----- 1. If a Meat Lovers pizza costs $12 and Vegetarian costs $10 and there were no charges for changes
-- How much money has Pizza Runner made so far if there are no delivery fees?
with price as (
	select order_id, customer_id, pizza_id, exclusions_name, extras_name, order_time,
		case 
        when pizza_id = 1 then 12
        else 10
        end as cost
        from tab_order_delivered)
select sum(cost) as total_revenue
from price;

----- 2. What if there was an additional $1 charge for any pizza extras?
with price as (
	select order_id, customer_id, pizza_id, exclusions_name, extras_name, order_time,
		case 
        when pizza_id = 1 then 12
        else 10
        end as cost, 
        case 
        when extras_name is not null then 1 * length(replace(extras, ', ', '')) -- getting the length of the extras column by removing ', '
        else 0
        end as extra_cost
        from tab_order_delivered)
select sum(case when extra_cost = 0 then cost else cost + extra_cost end) as total_revenue
from price;

-- 5. If a Meat Lovers pizza was $12 and Vegetarian $10 fixed prices with no cost for extras and each runner is paid $0.30 per kilometre travelled. 
-- How much money does Pizza Runner have left over after these deliveries
with price as (
	select order_id, customer_id, pizza_id, exclusions_name, extras_name, order_time,
		case 
        when pizza_id = 1 then 12
        else 10
        end as cost
        from tab_order_delivered
        ),
delivery as (select sum(cost) as delivery_fee
from price
union ALL -- to combine distance with cost to avoid duplicate
select sum(distance*-0.3) 
from runner_orders )

select sum(delivery_fee) as net_income -- summing to get pizza runner net income
from delivery;

----- 3. to check runner rating create #check rating schema
select *
from runner_ratings;

----- 4. a joint table of runner orders
select order_id, runner_id, pickup_time, distance, duration, cancellation, rating, 
	avg(timestampdiff(minute, order_time,pickup_time)) as avg_time,
	avg(distance*60/duration) as average_speed, count(c.order_id) as num_order
from runner_ratings
inner join customer_orders c
using(order_id)
group by order_id,runner_id, pickup_time, distance, duration, cancellation, rating;
