-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2025-02-10 18:17:58.927

-- foreign keys
ALTER TABLE address
    DROP CONSTRAINT address_user;

ALTER TABLE color
    DROP CONSTRAINT color_product;

ALTER TABLE label_product
    DROP CONSTRAINT label_product_label;

ALTER TABLE label_product
    DROP CONSTRAINT label_product_product;

ALTER TABLE order_product
    DROP CONSTRAINT order_association_1;

ALTER TABLE order_status
    DROP CONSTRAINT order_status_order;

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

DROP TABLE product;

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

