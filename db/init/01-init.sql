-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2025-02-10 18:17:58.927

-- tables
-- Table: address
CREATE TABLE address (
                         id_address serial  NOT NULL,
                         name varchar(45)  NOT NULL,
                         address varchar(100)  NOT NULL,
                         details varchar(45)  NOT NULL,
                         latitude decimal(9,6)  NOT NULL,
                         longitude decimal(9,6)  NOT NULL,
                         user_id varchar(36)  NOT NULL,
                         CONSTRAINT address_pk PRIMARY KEY (id_address)
);

-- Table: color
CREATE TABLE color (
                       id_color serial  NOT NULL,
                       hexa_code varchar(6)  NOT NULL,
                       img_url varchar(700)  NULL,
                       product_code varchar(200)  NOT NULL,
                       CONSTRAINT color_pk PRIMARY KEY (id_color)
);

-- Table: label
CREATE TABLE label (
                       id_label serial  NOT NULL,
                       name varchar(45)  NOT NULL,
                       description varchar(45)  NULL,
                       CONSTRAINT label_pk PRIMARY KEY (id_label)
);

-- Table: label_product
CREATE TABLE label_product (
                               label_id_label int  NOT NULL,
                               product_code varchar(200)  NOT NULL,
                               CONSTRAINT label_product_pk PRIMARY KEY (label_id_label,product_code)
);

-- Table: order
CREATE TABLE "order" (
                         id_order serial  NOT NULL,
                         id_user varchar(36)  NOT NULL,
                         creation_date timestamp  NOT NULL,
                         total real  NOT NULL,
                         address varchar(100)  NOT NULL,
                         shipping_cost int  NULL,
                         transport_company varchar(45)  NULL,
                         shipping_guide varchar(100)  NULL,
                         id_domiciliary varchar(36)  NULL,
                         CONSTRAINT order_pk PRIMARY KEY (id_order)
);

-- Table: order_product
CREATE TABLE order_product (
                               id_order int  NOT NULL,
                               product_code varchar(200)  NOT NULL,
                               price real  NOT NULL,
                               quantity int  NOT NULL,
                               CONSTRAINT order_product_pk PRIMARY KEY (id_order,product_code)
);

-- Table: order_status
CREATE TABLE order_status (
                              id_order int  NOT NULL,
                              status varchar(45)  NOT NULL,
                              start_date timestamp  NOT NULL,
                              end_date timestamp  NOT NULL,
                              notes varchar(200)  NULL,
                              CONSTRAINT order_status_pk PRIMARY KEY (status,id_order)
);

-- Table: product
CREATE TABLE product (
                         code varchar(200)  NOT NULL,
                         name varchar(45)  NOT NULL,
                         description varchar(250)  NULL,
                         price real  NOT NULL,
                         deleted boolean  NOT NULL,
                         img_url varchar(700)  NULL,
                         CONSTRAINT product_pk PRIMARY KEY (code)
);

-- Table: review
CREATE TABLE review (
                        id_review serial  NOT NULL,
                        calification real  NOT NULL,
                        commentary varchar(250)  NULL,
                        product_code varchar(200)  NOT NULL,
                        id_user varchar(36)  NOT NULL,
                        CONSTRAINT review_pk PRIMARY KEY (id_review)
);

-- Table: user
CREATE TABLE "user" (
                        id varchar(36)  NOT NULL,
                        email varchar(45)  NOT NULL,
                        fullname varchar(100)  NOT NULL,
                        username varchar(20)  NOT NULL,
                        rol varchar(45)  NOT NULL,
                        deleted boolean  NOT NULL,
                        CONSTRAINT user_pk PRIMARY KEY (id)
);

-- Table: variant
CREATE TABLE variant (
                         id_variant serial  NOT NULL,
                         name varchar(45)  NOT NULL,
                         product_code varchar(200)  NOT NULL,
                         CONSTRAINT variant_pk PRIMARY KEY (id_variant)
);

-- Table: variant_option
CREATE TABLE variant_option (
                                id_variant_option serial  NOT NULL,
                                name varchar(45)  NOT NULL,
                                img_url varchar(700)  NULL,
                                variant_id_variant int  NOT NULL,
                                CONSTRAINT variant_option_pk PRIMARY KEY (id_variant_option)
);

