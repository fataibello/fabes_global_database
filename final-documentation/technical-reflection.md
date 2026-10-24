# Technical Reflection — FABES GLOBAL Advanced Database Portfolio

## 1. Introduction

This reflection reviews the technical work undertaken for the FABES e-commerce database portfolio. The project covered relational database design, query optimisation, transaction processing, NoSQL data modelling, and distributed database architecture.

Working through these areas helped connect database theory with practical implementation and highlighted the importance of testing, evidence, and honest evaluation.

## 2. Relational Database Design

The PostgreSQL implementation provided practical experience in organising e-commerce data into related tables. Separating customers, addresses, products, orders, order items, payments, and deliveries helped reduce unnecessary duplication and represent the relationships between business entities.

Primary keys and foreign keys helped maintain referential integrity, while constraints provided additional protection against invalid data.

One lesson was that a structurally valid schema does not automatically enforce every business rule. For example, additional validation may be needed to ensure that an address selected for an order belongs to the customer placing it. Some rules are better enforced through carefully designed transactions or application-level validation.

## 3. Query Processing and Optimisation

The query optimisation work involved examining SQL queries, creating indexes, and using `EXPLAIN ANALYZE` to inspect execution plans and timing information.

This demonstrated that indexes can support data retrieval, particularly when queries filter or join on relevant columns. It also showed that adding indexes does not guarantee a measurable speed improvement for every query.

The small sample dataset limited the strength of performance conclusions. Query timings varied between runs, so the results need to be interpreted in context rather than treated as definitive proof of a general performance improvement.

Future work could use a much larger dataset, repeat each benchmark several times, compare consistent baseline and indexed queries, and document the execution plans and measurements in a structured format.

## 4. Transactions and Concurrency

The transaction exercises demonstrated the difference between committing and rolling back database changes. Conditional stock updates also illustrated how a database can help prevent inventory from falling below an acceptable level.

Testing updates from separate PostgreSQL sessions provided practical insight into concurrency and row-level locking. When two sessions attempt to update the same product, transaction timing and locking affect when each update can complete.

These exercises reinforced the importance of atomic transactions, suitable isolation behaviour, and explicit transaction control when multiple users interact with an e-commerce system.

Further testing could explore deadlocks, transaction isolation levels, and simultaneous order placement under more demanding workloads.

## 5. NoSQL Data Modelling

MongoDB provided practical experience with document-based data modelling and CRUD operations. Product documents could hold nested specifications and arrays without requiring every product type to have an identical set of attributes.

This flexibility is useful for a catalogue containing different product categories. However, flexible documents still require validation and consistent field conventions to prevent data quality problems.

The portfolio also compared key-value, column-family, and graph models conceptually. These comparisons helped explain that database technologies should be selected according to access patterns, relationships, consistency needs, and operational requirements rather than novelty alone.

## 6. Distributed Database Architecture

The proposed FABES architecture separates relational transactions from flexible product catalogue data. The analysis of replication and sharding highlighted different approaches to availability, read scaling, and distributing data across systems.

Replication can provide another copy of data, but it introduces operational requirements such as monitoring replication lag and planning failover. Sharding can distribute storage and workload, but shard-key selection and cross-shard queries can add complexity.

The architecture and analysis are proposals. PostgreSQL and MongoDB were implemented locally, but a live replicated cluster, sharded deployment, and automated backup and monitoring infrastructure were not deployed. Recognising this distinction is important when evaluating the evidence and the project's limitations.

## 7. Challenges and Lessons Learned

The project required careful management of database scripts, query results, screenshots, and repository documentation. Recording evidence alongside each portfolio helped make the work easier to review.

Another important lesson was to evaluate results rather than assuming that a successful command proves an entire system is complete. Performance measurements require comparable tests, transaction behaviour requires deliberate testing, and proposed infrastructure must be clearly distinguished from implemented infrastructure.

Organising the work into separate portfolio folders also made it easier to maintain a clear record of the project.

## 8. Future Improvements

Potential improvements include:

- Testing query performance against a larger and more realistic dataset.
- Expanding transaction tests to include deadlocks and different isolation levels.
- Adding stronger validation for business rules and inventory operations.
- Implementing automated database backups and testing restoration.
- Deploying and testing PostgreSQL replication in a controlled environment.
- Evaluating a real sharding strategy only when workload and scaling requirements justify it.
- Improving automated tests, monitoring, security controls, and deployment documentation.

## 9. Conclusion

The FABES portfolio developed practical understanding of relational databases, query performance, transactions, NoSQL documents, and distributed database design.

The most important outcome was learning to combine implementation with measurement, analysis, and clear documentation. The project also identified limitations and future improvements without presenting proposed features as completed deployments.
