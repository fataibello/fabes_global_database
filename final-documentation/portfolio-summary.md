# FABES GLOBAL Advanced Database Systems Portfolio

## 1. Introduction

This portfolio presents the design, implementation, testing, and evaluation of database solutions for the FABES GLOBAL e-commerce case study. It explores relational database design, query optimisation, transaction management, NoSQL data modelling, and distributed database architecture.

The project uses PostgreSQL for relational data management and MongoDB for flexible product catalogue documents. It also examines proposed approaches to replication, sharding, backup, and recovery.

## 2. Portfolio 1: Database Design and Modelling

This section covers the design and implementation of the FABES GLOBAL relational database in PostgreSQL.

The database includes tables for customers, addresses, categories, products, product attributes, orders, order items, payments, and deliveries. Primary keys, foreign keys, and constraints support data integrity.

Sample records were inserted to test the schema. An entity-relationship diagram and supporting documentation describe the database structure and design decisions.

## 3. Portfolio 2: Query Processing and Optimisation

This section examines SQL queries and indexing strategies for the FABES GLOBAL database.

Indexes were created for important relationships and query fields, including customer IDs, order IDs, product IDs, order dates, and a composite customer-and-date index.

`EXPLAIN ANALYZE` was used to inspect query execution and record planning and execution times. Because the sample dataset is small, timing results should be interpreted cautiously; repeated measurements can vary due to caching and other execution conditions.

## 4. Portfolio 3: Transactions and Concurrency

This section explores transaction behaviour and data consistency in PostgreSQL.

Practical exercises demonstrate transaction rollback, transaction commit, conditional stock updates, and concurrent updates to a product record from separate database sessions.

These exercises illustrate atomicity, consistency, isolation, and durability, as well as the role of row-level locking in coordinating concurrent changes.

## 5. Portfolio 4: NoSQL and Advanced Data Models

This section implements a MongoDB product catalogue using document-based data modelling.

Product documents contain fields such as prices, stock quantities, categories, nested specifications, and arrays. CRUD operations were used to create, read, update, and delete documents.

The portfolio also compares document, key-value, column-family, and graph data models. Redis, Cassandra, and Neo4j examples are presented conceptually and are not claimed to have been deployed or tested.

## 6. Portfolio 5: Distributed Databases and Cloud Architecture

This section proposes a distributed database architecture for FABES GLOBAL, combining PostgreSQL for relational transactions and MongoDB for product catalogue data.

The documentation evaluates replication, sharding, consistency, availability, backups, monitoring, and recovery considerations.

The PostgreSQL and MongoDB environments were implemented locally. A replicated PostgreSQL cluster, sharding infrastructure, automated backup infrastructure, and monitoring infrastructure remain proposed designs rather than deployed components.

## 7. Key Learning Outcomes

The project demonstrates practical work in:

- Relational schema design and referential integrity.
- SQL querying, indexing, and execution-plan analysis.
- Transaction control and concurrent database updates.
- MongoDB document modelling and CRUD operations.
- Comparing different NoSQL data models.
- Evaluating distributed database architecture and its trade-offs.
- Recording implementation evidence and documenting technical limitations.

## 8. Conclusion

The FABES GLOBAL portfolio brings together relational database implementation, performance analysis, transaction testing, NoSQL modelling, and distributed architecture planning.

It distinguishes completed practical work from conceptual designs and identifies areas for further development, including larger-scale performance testing, automated recovery, and deployment of replicated or sharded infrastructure.

Supporting scripts, analysis, diagrams, and evidence are organised in the corresponding portfolio folders in this repository.
