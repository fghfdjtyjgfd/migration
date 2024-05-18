CREATE TABLE Product_user (
  product_user_id bigint PRIMARY KEY,
  created_at timestamp with time zone not null,
  updated_at timestamp with time zone not null,
  deleted_at timestamp with time zone,
  product_name varchar(50),
  price int,
  rating int,
  image varchar(255)
);