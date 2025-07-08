-- =========================================
-- Index Optimization for Query Performance
-- =========================================

-- Indexing high-usage columns for performance improvements

-- Users Table
-- Commonly used in WHERE, JOIN clauses by email and user_id
CREATE INDEX idx_users_user_id ON users(user_id);
CREATE INDEX idx_users_email ON users(email);

-- Properties Table
-- Used frequently in JOIN (host_id, property_id) and filter (location)
CREATE INDEX idx_properties_property_id ON properties(property_id);
CREATE INDEX idx_properties_host_id ON properties(host_id);
CREATE INDEX idx_properties_location ON properties(location);

-- Bookings Table
-- High usage on user_id, property_id, status
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_status ON bookings(status);

-- Payments Table
-- Often queried by booking_id
CREATE INDEX idx_payments_booking_id ON payments(booking_id);

-- Reviews Table
-- Common joins on property_id and user_id
CREATE INDEX idx_reviews_property_id ON reviews(property_id);
CREATE INDEX idx_reviews_user_id ON reviews(user_id);
