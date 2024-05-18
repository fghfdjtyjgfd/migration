CREATE TABLE Users (
  ID bigint PRIMARY KEY,
  created_at timestamp with time zone not null,
  updated_at timestamp with time zone not null,
  deleted_at timestamp with time zone,
  first_name varchar(50),
  last_name varchar(50),
  password varchar(50),
  email varchar(50),
  phone varchar(50) UNIQUE,
  token varchar(50),
  refresh_token varchar(50),
  product_user_id bigint,
  order_id bigint,
  address_id bigint
);