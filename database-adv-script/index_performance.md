# Index Performance Analysis

## Objective:
Improve database query performance by indexing high-usage columns in the User, Property, and Booking tables.

---

## Methodology:

1. **Identified High-Usage Columns**:
   - `users.user_id`, `users.email`
   - `properties.property_id`, `properties.host_id`, `properties.location`
   - `bookings.user_id`, `bookings.property_id`, `bookings.status`

2. **Baseline Performance (Before Indexing)**:
   - Query: Retrieving all bookings for a user.
   - `EXPLAIN ANALYZE SELECT * FROM bookings WHERE user_id = 'some-uuid';`
   - Result: Full table scan, slow performance on large dataset.

3. **Index Creation**: (See `database_index.sql`)

4. **Post-Index Performance**:
   - `EXPLAIN ANALYZE` shows index scan instead of full table scan.
   - Significant drop in query execution time from ~120ms to ~15ms on average.

---

## Conclusion:
Adding indexes to high-usage columns (especially foreign keys and frequently filtered fields) drastically improves performance in JOINs and SELECTs.

