BEGIN;
--
-- Create model Customer
--
CREATE TABLE "app_customer" ("id" serial NOT NULL PRIMARY KEY, "name" varchar(50) NULL, "dob" date NULL, "mobile" varchar(20) NULL, "email" varchar(20) NULL, "address" varchar(20) NULL, "postal_code" integer NULL, "city" varchar(20) NULL, "customer_stars" integer NULL, "customer_points" integer NULL);
--
-- Create model Order
--
CREATE TABLE "app_order" ("id" serial NOT NULL PRIMARY KEY, "paymentStatus" varchar(20) NOT NULL, "paymentMethod" varchar(20) NOT NULL, "status" varchar(20) NOT NULL, "type" varchar(20) NOT NULL, "deliveryType" varchar(30) NOT NULL, "total_price" double precision NULL, "create_date" date NOT NULL, "received_by" varchar(250) NULL, "delivered_by" varchar(250) NULL, "user_input" varchar(250) NULL, "data" hstore NULL, "customer_id" integer NULL);
--
-- Create model OrderItem
--
CREATE TABLE "app_orderitem" ("id" serial NOT NULL PRIMARY KEY, "no_of_item" integer NOT NULL CHECK ("no_of_item" >= 0), "order_id" integer NOT NULL);
--
-- Create model Product
--
CREATE TABLE "app_product" ("id" serial NOT NULL PRIMARY KEY, "seq_no" smallint NOT NULL CHECK ("seq_no" >= 0), "name" varchar(50) NULL, "starToCustomer" boolean NOT NULL, "description" varchar(500) NULL, "status" varchar(20) NOT NULL, "modified_date" date NOT NULL, "unitPrice" double precision NOT NULL, "discountPercentage" double precision NULL, "tags" varchar(80) NULL, "image_path" varchar(500) NULL, "data" hstore NULL);
--
-- Create model ProductGroup
--
CREATE TABLE "app_productgroup" ("id" serial NOT NULL PRIMARY KEY, "name" varchar(20) NOT NULL, "image_path" varchar(500) NULL);
--
-- Create model ProductType
--
CREATE TABLE "app_producttype" ("id" serial NOT NULL PRIMARY KEY, "seq_no" smallint NOT NULL CHECK ("seq_no" >= 0), "name" varchar(20) NULL, "description" varchar(250) NULL, "status" varchar(20) NOT NULL, "modified_date" date NOT NULL, "discountPercentage" double precision NULL, "image_path" varchar(500) NULL, "productGroup_id" integer NOT NULL);
--
-- Add field productType to product
--
ALTER TABLE "app_product" ADD COLUMN "productType_id" integer NOT NULL;
--
-- Add field product to orderitem
--
ALTER TABLE "app_orderitem" ADD COLUMN "product_id" integer NOT NULL;
ALTER TABLE "app_order" ADD CONSTRAINT "app_order_customer_id_7c27c407_fk_app_customer_id" FOREIGN KEY ("customer_id") REFERENCES "app_customer" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "app_order_customer_id_7c27c407" ON "app_order" ("customer_id");
ALTER TABLE "app_orderitem" ADD CONSTRAINT "app_orderitem_order_id_41257a1b_fk_app_order_id" FOREIGN KEY ("order_id") REFERENCES "app_order" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "app_orderitem_order_id_41257a1b" ON "app_orderitem" ("order_id");
ALTER TABLE "app_producttype" ADD CONSTRAINT "app_producttype_productGroup_id_9ca0fea0_fk_app_productgroup_id" FOREIGN KEY ("productGroup_id") REFERENCES "app_productgroup" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "app_producttype_productGroup_id_9ca0fea0" ON "app_producttype" ("productGroup_id");
CREATE INDEX "app_product_productType_id_c44af118" ON "app_product" ("productType_id");
ALTER TABLE "app_product" ADD CONSTRAINT "app_product_productType_id_c44af118_fk_app_producttype_id" FOREIGN KEY ("productType_id") REFERENCES "app_producttype" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "app_orderitem_product_id_5f40ddb0" ON "app_orderitem" ("product_id");
ALTER TABLE "app_orderitem" ADD CONSTRAINT "app_orderitem_product_id_5f40ddb0_fk_app_product_id" FOREIGN KEY ("product_id") REFERENCES "app_product" ("id") DEFERRABLE INITIALLY DEFERRED;
COMMIT;
