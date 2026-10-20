# Portfolio 2: Query Processing and Optimisation

## 1. Objective

The objective was to analyse a multi-table SQL query in the FABES Global database, examine its execution plan using PostgreSQL `EXPLAIN ANALYZE`, and create indexes to support joins and date-based queries.

## 2. Baseline Test

The original query joined the `orders`, `customers`, and `order_items` tables. It calculated order totals by multiplying item quantities by their recorded unit prices and summing the results for each order.

The query was executed using `EXPLAIN ANALYZE` to inspect PostgreSQL's execution plan and measure query execution time.

**Baseline execution time:** 0.287ms.

## 3. Indexing Strategy

Four indexes were created:

- `idx_orders_customer_id` on `orders(customer_id)`
- `idx_order_items_order_id` on `order_items(order_id)`
- `idx_order_items_product_id` on `order_items(product_id)`
- `idx_orders_order_date` on `orders(order_date)`

These indexes were intended to support foreign-key joins and date-based queries.

## 4. Post-Indexing Test

After creating the four indexes, I executed the same SQL query again using PostgreSQL's `EXPLAIN ANALYZE`.

The reported results were:

- **Planning Time:** 25.692 ms
- **Execution Time:** 5.566 ms

The query completed successfully and returned the order information and calculated totals.

## 5. Performance Analysis

The post-indexing test recorded an execution time of 5.566 ms. The planning time was 25.692 ms.

Planning time and execution time measure different stages of query processing. Planning time represents the time PostgreSQL spent selecting an execution strategy, while execution time represents the time spent running the query.

These figures alone do not establish whether indexing improved performance. A fair comparison requires the total execution time from the baseline test and the post-indexing test, ideally across multiple runs under comparable conditions.

Because the sample database is small, PostgreSQL may choose sequential scans rather than use the newly created indexes. This can be an efficient choice for small tables. The execution plans should therefore be examined to determine which scan and join strategies PostgreSQL selected.

## 6. Conclusion

This exercise demonstrated the use of `EXPLAIN ANALYZE` to inspect query execution, the creation of indexes on frequently joined and filtered columns, and the importance of evaluating measured performance rather than assuming indexes always improve query speed. Further tests using a larger dataset and repeated measurements would help establish the impact of the indexes.

## 7. Repeated Execution Measurements

The same three-table query was executed twice using PostgreSQL `EXPLAIN ANALYZE`.

| Measurement | Run 1 | Run 2 |
|---|---:|---:|
| Planning Time | 13.119 ms | 0.388 ms |
| Execution Time | 0.306 ms | 0.173 ms |

The execution time decreased from 0.306 ms to 0.173 ms, a difference of approximately 43.5%.

However, these measurements were taken with the indexes potentially already present. They therefore represent variation between consecutive executions rather than a controlled comparison of query performance before and after indexing. Caching and other system factors may influence the results.

A controlled indexing evaluation would require measurements with the same query and dataset before and after the index changes, preferably using multiple runs and comparing execution plans. T
