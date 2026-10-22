# FABES GLOBAL Advanced Database Systems Portfolio

## Project Overview

This repository presents the FABES GLOBAL e-commerce database case study for the Advanced Database Systems module. It covers relational database design, SQL query optimisation, transaction processing, NoSQL data modelling, and distributed database architecture.

The project combines practical database implementation with technical analysis, documentation, and supporting evidence.

## Technologies Used

- **PostgreSQL 18** — relational schema design, SQL queries, indexing, transactions, and concurrency testing.
- **MongoDB Community Server and MongoDB Compass** — document-based product catalogue and CRUD operations.
- **GitHub** — version control, project organisation, and submission documentation.
- **Mermaid** — architecture and database diagrams where supported.

## Portfolio Contents

| Portfolio | Focus | Main Contents |
|---|---|---|
| [Portfolio 1](portfolio-1-database-design/) | Database design and modelling | Relational schema, sample data, ER diagram, and design analysis |
| [Portfolio 2](portfolio-2-query-optimisation/) | Query processing and optimisation | SQL queries, indexes, execution plans, and performance analysis |
| [Portfolio 3](portfolio-3-transactions-concurrency/) | Transactions and concurrency | Commit and rollback tests, stock updates, and concurrency analysis |
| [Portfolio 4](portfolio-4-nosql/) | NoSQL and advanced data models | MongoDB documents, CRUD operations, model comparisons, and analysis |
| [Portfolio 5](portfolio-5-distributed-cloud/) | Distributed databases and cloud architecture | Architecture proposal, replication and sharding analysis, and evidence |
| [Final Documentation](final-documentation/) | Project overview and reflection | Portfolio summary, technical reflection, and references |

## Database Implementation

### PostgreSQL

The relational database models core e-commerce entities, including customers, addresses, categories, products, product attributes, orders, order items, payments, and deliveries.

The implementation uses primary keys, foreign keys, constraints, indexes, SQL queries, and transaction tests to demonstrate database design and management concepts.

### MongoDB

MongoDB stores product catalogue documents containing product information, nested specifications, and arrays where appropriate. CRUD operations demonstrate document creation, retrieval, updating, and deletion.

## Distributed Architecture

The portfolio proposes an architecture combining PostgreSQL and MongoDB. It evaluates replication, sharding, consistency, availability, backups, and monitoring.

**Implementation status:** PostgreSQL and MongoDB were implemented locally. PostgreSQL replication, sharding infrastructure, automated backup infrastructure, and monitoring infrastructure are documented as proposals and are not claimed to be deployed.

## Evidence and Documentation

Each portfolio folder contains its relevant scripts, analysis, and available evidence. The final documentation folder provides an overall summary, technical reflection, and references.

## Project Limitations

- Query performance tests used a small sample dataset, so timing results should be interpreted cautiously.
- Redis, Cassandra, and Neo4j are discussed as conceptual NoSQL model examples and are not claimed to have been implemented.
- Distributed infrastructure described in Portfolio 5 is proposed rather than deployed.

## Conclusion

This project demonstrates practical work across relational databases, SQL performance analysis, transaction management, document-oriented NoSQL, and distributed database design. It also records technical limitations and identifies opportunities for further testing and development.
