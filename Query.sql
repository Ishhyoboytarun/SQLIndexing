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
  
/*
This execution plan tells us that the query is performing a sequential scan on the "customers" table 
and applying a filter to select only rows where "customer_email" ends with "@gmail.com". 
The cost of this operation is estimated to be between 0.00 and 10.50 units, with an expected result set of 100 rows.


Based on this analysis, we can see that the query is performing a full table scan, 
which can be slow for large tables. 
To optimize the query, we might consider adding an index on the "customer_email" column
*/
