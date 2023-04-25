
CREATE SEQUENCE s_customer_id
   MINVALUE 1 
   MAXVALUE 9999999 
   INCREMENT BY 1 
   START WITH 216
   NOCACHE 
   NOORDER 
   NOCYCLE;
CREATE SEQUENCE s_dept_id
   MINVALUE 1 
   MAXVALUE 9999999 
   INCREMENT BY 1 
   START WITH 51
   NOCACHE 
   NOORDER 
   NOCYCLE;
CREATE SEQUENCE s_emp_id
   MINVALUE 1 
   MAXVALUE 9999999 
   INCREMENT BY 1 
   START WITH 26
   NOCACHE 
   NOORDER 
   NOCYCLE;
CREATE SEQUENCE s_ord_id
   MINVALUE 1 
   MAXVALUE 9999999 
   INCREMENT BY 1 
   START WITH 113
   NOCACHE 
   NOORDER 
   NOCYCLE;
CREATE SEQUENCE s_product_id
   MINVALUE 1 
   MAXVALUE 9999999 
   INCREMENT BY 1 
   START WITH 50537
   NOCACHE 
   NOORDER 
   NOCYCLE;
CREATE SEQUENCE s_region_id
   MINVALUE 1 
   MAXVALUE 9999999 
   INCREMENT BY 1 
   START WITH 6
   NOCACHE 
   NOORDER 
   NOCYCLE;
CREATE SEQUENCE s_warehouse_id
   MINVALUE 1 
   MAXVALUE 9999999 
   INCREMENT BY 1 
   START WITH 10502
   NOCACHE 
   NOORDER 
   NOCYCLE;

Rem Create and populate tables.

CREATE TABLE s_customer 
(id                         NUMBER(5) 
   CONSTRAINT s_customer_id_nn NOT NULL,
 name                       VARCHAR2(30) 
   CONSTRAINT s_customer_name_nn NOT NULL,
 phone                      VARCHAR2(15),
 address                    VARCHAR2(200),
 city                       VARCHAR2(20),
 state                      VARCHAR2(20),
 country                    VARCHAR2(25),
 zip_code                   VARCHAR2(10),
 credit_rating              VARCHAR2(9),
 sales_rep_id               NUMBER(7),
 region_id                  NUMBER(7),
 comments                   VARCHAR2(255),
     CONSTRAINT s_customer_id_pk PRIMARY KEY (id),
     CONSTRAINT s_customer_credit_rating_ck
        CHECK (credit_rating IN ('EXCELLENT', 'GOOD', 'POOR')));

INSERT INTO s_customer VALUES (
   201, 'Unisports', '55-2066101',
   '72 Via Bahia', 'Sao Paolo', NULL, 'Brazil', NULL,
   'EXCELLENT', 12, 2, 'Customer usually orders large amounts and has ' ||
   'a high order total.  This is okay as long as the credit rating remains ' ||
   'excellent.');
INSERT INTO s_customer VALUES (
   202, 'Simms Atheletics', '81-20101',
   '6741 Takashi Blvd.', 'Osaka', NULL, 'Japan', NULL,
   'POOR', 14, 4, 'Customer should always pay by cash until his credit ' ||
   'rating improves.');
INSERT INTO s_customer VALUES (
   203, 'Delhi Sports', '91-10351',
   '11368 Chanakya', 'New Delhi', NULL, 'India', NULL,
   'GOOD', 14, 4, 'Customer specializes in baseball equipment and is the ' ||
   'largest retailer in India.');
INSERT INTO s_customer VALUES (
   204, 'Womansport', '1-206-104-0103',
   '281 King Street', 'Seattle', 'Washington', 'USA', '98101',
   'EXCELLENT', 11, 1, 'Customer specializes in Soccer');
INSERT INTO s_customer VALUES (
   205, 'Kam''s Sporting Goods', '852-3692888',
   '15 Henessey Road', 'Hong Kong', NULL, NULL, NULL,
   'EXCELLENT', 15, 4, NULL);
INSERT INTO s_customer VALUES (
   206, 'Sportique', '33-2257201',
   '172 Rue de Rivoli', 'Cannes', NULL, 'France', NULL,
   'EXCELLENT', 15, 5, 'Customer specializes in Soccer.  Likes to order ' ||
   'accessories in bright colors.');
INSERT INTO s_customer VALUES (
   207, 'Sweet Rock Sports', '234-6036201',
   '6 Saint Antoine', 'Lagos', NULL, 'Nigeria', NULL,
   'GOOD', NULL, 3, NULL);
INSERT INTO s_customer VALUES (
   208, 'Muench Sports', '49-527454',
   '435 Gruenestrasse', 'Stuttgart', NULL, 'Germany', NULL,
   'GOOD', 15, 5, 'Customer usually pays small orders by cash and ' ||
   'large orders on credit.');
INSERT INTO s_customer VALUES (
   209, 'Beisbol Si!', '809-352689',
   '792 Playa Del Mar', 'San Pedro de Macon''s', NULL, 'Dominican Republic', 
   NULL, 'EXCELLENT', 11, 1, NULL);
INSERT INTO s_customer VALUES (
   210, 'Futbol Sonora', '52-404562',
   '3 Via Saguaro', 'Nogales', NULL, 'Mexico', NULL,
   'EXCELLENT', 12, 2, 'Customer is difficult to reach by phone.  Try mail.');
INSERT INTO s_customer VALUES (
   211, 'Kuhn''s Sports', '42-111292',
   '7 Modrany', 'Prague', NULL, 'Czechoslovakia', NULL,
   'EXCELLENT', 15, 5, NULL);
INSERT INTO s_customer VALUES (
   212, 'Hamada Sport', '20-1209211',
   '57A Corniche', 'Alexandria', NULL, 'Egypt', NULL,
   'EXCELLENT', 13, 3, 'Customer orders sea and water equipment.');
INSERT INTO s_customer VALUES (
   213, 'Big John''s Sports Emporium', '1-415-555-6281',
   '4783 18th Street', 'San Francisco', 'CA', 'USA', '94117',
   'EXCELLENT', 11, 1, 'Customer has a dependable credit record.');
INSERT INTO s_customer VALUES (
   214, 'Ojibway Retail', '1-716-555-7171',
   '415 Main Street', 'Buffalo', 'NY', 'USA', '14202',
   'POOR', 11, 1, NULL);
INSERT INTO s_customer VALUES (
   215, 'Sporta Russia', '7-3892456',
   '6000 Yekatamina', 'Saint Petersburg', NULL, 'Russia', NULL,
   'POOR', 15, 5, 'This customer is very friendly, but has difficulty ' ||
   'paying bills.  Insist upon cash.');
COMMIT;


CREATE TABLE s_dept 
(id                         NUMBER(7) 
   CONSTRAINT s_dept_id_nn NOT NULL,
 name                       VARCHAR2(15) 
   CONSTRAINT s_dept_name_nn NOT NULL,
 region_id                  NUMBER(7),
     CONSTRAINT s_dept_id_pk PRIMARY KEY (region_id, id),
     CONSTRAINT s_dept_name_region_id_uk UNIQUE (name, region_id));

INSERT INTO s_dept VALUES (
   10, 'Finance', 1);
INSERT INTO s_dept VALUES (
   30, 'Sales', 1);
INSERT INTO s_dept VALUES (
   30, 'Sales', 2);
INSERT INTO s_dept VALUES (
   30, 'Sales', 3);
INSERT INTO s_dept VALUES (
   30, 'Sales', 4);
INSERT INTO s_dept VALUES (
   30, 'Sales', 5);
INSERT INTO s_dept VALUES (
   40, 'Operations', 1);
INSERT INTO s_dept VALUES (
   40, 'Operations', 2);
INSERT INTO s_dept VALUES (
   40, 'Operations', 3);
INSERT INTO s_dept VALUES (
   40, 'Operations', 4);
INSERT INTO s_dept VALUES (
   40, 'Operations', 5);
INSERT INTO s_dept VALUES (
   50, 'Administration', 1);
COMMIT;


CREATE TABLE s_emp 
(id                         NUMBER(7) 
   CONSTRAINT s_emp_id_nn NOT NULL,
 last_name                  VARCHAR2(15) 
   CONSTRAINT s_emp_last_name_nn NOT NULL,
 first_name                 VARCHAR2(15),
 userid                     VARCHAR2(8),
 start_date                 DATE,
 comments                   VARCHAR2(255),
 manager_id                 NUMBER(7),
 title                      VARCHAR2(25),
 region_id		              NUMBER(7),
 dept_id                    NUMBER(7), 
 salary                     NUMBER(11, 2),
 commission_pct             NUMBER(4, 2),
     CONSTRAINT s_emp_id_pk PRIMARY KEY (id),
     CONSTRAINT s_emp_userid_uk UNIQUE (userid),
     CONSTRAINT s_emp_commission_pct_ck
        CHECK (commission_pct IN (10, 12.5, 15, 17.5, 20)),
	CONSTRAINT s_dep_region_fk  FOREIGN KEY(region_id, dept_id) references s_dept(region_id, id),
	CONSTRAINT s_manager_fk  foreign key(manager_id) references s_emp(id));

INSERT INTO s_emp VALUES (
  1, 'Velasquez', 'Carmen', 'cvelasqu',
   to_date('03/03/2008 8:30', 'dd/mm/yyyy hh24:mi'), NULL, NULL, 'President',
   1, 50, 2500, NULL);
INSERT INTO s_emp VALUES (
   2, 'Ngao', 'LaDoris', 'lngao',
   to_date('08/03/2009','dd/mm/yyyy'), NULL, 1, 'VP, Operations',
   1, 40, 1450, NULL);
INSERT INTO s_emp VALUES (
   3, 'Nagayama', 'Midori', 'mnagayam',
   to_date('17/06/2011','/dd/mm/yyyy'), NULL, 1, 'VP, Sales',
   1, 30, 1400, NULL);
INSERT INTO s_emp VALUES (
   4, 'Quick-To-See', 'Mark', 'mquickto', 
   to_date('07/04/2009','dd/mm/yyyy'), NULL, 1, 'VP, Finance', 
   1, 10, 1450, NULL);
INSERT INTO s_emp VALUES (
   5, 'Ropeburn', 'Audry', 'aropebur',
   to_date('04/03/2009','dd/mm/yyyy'), NULL, 1, 'VP, Administration',
   1, 50, 1550, NULL);
INSERT INTO s_emp VALUES (
   6, 'Urguhart', 'Molly', 'murguhar',
   to_date('18/01/2010','dd/mm/yyyy'), NULL, 2, 'Warehouse Manager',
   1, 40, 1200, NULL);
INSERT INTO s_emp VALUES (
   7, 'Menchu', 'Roberta', 'rmenchu',
   to_date('14/05/2009','dd/mm/yyyy'), NULL, 2, 'Warehouse Manager',
   2, 40, 1250, NULL);
