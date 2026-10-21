
# Portfolio 5: Distributed Database Architecture for FABES GLOBAL

## 1. Introduction

FABES is an e-commerce platform that manages customers, products, orders, payments, and deliveries. Its current implementation uses PostgreSQL for relational data and MongoDB for flexible product documents.

As the platform grows, the architecture must support availability, scalability, data consistency, security, and reliable recovery from failures.

## 2. Proposed Architecture

The proposed architecture contains the following components:

1. **Application layer:** Handles customer requests, product searches, shopping carts, orders, and payments.
2. **PostgreSQL primary database:** Stores customers, addresses, orders, order items, payments, and deliveries.
3. **PostgreSQL standby replica:** Maintains a copy of the primary database to support recovery and potentially read-only workloads.
4. **MongoDB product catalogue:** Stores flexible product documents, including category-specific specifications and tags.
5. **Backup storage:** Holds scheduled database backups in a separate protected location.
6. **Monitoring and recovery:** Tracks database health, replication status, backup completion, and available storage.

The PostgreSQL replica and backup storage are proposed architectural components. They have not been deployed as part of the current local implementation.

## 3. Why Distribution Matters

A distributed database architecture can help FABES to:

- Improve service availability when a database server fails.
- Scale read workloads by directing suitable queries to replicas.
- Increase storage and processing capacity as data volumes grow.
- Support recovery from accidental deletion or infrastructure failure.

Distribution also introduces additional complexity, including replication lag, network failures, consistency management, operational costs, and security configuration.

## 4. Data Ownership

PostgreSQL remains the authoritative source for orders, payments, customer records, and transactional relationships.

MongoDB provides a document-oriented representation of product information. If product information is duplicated between databases, the application must define which system owns each field and how updates are synchronised.

The design should avoid treating two independent databases as if they automatically share a single transaction.

## 5. Availability and Recovery

A PostgreSQL standby can reduce recovery time after primary-server failure, but replication alone is not a complete backup strategy. Accidental changes may also be replicated.

FABES should use scheduled backups, protected backup storage, restore testing, monitoring, and a documented failover procedure.

## 6. Security

Distributed components should use authenticated connections, least-privilege database accounts, encrypted network connections where appropriate, and protected backups.

Database servers should not be exposed publicly without suitable network restrictions and security controls.

## 7. Conclusion

A distributed architecture can help FABES grow beyond a single-server deployment. The appropriate design depends on traffic, availability requirements, data volume, and operational capacity. For a small deployment, a well-maintained PostgreSQL server, MongoDB for appropriate workloads, and tested backups may be more practical than introducing a complex distributed cluster immediately.

This document describes a proposed architecture, not a claim that replicas or cloud infrastructure have already been deployed.

