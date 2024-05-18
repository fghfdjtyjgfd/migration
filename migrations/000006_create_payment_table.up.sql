CREATE TABLE Payment (
  payment_id bigint PRIMARY KEY,
  created_at timestamp with time zone not null,
  updated_at timestamp with time zone not null,
  deleted_at timestamp with time zone,
  Digital varchar(50),
  COD varchar(50)
);