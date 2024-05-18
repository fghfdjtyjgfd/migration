CREATE TABLE Payment (
  payment_id bigint(20) PRIMARY KEY,
  created_at datetime,
  updated_at datetime,
  deleted_at datetime,
  Digital varchar(50),
  COD varchar(50)
);