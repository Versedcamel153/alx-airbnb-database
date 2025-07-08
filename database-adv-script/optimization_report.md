# Performance Analysis of Booking Query

## Objective

To analyze and improve a query that retrieves all bookings with associated user, property, and payment details.

---

## Initial Query

The original query joined:
- `bookings`
- `users`
- `properties`
- `payments` (LEFT JOIN)

### Analysis with EXPLAIN

### Observations:
- `bookings` table was scanned using `ALL` (full table scan)
- Joins on `user_id`, `property_id`, and `booking_id` lacked index optimization
- Fetching too many columns led to unnecessary overhead

---

## Optimization Strategy

1. **Indexed Columns**:
    - `bookings.user_id`
    - `bookings.property_id`
    - `payments.booking_id`

2. **Reduced Columns**:
    - Avoid selecting unused or redundant fields

3. **Use LEFT JOIN only when necessary**:
    - Payments table used `LEFT JOIN` since some bookings may not be paid yet

---

## Refactored Query

```sql
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    u.first_name,
    p.name AS property_name,
    pay.amount AS payment_amount
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON b.booking_id = pay.booking_id;
