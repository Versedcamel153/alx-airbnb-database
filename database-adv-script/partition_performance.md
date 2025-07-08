# Partitioning Report: Bookings Table

## Objective
To improve query performance on the large `bookings` table by using **RANGE partitioning** on the `start_date` column.

---

## Implementation

1. **Renamed** the existing table to `bookings_original`.
2. **Recreated** the `bookings` table using `PARTITION BY RANGE (YEAR(start_date))`.
3. **Defined partitions** for years 2021 through 2024 and one `MAXVALUE` fallback.
4. **Re-inserted data** from the old table into the partitioned table.
5. **Tested** queries using `EXPLAIN` to analyze performance.

---

## Performance Before & After

### Before Partitioning

Query:
```sql
SELECT * FROM bookings WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';
