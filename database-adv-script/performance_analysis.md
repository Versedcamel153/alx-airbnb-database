# Database Performance Monitoring & Optimization Report

## Objective
To continuously monitor and refine database performance by analyzing query execution plans and making necessary schema or indexing adjustments.

---

## Tools Used
- `EXPLAIN` (MySQL 5.x / 8.x)
- `EXPLAIN ANALYZE` (MySQL 8+)
- Query logs
- Manual query testing

---

## 1. Queries Analyzed

### Query 1: Fetch bookings by user
```sql
EXPLAIN SELECT * FROM bookings WHERE user_id = 'uuid-1';
