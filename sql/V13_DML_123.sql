INSERT INTO app_users (username, email)
VALUES
('alice', 'alice@test.com'),
('bob', 'bob@test.com'),
('charlie', 'charlie@test.com');

INSERT INTO products (name, price)
VALUES
('Laptop', 1200.00),
('Mouse', 25.50),
('Keyboard', 75.00);


INSERT INTO orders (user_id, order_total, order_status)
VALUES
(1, 1225.50, 'PLACED'),
(2, 75.00, 'SHIPPED');

INSERT INTO order_items (order_id, product_id, quantity, item_price)
VALUES
(1, 1, 1, 1200.00),
(1, 2, 1, 25.50),
(2, 3, 1, 75.00);

