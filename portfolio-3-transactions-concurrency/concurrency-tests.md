# Portfolio 3: Transactions and Concurrency

## 1. Objective

The objective was to demonstrate transaction management and concurrency control in PostgreSQL using the FABES GLOBAL database.

## 2. Transaction Rollback

A transaction increased the stock quantity of product 1 by five units. The transaction was rolled back using `ROLLBACK`. The final stock quantity returned to its original value, demonstrating that uncommitted changes can be discarded.

## 3. Transaction Commit

A separate transaction increased the stock quantity of product 1 by three units. The transaction was committed using `COMMIT`, and the updated quantity persisted.

## 4. Safe Inventory Update

A conditional update deducted two units only when sufficient stock was available. This demonstrated how a database condition can help prevent inventory from becoming negative.

## 5. Two-Session Concurrency Test

Two separate PostgreSQL sessions attempted to update the stock quantity of the same product.

Session A began a transaction and updated the product without committing. Session B then attempted to update the same row and remained running while waiting for the conflicting row lock.

After Session A committed, Session B continued and completed its update. Session B was then committed.

This experiment demonstrated PostgreSQL row-level locking and the coordination of concurrent updates to the same row.

## 6. Conclusion

The practical exercises demonstrated the use of `COMMIT`, `ROLLBACK`, conditional updates, and row-level locking. These mechanisms help maintain data consistency when multiple operations modify inventory concurrently.

