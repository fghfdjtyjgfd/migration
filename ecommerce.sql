CREATE TABLE `User` (
  `ID` bigint(20) PRIMARY KEY,
  `created_at` datetime,
  `updated_at` datetime,
  `deleted_at` datetime,
  `first_name` varchar(50),
  `last_name` varchar(50),
  `password` varchar(50),
  `email` varchar(50),
  `phone` varchar(50) UNIQUE,
  `token` varchar(50),
  `refresh_token` varchar(50),
  `product_user_id` bigint(20),
  `order_id` bigint(20),
  `address_id` bigint(20)
);

CREATE TABLE `Product` (
  `product_id` bigint(20) PRIMARY KEY,
  `created_at` datetime,
  `updated_at` datetime,
  `deleted_at` datetime,
  `product_name` varchar(50),
  `price` int,
  `rating` int,
  `image` varchar(255)
);

CREATE TABLE `Product_user` (
  `product_user_id` bigint(20) PRIMARY KEY,
  `created_at` datetime,
  `updated_at` datetime,
  `deleted_at` datetime,
  `product_name` varchar(50),
  `price` int,
  `rating` int,
  `image` varchar(255)
);

CREATE TABLE `Address` (
  `address_id` bigint(20) PRIMARY KEY,
  `created_at` datetime,
  `updated_at` datetime,
  `deleted_at` datetime,
  `house` varchar(50),
  `street` varchar(50),
  `city` varchar(50),
  `pincode` int
);

CREATE TABLE `Order` (
  `order_id` bigint(20) PRIMARY KEY,
  `created_at` datetime,
  `updated_at` datetime,
  `deleted_at` datetime,
  `price` int,
  `discount` int,
  `payment_id` bigint(20),
  `product_user_id` bigint(20)
);

CREATE TABLE `Payment` (
  `payment_id` bigint(20) PRIMARY KEY,
  `created_at` datetime,
  `updated_at` datetime,
  `deleted_at` datetime,
  `Digital` varchar(50),
  `COD` varchar(50)
);

ALTER TABLE `Order` ADD FOREIGN KEY (`payment_id`) REFERENCES `Payment` (`payment_id`);

ALTER TABLE `Order` ADD FOREIGN KEY (`product_user_id`) REFERENCES `Product_user` (`product_user_id`);

ALTER TABLE `User` ADD FOREIGN KEY (`address_id`) REFERENCES `Address` (`address_id`);

ALTER TABLE `User` ADD FOREIGN KEY (`order_id`) REFERENCES `Order` (`order_id`);

ALTER TABLE `User` ADD FOREIGN KEY (`product_user_id`) REFERENCES `Product_user` (`product_user_id`);
