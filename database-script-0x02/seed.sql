-- Sample Users
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES 
  (gen_random_uuid(), 'Alice', 'Johnson', 'alice@example.com', 'hashed_pwd_1', '1234567890', 'guest'),
  (gen_random_uuid(), 'Bob', 'Smith', 'bob@example.com', 'hashed_pwd_2', '2345678901', 'host'),
  (gen_random_uuid(), 'Charlie', 'Doe', 'charlie@example.com', 'hashed_pwd_3', NULL, 'admin');

-- Hardcode some UUIDs here just for illustration.
-- Replace with actual UUIDs from `users` if when running this manually.

-- Sample Properties
INSERT INTO properties (property_id, host_id, name, description, location, price_per_night)
VALUES 
  ('11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', 'Ocean View Bungalow', 'Cozy beach house with WiFi and AC', 'Cape Coast', 150.00),
  ('33333333-3333-3333-3333-333333333333', '22222222-2222-2222-2222-222222222222', 'Mountain Retreat', 'Peaceful cabin with mountain view', 'Aburi Hills', 200.00);

-- Sample Bookings
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES 
  ('44444444-4444-4444-4444-444444444444', '11111111-1111-1111-1111-111111111111', '55555555-5555-5555-5555-555555555555', '2025-07-10', '2025-07-15', 750.00, 'confirmed'),
  ('66666666-6666-6666-6666-666666666666', '33333333-3333-3333-3333-333333333333', '55555555-5555-5555-5555-555555555555', '2025-08-01', '2025-08-03', 400.00, 'pending');

-- Sample Payments
INSERT INTO payments (payment_id, booking_id, amount, payment_method)
VALUES 
  (gen_random_uuid(), '44444444-4444-4444-4444-444444444444', 750.00, 'paypal'),
  (gen_random_uuid(), '66666666-6666-6666-6666-666666666666', 400.00, 'credit_card');

-- Sample Reviews
INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
VALUES 
  (gen_random_uuid(), '11111111-1111-1111-1111-111111111111', '55555555-5555-5555-5555-555555555555', 5, 'Amazing view and quiet nights!'),
  (gen_random_uuid(), '33333333-3333-3333-3333-333333333333', '55555555-5555-5555-5555-555555555555', 4, 'Loved the atmosphere, will come again.');

-- Sample Messages
INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
VALUES 
  (gen_random_uuid(), '55555555-5555-5555-5555-555555555555', '22222222-2222-2222-2222-222222222222', 'Hi Bob, is the Ocean View available for the weekend?'),
  (gen_random_uuid(), '22222222-2222-2222-2222-222222222222', '55555555-5555-5555-5555-555555555555', 'Yes, it’s available! Book anytime.');
