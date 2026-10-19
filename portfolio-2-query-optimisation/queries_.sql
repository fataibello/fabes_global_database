
-- Portfolio 2: Query Processing and Optimisation
-- FABES Global Database
-- Test 1: Baseline query with execution plan

EXPLAIN ANALYZE
SELECT
    o.order_id,
    o.order_date,
    o.order_status,
    c.full_name,
    SUM(oi.quantity * oi.unit_price) AS order_total
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY
    o.order_id,
    o.order_date,
    o.order_status,
    c.full_name
ORDER BY o.order_date DESC;
