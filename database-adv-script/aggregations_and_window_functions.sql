-- ================================
-- Aggregations and Window Functions
-- ================================

-- 1. Total number of bookings made by each user
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    COUNT(b.booking_id) AS total_bookings
FROM 
    users u
LEFT JOIN 
    bookings b ON u.user_id = b.user_id
GROUP BY 
    u.user_id, u.first_name, u.last_name;

-- 2. Rank properties by the total number of bookings using RANK()
SELECT 
    property_id,
    total_bookings,
    RANK() OVER (ORDER BY total_bookings DESC) AS rank
FROM (
    SELECT 
        p.property_id,
        COUNT(b.booking_id) AS total_bookings
    FROM 
        properties p
    LEFT JOIN 
        bookings b ON p.property_id = b.property_id
    GROUP BY 
        p.property_id
) AS booking_counts;
