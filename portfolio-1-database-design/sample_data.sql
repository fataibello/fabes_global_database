
BEGIN;

-- 1. Customers
INSERT INTO customers
(customer_id, full_name, email, phone, created_at)
OVERRIDING SYSTEM VALUE
VALUES
(1, 'Ada Okafor', 'ada.okafor@example.com', '08030000001', '2026-09-01 09:00:00+01'),
(2, 'Tunde Bello', 'tunde.bello@example.com', '08030000002', '2026-09-03 10:30:00+01'),
(3, 'Mary James', 'mary.james@example.com', '08030000003', '2026-09-05 12:00:00+01');

-- 2. Customer addresses
INSERT INTO addresses
(address_id, customer_id, address_line, city, state, country, is_default)
OVERRIDING SYSTEM VALUE
VALUES
(1, 1, '12 Unity Road', 'Abuja', 'FCT', 'Nigeria', TRUE),
(2, 2, '8 Market Street', 'Lagos', 'Lagos', 'Nigeria', TRUE),
(3, 3, '25 Garden Avenue', 'Abuja', 'FCT', 'Nigeria', TRUE),
(4, 1, '4 Palm Crescent', 'Lagos', 'Lagos', 'Nigeria', FALSE);

-- 3. Product categories
INSERT INTO categories (category_id, category_name)
OVERRIDING SYSTEM VALUE
VALUES
(1, 'Electronics'),
(2, 'Fashion'),
(3, 'Home and Living'),
(4, 'Accessories');

-- 4. Products
INSERT INTO products
(product_id, category_id, product_name, description,
 unit_price, stock_quantity, is_active, created_at)
OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'Wireless Headphones', 'Bluetooth over-ear headphones', 45000.00, 25, TRUE, '2026-09-01 09:00:00+01'),
(2, 1, 'USB-C Charger', 'Fast charging wall adapter', 12000.00, 50, TRUE, '2026-09-02 09:00:00+01'),
(3, 2, 'Classic T-Shirt', 'Cotton casual T-shirt', 8500.00, 40, TRUE, '2026-09-03 09:00:00+01'),
(4, 2, 'Running Shoes', 'Lightweight sports shoes', 32000.00, 15, TRUE, '2026-09-04 09:00:00+01'),
(5, 3, 'Table Lamp', 'LED bedside lamp', 18000.00, 20, TRUE, '2026-09-05 09:00:00+01'),
(6, 4, 'Leather Wallet', 'Compact everyday wallet', 10000.00, 30, TRUE, '2026-09-06 09:00:00+01');

-- 5. Product attributes
INSERT INTO product_attributes
(attribute_id, product_id, attribute_name, attribute_value)
OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'Colour', 'Black'),
(2, 1, 'Connectivity', 'Bluetooth'),
(3, 2, 'Connector', 'USB-C'),
(4, 3, 'Material', 'Cotton'),
(5, 3, 'Size', 'Large'),
(6, 4, 'Colour', 'White'),
(7, 5, 'Light Type', 'LED'),
(8, 6, 'Material', 'Leather');

-- 6. Orders
INSERT INTO orders
(order_id, customer_id, address_id, order_date, order_status)
OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, '2026-10-01 10:00:00+01', 'Delivered'),
(2, 2, 2, '2026-10-03 14:15:00+01', 'Shipped'),
(3, 3, 3, '2026-10-05 11:30:00+01', 'Confirmed'),
(4, 1, 4, '2026-10-07 16:45:00+01', 'Pending');

-- 7. Items in each order
INSERT INTO order_items
(order_item_id, order_id, product_id, quantity, unit_price)
OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 1, 45000.00),
(2, 1, 2, 2, 12000.00),
(3, 2, 3, 3, 8500.00),
(4, 2, 4, 1, 32000.00),
(5, 3, 5, 1, 18000.00),
(6, 3, 6, 2, 10000.00),
(7, 4, 2, 1, 12000.00);

-- 8. Payments
INSERT INTO payments
(payment_id, order_id, payment_reference, amount,
 payment_method, payment_status, payment_date)
OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'FABES-PAY-1001', 69000.00, 'Card', 'Successful', '2026-10-01 10:05:00+01'),
(2, 2, 'FABES-PAY-1002', 57500.00, 'Transfer', 'Successful', '2026-10-03 14:20:00+01'),
(3, 3, 'FABES-PAY-1003', 38000.00, 'Card', 'Pending', '2026-10-05 11:35:00+01');

-- 9. Deliveries
INSERT INTO deliveries
(delivery_id, order_id, tracking_number, delivery_status,
 shipped_at, delivered_at)
OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'FABES-TRK-1001', 'Delivered',
 '2026-10-02 08:00:00+01', '2026-10-04 13:00:00+01'),
(2, 2, 'FABES-TRK-1002', 'In Transit',
 '2026-10-04 09:00:00+01', NULL);

COMMIT;
