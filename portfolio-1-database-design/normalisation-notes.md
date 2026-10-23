# FABES GLOBAL
## Portfolio 1: Database Design and Modelling

### 1. Introduction

FABES GLOBAL is a simulated e-commerce platform designed to manage customers, product listings, inventory, customer orders, payments and deliveries. The database is implemented using PostgreSQL 18 and administered through pgAdmin 4.

The purpose of this project is to design and implement a relational database that maintains data integrity, minimises unnecessary duplication, supports transactional operations and enables meaningful business reporting.

The implemented database contains nine core tables: `customers`, `addresses`, `categories`, `products`, `product_attributes`, `orders`, `order_items`, `payments` and `deliveries`.

### 2. Business Requirements

The database is designed to support the following operations:

- Register and maintain customer information.
- Store multiple delivery addresses for customers.
- Organise products into categories.
- Store product prices, stock quantities and attributes.
- Record customer orders and the products purchased.
- Record payment references, amounts, methods and statuses.
- Track shipment and delivery progress.
- Produce order summaries and sales-related reports.

### 3. Database Entities

**Customers:** Stores customer identity and contact information. Each customer has a unique identifier and email address.

**Addresses:** Stores customer delivery addresses. The customer foreign key links each address to its owner.

**Categories:** Stores product category names, such as Electronics, Fashion and Home.

**Products:** Stores product details, prices, stock quantities and active status. Products can be associated with categories.

**Product Attributes:** Stores additional product characteristics as name-value pairs, such as colour, material, size and connectivity.

**Orders:** Records the customer order, the selected delivery address, the order date and the order status.

**Order Items:** Records individual products within an order, including quantity and the unit price recorded for that order.

**Payments:** Records payment references, amounts, payment methods, payment statuses and payment dates. The schema allows multiple payment records for an order.

**Deliveries:** Records delivery tracking numbers, shipment dates and delivery statuses. The unique order foreign key allows at most one delivery record per order.

### 4. Relationships and Cardinality

The principal relationships are:

- One customer can have many addresses.
- One customer can place many orders.
- One address can be selected for multiple orders.
- One category can contain many products.
- One product can have multiple product attributes.
- One order can contain multiple order items.
- One product can appear in multiple order items.
- One order can have multiple payment records.
- One order can have zero or one delivery record.

The `order_items` table resolves the many-to-many relationship between orders and products. It also stores the quantity and unit price for each purchased product.

The accompanying Entity-Relationship Diagram illustrates the primary keys, foreign keys, unique constraints and relationships among the nine entities.

### 5. Primary Keys and Referential Integrity

Each table has a primary key that uniquely identifies its records. Foreign keys establish relationships between dependent and parent records.

Examples include:

- `addresses.customer_id` references `customers.customer_id`.
- `products.category_id` references `categories.category_id`.
- `orders.customer_id` references `customers.customer_id`.
- `order_items.order_id` references `orders.order_id`.
- `order_items.product_id` references `products.product_id`.
- `payments.order_id` references `orders.order_id`.
- `deliveries.order_id` references `orders.order_id`.

Unique constraints prevent duplicate values where required, including customer email addresses, category names, payment references and delivery tracking numbers.

Check constraints restrict values such as negative prices, non-positive order quantities and invalid order, payment or delivery statuses.

### 6. Normalisation

The database design follows the principles of relational normalisation.

**First Normal Form (1NF):** Each table uses a primary key and stores individual values in its columns. Product characteristics are represented as separate attribute records rather than as repeated attribute columns.

**Second Normal Form (2NF):** Each non-key attribute is associated with the key of its table. The separate `order_items` entity stores order-specific product quantities and prices, rather than repeating product details in the `orders` table.

**Third Normal Form (3NF):** Customer, category, product, order, payment and delivery information are separated into related tables. This reduces duplication and helps prevent insertion, update and deletion anomalies.

The design is consistent with a 3NF-oriented relational model. A formal normalisation analysis should also document functional dependencies and demonstrate that non-key attributes depend on the key, the whole key and nothing but the key.

### 7. Data Integrity and Validation

The sample database was populated with test data and validated using SQL queries.

The verification activities included:

1. Checking the expected number of records in all nine tables.
2. Joining customers, orders, order items and products to verify relationships.
3. Calculating order totals from quantities and recorded unit prices.
4. Checking for orphaned order items, orders without valid customers and products without valid categories.
5. Inspecting the defined primary key, foreign key, unique and check constraints.

The order totals calculated from the sample data were:

| Order ID | Order status | Total |
|---:|---|---:|
| 1 | Delivered | ₦69,000 |
| 2 | Shipped | ₦57,500 |
| 3 | Confirmed | ₦38,000 |
| 4 | Pending | ₦12,000 |

These values represent the totals of the order items, not necessarily revenue received. Payment status must be considered separately when preparing revenue reports.

### 8. Design Limitations and Improvements

The current schema has several limitations that can be addressed in future development.

**Address ownership:** The foreign keys on `orders.customer_id` and `orders.address_id` do not guarantee that the selected address belongs to the customer who placed the order. A composite foreign key or equivalent integrity mechanism could enforce this rule.

**Inventory management:** The schema stores the current stock quantity, but a dedicated inventory transaction table would provide an audit trail of stock movements.

**Order completeness:** A foreign key ensures that an order item references a valid order, but it does not guarantee that every order contains at least one item. This business rule would require additional transactional or application-level validation.

**Delivery cardinality:** The unique constraint on `deliveries.order_id` limits each order to one delivery record. Supporting split shipments would require a different design.

**Historical product pricing:** Storing `unit_price` in `order_items` preserves the price recorded at the time of purchase, even if the current product price changes.

### 9. Conclusion

The FABES GLOBAL database establishes a relational foundation for customer management, product cataloguing, ordering, payments and deliveries. The implementation of nine related tables, primary and foreign keys, uniqueness rules and check constraints supports data consistency.

Sample-data insertion and SQL validation confirmed that the expected records were present, joins returned the expected results, order totals were calculated correctly, and the tested relationships did not contain orphaned records.

The design provides a foundation for the next portfolio activities, including query optimisation, transaction management, concurrency testing, NoSQL modelling and distributed database concepts.

