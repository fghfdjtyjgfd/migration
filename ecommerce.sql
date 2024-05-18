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

CREATE TABLE Product (
  product_id bigint PRIMARY KEY,
  created_at timestamp with time zone not null,
  updated_at timestamp with time zone not null,
  deleted_at timestamp with time zone,
  product_name varchar(50),
  price int,
  rating int,
  image varchar(255)
);

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

CREATE TABLE Address (
  address_id bigint PRIMARY KEY,
  created_at timestamp with time zone not null,
  updated_at timestamp with time zone not null,
  deleted_at timestamp with time zone,
  house varchar(50),
  street varchar(50),
  city varchar(50),
  pincode int
);

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

CREATE TABLE Payment (
  payment_id bigint PRIMARY KEY,
  created_at timestamp with time zone not null,
  updated_at timestamp with time zone not null,
  deleted_at timestamp with time zone,
  Digital varchar(50),
  COD varchar(50)
);

ALTER TABLE Orders ADD FOREIGN KEY (payment_id) REFERENCES Payment (payment_id);

ALTER TABLE Orders ADD FOREIGN KEY (product_user_id) REFERENCES Product_user (product_user_id);

ALTER TABLE Users ADD FOREIGN KEY (address_id) REFERENCES Address (address_id);

ALTER TABLE Users ADD FOREIGN KEY (order_id) REFERENCES Orders (order_id);

ALTER TABLE Users ADD FOREIGN KEY (product_user_id) REFERENCES Product_user (product_user_id);