INSERT INTO s_emp VALUES (
   8, 'Biri', 'Ben', 'bbiri',
   to_date('07/04/2009','dd/mm/yyyy'), NULL, 2, 'Warehouse Manager',
   3, 40, 1100, NULL);
INSERT INTO s_emp VALUES (
   9, 'Catchpole', 'Antoinette', 'acatchpo',
   to_date('09/02/2001','dd/mm/yyyy'), NULL, 2, 'Warehouse Manager',
   4, 40, 1300, NULL);
INSERT INTO s_emp VALUES (
   10, 'Havel', 'Marta', 'mhavel',
   to_date('27/02/2010','dd/mm/yyyy'), NULL, 2, 'Warehouse Manager',
   5, 40, 1307, NULL);
INSERT INTO s_emp VALUES (
   11, 'Magee', 'Colin', 'cmagee',
   to_date('14/05/2009','dd/mm/yyyy'), NULL, 3, 'Sales Representative',
   1, 30, 1400, 10);
INSERT INTO s_emp VALUES (
   12, 'Giljum', 'Henry', 'hgiljum',
   to_date('18/01/2001','dd/mm/yyyy'),NULL, 3, 'Sales Representative',
   2, 30, 1490, 12.5);
INSERT INTO s_emp VALUES (
   13, 'Sedeghi', 'Yasmin', 'ysedeghi',
   to_date('18/02/2010','dd/mm/yyyy'), NULL, 3, 'Sales Representative',
   3, 30, 1515, 10);
INSERT INTO s_emp VALUES (
   14, 'Nguyen', 'Mai', 'mnguyen',
   to_date('22/01/2001','dd/mm/yyyy'), NULL, 3, 'Sales Representative',
   4, 30, 1525, 15);
INSERT INTO s_emp VALUES (
   15, 'Dumas', 'Andre', 'adumas',
   to_date('09/10/2010','dd/mm/yyyy'), NULL, 3, 'Sales Representative',
   5, 30, 1450, 17.5);
INSERT INTO s_emp VALUES (
   16, 'Mandell', 'Elena', 'emandell',
   to_date('07/02/2001','dd/mm/yyyy'), NULL, 6, 'Stock Clerk',
   1, 40, 1400, NULL);
INSERT INTO s_emp VALUES (
   17, 'Smith', 'George', 'gsmith',
   to_date('08/03/2009','dd/mm/yyyy'), NULL, 6, 'Stock Clerk',
   1, 40, 940, NULL);
INSERT INTO s_emp VALUES (
   18, 'Nozaki', 'Akira', 'anozaki',
   to_date('09/02/2010','dd/mm/yyyy'), NULL, 7, 'Stock Clerk',
   2, 40, 1200, NULL);
INSERT INTO s_emp VALUES (
   19, 'Patel', 'Vikram', 'vpatel',
   to_date('06/08/2010','dd/mm/yyyy'), NULL, 7, 'Stock Clerk',
   2, 40, 795, NULL);
INSERT INTO s_emp VALUES (
   20, 'Newman', 'Chad', 'cnewman',
   to_date('21/07/2010','dd/mm/yyyy'), NULL, 8, 'Stock Clerk',
   3, 40, 750, NULL);
INSERT INTO s_emp VALUES (
   21, 'Markarian', 'Alexander', 'amarkari',
   to_date('26/05/2010','dd/mm/yyyy'), NULL, 8, 'Stock Clerk',
   3, 40, 850, NULL);
INSERT INTO s_emp VALUES (
   22, 'Chang', 'Eddie', 'echang',
   to_date('30/11/2009','dd/mm/yyyy'), NULL, 9, 'Stock Clerk',
   4, 40, 800, NULL);
INSERT INTO s_emp VALUES (
   23, 'Patel', 'Radha', 'rpatel',
   to_date('17/10/2009','dd/mm/yyyy'), NULL, 9, 'Stock Clerk',
   4, 30, 795, NULL);
INSERT INTO s_emp VALUES (
   24, 'Dancs', 'Bela', 'bdancs',
   to_date('17/03/2010','dd/mm/yyyy'), NULL, 10, 'Stock Clerk',
   5, 40, 860, NULL);
INSERT INTO s_emp VALUES (
   25, 'Schwartz', 'Sylvie', 'sschwart',
   to_date('09/05/2010','dd/mm/yyyy'), NULL, 10, 'Stock Clerk',
   5, 40, 1100, NULL);
COMMIT;


CREATE TABLE s_inventory 
(product_id                 NUMBER(7) 
   CONSTRAINT s_inventory_product_id_nn NOT NULL,
 warehouse_id               NUMBER(7) 
   CONSTRAINT s_inventory_warehouse_id_nn NOT NULL,
 amount_in_stock            NUMBER(9),
 reorder_point              NUMBER(9),
 max_in_stock               NUMBER(9),
 out_of_stock_explanation   VARCHAR2(255),
 restock_date               DATE,
     CONSTRAINT s_inventory_prodid_warid_pk
        PRIMARY KEY (product_id, warehouse_id));

INSERT INTO s_inventory VALUES (
   10011, 101, 650, 625, 1100, NULL, NULL);
INSERT INTO s_inventory VALUES (
   10012, 101, 600, 560, 1000, NULL, NULL);
INSERT INTO s_inventory VALUES (
   10013, 101, 400, 400, 700, NULL, NULL);
INSERT INTO s_inventory VALUES (
   10021, 101, 500, 425, 740, NULL, NULL);
INSERT INTO s_inventory VALUES (
   10022, 101, 300, 200, 350, NULL, NULL);
INSERT INTO s_inventory VALUES (
   10023, 101, 400, 300, 525, NULL, NULL);
INSERT INTO s_inventory VALUES (
   20106, 101, 993, 625, 1000, NULL, NULL);
INSERT INTO s_inventory VALUES (
   20108, 101, 700, 700, 1225, NULL, NULL);
INSERT INTO s_inventory VALUES (
   20201, 101, 802, 800, 1400, NULL, NULL);
INSERT INTO s_inventory VALUES (
   20510, 101, 1389, 850, 1400, NULL, NULL);
INSERT INTO s_inventory VALUES (
   20512, 101, 850, 850, 1450, NULL, NULL);
INSERT INTO s_inventory VALUES (
   30321, 101, 2000, 1500, 2500, NULL, NULL);
INSERT INTO s_inventory VALUES (
   30326, 101, 2100, 2000, 3500, NULL, NULL);
INSERT INTO s_inventory VALUES (
   30421, 101, 1822, 1800, 3150, NULL, NULL);
INSERT INTO s_inventory VALUES (
   30426, 101, 2250, 2000, 3500, NULL, NULL);
INSERT INTO s_inventory VALUES (
   30433, 101, 650, 600, 1050, NULL, NULL);
INSERT INTO s_inventory VALUES (
   32779, 101, 2120, 1250, 2200, NULL, NULL);
INSERT INTO s_inventory VALUES (
   32861, 101, 505, 500, 875, NULL, NULL);
INSERT INTO s_inventory VALUES (
   40421, 101, 578, 350, 600, NULL, NULL);
INSERT INTO s_inventory VALUES (
   40422, 101, 0, 350, 600, 'Phenomenal sales...', to_date('08/02/2011','dd/mm/yyyy'));
INSERT INTO s_inventory VALUES (
   41010, 101, 250, 250, 437, NULL, NULL);
INSERT INTO s_inventory VALUES (
   41020, 101, 471, 450, 750, NULL, NULL);
INSERT INTO s_inventory VALUES (
   41050, 101, 501, 450, 750, NULL, NULL);
INSERT INTO s_inventory VALUES (
   41080, 101, 400, 400, 700, NULL, NULL);
INSERT INTO s_inventory VALUES (
   41100, 101, 350, 350, 600, NULL, NULL);
INSERT INTO s_inventory VALUES (
   50169, 101, 2530, 1500, 2600, NULL, NULL);
INSERT INTO s_inventory VALUES (
   50273, 101, 233, 200, 350, NULL, NULL);
INSERT INTO s_inventory VALUES (
   50417, 101, 518, 500, 875, NULL, NULL);
INSERT INTO s_inventory VALUES (
   50418, 101, 244, 100, 275, NULL, NULL);
INSERT INTO s_inventory VALUES (
   50419, 101, 230, 120, 310, NULL, NULL);
INSERT INTO s_inventory VALUES (
   50530, 101, 669, 400, 700, NULL, NULL);
INSERT INTO s_inventory VALUES (
   50532, 101, 0, 100, 175, 'Wait for Spring.', to_date('12/04/2011','dd/mm/yyyy'));
INSERT INTO s_inventory VALUES (
   50536, 101, 173, 100, 175, NULL, NULL);
INSERT INTO s_inventory VALUES (
   20106, 201, 220, 150, 260, NULL, NULL);
INSERT INTO s_inventory VALUES (
   20108, 201, 166, 150, 260, NULL, NULL);
INSERT INTO s_inventory VALUES (
   20201, 201, 320, 200, 350, NULL, NULL);
INSERT INTO s_inventory VALUES (
   20510, 201, 175, 100, 175, NULL, NULL);
INSERT INTO s_inventory VALUES (
   20512, 201, 162, 100, 175, NULL, NULL);
INSERT INTO s_inventory VALUES (
   30321, 201, 96, 80, 140, NULL, NULL);
INSERT INTO s_inventory VALUES (
   30326, 201, 147, 120, 210, NULL, NULL);
INSERT INTO s_inventory VALUES (
   30421, 201, 102, 80, 140, NULL, NULL);
INSERT INTO s_inventory VALUES (
   30426, 201, 200, 120, 210, NULL, NULL);
INSERT INTO s_inventory VALUES (
   30433, 201, 130, 130, 230, NULL, NULL);
INSERT INTO s_inventory VALUES (
   32779, 201, 180, 150, 260, NULL, NULL);
INSERT INTO s_inventory VALUES (
   32861, 201, 132, 80, 140, NULL, NULL);
INSERT INTO s_inventory VALUES (
   50169, 201, 225, 220, 385, NULL, NULL);
INSERT INTO s_inventory VALUES (
   50273, 201, 75, 60, 100, NULL, NULL);
INSERT INTO s_inventory VALUES (
   50417, 201, 82, 60, 100, NULL, NULL);
INSERT INTO s_inventory VALUES (
   50418, 201, 98, 60, 100, NULL, NULL);
INSERT INTO s_inventory VALUES (
   50419, 201, 77, 60, 100, NULL, NULL);
INSERT INTO s_inventory VALUES (
   50530, 201, 62, 60, 100, NULL, NULL);
INSERT INTO s_inventory VALUES (
   50532, 201, 67, 60, 100, NULL, NULL);
