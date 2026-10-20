
-- Portfolio 3: Transaction rollback test
-- FABES Global Database

BEGIN;

UPDATE products
SET stock_quantity = stock_quantity + 5
WHERE product_id = 1;

-- Check the temporary stock quantity
SELECT product_id, product_name, stock_quantity
FROM products
WHERE product_id = 1;

ROLLBACK;

-- Confirm that the original quantity has been restored
SELECT product_id, product_name, stock_quantity
FROM products
WHERE product_id = 1;


--Transaction commit test

BEGIN;

UPDATE products
SET stock_quantity = stock_quantity + 3
WHERE product_id = 1;

COMMIT;

-- Verify that the stock change was saved
SELECT
    product_id,
    product_name,
    stock_quantity
FROM products
WHERE product_id = 1;

