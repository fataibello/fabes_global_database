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

The same query was executed again after creating the indexes.

**Post-indexing execution time:** 0.287 ms, subject to confirmation against the execution plan.

## 5. Performance Analysis

The query completed successfully after the indexes were created. 

## 6. Conclusion

The exercise demonstrated how to use `EXPLAIN ANALYZE` to examine query execution and how to create indexes for common join and search columns. Further testing with a larger dataset and repeated measurements would provide a stronger basis for evaluating the performance impact of indexing.
