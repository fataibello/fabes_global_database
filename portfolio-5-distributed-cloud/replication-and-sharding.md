
# Portfolio 5: Replication and Sharding for FABES GLOBAL

## 1. Replication

Replication maintains copies of data on multiple database servers. It can improve availability and support read scaling, depending on the replication design.

### Proposed PostgreSQL design

- **Primary:** Accepts writes to customers, orders, payments, and other transactional tables.
- **Standby replica:** Receives changes from the primary and maintains a copy of its data.
- **Read routing:** Selected read-only queries may use a replica when the application can tolerate replication lag.
- **Failover:** An administrator or configured orchestration system promotes a suitable standby when the primary fails.

### Benefits

- Can reduce downtime following server failure.
- Can support additional read capacity.
- Can provide a second database copy for recovery.

### Limitations

- Asynchronous replication may lag behind the primary.
- Synchronous replication may increase write latency.
- A replica can reproduce accidental updates or deletions.
- Failover requires monitoring, coordination, and a recovery procedure.

Replication is not a substitute for independent, tested backups.

## 2. Sharding

Sharding divides a dataset across multiple servers. Each shard stores a portion of the overall data.

### Proposed FABES example

If FABES accumulates a very large volume of product-view events, those events could be partitioned by customer identifier or another suitable key.

For example:

- Shard A stores events for one range or group of customer identifiers.
- Shard B stores events for another range or group.
- A routing mechanism directs each query to the relevant shard or shards.

This is a conceptual design. It does not mean the current FABES database has been sharded.

### Choosing a shard key

A suitable shard key should distribute writes and storage reasonably evenly while supporting common queries.

A poor shard key can create hotspots, uneven storage, and expensive queries that must contact multiple shards.

Customer-based partitioning can work for customer-specific event histories, but queries across all customers may require scatter-gather operations.

## 3. Replication Versus Sharding

| Feature | Replication | Sharding |
|---|---|---|
| Main purpose | Maintain copies of data | Split data across partitions |
| Availability | Can support recovery and failover | Depends on shard and replica design |
| Capacity | Adds copies and may increase read capacity | Distributes storage and workload |
| Main challenge | Consistency and replication lag | Partitioning, routing, and data skew |

Replication and sharding can be combined in larger systems.

## 4. Consistency Considerations

For FABES, order and payment processing requires careful consistency controls.

- The application should use transactions for related changes within PostgreSQL.
- Replicated read workloads must account for possible lag.
- Payment processing should be designed to prevent duplicate processing and inconsistent order states.
- Cross-database updates between PostgreSQL and MongoDB need an explicit synchronisation strategy.

A distributed design should specify which data is authoritative, how failures are handled, and how inconsistencies are detected and corrected.

## 5. Suggested Evaluation Plan

If replication is deployed in a test environment, measure:

1. Whether changes on the primary appear on the standby.
2. The delay between the primary commit and replica visibility.
3. Behaviour when the primary becomes unavailable.
4. Whether recovery procedures restore service correctly.

If sharding is deployed, evaluate data distribution, query routing, storage balance, and performance for representative workloads.

## 6. Current Implementation Status

The replication and sharding designs in this document are proposed architectural examples. A live replicated or sharded cluster has not been established as part of the current local implementation.

Implementation claims should be updated only after the relevant configuration and tests have been performed.

