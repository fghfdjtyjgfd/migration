ALTER TABLE Orders ADD FOREIGN KEY (payment_id) REFERENCES Payment (payment_id);

ALTER TABLE Orders ADD FOREIGN KEY (product_user_id) REFERENCES Product_user (product_user_id);

ALTER TABLE Users ADD FOREIGN KEY (address_id) REFERENCES Address (address_id);

ALTER TABLE Users ADD FOREIGN KEY (order_id) REFERENCES Orders (order_id);

ALTER TABLE Users ADD FOREIGN KEY (product_user_id) REFERENCES Product_user (product_user_id);