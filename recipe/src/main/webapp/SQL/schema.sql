DROP TABLE IF EXISTS RECIPE;
CREATE TABLE RECIPE
(
    recipe_id   VARCHAR(255)    NOT NULL,
    title       VARCHAR(255)    NOT NULL,
    img_url     VARCHAR(255)    NOT NULL,
    register_id VARCHAR(255)    NOT NULL,
    hits        number,
    PRIMARY KEY (recipe_id)
);

DROP TABLE IF EXISTS CUSTOMER;
CREATE TABLE CUSTOMER
(
    customer_id VARCHAR(255)    NOT NULL,
    name        VARCHAR(255)    NOT NULL,
    PRIMARY KEY (customer_id)
);

DROP TABLE IF EXISTS FAVORITE;
CREATE TABLE FAVORITE
(
    recipe_id   VARCHAR(255)    NOT NULL,
    customer_id VARCHAR(255)    NOT NULL,
    is_favorite VARCHAR(1) DEFAULT 'Y',
    PRIMARY KEY (recipe_id, customer_id)
);