INSERT INTO s_inventory VALUES (
   50536, 201, 97, 60, 100, NULL, NULL);
INSERT INTO s_inventory VALUES (
   20510, 301, 69, 40, 100, NULL, NULL);
INSERT INTO s_inventory VALUES (
   20512, 301, 28, 20, 50, NULL, NULL);
INSERT INTO s_inventory VALUES (
   30321, 301, 85, 80, 140, NULL, NULL);
INSERT INTO s_inventory VALUES (
   30421, 301, 102, 80, 140, NULL, NULL);
INSERT INTO s_inventory VALUES (
   30433, 301, 35, 20, 35, NULL, NULL);
INSERT INTO s_inventory VALUES (
   32779, 301, 102, 95, 175, NULL, NULL);
INSERT INTO s_inventory VALUES (
   32861, 301, 57, 50, 100, NULL, NULL);
INSERT INTO s_inventory VALUES (
   40421, 301, 70, 40, 70, NULL, NULL);
INSERT INTO s_inventory VALUES (
   40422, 301, 65, 40, 70, NULL, NULL);
INSERT INTO s_inventory VALUES (
   41010, 301, 59, 40, 70, NULL, NULL);
INSERT INTO s_inventory VALUES (
   41020, 301, 61, 40, 70, NULL, NULL);
INSERT INTO s_inventory VALUES (
   41050, 301, 49, 40, 70, NULL, NULL);
INSERT INTO s_inventory VALUES (
   41080, 301, 50, 40, 70, NULL, NULL);
INSERT INTO s_inventory VALUES (
   41100, 301, 42, 40, 70, NULL, NULL);
INSERT INTO s_inventory VALUES (
   20510, 401, 88, 50, 100, NULL, NULL);
INSERT INTO s_inventory VALUES (
   20512, 401, 75, 75, 140, NULL, NULL);
INSERT INTO s_inventory VALUES (
   30321, 401, 102, 80, 140, NULL, NULL);
INSERT INTO s_inventory VALUES (
   30326, 401, 113, 80, 140, NULL, NULL);
INSERT INTO s_inventory VALUES (
   30421, 401, 85, 80, 140, NULL, NULL);
INSERT INTO s_inventory VALUES (
   30426, 401, 135, 80, 140, NULL, NULL);
INSERT INTO s_inventory VALUES (
   30433, 401, 0, 100, 175, 'A defective shipment was sent to Hong Kong ' ||
   'and needed to be returned. The soonest ACME can turn this around is ' ||
   'early February.', to_date('07/09/2011','dd/mm/yyyy'));
INSERT INTO s_inventory VALUES (
   32779, 401, 135, 100, 175, NULL, NULL);
INSERT INTO s_inventory VALUES (
   32861, 401, 250, 150, 250, NULL, NULL);
INSERT INTO s_inventory VALUES (
   40421, 401, 47, 40, 70, NULL, NULL);
INSERT INTO s_inventory VALUES (
   40422, 401, 50, 40, 70, NULL, NULL);
INSERT INTO s_inventory VALUES (
   41010, 401, 80, 70, 220, NULL, NULL);
INSERT INTO s_inventory VALUES (
   41020, 401, 91, 70, 220, NULL, NULL);
INSERT INTO s_inventory VALUES (
   41050, 401, 169, 70, 220, NULL, NULL);
INSERT INTO s_inventory VALUES (
   41080, 401, 100, 70, 220, NULL, NULL);
INSERT INTO s_inventory VALUES (
   41100, 401, 75, 70, 220, NULL, NULL);
INSERT INTO s_inventory VALUES (
   50169, 401, 240, 200, 350, NULL, NULL);
INSERT INTO s_inventory VALUES (
   50273, 401, 224, 150, 280, NULL, NULL);
INSERT INTO s_inventory VALUES (
   50417, 401, 130, 120, 210, NULL, NULL);
INSERT INTO s_inventory VALUES (
   50418, 401, 156, 100, 175, NULL, NULL);
INSERT INTO s_inventory VALUES (
   50419, 401, 151, 150, 280, NULL, NULL);
INSERT INTO s_inventory VALUES (
   50530, 401, 119, 100, 175, NULL, NULL);
INSERT INTO s_inventory VALUES (
   50532, 401, 233, 200, 350, NULL, NULL);
INSERT INTO s_inventory VALUES (
   50536, 401, 138, 100, 175, NULL, NULL);
INSERT INTO s_inventory VALUES (
   10012, 10501, 300, 300, 525, NULL, NULL);
INSERT INTO s_inventory VALUES (
   10013, 10501, 314, 300, 525, NULL, NULL);
INSERT INTO s_inventory VALUES (
   10022, 10501, 502, 300, 525, NULL, NULL);
INSERT INTO s_inventory VALUES (
   10023, 10501, 500, 300, 525, NULL, NULL);
INSERT INTO s_inventory VALUES (
   20106, 10501, 150, 100, 175, NULL, NULL);
INSERT INTO s_inventory VALUES (
   20108, 10501, 222, 200, 350, NULL, NULL);
INSERT INTO s_inventory VALUES (
   20201, 10501, 275, 200, 350, NULL, NULL);
INSERT INTO s_inventory VALUES (
   20510, 10501, 57, 50, 87, NULL, NULL);
INSERT INTO s_inventory VALUES (
   20512, 10501, 62, 50, 87, NULL, NULL);
INSERT INTO s_inventory VALUES (
   30321, 10501, 194, 150, 275, NULL, NULL);
INSERT INTO s_inventory VALUES (
   30326, 10501, 277, 250, 440, NULL, NULL);
INSERT INTO s_inventory VALUES (
   30421, 10501, 190, 150, 275, NULL, NULL);
INSERT INTO s_inventory VALUES (
   30426, 10501, 423, 250, 450, NULL, NULL);
INSERT INTO s_inventory VALUES (
   30433, 10501, 273, 200, 350, NULL, NULL);
INSERT INTO s_inventory VALUES (
   32779, 10501, 280, 200, 350, NULL, NULL);
INSERT INTO s_inventory VALUES (
   32861, 10501, 288, 200, 350, NULL, NULL);
INSERT INTO s_inventory VALUES (
   40421, 10501, 97, 80, 140, NULL, NULL);
INSERT INTO s_inventory VALUES (
   40422, 10501, 90, 80, 140, NULL, NULL);
INSERT INTO s_inventory VALUES (
   41010, 10501, 151, 140, 245, NULL, NULL);
INSERT INTO s_inventory VALUES (
   41020, 10501, 224, 140, 245, NULL, NULL);
INSERT INTO s_inventory VALUES (
   41050, 10501, 157, 140, 245, NULL, NULL);
INSERT INTO s_inventory VALUES (
   41080, 10501, 159, 140, 245, NULL, NULL);
INSERT INTO s_inventory VALUES (
   41100, 10501, 141, 140, 245, NULL, NULL);
COMMIT;


CREATE TABLE s_item 
(ord_id                     NUMBER(7) 
   CONSTRAINT s_item_ord_id_nn NOT NULL,
 item_id                    NUMBER(7) 
   CONSTRAINT s_item_item_id_nn NOT NULL,
 product_id                 NUMBER(7) 
   CONSTRAINT s_item_product_id_nn NOT NULL,
 price                      NUMBER(11, 2),
 quantity                   NUMBER(9),
 quantity_shipped           NUMBER(9),
     CONSTRAINT s_item_ordid_itemid_pk PRIMARY KEY (ord_id, item_id),
     CONSTRAINT s_item_ordid_prodid_uk UNIQUE (ord_id, product_id));

INSERT INTO s_item VALUES (
   100, 1, 10011, 135, 500, 500);
INSERT INTO s_item VALUES (
   100, 2, 10013, 380, 400, 400);
INSERT INTO s_item VALUES (
   100, 3, 10021, 14, 500, 500);
INSERT INTO s_item VALUES (
   100, 5, 30326, 582, 600, 600);
INSERT INTO s_item VALUES (
   100, 7, 41010, 8, 250, 250);
INSERT INTO s_item VALUES (
   100, 6, 30433, 20, 450, 450);
INSERT INTO s_item VALUES (
   100, 4, 10023, 36, 400, 400);
INSERT INTO s_item VALUES (
   101, 1, 30421, 16, 15, 15);
INSERT INTO s_item VALUES (
   101, 3, 41010, 8, 20, 20);
INSERT INTO s_item VALUES (
   101, 5, 50169, 4.29, 40, 40);
INSERT INTO s_item VALUES (
   101, 6, 50417, 80, 27, 27);
INSERT INTO s_item VALUES (
   101, 7, 50530, 45, 50, 50);
INSERT INTO s_item VALUES (
   101, 4, 41100, 45, 35, 35);
INSERT INTO s_item VALUES (
   101, 2, 40422, 50, 30, 30);
INSERT INTO s_item VALUES (
   102, 1, 20108, 28, 100, 100);
INSERT INTO s_item VALUES (
   102, 2, 20201, 123, 45, 45);
INSERT INTO s_item VALUES (
   103, 1, 30433, 20, 15, 15);
INSERT INTO s_item VALUES (
   103, 2, 32779, 7, 11, 11);
INSERT INTO s_item VALUES (
   104, 1, 20510, 9, 7, 7);
INSERT INTO s_item VALUES (
   104, 4, 30421, 16, 35, 35);
INSERT INTO s_item VALUES (
   104, 2, 20512, 8, 12, 12);
INSERT INTO s_item VALUES (
   104, 3, 30321, 1669, 19, 19);
INSERT INTO s_item VALUES (
   105, 1, 50273, 22.89, 16, 16);
INSERT INTO s_item VALUES (
   105, 3, 50532, 47, 28, 28);
INSERT INTO s_item VALUES (
   105, 2, 50419, 80, 13, 13);
INSERT INTO s_item VALUES (
   106, 1, 20108, 28, 46, 46);
INSERT INTO s_item VALUES (
   106, 4, 50273, 22.89, 75, 75);
INSERT INTO s_item VALUES (
   106, 5, 50418, 75, 98, 98);
INSERT INTO s_item VALUES (
   106, 6, 50419, 80, 27, 27);
INSERT INTO s_item VALUES (
   106, 2, 20201, 123, 21, 21);
INSERT INTO s_item VALUES (
   106, 3, 50169, 4.29, 125, 125);
INSERT INTO s_item VALUES (
   107, 1, 20106, 11, 50, 50);
INSERT INTO s_item VALUES (
   107, 3, 20201, 115, 130, 130);
INSERT INTO s_item VALUES (
   107, 5, 30421, 16, 55, 55);
INSERT INTO s_item VALUES (
   107, 4, 30321, 1669, 75, 75);
INSERT INTO s_item VALUES (
   107, 2, 20108, 28, 22, 22);
INSERT INTO s_item VALUES (
   108, 1, 20510, 9, 9, 9);
