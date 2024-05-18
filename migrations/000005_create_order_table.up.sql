CREATE TABLE Orders (
  order_id bigint PRIMARY KEY,
  created_at timestamp with time zone not null,
  updated_at timestamp with time zone not null,
  deleted_at timestamp with time zone,
  price int,
  discount int,
  payment_id bigint,
  product_user_id bigint
);