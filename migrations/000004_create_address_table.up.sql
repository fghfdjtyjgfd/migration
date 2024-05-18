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