INSERT INTO s_item VALUES (
   108, 6, 41080, 35, 50, 50);
INSERT INTO s_item VALUES (
   108, 7, 41100, 45, 42, 42);
INSERT INTO s_item VALUES (
   108, 5, 32861, 60, 57, 57);
INSERT INTO s_item VALUES (
   108, 2, 20512, 8, 18, 18);
INSERT INTO s_item VALUES (
   108, 4, 32779, 7, 60, 60);
INSERT INTO s_item VALUES (
   108, 3, 30321, 1669, 85, 85);
INSERT INTO s_item VALUES (
   109, 1, 10011, 140, 150, 150);
INSERT INTO s_item VALUES (
   109, 5, 30426, 18.25, 500, 500);
INSERT INTO s_item VALUES (
   109, 7, 50418, 75, 43, 43);
INSERT INTO s_item VALUES (
   109, 6, 32861, 60, 50, 50);
INSERT INTO s_item VALUES (
   109, 4, 30326, 582, 1500, 1500);
INSERT INTO s_item VALUES (
   109, 2, 10012, 175, 600, 600);
INSERT INTO s_item VALUES (
   109, 3, 10022, 21.95, 300, 300);
INSERT INTO s_item VALUES (
   110, 1, 50273, 22.89, 17, 17);
INSERT INTO s_item VALUES (
   110, 2, 50536, 50, 23, 23);
INSERT INTO s_item VALUES (
   111, 1, 40421, 65, 27, 27);
INSERT INTO s_item VALUES (
   111, 2, 41080, 35, 29, 29);
INSERT INTO s_item VALUES (
   97, 1, 20106, 9, 1000, 1000);
INSERT INTO s_item VALUES (
   97, 2, 30321, 1500, 50, 50);
INSERT INTO s_item VALUES (
   98, 1, 40421, 85, 7, 7);
INSERT INTO s_item VALUES (
   99, 1, 20510, 9, 18, 18);
INSERT INTO s_item VALUES (
   99, 2, 20512, 8, 25, 25);
INSERT INTO s_item VALUES (
   99, 3, 50417, 80, 53, 53);
INSERT INTO s_item VALUES (
   99, 4, 50530, 45, 69, 69);
INSERT INTO s_item VALUES (
   112, 1, 20106, 11, 50, 50);
COMMIT;



CREATE TABLE s_ord 
(id                         NUMBER(7) 
   CONSTRAINT s_ord_id_nn NOT NULL,
 customer_id                NUMBER(7) 
   CONSTRAINT s_ord_customer_id_nn NOT NULL,
 date_ordered               DATE,
 date_shipped               DATE,
 sales_rep_id               NUMBER(7),
 total                      NUMBER(11, 2),
 payment_type               VARCHAR2(6),
 order_filled               VARCHAR2(1),
     CONSTRAINT s_ord_id_pk PRIMARY KEY (id),
     CONSTRAINT s_ord_payment_type_ck
        CHECK (payment_type in ('CASH', 'CREDIT')),
     CONSTRAINT s_ord_order_filled_ck
        CHECK (order_filled in ('Y', 'N')));

INSERT INTO s_ord VALUES (
   100, 204, to_date('31/08/2011','dd/mm/yyyy'), to_date('10/09/2011','dd/mm/yyyy'),
   11, 601100, 'CREDIT', 'Y');
INSERT INTO s_ord VALUES (
   101, 205, to_date('31/08/2011','dd/mm/yyyy'), to_date('15/09/2011','dd/mm/yyyy'),
   14, 8056.6, 'CREDIT', 'Y');
INSERT INTO s_ord VALUES (
   102, 206, to_date('01/09/2011','dd/mm/yyyy'), to_date('08/09/2011','dd/mm/yyyy'),
   15, 8335, 'CREDIT', 'Y');
INSERT INTO s_ord VALUES (
   103, 208, to_date('02/09/2011','dd/mm/yyyy'), to_date('22/09/2011','dd/mm/yyyy'),
   15, 377, 'CASH', 'Y');
INSERT INTO s_ord VALUES (
   104, 208, to_date('03/09/2011','dd/mm/yyyy'), to_date('23/09/2011','dd/mm/yyyy'),
   15, 32430, 'CREDIT', 'Y');
INSERT INTO s_ord VALUES (
   105, 209, to_date('04/09/2011','dd/mm/yyyy'), to_date('18/09/2011','dd/mm/yyyy'),
   11, 2722.24, 'CREDIT', 'Y');
INSERT INTO s_ord VALUES (
   106, 210, to_date('07/09/2011','dd/mm/yyyy'), to_date('15/09/2011','dd/mm/yyyy'),
   12, 15634, 'CREDIT', 'Y');
INSERT INTO s_ord VALUES (
   107, 211, to_date('07/09/2011','dd/mm/yyyy'), to_date('21/09/2011','dd/mm/yyyy'),
   15, 142171, 'CREDIT', 'Y');
INSERT INTO s_ord VALUES (
   108, 212, to_date('07/09/2011','dd/mm/yyyy'), to_date('10/09/2011','dd/mm/yyyy'),
   13, 149570, 'CREDIT', 'Y');
INSERT INTO s_ord VALUES (
   109, 213, to_date('08/09/2011','dd/mm/yyyy'), to_date('28/09/2011','dd/mm/yyyy'),
   11, 1020935, 'CREDIT', 'Y');
INSERT INTO s_ord VALUES (
   110, 214, to_date('09/09/2011','dd/mm/yyyy'), to_date('21/09/2011','dd/mm/yyyy'),
   11, 1539.13, 'CASH', 'Y');
INSERT INTO s_ord VALUES (
   111, 204, to_date('09/09/2011','dd/mm/yyyy'), to_date('21/09/2011','dd/mm/yyyy'),
   11, 2770, 'CASH', 'Y');
INSERT INTO s_ord VALUES (
   97, 201, to_date('28/08/2011','dd/mm/yyyy'), to_date('17/09/2011','dd/mm/yyyy'),
   12, 84000, 'CREDIT', 'Y');
INSERT INTO s_ord VALUES (
   98, 202, to_date('31/08/2011','dd/mm/yyyy'), to_date('10/09/2011','dd/mm/yyyy'),
   14, 595, 'CASH', 'Y');
INSERT INTO s_ord VALUES (
   99, 203, to_date('31/08/2011','dd/mm/yyyy'), to_date('18/09/2011','dd/mm/yyyy'),
   14, 7707, 'CREDIT', 'Y');
INSERT INTO s_ord VALUES (
   112, 210, to_date('31/08/2011','dd/mm/yyyy'), to_date('10/09/2011','dd/mm/yyyy'),
   12, 550, 'CREDIT', 'Y');
COMMIT;


CREATE TABLE s_product 
(id                         NUMBER(7) 
   CONSTRAINT s_product_id_nn NOT NULL,
 name                       VARCHAR2(50) 
   CONSTRAINT s_product_name_nn NOT NULL,
 short_desc                 VARCHAR2(255),
 suggested_whlsl_price      NUMBER(11, 2),
 whlsl_units                VARCHAR2(25),
     CONSTRAINT s_product_id_pk PRIMARY KEY (id),
     CONSTRAINT s_product_name_uk UNIQUE (name));

INSERT INTO s_product VALUES (
   10011, 'Bunny Boot',
   'Beginner''s ski boot',
   150, NULL);
INSERT INTO s_product VALUES (
   10012, 'Ace Ski Boot',
   'Intermediate ski boot',
   200, NULL);
INSERT INTO s_product VALUES (
   10013, 'Pro Ski Boot',
   'Advanced ski boot',
   410, NULL);
INSERT INTO s_product VALUES (
   10021, 'Bunny Ski Pole',
   'Beginner''s ski pole',
   16.25, NULL);
INSERT INTO s_product VALUES (
   10022, 'Ace Ski Pole',
   'Intermediate ski pole',
   21.95, NULL);
INSERT INTO s_product VALUES (
   10023, 'Pro Ski Pole',
   'Advanced ski pole',
   40.95, NULL);
INSERT INTO s_product VALUES (
   20106, 'Junior Soccer Ball',
   'Junior soccer ball',
   11, NULL);
INSERT INTO s_product VALUES (
   20108, 'World Cup Soccer Ball',
   'World cup soccer ball',
   28, NULL);
INSERT INTO s_product VALUES (
   20201, 'World Cup Net',
   'World cup net',
   123, NULL);
INSERT INTO s_product VALUES (
   20510, 'Black Hawk Knee Pads',
   'Knee pads, pair',
   9, NULL);
INSERT INTO s_product VALUES (
   20512, 'Black Hawk Elbow Pads',
   'Elbow pads, pair',
   8, NULL);
INSERT INTO s_product VALUES (
   30321, 'Grand Prix Bicycle',
   'Road bicycle',
   1669, NULL);
INSERT INTO s_product VALUES (
   30326, 'Himalaya Bicycle',
   'Mountain bicycle',
   582, NULL);
INSERT INTO s_product VALUES (
   30421, 'Grand Prix Bicycle Tires',
   'Road bicycle tires',
   16, NULL);
INSERT INTO s_product VALUES (
   30426, 'Himalaya Tires',
   'Mountain bicycle tires',
   18.25, NULL);
INSERT INTO s_product VALUES (
   30433, 'New Air Pump',
   'Tire pump',
   20, NULL);
INSERT INTO s_product VALUES (
   32779, 'Slaker Water Bottle',
   'Water bottle',
   7, NULL);
INSERT INTO s_product VALUES (
   32861, 'Safe-T Helmet',
   'Bicycle helmet',
   60, NULL);
INSERT INTO s_product VALUES (
   40421, 'Alexeyer Pro Lifting Bar',
   'Straight bar',
   65, NULL);
INSERT INTO s_product VALUES (
   40422, 'Pro Curling Bar',
   'Curling bar',
   50, NULL);
INSERT INTO s_product VALUES (
   41010, 'Prostar 10 Pound Weight',
   'Ten pound weight',
   8, NULL);
INSERT INTO s_product VALUES (
   41020, 'Prostar 20 Pound Weight',
   'Twenty pound weight',
   12, NULL);
INSERT INTO s_product VALUES (
   41050, 'Prostar 50 Pound Weight',
   'Fifty pound weight',
   25, NULL);
INSERT INTO s_product VALUES (
   41080, 'Prostar 80 Pound Weight',
   'Eighty pound weight',
   35, NULL);
INSERT INTO s_product VALUES (
   41100, 'Prostar 100 Pound Weight',
   'One hundred pound weight',
   45, NULL);
INSERT INTO s_product VALUES (
   50169, 'Major League Baseball',
   'Baseball',
   4.29, NULL);
INSERT INTO s_product VALUES (
   50273, 'Chapman Helmet',
   'Batting helmet',
   22.89, NULL);
