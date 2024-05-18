CREATE TABLE Product_user (
  product_user_id bigint(20) PRIMARY KEY,
  created_at datetime,
  updated_at datetime,
  deleted_at datetime,
  product_name varchar(50),
  price int,
  rating int,
  image varchar(255)
);