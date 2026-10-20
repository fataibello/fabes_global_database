# Portfolio 2: Query Processing and Optimisation

## 1. Objective

The objective was to analyse a multi-table SQL query in the FABES e-commerce database, examine its execution plan using PostgreSQL `EXPLAIN ANALYZE`, and create indexes to support joins and date-based queries.

## 2. Baseline Test

The original query joined the `orders`, `customers`, and `order_items` tables. It calculated order totals by multiplying item quantities by their recorded unit prices and summing the results for each order.

The query was executed using `EXPLAIN ANALYZE` to inspect PostgreSQL's execution plan and measure query execution time.

**Baseline execution time:** [Enter the value from your first screenshot] ms.

## 3. Indexing Strategy

Four indexes were created:

- `idx_orders_customer_id` on `orders(customer_id)`
- `idx_order_items_order_id` on `order_items(order_id)`
- `idx_order_items_product_id` on `order_items(product_id)`
- `idx_orders_order_date` on `orders(order_date)`

These indexes were intended to support foreign-key joins and date-based queries.

## 4. Post-Indexing Test

The same query was executed again after creating the indexes.

**Post-indexing execution time:** 0.287 ms, subject to confirmation against the execution plan.

## 5. Performance Analysis

The query completed successfully after the indexes were created. The execution time must be interpreted in the context of the small sample dataset.

PostgreSQL may choose sequential scans rather than index scans when a table contains very few records. This is not necessarily a performance problem because scanning a small table can be cheaper than accessing an index.

A reliable conclusion about performance improvement requires comparing the baseline and post-indexing execution times and inspecting both execution plans. A single run does not establish that the indexes caused a performance improvement.

## 6. Conclusion

The exercise demonstrated how to use `EXPLAIN ANALYZE` to examine query execution and how to create indexes for common join and search columns. Further testing with a larger dataset and repeated measurements would provide a stronger basis for evaluating the performance impact of indexing.