INSERT INTO s_product VALUES (
   50417, 'Griffey Glove',
   'Outfielder''s glove',
   80, NULL);
INSERT INTO s_product VALUES (
   50418, 'Alomar Glove',
   'Infielder''s glove',
   75, NULL);
INSERT INTO s_product VALUES (
   50419, 'Steinbach Glove',
   'Catcher''s glove',
   80, NULL);
INSERT INTO s_product VALUES (
   50530, 'Cabrera Bat',
   'Thirty inch bat',
   45, NULL);
INSERT INTO s_product VALUES (
   50532, 'Puckett Bat',
   'Thirty-two inch bat',
   47, NULL);
INSERT INTO s_product VALUES (
   50536, 'Winfield Bat',
   'Thirty-six inch bat',
   50, NULL);
COMMIT;

CREATE TABLE s_region 
(id                         NUMBER(7) 
   CONSTRAINT s_region_id_nn NOT NULL,
 name                       VARCHAR2(50) 
   CONSTRAINT s_region_name_nn NOT NULL,
     CONSTRAINT s_region_id_pk PRIMARY KEY (id),
     CONSTRAINT s_region_name_uk UNIQUE (name));

INSERT INTO s_region VALUES (
   1, 'North America');
INSERT INTO s_region VALUES (
   2, 'South America');
INSERT INTO s_region VALUES (
   3, 'Africa / Middle East');
INSERT INTO s_region VALUES (
   4, 'Asia');
INSERT INTO s_region VALUES (
   5, 'Europe');
COMMIT;


CREATE TABLE s_title
(title                      VARCHAR2(25) 
   CONSTRAINT s_title_title_nn NOT NULL,
	CONSTRAINT s_title_title_pk PRIMARY KEY (title));

INSERT INTO s_title VALUES ('President');
INSERT INTO s_title VALUES ('Sales Representative');
INSERT INTO s_title VALUES ('Stock Clerk');
INSERT INTO s_title VALUES ('VP, Administration');
INSERT INTO s_title VALUES ('VP, Finance');
INSERT INTO s_title VALUES ('VP, Operations');
INSERT INTO s_title VALUES ('VP, Sales');
INSERT INTO s_title VALUES ('Warehouse Manager');
COMMIT;


CREATE TABLE s_warehouse 
(id                         NUMBER(7) 
   CONSTRAINT s_warehouse_id_nn NOT NULL,
 region_id                  NUMBER(7) 
   CONSTRAINT s_warehouse_region_id_nn NOT NULL,
 address                    LONG,
 city                       VARCHAR2(30),
 state                      VARCHAR2(20),
 country                    VARCHAR2(30),
 zip_code                   VARCHAR2(75),
 phone                      VARCHAR2(25),
 manager_id                 NUMBER(7),
     CONSTRAINT s_warehouse_id_pk PRIMARY KEY (id));

INSERT INTO s_warehouse VALUES (
   101, 1,
   '283 King Street',
   'Seattle', 'WA', 'USA',
   NULL,
   NULL, 6);
INSERT INTO s_warehouse VALUES (
   10501, 5,
   '5 Modrany',
   'Bratislava', NULL, 'Czechozlovakia',
   NULL,
   NULL, 10);
INSERT INTO s_warehouse VALUES (
   201, 2,
   '68 Via Centrale',
   'Sao Paolo', NULL, 'Brazil',
   NULL,
   NULL, 7);
INSERT INTO s_warehouse VALUES (
   301, 3,
   '6921 King Way',
   'Lagos', NULL, 'Nigeria',
   NULL,
   NULL, 8);
INSERT INTO s_warehouse VALUES (
   401, 4,
   '86 Chu Street',
   'Hong Kong', NULL, NULL,
   NULL,
   NULL, 9);

create table s_salary (
consec number(7) NOT NULL,
id number(7) NOT NULL,
datePayment date NOT NULL,
payment number(10,2),
constraint salary_pk primary key (consec),
constraint salary_id_fk FOREIGN KEY (id) references s_emp);

INSERT INTO s_salary values(1,1, to_date('30/01/2011', 'dd/mm/yyyy'), 15000);
INSERT INTO s_salary values(2,1, to_date('26/02/2011', 'dd/mm/yyyy'), 15000);
INSERT INTO s_salary values(3,1, to_date('30/03/2011', 'dd/mm/yyyy'), 25000);
INSERT INTO s_salary values(4,1, to_date('30/04/2011', 'dd/mm/yyyy'), 25000);
INSERT INTO s_salary values(5,1, to_date('30/05/2011', 'dd/mm/yyyy'), 25000);
INSERT INTO s_salary values(6,1, to_date('30/06/2011', 'dd/mm/yyyy'), 25000);
INSERT INTO s_salary values(7,1, to_date('30/07/2011', 'dd/mm/yyyy'), 25000);
INSERT INTO s_salary values(8,1, to_date('30/08/2011', 'dd/mm/yyyy'), 30000);
INSERT INTO s_salary values(9,1, to_date('30/09/2011', 'dd/mm/yyyy'), 30000);
INSERT INTO s_salary values(10,1, to_date('30/10/2011','dd/mm/yyyy'), 31000);
INSERT INTO s_salary values(11,1, to_date('30/11/2011','dd/mm/yyyy'), 31000);
INSERT INTO s_salary values(12,2, to_date('30/12/2011','dd/mm/yyyy'), 37000);


INSERT INTO s_salary values(13,2, to_date('30/01/2011', 'dd/mm/yyyy'),  7000);
INSERT INTO s_salary values(14,2, to_date('27/02/2011', 'dd/mm/yyyy'),  7000);
INSERT INTO s_salary values(15,2, to_date('30/03/2011', 'dd/mm/yyyy'),  7000);
INSERT INTO s_salary values(16, 2, to_date('30/04/2011','dd/mm/yyyy'),  7000);
INSERT INTO s_salary values(17, 2, to_date('30/05/2011','dd/mm/yyyy'),  7000);
INSERT INTO s_salary values(18, 2, to_date('30/06/2011','dd/mm/yyyy'),  7000);
INSERT INTO s_salary values(19, 2, to_date('30/07/2011','dd/mm/yyyy'),  9000);
INSERT INTO s_salary values(20, 2, to_date('30/08/2011','dd/mm/yyyy'),  9000);
INSERT INTO s_salary values(21,2, to_date('30/09/2011', 'dd/mm/yyyy'),  9000);
INSERT INTO s_salary values(22,2, to_date('30/10/2011', 'dd/mm/yyyy'),  9000);
INSERT INTO s_salary values(23,2, to_date('30/11/2011', 'dd/mm/yyyy'),  9000);
INSERT INTO s_salary values(24, 2, to_date('28/12/2011','dd/mm/yyyy'),  9000);


INSERT INTO s_salary values(25, 3, to_date('30/01/2011','dd/mm/yyyy'),  7500);
INSERT INTO s_salary values(26, 3, to_date('27/02/2011','dd/mm/yyyy'),  7500);
INSERT INTO s_salary values(27, 3, to_date('30/03/2011','dd/mm/yyyy'),  7500);
INSERT INTO s_salary values(28, 3, to_date('30/04/2011','dd/mm/yyyy'),  7500);
INSERT INTO s_salary values(29, 3, to_date('30/05/2011','dd/mm/yyyy'),  8000);
INSERT INTO s_salary values(30, 3, to_date('30/06/2011','dd/mm/yyyy'),  8000);
INSERT INTO s_salary values(31, 3, to_date('30/07/2011','dd/mm/yyyy'),  9000);
INSERT INTO s_salary values(32, 3, to_date('30/08/2011','dd/mm/yyyy'),  9000);
INSERT INTO s_salary values(33, 3, to_date('30/09/2011','dd/mm/yyyy'),  9000);
INSERT INTO s_salary values(34, 3, to_date('30/10/2011','dd/mm/yyyy'),  9000);
INSERT INTO s_salary values(35, 3, to_date('30/11/2011','dd/mm/yyyy'),  9000);
INSERT INTO s_salary values(36, 3, to_date('30/12/2011','dd/mm/yyyy'),  9000);


INSERT INTO s_salary values(37, 4, to_date('30/01/2011', 'dd/mm/yyyy'), 6000);
INSERT INTO s_salary values(38, 4, to_date('28/02/2011', 'dd/mm/yyyy'), 7500);
INSERT INTO s_salary values(39, 4, to_date('30/03/2011', 'dd/mm/yyyy'), 7500);
INSERT INTO s_salary values(40,4, to_date('30/04/2011',  'dd/mm/yyyy'), 7500);
INSERT INTO s_salary values(41,4, to_date('30/05/2011',  'dd/mm/yyyy'), 8500);
INSERT INTO s_salary values(42,4, to_date('30/06/2011',  'dd/mm/yyyy'), 8000);
INSERT INTO s_salary values(43,4, to_date('30/07/2011',  'dd/mm/yyyy'), 8700);
INSERT INTO s_salary values(44, 4, to_date('30/08/2011', 'dd/mm/yyyy'), 8700);
INSERT INTO s_salary values(45, 4, to_date('30/09/2011', 'dd/mm/yyyy'), 9000);
INSERT INTO s_salary values(46,4, to_date('30/10/2011',  'dd/mm/yyyy'), 9000);
INSERT INTO s_salary values(47,4, to_date('30/11/2011',  'dd/mm/yyyy'), 9000);
INSERT INTO s_salary values(48,4, to_date('30/12/2011',  'dd/mm/yyyy'), 9400);

INSERT INTO s_salary values(49,5, to_date('30/01/2011', 'dd/mm/yyyy'),  5000);
INSERT INTO s_salary values(50,5, to_date('28/02/2011', 'dd/mm/yyyy'),  5500);
INSERT INTO s_salary values(51,5, to_date('30/03/2011', 'dd/mm/yyyy'),  5500);
INSERT INTO s_salary values(52,5, to_date('30/04/2011', 'dd/mm/yyyy'),  5500);
INSERT INTO s_salary values(53,5, to_date('30/05/2011', 'dd/mm/yyyy'),  6500);
INSERT INTO s_salary values(54,5, to_date('30/06/2011', 'dd/mm/yyyy'),  6000);
INSERT INTO s_salary values(55, 5, to_date('30/07/2011','dd/mm/yyyy'),  6700);
INSERT INTO s_salary values(57, 5, to_date('30/08/2011','dd/mm/yyyy'),  6700);
INSERT INTO s_salary values(58, 5, to_date('30/09/2011','dd/mm/yyyy'),  7000);
INSERT INTO s_salary values(59, 5, to_date('30/10/2011','dd/mm/yyyy'),  7000);
INSERT INTO s_salary values(60, 5, to_date('30/11/2011','dd/mm/yyyy'),  7000);
INSERT INTO s_salary values(61, 5, to_date('30/12/2011','dd/mm/yyyy'),  7400);

