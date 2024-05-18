CREATE TABLE User (
  ID bigint(20) PRIMARY KEY,
  created_at datetime,
  updated_at datetime,
  deleted_at datetime,
  first_name varchar(50),
  last_name varchar(50),
  password varchar(50),
  email varchar(50),
  phone varchar(50) UNIQUE,
  token varchar(50),
  refresh_token varchar(50),
  product_user_id bigint(20),
  order_id bigint(20),
  address_id bigint(20)
);