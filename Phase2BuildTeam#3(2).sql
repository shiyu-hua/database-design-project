/* Phase 2 - Building the Database */
/* Team # ___3___ */

/* Participating member names: first and last Jihui Liu, Shiyu Hua, Shuyi Wu */
/* Team Leader Name: Jihui Liu */

/* drop tables */
Drop table Chef cascade constraints;
Drop table Show cascade constraints;
Drop table Product cascade constraints;
Drop table Review cascade constraints;
Drop table Recipe cascade constraints;
Drop table Ingredient cascade constraints;
Drop table Restaurant cascade constraints;

/* SQL to Create Table Chef */ 
/* Place SQL below */

CREATE TABLE Chef
(Chef_id number(2) NOT NULL,
Chef_name varchar2(50) NOT NULL,
Chef_bio varchar2(2000), 
Chef_website_address varchar2(200),
CONSTRAINT constrChef_PK PRIMARY KEY(Chef_id));


/* SQL to Create Table Product */
/* Place SQL below */


CREATE TABLE Product
(Chef_id number(2),
product_id number(3) NOT NULL,
product_category varchar2(15) ,
product_name varchar2(30) ,
product_seller varchar2(30) ,
price number(8,2) NOT NULL,
CONSTRAINT product_pk PRIMARY KEY (product_id),
CONSTRAINT chef_fk FOREIGN KEY (chef_id) REFERENCES chef(chef_id));


/* SQL to Create Table Show */
/* Place SQL below */

CREATE TABLE Show
 (Chef_id number(2),
 Show_number number(4) NOT NULL, 
    Show_name varchar2(50),
    Season_number number(2), 
    Show_year number(4),
    Show_aired_on date,
CONSTRAINT show_pk PRIMARY KEY (Show_number),  
CONSTRAINT chef_fk1 FOREIGN KEY (Chef_id) REFERENCES  Chef(Chef_id));


/* SQL to Create Table Restaurant */
/* Place SQL below */


CREATE TABLE Restaurant
 (Show_number number(4) ,
 Restaurant_id number(4) NOT NULL, 
    Restaurant_name varchar2(50),
    Street varchar2(50), 
    City varchar2(100), 
    State varchar2(20), 
    Zip varchar2(20), 
    Country varchar2(20), 
    Restaurant_phone varchar2(50),
    Restaurant_notes varchar2(500),
    Thump_up number(4), 
    Thump_down number(2),  
CONSTRAINT restaurant_pk PRIMARY KEY (Restaurant_id),
CONSTRAINT show_fk FOREIGN KEY (show_number) REFERENCES Show(show_number));


/* SQL to Create Table Review */
/* Place SQL below */


CREATE TABLE review
(restaurant_id number(4),
review_id number(5)NOT NULL,
rating number(3) ,
number_of_rating number(3) ,
reviewer varchar2(30),
daysago number(6),
review_description varchar2(2000),
review_stars number(5),
CONSTRAINT review_pk PRIMARY KEY (review_id),
CONSTRAINT review_fk FOREIGN KEY (restaurant_id) REFERENCES  restaurant(restaurant_id));


/* SQL to Create Table Recipe */
/* Place SQL below */


CREATE TABLE recipe
(restaurant_id number(4),
recipe_id number(3),
recipe_name varchar2(100),
recipe_level varchar2(50),
preptime varchar2(100), 
cooking_time varchar2(100), 
total_cooking_time varchar(100), 
recipe_servings varchar2(100),
recipe_comment varchar2(2000),
CONSTRAINT recipe_pk PRIMARY KEY (recipe_id),
CONSTRAINT rest_fk FOREIGN KEY (restaurant_id) REFERENCES restaurant(restaurant_id));

/* SQL to Create Table Ingredient */
/* Place SQL below */

CREATE TABLE ingredient
(recipe_id number(3),
ingredient_id number (3),
ingredient_description varchar2(500), 
direction varchar2(300),
CONSTRAINT ingredient_pk PRIMARY KEY (ingredient_id),
CONSTRAINT recipe_fk FOREIGN KEY (recipe_id) REFERENCES recipe(recipe_id));



/* End of Script */