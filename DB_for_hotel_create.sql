-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2024-05-16 10:33:35.462

-- tables
-- Table: customers
CREATE TABLE customers (
    customerid int  NOT NULL,
    firstname varchar(255)  NOT NULL,
    lastname varchar(255)  NOT NULL,
    address varchar(255)  NOT NULL,
    phone varchar(255)  NOT NULL,
    city varchar(255)  NOT NULL,
    country varchar(255)  NOT NULL,
    post_code varchar(255)  NOT NULL,
    region varchar(255)  NULL,
    birthdate date  NOT NULL,
    pesel int  NOT NULL,
    photopath varchar(255)  NULL,
    notes text  NULL,
    fax varchar(255)  NULL,
    CONSTRAINT customers_pk PRIMARY KEY  (customerid)
);

-- Table: orders
CREATE TABLE orders (
    orderid int  NOT NULL,
    orderdate date  NOT NULL,
    status bit  NOT NULL,
    tip decimal(10,2)  NOT NULL,
    discount decimal(10,2)  NOT NULL,
    reservationid int  NOT NULL,
    CONSTRAINT orders_pk PRIMARY KEY  (orderid)
);

-- Table: payment_methods
CREATE TABLE payment_methods (
    payment_methodid int  NOT NULL,
    name varchar(255)  NOT NULL,
    CONSTRAINT payment_methodid PRIMARY KEY  (payment_methodid)
);

-- Table: payments
CREATE TABLE payments (
    paymentid int  NOT NULL,
    advance bit  NOT NULL,
    reservationid int  NOT NULL,
    payment_methodid int  NOT NULL,
    payment_date date  NOT NULL,
    value decimal(10,2)  NOT NULL,
    CONSTRAINT payments_pk PRIMARY KEY  (paymentid)
);

-- Table: processed_orders
CREATE TABLE processed_orders (
    processed_orderid int  NOT NULL,
    orderid int  NOT NULL,
    productid int  NOT NULL,
    CONSTRAINT processed_orders_pk PRIMARY KEY  (processed_orderid)
);

-- Table: products
CREATE TABLE products (
    productid int  NOT NULL,
    unitprice decimal(10,2)  NOT NULL,
    unitsinstock int  NOT NULL,
    unitsinorder int  NOT NULL,
    productname varchar(255)  NOT NULL,
    CONSTRAINT products_pk PRIMARY KEY  (productid)
);

-- Table: reservated_rooms
CREATE TABLE reservated_rooms (
    reservated_roomid int  NOT NULL,
    roomid int  NOT NULL,
    reservationid int  NOT NULL,
    price decimal(10,2)  NOT NULL,
    CONSTRAINT reservated_rooms_pk PRIMARY KEY  (reservated_roomid)
);

-- Table: reservations
CREATE TABLE reservations (
    reservationid int  NOT NULL,
    customerid int  NOT NULL,
    start_date date  NOT NULL,
    end_date date  NOT NULL,
    note varchar(255)  NULL,
    additional decimal(10,2)  NOT NULL,
    CONSTRAINT reservations_pk PRIMARY KEY  (reservationid)
);

-- Table: room_type
CREATE TABLE room_type (
    room_typeid int  NOT NULL,
    beds int  NOT NULL,
    persons int  NOT NULL,
    description varchar(255)  NULL,
    price decimal(10,2)  NOT NULL,
    CONSTRAINT room_type_pk PRIMARY KEY  (room_typeid)
);

-- Table: rooms
CREATE TABLE rooms (
    roomid int  NOT NULL,
    room_typeid int  NOT NULL,
    number varchar(255)  NOT NULL,
    CONSTRAINT rooms_pk PRIMARY KEY  (roomid)
);

-- foreign keys
-- Reference: orders_reservations (table: orders)
ALTER TABLE orders ADD CONSTRAINT orders_reservations
    FOREIGN KEY (reservationid)
    REFERENCES reservations (reservationid);

-- Reference: payments_payment_methods (table: payments)
ALTER TABLE payments ADD CONSTRAINT payments_payment_methods
    FOREIGN KEY (payment_methodid)
    REFERENCES payment_methods (payment_methodid);

-- Reference: payments_reservations (table: payments)
ALTER TABLE payments ADD CONSTRAINT payments_reservations
    FOREIGN KEY (reservationid)
    REFERENCES reservations (reservationid);

-- Reference: processed_orders_orders (table: processed_orders)
ALTER TABLE processed_orders ADD CONSTRAINT processed_orders_orders
    FOREIGN KEY (orderid)
    REFERENCES orders (orderid);

-- Reference: processed_orders_products (table: processed_orders)
ALTER TABLE processed_orders ADD CONSTRAINT processed_orders_products
    FOREIGN KEY (productid)
    REFERENCES products (productid);

-- Reference: reservated_rooms_reservations (table: reservated_rooms)
ALTER TABLE reservated_rooms ADD CONSTRAINT reservated_rooms_reservations
    FOREIGN KEY (reservationid)
    REFERENCES reservations (reservationid);

-- Reference: reservated_rooms_rooms (table: reservated_rooms)
ALTER TABLE reservated_rooms ADD CONSTRAINT reservated_rooms_rooms
    FOREIGN KEY (roomid)
    REFERENCES rooms (roomid);

-- Reference: reservations_customers (table: reservations)
ALTER TABLE reservations ADD CONSTRAINT reservations_customers
    FOREIGN KEY (customerid)
    REFERENCES customers (customerid);

-- Reference: rooms_room_type (table: rooms)
ALTER TABLE rooms ADD CONSTRAINT rooms_room_type
    FOREIGN KEY (room_typeid)
    REFERENCES room_type (room_typeid);

-- End of file.

