CREATE TABLE Address (
  address_id bigint(20) PRIMARY KEY,
  created_at datetime,
  updated_at datetime,
  deleted_at datetime,
  house varchar(50),
  street varchar(50),
  city varchar(50),
  pincode int
);