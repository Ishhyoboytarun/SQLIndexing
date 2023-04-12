-- Original query for fetching data
SELECT * FROM customers WHERE customer_email LIKE '%@gmail.com';


-- Analyzing the performance of the query
EXPLAIN SELECT * FROM customers WHERE customer_email LIKE '%@gmail.com';


/*
This is the response
from the above explanation of the query
*/
Seq Scan on customers  (cost=0.00..10.50 rows=100 width=36)
  Filter: (customer_email ~~ '%@gmail.com'::text)
  
 
