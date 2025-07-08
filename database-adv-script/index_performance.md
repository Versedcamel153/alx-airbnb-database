# Index Performance Analysis

## Objective

Improve query performance by identifying high-usage columns in the `users`, `bookings`, and `properties` tables. Create appropriate indexes and evaluate their effect using `EXPLAIN`.

---

## 1. High-Usage Columns Identified

The following columns were identified based on frequent use in `WHERE`, `JOIN`, and `ORDER BY` clauses:

| Table       | Column(s)            | Usage Context                              |
|-------------|----------------------|--------------------------------------------|
| `users`     | `email`, `user_id`   | User lookup, foreign key joins             |
| `bookings`  | `user_id`, `property_id`, `status` | Filtering, foreign key joins, reports |
| `properties`| `location`, `host_id`, `property_id` | Filtering by location, foreign keys  |

---

## 2. Indexes Created

The following indexes were created to optimize queries:

```sql
-- Users table
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_user_id ON users(user_id);

-- Bookings table
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_status ON bookings(status);

-- Properties table
CREATE INDEX idx_properties_location ON properties(location);
CREATE INDEX idx_properties_host_id ON properties(host_id);
CREATE INDEX idx_properties_property_id ON properties(property_id);