INSERT INTO s_salary values(62,6, to_date('30/01/2011', 'dd/mm/yyyy'),  320);
INSERT INTO s_salary values(63, 6, to_date('28/02/2011','dd/mm/yyyy'),  320);
INSERT INTO s_salary values(64, 6, to_date('30/03/2011','dd/mm/yyyy'),  320);
INSERT INTO s_salary values(65, 6, to_date('30/04/2011','dd/mm/yyyy'),  320);
INSERT INTO s_salary values(66, 6, to_date('30/05/2011','dd/mm/yyyy'),  320);
INSERT INTO s_salary values(67, 6, to_date('30/06/2011','dd/mm/yyyy'),  512);
INSERT INTO s_salary values(68, 6, to_date('30/07/2011','dd/mm/yyyy'),  512);
INSERT INTO s_salary values(69, 6, to_date('30/08/2011','dd/mm/yyyy'),  513);
INSERT INTO s_salary values(70, 6, to_date('30/09/2011','dd/mm/yyyy'),  610);
INSERT INTO s_salary values(71, 6, to_date('30/10/2011','dd/mm/yyyy'),  610);
INSERT INTO s_salary values(72, 6, to_date('30/11/2011','dd/mm/yyyy'),  620);
INSERT INTO s_salary values(73, 6, to_date('30/12/2011','dd/mm/yyyy'),  630);

INSERT INTO s_salary values(74,7, to_date('30/01/2011', 'dd/mm/yyyy'),  320);
INSERT INTO s_salary values(75, 7, to_date('28/02/2011','dd/mm/yyyy'),  325);
INSERT INTO s_salary values(76, 7, to_date('30/03/2011','dd/mm/yyyy'),  320);
INSERT INTO s_salary values(77, 7, to_date('30/04/2011','dd/mm/yyyy'),  332);
INSERT INTO s_salary values(78, 7, to_date('30/05/2011','dd/mm/yyyy'),  320);
INSERT INTO s_salary values(79, 7, to_date('30/06/2011','dd/mm/yyyy'),  512);
INSERT INTO s_salary values(80, 7, to_date('30/07/2011','dd/mm/yyyy'),  512);
INSERT INTO s_salary values(81, 7, to_date('30/08/2011','dd/mm/yyyy'),  527);
INSERT INTO s_salary values(82, 7, to_date('30/09/2011','dd/mm/yyyy'),  630);
INSERT INTO s_salary values(83, 7, to_date('30/10/2011','dd/mm/yyyy'),  610);
INSERT INTO s_salary values(84, 7, to_date('30/11/2011','dd/mm/yyyy'),  635);
INSERT INTO s_salary values(85, 7, to_date('30/12/2011','dd/mm/yyyy'),  680);

INSERT INTO s_salary values(86,8, to_date('30/01/2011', 'dd/mm/yyyy'),  324);
INSERT INTO s_salary values(87, 8, to_date('28/02/2011','dd/mm/yyyy'),  326);
INSERT INTO s_salary values(88, 8, to_date('30/03/2011','dd/mm/yyyy'),  350);
INSERT INTO s_salary values(89, 8, to_date('30/04/2011','dd/mm/yyyy'),  382);
INSERT INTO s_salary values(90, 8, to_date('30/05/2011','dd/mm/yyyy'),  387);
INSERT INTO s_salary values(91, 8, to_date('30/06/2011','dd/mm/yyyy'),  500);
INSERT INTO s_salary values(92, 8, to_date('30/07/2011','dd/mm/yyyy'),  512);
INSERT INTO s_salary values(93, 8, to_date('30/08/2011','dd/mm/yyyy'),  517);
INSERT INTO s_salary values(94, 8, to_date('30/09/2011','dd/mm/yyyy'),  700);
INSERT INTO s_salary values(95, 8, to_date('30/10/2011','dd/mm/yyyy'),  610);
INSERT INTO s_salary values(96, 8, to_date('30/11/2011','dd/mm/yyyy'),  624);
INSERT INTO s_salary values(97, 8, to_date('30/12/2011','dd/mm/yyyy'),  701);

INSERT INTO s_salary values(98,9, to_date('30/01/2011',  'dd/mm/yyyy'),  314);
INSERT INTO s_salary values(99, 9, to_date('28/02/2011', 'dd/mm/yyyy'),  226);
INSERT INTO s_salary values(100, 9, to_date('30/03/2011','dd/mm/yyyy'),  550);
INSERT INTO s_salary values(101, 9, to_date('30/04/2011','dd/mm/yyyy'),  482);
INSERT INTO s_salary values(102, 9, to_date('30/05/2011','dd/mm/yyyy'),  287);
INSERT INTO s_salary values(103, 9, to_date('30/06/2011','dd/mm/yyyy'),  300);
INSERT INTO s_salary values(104, 9, to_date('30/07/2011','dd/mm/yyyy'),  312);
INSERT INTO s_salary values(105, 9, to_date('30/08/2011','dd/mm/yyyy'),  517);
INSERT INTO s_salary values(106, 9, to_date('30/09/2011','dd/mm/yyyy'),  500);
INSERT INTO s_salary values(107, 9, to_date('30/10/2011','dd/mm/yyyy'),  510);
INSERT INTO s_salary values(108, 9, to_date('30/11/2011','dd/mm/yyyy'),  524);
INSERT INTO s_salary values(109, 9, to_date('30/12/2011','dd/mm/yyyy'),  501);

INSERT INTO s_salary values(110, 10, to_date('30/01/2011', 'dd/mm/yyyy'), 414);
INSERT INTO s_salary values(111, 10, to_date('28/02/2011', 'dd/mm/yyyy'), 426);
INSERT INTO s_salary values(112, 10, to_date('30/03/2011', 'dd/mm/yyyy'), 450);
INSERT INTO s_salary values(113, 10, to_date('30/04/2011', 'dd/mm/yyyy'), 482);
INSERT INTO s_salary values(114, 10, to_date('30/05/2011', 'dd/mm/yyyy'), 487);
INSERT INTO s_salary values(115, 10, to_date('30/06/2011', 'dd/mm/yyyy'), 400);
INSERT INTO s_salary values(116, 10, to_date('30/07/2011', 'dd/mm/yyyy'), 412);
INSERT INTO s_salary values(117, 10, to_date('30/08/2011', 'dd/mm/yyyy'), 417);
INSERT INTO s_salary values(118, 10, to_date('30/09/2011', 'dd/mm/yyyy'), 600);
INSERT INTO s_salary values(119, 10, to_date('30/10/2011', 'dd/mm/yyyy'), 610);
INSERT INTO s_salary values(120, 10, to_date('30/11/2011', 'dd/mm/yyyy'), 624);
INSERT INTO s_salary values(121, 10, to_date('30/12/2011', 'dd/mm/yyyy'), 601);



INSERT INTO s_salary values(122, 11, to_date('30/01/2011', 'dd/mm/yyyy'), 800);
INSERT INTO s_salary values(123, 11, to_date('28/02/2011', 'dd/mm/yyyy'), 826);
INSERT INTO s_salary values(124, 11, to_date('30/03/2011', 'dd/mm/yyyy'), 850);
INSERT INTO s_salary values(125, 11, to_date('30/04/2011', 'dd/mm/yyyy'), 982);
INSERT INTO s_salary values(126, 11, to_date('30/05/2011', 'dd/mm/yyyy'), 987);
INSERT INTO s_salary values(127, 11, to_date('30/06/2011', 'dd/mm/yyyy'), 980);
INSERT INTO s_salary values(128, 11, to_date('30/07/2011', 'dd/mm/yyyy'), 982);
INSERT INTO s_salary values(129, 11, to_date('30/08/2011', 'dd/mm/yyyy'), 917);
INSERT INTO s_salary values(130, 11, to_date('30/09/2011', 'dd/mm/yyyy'), 900);
INSERT INTO s_salary values(131, 11, to_date('30/10/2011', 'dd/mm/yyyy'), 910);
INSERT INTO s_salary values(132, 11, to_date('30/11/2011', 'dd/mm/yyyy'), 924);
INSERT INTO s_salary values(133, 11, to_date('30/12/2011', 'dd/mm/yyyy'), 901);



INSERT INTO s_salary values(290, 12, to_date('30/01/2011',  'dd/mm/yyyy'), 820);
INSERT INTO s_salary values(291, 12, to_date('28/02/2011', 'dd/mm/yyyy'), 802);
INSERT INTO s_salary values(292, 12, to_date('30/03/2011', 'dd/mm/yyyy'), 802);
INSERT INTO s_salary values(293, 12, to_date('30/04/2011', 'dd/mm/yyyy'), 800);
INSERT INTO s_salary values(294, 12, to_date('30/05/2011', 'dd/mm/yyyy'), 800);
INSERT INTO s_salary values(295, 12, to_date('30/06/2011', 'dd/mm/yyyy'), 780);
INSERT INTO s_salary values(296, 12, to_date('30/07/2011', 'dd/mm/yyyy'), 782);
INSERT INTO s_salary values(297, 12, to_date('30/08/2011', 'dd/mm/yyyy'), 717);
INSERT INTO s_salary values(298, 12, to_date('30/09/2011', 'dd/mm/yyyy'), 700);
INSERT INTO s_salary values(299, 12, to_date('30/10/2011', 'dd/mm/yyyy'), 710);
INSERT INTO s_salary values(300, 12, to_date('30/11/2011', 'dd/mm/yyyy'), 824);
INSERT INTO s_salary values(301, 12, to_date('30/12/2011', 'dd/mm/yyyy'), 801);

INSERT INTO s_salary values(134, 13, to_date('30/01/2011', 'dd/mm/yyyy'), 700);
INSERT INTO s_salary values(135, 13, to_date('28/02/2011', 'dd/mm/yyyy'), 726);
INSERT INTO s_salary values(136, 13, to_date('30/03/2011', 'dd/mm/yyyy'), 750);
INSERT INTO s_salary values(137, 13, to_date('30/04/2011', 'dd/mm/yyyy'), 972);
INSERT INTO s_salary values(138, 13, to_date('30/05/2011', 'dd/mm/yyyy'), 977);
INSERT INTO s_salary values(139, 13, to_date('30/06/2011', 'dd/mm/yyyy'), 970);
INSERT INTO s_salary values(140, 13, to_date('30/07/2011', 'dd/mm/yyyy'), 972);
INSERT INTO s_salary values(141, 13, to_date('30/08/2011', 'dd/mm/yyyy'), 900);
INSERT INTO s_salary values(142, 13, to_date('30/09/2011', 'dd/mm/yyyy'), 900);
INSERT INTO s_salary values(143, 13, to_date('30/10/2011', 'dd/mm/yyyy'), 900);
INSERT INTO s_salary values(144, 13, to_date('30/11/2011', 'dd/mm/yyyy'), 904);
INSERT INTO s_salary values(145, 13, to_date('30/12/2011', 'dd/mm/yyyy'), 901);

