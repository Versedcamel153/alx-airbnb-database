-- Step 1: Rename original table
RENAME TABLE bookings TO bookings_original;

-- Step 2: Recreate the bookings table with partitioning
CREATE TABLE bookings (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status VARCHAR(10) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_booking_property FOREIGN KEY (property_id) REFERENCES properties(property_id) ON DELETE CASCADE,
    CONSTRAINT fk_booking_user FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    CONSTRAINT chk_booking_dates CHECK (end_date > start_date)
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2021 VALUES LESS THAN (2022),
    PARTITION p2022 VALUES LESS THAN (2023),
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION pmax VALUES LESS THAN MAXVALUE
);

-- Step 3: Re-insert data from old table
INSERT INTO bookings (
    booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at
)
SELECT 
    booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at
FROM bookings_original;

-- Step 4: Optional - drop the old table
-- DROP TABLE bookings_original;

-- Step 5: Test a partitioned query
EXPLAIN
SELECT * FROM bookings
WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';
