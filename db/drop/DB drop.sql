-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2025-05-14 19:23:25.249

-- foreign keys
ALTER TABLE address
    DROP CONSTRAINT address_user;

ALTER TABLE label_product
    DROP CONSTRAINT label_product_label;

ALTER TABLE label_product
    DROP CONSTRAINT label_product_product;

ALTER TABLE order_product
    DROP CONSTRAINT order_association_1;

ALTER TABLE order_status
    DROP CONSTRAINT order_status_order;

ALTER TABLE payment_method
    DROP CONSTRAINT payment_method_user;

ALTER TABLE product_color
    DROP CONSTRAINT product_color_color;

ALTER TABLE product_color
    DROP CONSTRAINT product_color_product;

ALTER TABLE review
    DROP CONSTRAINT review_product;

ALTER TABLE variant_option
    DROP CONSTRAINT variant_option_variant;

ALTER TABLE variant
    DROP CONSTRAINT variant_product;

-- tables
DROP TABLE address;

DROP TABLE color;

DROP TABLE label;

DROP TABLE label_product;

DROP TABLE "order";

DROP TABLE order_product;

DROP TABLE order_status;

DROP TABLE payment_method;

DROP TABLE product;

DROP TABLE product_color;

DROP TABLE review;

DROP TABLE "user";

DROP TABLE variant;

DROP TABLE variant_option;

-- sequences
DROP SEQUENCE IF EXISTS address_seq;

DROP SEQUENCE IF EXISTS color_seq;

DROP SEQUENCE IF EXISTS label_seq;

DROP SEQUENCE IF EXISTS order_seq;

DROP SEQUENCE IF EXISTS review_seq;

DROP SEQUENCE IF EXISTS variant_option_seq;

DROP SEQUENCE IF EXISTS variant_seq;

-- End of file.

