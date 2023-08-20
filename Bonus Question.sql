----- bonus question
----- Write an INSERT statement to demonstrate what would happen if a new
----- 'Supreme' pizza with all the toppings was added to the Pizza Runner menu?

----- creating a new table and update of 'pizza_recipes' adding another pizza to it.  

INSERT INTO pizza_recipes
  (pizza_id, toppings)
VALUES
  (3, '1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12');
  
----- check it the new the table
 select *
 from pizza_recipes_update;
  
----- creating a new table and update of 'pizza_names' adding another pizza to it.
INSERT INTO pizza_names
  (pizza_id, pizza_name)
VALUES
  (3, 'Supreme');

----- checking it the new the table
select *
from pizza_names