# Transaction Analysis: ACID Properties

## 1. Atomicity

Atomicity means a transaction's operations are treated as a single unit. If a transaction is rolled back, its uncommitted changes are undone.

**FABES GLOBAL for example:** The stock update test increased a product's stock by five units and then used `ROLLBACK`. The original quantity was restored.

## 2. Consistency

Consistency means a transaction must preserve database constraints and defined business rules.

**FABES GLOBAL for example:** The `products` table has a check constraint requiring `stock_quantity` to be greater than or equal to zero. The conditional inventory update also deducted stock only when sufficient stock was available.

## 3. Isolation

Isolation concerns how concurrent transactions interact. PostgreSQL uses row-level locks to coordinate conflicting updates.

**FABES GLOBAL for example:** In the two-session test, Session B waited while Session A held a lock on the same product row. After Session A committed, Session B continued and completed its update.

## 4. Durability

Durability means committed changes persist beyond the completion of a transaction.

**FABES GLOBAL for example:** The stock update using `COMMIT` remained in the database and could be verified with a subsequent `SELECT` query.

## 5. Conclusion

The practical tests demonstrated the main ACID concepts using PostgreSQL transactions and inventory updates. Together, these properties help protect the reliability and consistency of an e-commerce database.

