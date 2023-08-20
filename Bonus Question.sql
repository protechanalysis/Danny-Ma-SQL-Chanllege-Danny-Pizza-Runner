----- bonus question
----- Write an INSERT statement to demonstrate what would happen if a new
----- 'Supreme' pizza with all the toppings was added to the Pizza Runner menu?

----- updating 'pizza_recipes' by adding another pizza to it.  

INSERT INTO pizza_recipes
  (pizza_id, toppings)
VALUES
  (3, '1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12');
  
----- check if the update was effective
 select *
 from pizza_recipes_update;
  
----- updating 'pizza_names' by adding another pizza to it.
INSERT INTO pizza_names
  (pizza_id, pizza_name)
VALUES
  (3, 'Supreme');

----- check if the update was effective
select *
from pizza_names
