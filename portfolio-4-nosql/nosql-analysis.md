
# NoSQL Analysis for FABES GLOBAL

## 1. Introduction

FABES GLOBAL is an e-commerce system that manages customers, products, orders, payments, and deliveries. PostgreSQL provides relational integrity and transaction support for core business records. NoSQL databases can complement PostgreSQL where flexible data structures, fast key-based access, high-volume events, or complex relationships are important.

## 2. Document Model: MongoDB

**Proposed use:** Product catalogue.

MongoDB stores product information as BSON documents. 

**Benefits**
- Flexible structure for products with different attributes.
- Related product details can be retrieved together.
- Supports queries and updates on nested fields and arrays.

**Limitations**
- Flexible schemas require application-level validation and consistency rules.
- Embedding too much data can create large documents or duplicated information.
- MongoDB does not automatically enforce all relational foreign-key rules used in PostgreSQL.

**Assessment:** Suitable for a product catalogue with diverse specifications. PostgreSQL remains useful for orders, payments, and records requiring strong relational constraints.

**Implementation status:** The local MongoDB database and product documents were created in MongoDB Compass. Record CRUD tests and screenshots as evidence when each operation has been verified.

## 3. Key-Value Model: Redis

**Proposed use:** Shopping-cart and session storage.

A key-value database retrieves a value using a unique key, for example `cart:customer:1`.

**Benefits**
- Fast lookups by key.
- Simple data access for temporary cart and session information.
- Expiration policies can remove data that is no longer needed.

**Limitations**
- Access by arbitrary product attributes is not its primary strength.
- Application logic may be needed to maintain consistency with product prices and stock in PostgreSQL.
- Persistence and eviction settings must be chosen carefully.

## 4. Column-Family Model: Apache Cassandra

**Proposed use:** High-volume product-view and activity events.

Cassandra tables are designed around query patterns, partition keys, and clustering columns. The example groups product-view events by customer and orders them by timestamp.

**Benefits**
- Designed for distributed storage and high write throughput.
- Supports horizontal scaling across nodes.
- Query-oriented partitioning can make common access patterns efficient.

**Limitations**
- Data modelling requires advance knowledge of important query patterns.
- Data duplication may be necessary for different queries.
- It is not a direct replacement for relational joins or multi-table transactions.

## 5. Graph Model: Neo4j

**Proposed use:** Product recommendations and relationship exploration.

A graph database represents entities as nodes and connections as relationships. For example, a customer can VIEW a product or PURCHASE a product.

**Benefits**
- Relationships are explicit and easy to traverse.
- Useful for discovering related products and customer interests.
- Can express multi-step relationships without manually joining many relational tables.

**Limitations**
- Adds another database technology to operate and maintain.
- Requires careful graph modelling and suitable query design.
- Is not necessarily better than PostgreSQL for simple tabular queries.

## 6. Comparative Evaluation

| Model | Example FABES GLOBAL workload | Main advantage | Main limitation |
|---|---|---|---|
| Document | Product catalogue | Flexible attributes | Requires schema and validation discipline |
| Key-value | Carts and sessions | Fast key lookups | Limited relational querying |
| Column-family | Activity events | Distributed write scalability | Query-driven data modelling |
| Graph | Recommendations | Relationship traversal | Additional operational complexity |
| Relational (PostgreSQL) | Orders and payments | Constraints and transactions | Less flexible for varying product attributes |

## 7. Conclusion

A polyglot persistence approach allows FABES GLOBAL to choose a database model for each workload. MongoDB is a practical complement for flexible product documents. Redis, Cassandra, and Neo4j are potential options for specific workloads if the system's scale and features justify their additional complexity.
