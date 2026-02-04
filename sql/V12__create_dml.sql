CREATE TABLE app_users (
    user_id     BIGSERIAL PRIMARY KEY,
    username    VARCHAR(50) UNIQUE NOT NULL,
    email       VARCHAR(100) UNIQUE NOT NULL,
    status      VARCHAR(20) DEFAULT 'ACTIVE',
    created_at  TIMESTAMP DEFAULT now()
);

CREATE TABLE products (
    product_id  BIGSERIAL PRIMARY KEY,
    name        VARCHAR(100) NOT NULL,
    price       NUMERIC(10,2) NOT NULL,
    active      BOOLEAN DEFAULT true,
    created_at  TIMESTAMP DEFAULT now()
);

CREATE TABLE orders (
    order_id    BIGSERIAL PRIMARY KEY,
    user_id     BIGINT REFERENCES app_users(user_id),
    order_total NUMERIC(12,2),
    order_status VARCHAR(20),
    created_at  TIMESTAMP DEFAULT now()
);

CREATE TABLE order_items (
    order_item_id BIGSERIAL PRIMARY KEY,
    order_id      BIGINT REFERENCES orders(order_id),
    product_id    BIGINT REFERENCES products(product_id),
    quantity      INT NOT NULL,
    item_price    NUMERIC(10,2) NOT NULL
);
