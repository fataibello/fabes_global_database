
-- Portfolio 2: Query Processing and Optimisation
-- FABES Global Database

-- Indexes to support joins and common searches

CREATE INDEX IF NOT EXISTS idx_orders_customer_id
    ON orders(customer_id);

CREATE INDEX IF NOT EXISTS idx_order_items_order_id
    ON order_items(order_id);

CREATE INDEX IF NOT EXISTS idx_order_items_product_id
    ON order_items(product_id);

CREATE INDEX IF NOT EXISTS idx_orders_order_date
    ON orders(order_date);

-- Verify that the indexes exist

SELECT
    tablename,
    indexname,
    indexdef
FROM pg_indexes
WHERE schemaname = 'public'
  AND indexname IN (
      'idx_orders_customer_id',
      'idx_order_items_order_id',
      'idx_order_items_product_id',
      'idx_orders_order_date'
  )
ORDER BY tablename, indexname;
