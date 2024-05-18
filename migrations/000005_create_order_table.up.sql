CREATE TABLE Order (
  order_id bigint(20) PRIMARY KEY,
  created_at datetime,
  updated_at datetime,
  deleted_at datetime,
  price int,
  discount int,
  payment_id bigint(20),
  product_user_id bigint(20)
);