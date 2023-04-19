create database clonexy;

use clonexy;

create database Fullfilment;

create database OrderHandling;

create database Marketing;

create database Catalog;

create database Billing;

create database CartManagement;

create database User;

create database Jobs;

CREATE TABLE `Billing`.`payment` (
  `payment_id` int NOT NULL,
  `transaction_id` varchar(45) NOT NULL,
  `payment_processor` varchar(45) NOT NULL,
  PRIMARY KEY (`payment_id`)
);

CREATE TABLE `CartManagement`.`cart` (
  `cart_id` int NOT NULL,
  `product_id_list` blob NOT NULL,
  `transaction_id` varchar(45) NOT NULL,
  `session_id` varchar(250) NOT NULL,
  PRIMARY KEY (`cart_id`)
);

CREATE TABLE `Catalog`.`category` (
  `category_id` int NOT NULL,
  `product_id` int NOT NULL,
  `category_url` varchar(250) DEFAULT NULL,
  `category_static_content` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
);

CREATE TABLE `Catalog`.`product` (
  `product_id` int NOT NULL,
  `online` tinyint(1) NOT NULL,
  `inventory` int NOT NULL,
  `back_order` tinyint(1) NOT NULL,
  `pre_order` tinyint(1) NOT NULL,
  `category_id` int NOT NULL,
  `product_image` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ;

CREATE TABLE `Fullfilment`.`shipment` (
  `shipment_id` int NOT NULL,
  `transaction_id` varchar(45) NOT NULL,
  `method` varchar(45) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `address` varchar(250) NOT NULL,
  `expected_delivery` datetime NOT NULL,
  PRIMARY KEY (`shipment_id`)
) ;

CREATE TABLE `Jobs`.`scheduler` (
  `session_id` varchar(250) NOT NULL,
  `transaction_id` varchar(45) NOT NULL,
  `cleanup_time` datetime NOT NULL,
  PRIMARY KEY (`transaction_id`)
) ;

CREATE TABLE `Marketing`.`campaign` (
  `campaign_id` int NOT NULL,
  `customer_group` varchar(45) NOT NULL,
  `coupon_id` int NOT NULL,
  `promotion_id` int NOT NULL,
  `valid_till_date` datetime NOT NULL,
  `online` tinyint NOT NULL,
  PRIMARY KEY (`campaign_id`)
) ;

CREATE TABLE `Marketing`.`coupon` (
  `coupon_id` int NOT NULL,
  `campaign_id` int NOT NULL,
  `coupon_available` varchar(100) DEFAULT NULL,
  `coupon_used` varchar(100) DEFAULT NULL,
  `transaction_id_list` blob,
  `online` tinyint NOT NULL,
  `promotion_id` varchar(45) NOT NULL,
  `valid_til_date` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`coupon_id`)
) ;

CREATE TABLE `Marketing`.`promotion` (
  `promotion_id` int NOT NULL,
  `online` tinyint NOT NULL,
  `valid_date` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `coupon_id` int NOT NULL,
  `product_id` int NOT NULL,
  `valid_till_date` datetime NOT NULL,
  `product_discount` int NOT NULL,
  `product_bundling_type` int DEFAULT NULL,
  `product_bundling` tinyint NOT NULL,
  `basket_discount_valid` tinyint NOT NULL,
  `basket_discount` int DEFAULT NULL,
  PRIMARY KEY (`promotion_id`)
) ;

CREATE TABLE `OrderHandling`.`errors` (
  `error_code` int NOT NULL,
  `error_reason` varchar(250) NOT NULL
) ;

CREATE TABLE `OrderHandling`.`order` (
  `order_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `shipment_id` int NOT NULL,
  `transaction_id` varchar(45) NOT NULL,
  `order_status` varchar(45) NOT NULL,
  `promotion_id` int DEFAULT NULL,
  `coupon_id` int DEFAULT NULL,
  `campaign_id` int DEFAULT NULL,
  `payment_status` varchar(45) NOT NULL,
  `error_code` int DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
) ;

CREATE TABLE `User`.`customer` (
  `customer_id` int NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `password` varchar(45) NOT NULL,
  `billing_address` varchar(250) NOT NULL,
  `shipping_address` varchar(250) DEFAULT NULL,
  `session_id` varchar(250) NOT NULL,
  `list_of_customer_groups` blob,
  PRIMARY KEY (`customer_id`)
) ;

CREATE TABLE `User`.`customer_group` (
  `customer_group_id` int NOT NULL,
  `customer_group_name` varchar(100) NOT NULL,
  `customer_group_config` varchar(100) NOT NULL,
  PRIMARY KEY (`customer_group_id`)
) ;

