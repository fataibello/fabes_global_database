
-- FABES GLoba. An E-commerce Platform
-- MIT 8103 Advanced Database Systems: Portfolio 1 - Database Design

CREATE TABLE customers (
    customer_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name VARCHAR(120) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone VARCHAR(25),
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE addresses (
    address_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_id BIGINT NOT NULL REFERENCES customers(customer_id),
    address_line VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL DEFAULT 'Nigeria',
    is_default BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE categories (
    category_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE products (
    product_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    category_id BIGINT NOT NULL REFERENCES categories(category_id),
    product_name VARCHAR(200) NOT NULL,
    description TEXT,
    unit_price NUMERIC(12,2) NOT NULL CHECK (unit_price >= 0),
    stock_quantity INTEGER NOT NULL DEFAULT 0
        CHECK (stock_quantity >= 0),
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE product_attributes (
    attribute_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    product_id BIGINT NOT NULL REFERENCES products(product_id),
    attribute_name VARCHAR(100) NOT NULL,
    attribute_value TEXT NOT NULL,
    UNIQUE (product_id, attribute_name)
);

CREATE TABLE orders (
    order_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_id BIGINT NOT NULL REFERENCES customers(customer_id),
    address_id BIGINT NOT NULL REFERENCES addresses(address_id),
    order_date TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    order_status VARCHAR(20) NOT NULL DEFAULT 'Pending'
        CHECK (order_status IN
        ('Pending', 'Confirmed', 'Shipped', 'Delivered', 'Cancelled'))
);

CREATE TABLE order_items (
    order_item_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    order_id BIGINT NOT NULL REFERENCES orders(order_id),
    product_id BIGINT NOT NULL REFERENCES products(product_id),
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    unit_price NUMERIC(12,2) NOT NULL CHECK (unit_price >= 0),
    UNIQUE (order_id, product_id)
);

CREATE TABLE payments (
    payment_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    order_id BIGINT NOT NULL REFERENCES orders(order_id),
    payment_reference VARCHAR(100) UNIQUE,
    amount NUMERIC(12,2) NOT NULL CHECK (amount > 0),
    payment_method VARCHAR(30) NOT NULL,
    payment_status VARCHAR(20) NOT NULL DEFAULT 'Pending'
        CHECK (payment_status IN
        ('Pending', 'Successful', 'Failed', 'Refunded')),
    payment_date TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE deliveries (
    delivery_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    order_id BIGINT NOT NULL UNIQUE REFERENCES orders(order_id),
    tracking_number VARCHAR(100) UNIQUE,
    delivery_status VARCHAR(20) NOT NULL DEFAULT 'Preparing'
        CHECK (delivery_status IN
        ('Preparing', 'In Transit', 'Delivered', 'Failed', 'Returned')),
    shipped_at TIMESTAMPTZ,
    delivered_at TIMESTAMPTZ
);
