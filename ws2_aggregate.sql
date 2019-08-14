SELECT store_id , film_id , count(*) as total FROM sakila.inventory
group by store_id, film_id
;