-- foreign keys
-- Reference: address_user (table: address)
ALTER TABLE address ADD CONSTRAINT address_user
    FOREIGN KEY (user_id)
        REFERENCES "user" (id)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: color_product (table: color)
ALTER TABLE color ADD CONSTRAINT color_product
    FOREIGN KEY (product_code)
        REFERENCES product (code)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: label_product_label (table: label_product)
ALTER TABLE label_product ADD CONSTRAINT label_product_label
    FOREIGN KEY (label_id_label)
        REFERENCES label (id_label)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: label_product_product (table: label_product)
ALTER TABLE label_product ADD CONSTRAINT label_product_product
    FOREIGN KEY (product_code)
        REFERENCES product (code)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: order_association_1 (table: order_product)
ALTER TABLE order_product ADD CONSTRAINT order_association_1
    FOREIGN KEY (id_order)
        REFERENCES "order" (id_order)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: order_status_order (table: order_status)
ALTER TABLE order_status ADD CONSTRAINT order_status_order
    FOREIGN KEY (id_order)
        REFERENCES "order" (id_order)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: review_product (table: review)
ALTER TABLE review ADD CONSTRAINT review_product
    FOREIGN KEY (product_code)
        REFERENCES product (code)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: variant_option_variant (table: variant_option)
ALTER TABLE variant_option ADD CONSTRAINT variant_option_variant
    FOREIGN KEY (variant_id_variant)
        REFERENCES variant (id_variant)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: variant_product (table: variant)
ALTER TABLE variant ADD CONSTRAINT variant_product
    FOREIGN KEY (product_code)
        REFERENCES product (code)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Crear la tabla intermedia product_color
CREATE TABLE product_color (
    product_code varchar(200) NOT NULL,
    id_color int NOT NULL,
    CONSTRAINT product_color_pk PRIMARY KEY (product_code, id_color),
    CONSTRAINT product_color_product_fk FOREIGN KEY (product_code)
        REFERENCES product (code)
        ON DELETE CASCADE,
    CONSTRAINT product_color_color_fk FOREIGN KEY (id_color)
        REFERENCES color (id_color)
        ON DELETE CASCADE
);

-- Crear tabla payment_method
CREATE TABLE payment_method(
  id_payment_method serial NOT NULL,
  card_number varchar(16) NOT NULL,
  ccv varchar(3) NOT NULL,
  email varchar(50) NOT NULL,
  phone varchar(15) NOT NULL,
  expiry_date varchar(6) NOT NULL,
  card_holder_name varchar (100) NOT NULL,
  user_id varchar(36)  NOT NULL,
  city varchar(30) NOT NULL,
  first_line varchar(100) NOT NULL,
  second_line varchar(100) NOT NULL,
  country varchar(25) NOT NULL,
  postal_code varchar(10) NOT NULL,
  state_name varchar(25) NOT NULL,

  CONSTRAINT payment_method_pk PRIMARY KEY(id_payment_method)
);



ALTER TABLE payment_method ADD CONSTRAINT payment_user
    FOREIGN KEY (user_id)
        REFERENCES "user" (id)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Eliminar la restricción de clave foránea actual de la tabla color
ALTER TABLE color DROP CONSTRAINT color_product;

-- Eliminar la columna product_code en la tabla color, ya que ahora está en la tabla intermedia
ALTER TABLE color DROP COLUMN product_code;

ALTER TABLE color ADD COLUMN name VARCHAR(45);

alter table "order"
    add debt real;

alter table "order"
    add lat DECIMAL(9, 6);

alter table "order"
    add lng DECIMAL(9, 6);

-- sequences
-- Sequence: address_seq
CREATE SEQUENCE address_seq
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    START WITH 1
    NO CYCLE
;

-- Sequence: color_seq
CREATE SEQUENCE color_seq
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    START WITH 1
    NO CYCLE
;

-- Sequence: label_seq
CREATE SEQUENCE label_seq
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    START WITH 1
    NO CYCLE
;

-- Sequence: order_seq
CREATE SEQUENCE order_seq
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    START WITH 1
    NO CYCLE
;

-- Sequence: review_seq
CREATE SEQUENCE review_seq
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    START WITH 1
    NO CYCLE
;

-- Sequence: variant_option_seq
CREATE SEQUENCE variant_option_seq
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    START WITH 1
    NO CYCLE
;

-- Sequence: variant_seq
CREATE SEQUENCE variant_seq
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    START WITH 1
    NO CYCLE
;

-- End of file.