INSERT INTO s_salary values(146, 14, to_date('30/01/2011', 'dd/mm/yyyy'), 900);
INSERT INTO s_salary values(147, 14, to_date('28/02/2011', 'dd/mm/yyyy'), 926);
INSERT INTO s_salary values(148, 14, to_date('30/03/2011', 'dd/mm/yyyy'), 950);
INSERT INTO s_salary values(149, 14, to_date('30/04/2011', 'dd/mm/yyyy'), 982);
INSERT INTO s_salary values(150, 14, to_date('30/05/2011', 'dd/mm/yyyy'), 987);
INSERT INTO s_salary values(151, 14, to_date('30/06/2011', 'dd/mm/yyyy'), 980);
INSERT INTO s_salary values(152, 14, to_date('30/07/2011', 'dd/mm/yyyy'), 982);
INSERT INTO s_salary values(153, 14, to_date('30/08/2011', 'dd/mm/yyyy'), 1017);
INSERT INTO s_salary values(154, 14, to_date('30/09/2011', 'dd/mm/yyyy'), 1000);
INSERT INTO s_salary values(155, 14, to_date('30/10/2011', 'dd/mm/yyyy'), 1010);
INSERT INTO s_salary values(156, 14, to_date('30/11/2011', 'dd/mm/yyyy'), 1024);
INSERT INTO s_salary values(157, 14, to_date('30/12/2011', 'dd/mm/yyyy'), 1001);

INSERT INTO s_salary values(158, 15, to_date('30/01/2011', 'dd/mm/yyyy'), 700);
INSERT INTO s_salary values(159, 15, to_date('28/02/2011', 'dd/mm/yyyy'), 826);
INSERT INTO s_salary values(160, 15, to_date('30/03/2011', 'dd/mm/yyyy'), 750);
INSERT INTO s_salary values(161, 15, to_date('30/04/2011', 'dd/mm/yyyy'), 882);
INSERT INTO s_salary values(162, 15, to_date('30/05/2011', 'dd/mm/yyyy'), 787);
INSERT INTO s_salary values(163, 15, to_date('30/06/2011', 'dd/mm/yyyy'), 880);
INSERT INTO s_salary values(164, 15, to_date('30/07/2011', 'dd/mm/yyyy'), 782);
INSERT INTO s_salary values(165, 15, to_date('30/08/2011', 'dd/mm/yyyy'), 817);
INSERT INTO s_salary values(166, 15, to_date('30/09/2011', 'dd/mm/yyyy'), 700);
INSERT INTO s_salary values(167, 15, to_date('30/10/2011', 'dd/mm/yyyy'), 810);
INSERT INTO s_salary values(168, 15, to_date('30/11/2011', 'dd/mm/yyyy'), 724);
INSERT INTO s_salary values(169, 15, to_date('30/12/2011', 'dd/mm/yyyy'), 801);




INSERT INTO s_salary values(170, 16, to_date('30/01/2011', 'dd/mm/yyyy'), 700);
INSERT INTO s_salary values(171, 16, to_date('28/02/2011', 'dd/mm/yyyy'), 826);
INSERT INTO s_salary values(172, 16, to_date('30/03/2011', 'dd/mm/yyyy'), 750);
INSERT INTO s_salary values(173, 16, to_date('30/04/2011', 'dd/mm/yyyy'), 882);
INSERT INTO s_salary values(174, 16, to_date('30/05/2011', 'dd/mm/yyyy'), 787);
INSERT INTO s_salary values(175, 16, to_date('30/06/2011', 'dd/mm/yyyy'), 880);
INSERT INTO s_salary values(176, 16, to_date('30/07/2011', 'dd/mm/yyyy'), 782);
INSERT INTO s_salary values(177, 16, to_date('30/08/2011', 'dd/mm/yyyy'), 817);
INSERT INTO s_salary values(178, 16, to_date('30/09/2011', 'dd/mm/yyyy'), 700);
INSERT INTO s_salary values(179, 16, to_date('30/10/2011', 'dd/mm/yyyy'), 810);
INSERT INTO s_salary values(180, 16, to_date('30/11/2011', 'dd/mm/yyyy'), 724);
INSERT INTO s_salary values(181, 16, to_date('30/12/2011', 'dd/mm/yyyy'), 801);


INSERT INTO s_salary values(182, 17, to_date('30/01/2011', 'dd/mm/yyyy'), 700);
INSERT INTO s_salary values(183, 17, to_date('28/02/2011', 'dd/mm/yyyy'), 826);
INSERT INTO s_salary values(184, 17, to_date('30/03/2011', 'dd/mm/yyyy'), 750);
INSERT INTO s_salary values(185, 17, to_date('30/04/2011', 'dd/mm/yyyy'), 882);
INSERT INTO s_salary values(186, 17, to_date('30/05/2011', 'dd/mm/yyyy'), 787);
INSERT INTO s_salary values(187, 17, to_date('30/06/2011', 'dd/mm/yyyy'), 880);
INSERT INTO s_salary values(188, 17, to_date('30/07/2011', 'dd/mm/yyyy'), 782);
INSERT INTO s_salary values(189, 17, to_date('30/08/2011', 'dd/mm/yyyy'), 817);
INSERT INTO s_salary values(190, 17, to_date('30/09/2011', 'dd/mm/yyyy'), 700);
INSERT INTO s_salary values(191, 17, to_date('30/10/2011', 'dd/mm/yyyy'), 810);
INSERT INTO s_salary values(192, 17, to_date('30/11/2011', 'dd/mm/yyyy'), 724);
INSERT INTO s_salary values(193, 17, to_date('30/12/2011', 'dd/mm/yyyy'), 801);


INSERT INTO s_salary values(194, 18, to_date('30/01/2011', 'dd/mm/yyyy'), 700);
INSERT INTO s_salary values(195, 18, to_date('28/02/2011', 'dd/mm/yyyy'), 826);
INSERT INTO s_salary values(196, 18, to_date('30/03/2011', 'dd/mm/yyyy'), 750);
INSERT INTO s_salary values(197, 18, to_date('30/04/2011', 'dd/mm/yyyy'), 882);
INSERT INTO s_salary values(198, 18, to_date('30/05/2011', 'dd/mm/yyyy'), 787);
INSERT INTO s_salary values(199, 18, to_date('30/06/2011', 'dd/mm/yyyy'), 880);
INSERT INTO s_salary values(200, 18, to_date('30/07/2011', 'dd/mm/yyyy'), 782);
INSERT INTO s_salary values(201, 18, to_date('30/08/2011', 'dd/mm/yyyy'), 817);
INSERT INTO s_salary values(202, 18, to_date('30/09/2011', 'dd/mm/yyyy'), 700);
INSERT INTO s_salary values(203, 18, to_date('30/10/2011', 'dd/mm/yyyy'), 810);
INSERT INTO s_salary values(204, 18, to_date('30/11/2011', 'dd/mm/yyyy'), 724);
INSERT INTO s_salary values(205, 18, to_date('30/12/2011', 'dd/mm/yyyy'), 801);


INSERT INTO s_salary values(206, 19, to_date('30/01/2011', 'dd/mm/yyyy'), 700);
INSERT INTO s_salary values(207, 19, to_date('28/02/2011', 'dd/mm/yyyy'), 826);
INSERT INTO s_salary values(208, 19, to_date('30/03/2011', 'dd/mm/yyyy'), 750);
INSERT INTO s_salary values(209, 19, to_date('30/04/2011', 'dd/mm/yyyy'), 882);
INSERT INTO s_salary values(210, 19, to_date('30/05/2011', 'dd/mm/yyyy'), 787);
INSERT INTO s_salary values(211, 19, to_date('30/06/2011', 'dd/mm/yyyy'), 880);
INSERT INTO s_salary values(212, 19, to_date('30/07/2011', 'dd/mm/yyyy'), 782);
INSERT INTO s_salary values(213, 19, to_date('30/08/2011', 'dd/mm/yyyy'), 817);
INSERT INTO s_salary values(214, 19, to_date('30/09/2011', 'dd/mm/yyyy'), 700);
INSERT INTO s_salary values(215, 19, to_date('30/10/2011', 'dd/mm/yyyy'), 810);
INSERT INTO s_salary values(216, 19, to_date('30/11/2011', 'dd/mm/yyyy'), 724);
INSERT INTO s_salary values(217, 19, to_date('30/12/2011', 'dd/mm/yyyy'), 801);

INSERT INTO s_salary values(218, 20, to_date('30/01/2011', 'dd/mm/yyyy'), 700);
INSERT INTO s_salary values(219, 20, to_date('28/02/2011', 'dd/mm/yyyy'), 826);
INSERT INTO s_salary values(220, 20, to_date('30/03/2011', 'dd/mm/yyyy'), 750);
INSERT INTO s_salary values(221, 20, to_date('30/04/2011', 'dd/mm/yyyy'), 882);
INSERT INTO s_salary values(222, 20, to_date('30/05/2011', 'dd/mm/yyyy'), 787);
INSERT INTO s_salary values(223, 20, to_date('30/06/2011', 'dd/mm/yyyy'), 880);
INSERT INTO s_salary values(224, 20, to_date('30/07/2011', 'dd/mm/yyyy'), 782);
INSERT INTO s_salary values(225, 20, to_date('30/08/2011', 'dd/mm/yyyy'), 817);
INSERT INTO s_salary values(226, 20, to_date('30/09/2011', 'dd/mm/yyyy'), 700);
INSERT INTO s_salary values(227, 20, to_date('30/10/2011', 'dd/mm/yyyy'), 810);
INSERT INTO s_salary values(228, 20, to_date('30/11/2011', 'dd/mm/yyyy'), 724);
INSERT INTO s_salary values(229, 20, to_date('30/12/2011', 'dd/mm/yyyy'), 801);



INSERT INTO s_salary values(230, 21, to_date('30/01/2011', 'dd/mm/yyyy'), 700);
INSERT INTO s_salary values(231, 21, to_date('28/02/2011', 'dd/mm/yyyy'), 826);
INSERT INTO s_salary values(232, 21, to_date('30/03/2011', 'dd/mm/yyyy'), 750);
INSERT INTO s_salary values(233, 21, to_date('30/04/2011', 'dd/mm/yyyy'), 882);
INSERT INTO s_salary values(234, 21, to_date('30/05/2011', 'dd/mm/yyyy'), 787);
INSERT INTO s_salary values(235, 21, to_date('30/06/2011', 'dd/mm/yyyy'), 880);
INSERT INTO s_salary values(236, 21, to_date('30/07/2011', 'dd/mm/yyyy'), 782);
INSERT INTO s_salary values(237, 21, to_date('30/08/2011', 'dd/mm/yyyy'), 817);
INSERT INTO s_salary values(238, 21, to_date('30/09/2011', 'dd/mm/yyyy'), 700);
INSERT INTO s_salary values(239, 21, to_date('30/10/2011', 'dd/mm/yyyy'), 810);
INSERT INTO s_salary values(240, 21, to_date('30/11/2011', 'dd/mm/yyyy'), 724);
INSERT INTO s_salary values(241, 21, to_date('30/12/2011', 'dd/mm/yyyy'), 801);



