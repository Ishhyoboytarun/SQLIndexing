/* 
Creating index on the email column 
for faster searching
*/
CREATE INDEX idx_customer_email ON customers(customer_email);


-- Checking the performance of the query after index creation
EXPLAIN SELECT * FROM customers WHERE customer_email LIKE '%@gmail.com';


-- The performance metrics post indexing
Bitmap Heap Scan on customers  (cost=4.00..30.50 rows=100 width=36)
  Recheck Cond: (customer_email ~~ '%@gmail.com'::text)
  ->  Bitmap Index Scan on idx_customer_email  (cost=0.00..4.00 rows=100 width=0)
        Index Cond: (customer_email ~~ '%@gmail.com'::text)

/*
This execution plan shows that the query is using the newly created index to perform a bitmap index scan, 
which is much faster than a full table scan. By analyzing the query and optimizing it with an index, 
we've greatly improved its performance.
*/
