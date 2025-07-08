-- =========================================
-- Index Optimization for Query Performance
-- =========================================

-- BEFORE INDEXING: Measure baseline performance
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    u.first_name,
    p.name AS property_name
FROM 
    bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
WHERE b.status = 'confirmed';

-- ===============================
-- Create Indexes for Optimization
-- ===============================

-- Users Table
CREATE INDEX idx_users_user_id ON users(user_id);
CREATE INDEX idx_users_email ON users(email);

-- Properties Table
CREATE INDEX idx_properties_property_id ON properties(property_id);
CREATE INDEX idx_properties_host_id ON properties(host_id);
CREATE INDEX idx_properties_location ON properties(location);

-- Bookings Table
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_status ON bookings(status);

-- Payments Table
CREATE INDEX idx_payments_booking_id ON payments(booking_id);

-- Reviews Table
CREATE INDEX idx_reviews_property_id ON reviews(property_id);
CREATE INDEX idx_reviews_user_id ON reviews(user_id);

-- AFTER INDEXING: Re-run the same query to measure improvement
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    u.first_name,
    p.name AS property_name
FROM 
    bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
WHERE b.status = 'confirmed';
