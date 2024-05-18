ALTER TABLE Order ADD FOREIGN KEY (payment_id) REFERENCES Payment (payment_id);

ALTER TABLE Order ADD FOREIGN KEY (product_user_id) REFERENCES Product_user (product_user_id);

ALTER TABLE User ADD FOREIGN KEY (address_id) REFERENCES Address (address_id);

ALTER TABLE User ADD FOREIGN KEY (order_id) REFERENCES Order (order_id);

ALTER TABLE User ADD FOREIGN KEY (product_user_id) REFERENCES Product_user (product_user_id);