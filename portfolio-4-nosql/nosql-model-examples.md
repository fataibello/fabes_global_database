
# Portfolio 4: NoSQL Data Model Examples

## 1. Document Model — MongoDB

**Example:** FABES Global product catalogue.

MongoDB stores each product as a document containing fields such as name, price, stock quantity, tags, and nested specifications.

```json
{
  "product_id": 1,
  "name": "Wireless Headphones",
  "price": 45000,
  "specifications": {
    "connectivity": "Bluetooth",
    "battery_life_hours": 30
  },
  "tags": ["wireless", "audio"]
}
```

**Suitability for FABES GLOBAL:** Product categories have different attributes. A document model accommodates these differences without requiring every product to share an identical set of columns.

## 2. Key-Value Model — Redis

**Example:** Shopping-cart storage.

```text
Key: cart:customer:1
Value: {"product_id": 1, "quantity": 2}
```

**Suitability for FABES GLOBAL:** A key-value store supports fast retrieval of cart or session data using a known key. Cart data can be temporary and does not always need the relational structure of PostgreSQL.

## 3. Column-Family Model — Apache Cassandra

**Example:** Product-view events grouped by customer.

Illustrative CQL table:

```sql
CREATE KEYSPACE fabes_global_analytics
WITH replication = {
  'class': 'SimpleStrategy',
  'replication_factor': 1
};

CREATE TABLE fabes_global_analytics.product_views_by_customer (
  customer_id int,
  viewed_at timestamp,
  product_id int,
  product_name text,
  PRIMARY KEY (customer_id, viewed_at, product_id)
) WITH CLUSTERING ORDER BY (viewed_at DESC);
```

**Suitability for FABES GLOBAL:** A column-family database can support large volumes of product-view events and customer activity, particularly when queries are designed around a partition key.

## 4. Graph Model — Neo4j

**Example:** Customer-to-product relationships.

Illustrative Cypher query:

```cypher
CREATE
  (c:Customer {customer_id: 1, name: 'Ada Okafor'}),
  (p:Product {product_id: 1, name: 'Wireless Headphones'}),
  (c)-[:VIEWED]->(p);
```

Retrieve products viewed by a customer:

```cypher
MATCH (c:Customer {customer_id: 1})-[:VIEWED]->(p:Product)
RETURN c.name, p.name;
```

**Suitability for FABES GLOBAL:** A graph database can represent customers, products, categories, and relationships such as VIEWED, PURCHASED, or BELONGS_TO. It is useful for recommendations and relationship-based discovery.

## 5. Comparison and Conclusion

| Model | FABES GLOBAL use case | Main strength |
|---|---|---|
| Document | Product catalogue | Flexible product attributes |
| Key-value | Shopping carts and sessions | Fast key-based access |
| Column-family | High-volume activity events | Scalable, query-oriented event storage |
| Graph | Recommendations and related products | Relationship traversal |

PostgreSQL remains suitable for orders, payments, customers, and other data requiring relational integrity and transactions. The NoSQL models complement it for specific workloads rather than replacing it indiscriminately.