INSERT INTO s_salary values(242, 22, to_date('30/01/2011', 'dd/mm/yyyy'), 700);
INSERT INTO s_salary values(243, 22, to_date('28/02/2011', 'dd/mm/yyyy'), 826);
INSERT INTO s_salary values(244, 22, to_date('30/03/2011', 'dd/mm/yyyy'), 750);
INSERT INTO s_salary values(245, 22, to_date('30/04/2011', 'dd/mm/yyyy'), 882);
INSERT INTO s_salary values(246, 22, to_date('30/05/2011', 'dd/mm/yyyy'), 787);
INSERT INTO s_salary values(247, 22, to_date('30/06/2011', 'dd/mm/yyyy'), 880);
INSERT INTO s_salary values(248, 22, to_date('30/07/2011', 'dd/mm/yyyy'), 782);
INSERT INTO s_salary values(249, 22, to_date('30/08/2011', 'dd/mm/yyyy'), 817);
INSERT INTO s_salary values(250, 22, to_date('30/09/2011', 'dd/mm/yyyy'), 700);
INSERT INTO s_salary values(251, 22, to_date('30/10/2011', 'dd/mm/yyyy'), 810);
INSERT INTO s_salary values(252, 22, to_date('30/11/2011', 'dd/mm/yyyy'), 724);
INSERT INTO s_salary values(253, 22, to_date('30/12/2011', 'dd/mm/yyyy'), 801);


INSERT INTO s_salary values(254, 23, to_date('30/01/2011', 'dd/mm/yyyy'), 700);
INSERT INTO s_salary values(255, 23, to_date('28/02/2011', 'dd/mm/yyyy'), 826);
INSERT INTO s_salary values(256, 23, to_date('30/03/2011', 'dd/mm/yyyy'), 750);
INSERT INTO s_salary values(257, 23, to_date('30/04/2011', 'dd/mm/yyyy'), 882);
INSERT INTO s_salary values(258, 23, to_date('30/05/2011', 'dd/mm/yyyy'), 787);
INSERT INTO s_salary values(259, 23, to_date('30/06/2011', 'dd/mm/yyyy'), 880);
INSERT INTO s_salary values(260, 23, to_date('30/07/2011', 'dd/mm/yyyy'), 782);
INSERT INTO s_salary values(261, 23, to_date('30/08/2011', 'dd/mm/yyyy'), 817);
INSERT INTO s_salary values(262, 23, to_date('30/09/2011', 'dd/mm/yyyy'), 700);
INSERT INTO s_salary values(263, 23, to_date('30/10/2011', 'dd/mm/yyyy'), 810);
INSERT INTO s_salary values(264, 23, to_date('30/11/2011', 'dd/mm/yyyy'), 724);
INSERT INTO s_salary values(265, 23, to_date('30/12/2011', 'dd/mm/yyyy'), 801);

INSERT INTO s_salary values(266, 24, to_date('30/01/2011', 'dd/mm/yyyy'), 700);
INSERT INTO s_salary values(267, 24, to_date('28/02/2011', 'dd/mm/yyyy'), 826);
INSERT INTO s_salary values(268, 24, to_date('30/03/2011', 'dd/mm/yyyy'), 750);
INSERT INTO s_salary values(269, 24, to_date('30/04/2011', 'dd/mm/yyyy'), 882);
INSERT INTO s_salary values(270, 24, to_date('30/05/2011', 'dd/mm/yyyy'), 787);
INSERT INTO s_salary values(271, 24, to_date('30/06/2011', 'dd/mm/yyyy'), 880);
INSERT INTO s_salary values(272, 24, to_date('30/07/2011', 'dd/mm/yyyy'), 782);
INSERT INTO s_salary values(273, 24, to_date('30/08/2011', 'dd/mm/yyyy'), 817);
INSERT INTO s_salary values(274, 24, to_date('30/09/2011', 'dd/mm/yyyy'), 700);
INSERT INTO s_salary values(275, 24, to_date('30/10/2011', 'dd/mm/yyyy'), 810);
INSERT INTO s_salary values(276, 24, to_date('30/11/2011', 'dd/mm/yyyy'), 724);
INSERT INTO s_salary values(277, 24, to_date('30/12/2011', 'dd/mm/yyyy'), 801);

INSERT INTO s_salary values(278, 25, to_date('30/01/2011', 'dd/mm/yyyy'), 700);
INSERT INTO s_salary values(279, 25, to_date('28/02/2011', 'dd/mm/yyyy'), 826);
INSERT INTO s_salary values(280, 25, to_date('30/03/2011', 'dd/mm/yyyy'), 750);
INSERT INTO s_salary values(281, 25, to_date('30/04/2011', 'dd/mm/yyyy'), 882);
INSERT INTO s_salary values(282, 25, to_date('30/05/2011', 'dd/mm/yyyy'), 787);
INSERT INTO s_salary values(283, 25, to_date('30/06/2011', 'dd/mm/yyyy'), 880);
INSERT INTO s_salary values(284, 25, to_date('30/07/2011', 'dd/mm/yyyy'), 782);
INSERT INTO s_salary values(285, 25, to_date('30/08/2011', 'dd/mm/yyyy'), 817);
INSERT INTO s_salary values(286, 25, to_date('30/09/2011', 'dd/mm/yyyy'), 700);
INSERT INTO s_salary values(287, 25, to_date('30/10/2011', 'dd/mm/yyyy'), 810);
INSERT INTO s_salary values(288, 25, to_date('30/11/2011', 'dd/mm/yyyy'), 724);
INSERT INTO s_salary values(289, 25, to_date('30/12/2011', 'dd/mm/yyyy'), 801);

COMMIT;


COMMIT;

Rem Add foreign key constraints.

ALTER TABLE s_dept 
   ADD CONSTRAINT s_dept_region_id_fk
   FOREIGN KEY (region_id) REFERENCES s_region (id);
ALTER TABLE s_emp 
   ADD CONSTRAINT s_emp_manager_id_fk
   FOREIGN KEY (manager_id) REFERENCES s_emp (id);
ALTER TABLE s_emp 
   ADD CONSTRAINT s_emp_dept_id_fk
   FOREIGN KEY (region_id,dept_id) REFERENCES s_dept (region_id, id);
ALTER TABLE s_emp 
   ADD CONSTRAINT s_emp_title_fk
   FOREIGN KEY (title) REFERENCES s_title (title);
ALTER TABLE s_customer 
   ADD CONSTRAINT s_sales_rep_id_fk
   FOREIGN KEY (sales_rep_id) REFERENCES s_emp (id);
ALTER TABLE s_customer 
   ADD CONSTRAINT s_customer_region_id_fk
   FOREIGN KEY (region_id) REFERENCES s_region (id);
ALTER TABLE s_ord 
   ADD CONSTRAINT s_ord_customer_id_fk
   FOREIGN KEY (customer_id) REFERENCES s_customer (id);
ALTER TABLE s_ord 
   ADD CONSTRAINT s_ord_sales_rep_id_fk
   FOREIGN KEY (sales_rep_id) REFERENCES s_emp (id);
ALTER TABLE s_item 
   ADD CONSTRAINT s_item_ord_id_fk
   FOREIGN KEY (ord_id) REFERENCES s_ord (id);
ALTER TABLE s_item 
   ADD CONSTRAINT s_item_product_id_fk
   FOREIGN KEY (product_id) REFERENCES s_product (id);
ALTER TABLE s_warehouse 
   ADD CONSTRAINT s_warehouse_manager_id_fk
   FOREIGN KEY (manager_id) REFERENCES s_emp (id);
ALTER TABLE s_warehouse 
   ADD CONSTRAINT s_warehouse_region_id_fk
   FOREIGN KEY (region_id) REFERENCES s_region (id);
ALTER TABLE s_inventory 
   ADD CONSTRAINT s_inventory_product_id_fk
   FOREIGN KEY (product_id) REFERENCES s_product (id);
ALTER TABLE s_inventory 
   ADD CONSTRAINT s_inventory_warehouse_id_fk
   FOREIGN KEY (warehouse_id) REFERENCES s_warehouse (id);


CREATE INDEX s_dept_idx on s_dept(region_id);

CREATE INDEX s_emp_dep_idx on s_emp(region_id, dept_id);
CREATE INDEX s_emp_tit_idx on s_emp(title);
CREATE INDEX s_emp_man_idx on s_emp(manager_id);

CREATE INDEX s_customer_sal_idx on s_customer(sales_rep_id);
CREATE INDEX s_customer_reg_idx on s_customer(region_id);

CREATE INDEX s_ord_cus_idx on s_ord(customer_id);
CREATE INDEX s_ord_sal_idx on s_ord(sales_rep_id);

CREATE INDEX s_item_ord_idx on s_item(ord_id);
CREATE INDEX s_item_pro_idx on s_item(product_id);

CREATE INDEX s_warehouse_man_idx on s_warehouse(manager_id);
CREATE INDEX s_warehouse_reg_idx on s_warehouse(region_id);

CREATE INDEX s_inventory_pro_idx on s_inventory(product_id);
CREATE INDEX s_inventory_war_idx on s_inventory(warehouse_id);

CREATE INDEX s_salary_id_idx on s_salary(id);


alter table s_ord  add stock_clerk number(7);
update s_ord set stock_clerk = 17 where id=100;
update s_ord set stock_clerk = 17 where id=101;
update s_ord set stock_clerk = 17 where id=102;
update s_ord set stock_clerk = 18 where id=103;
update s_ord set stock_clerk = 18 where id=97;
update s_ord set stock_clerk = 18 where id=98;
update s_ord set stock_clerk = 23 where id=106;
update s_ord set stock_clerk = 23 where id=107;
update s_ord set stock_clerk = 24 where id=108;
update s_ord set stock_clerk = 24 where id=109;
update s_ord set stock_clerk = 24 where id=110;
update s_ord set stock_clerk = 25 where id=111;
update s_ord set stock_clerk = 25 where id=112;
update s_ord set stock_clerk = 25 where id=113;

alter table s_ord add constraint stock_clerk_fk  foreign key (stock_clerk) references s_emp; 

CREATE INDEX stock_clerk_idx on s_ord(stock_clerk);







commit;


