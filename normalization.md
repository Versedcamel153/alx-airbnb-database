# Database Normalization Report – ALX Airbnb Database

## Objective
Ensure the database schema is normalized to **Third Normal Form (3NF)** by identifying and eliminating data redundancy and transitive dependencies.

---

## Original Entities and Attributes

### 1. User
- `user_id` (PK)
- `first_name`
- `last_name`
- `email`
- `password_hash`
- `phone_number`
- `role`
- `created_at`

### 2. Property
- `property_id` (PK)
- `host_id` (FK → User)
- `name`
- `description`
- `location`
- `pricepernight`
- `created_at`
- `updated_at`

### 3. Booking
- `booking_id` (PK)
- `property_id` (FK → Property)
- `user_id` (FK → User)
- `start_date`
- `end_date`
- `total_price`
- `status`
- `created_at`

### 4. Payment
- `payment_id` (PK)
- `booking_id` (FK → Booking)
- `amount`
- `payment_date`
- `payment_method`

### 5. Review
- `review_id` (PK)
- `property_id` (FK → Property)
- `user_id` (FK → User)
- `rating`
- `comment`
- `created_at`

### 6. Message
- `message_id` (PK)
- `sender_id` (FK → User)
- `recipient_id` (FK → User)
- `message_body`
- `sent_at`

---

## Normalization Steps

### 🔹 Step 1: First Normal Form (1NF)
- Ensured **atomic fields** (no arrays, no repeating groups).
- All tables already comply with 1NF — fields like `location`, `role`, and `rating` are scalar.

**Result**: Pass

---

### 🔹 Step 2: Second Normal Form (2NF)
- All tables use **single-column primary keys** (UUIDs), so no risk of partial dependencies.
- Verified that every non-key field depends **entirely** on the primary key of the table.

**Result**: Pass

---

### 🔹 Step 3: Third Normal Form (3NF)
- Verified **no transitive dependencies**:
  - `Property → Host → User Info`: Resolved by using `host_id` as FK only.
  - `Booking → Property → Location` is valid as separate relationships, not duplicated.
  - `Review` and `Message` tables use FKs without duplicating sender/recipient info.

**Result**: Pass

---

## 🔧 Adjustments Made

- Added constraints:
  - `CHECK (rating >= 1 AND rating <= 5)` to `Review`
  - `UNIQUE (user_id, property_id)` on `Review` to prevent duplicate reviews
  - `CHECK (end_date > start_date)` on `Booking` for date integrity

- Ensured enums for `role`, `status`, `payment_method` are clearly defined and constrained

- Separated concerns cleanly into individual tables without derived or duplicated fields.

---

## Final Result: Schema is in 3NF

The database schema avoids redundancy, supports integrity, and conforms fully to **Third Normal Form (3NF)**.

