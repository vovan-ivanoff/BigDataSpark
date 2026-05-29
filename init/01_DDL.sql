create table dim_customer (
    id serial primary key,
    first_name text,
    last_name text,
    age int,
    email text,
    country text,
    postal_code text,
    pet_type text,
    pet_name text,
    pet_breed text
);

create table dim_seller (
    id serial primary key,
    first_name text,
    last_name text,
    email text,
    country text,
    postal_code text
);

create table dim_store (
    id serial primary key,
    name text,
    location text,
    city text,
    state text,
    country text,
    phone text,
    email text
);

create table dim_supplier (
    id serial primary key,
    name text,
    contact text,
    email text,
    phone text,
    address text,
    city text,
    country text
);

create table dim_product (
    id serial primary key,
    product_name text,
    product_category text,
    product_price numeric(10,2),
    product_quantity int,
    pet_category text,
    product_weight numeric(10,2),
    product_color text,
    product_size text,
    product_brand text,
    product_material text,
    product_description text,
    product_rating numeric(3,1),
    product_reviews int,
    product_release_date text,
    product_expiry_date text,
    store_id int,
    supplier_id int,

    constraint fk_product_store
        foreign key (store_id) references dim_store(id),

    constraint fk_product_supplier
        foreign key (supplier_id) references dim_supplier(id)
);


create table fact_sales (
    id serial primary key,
    sale_date text,
    customer_id int,
    seller_id int,
    product_id int,
    sale_quantity int,
    sale_total_price numeric(10,2),

    constraint fk_sales_customer
        foreign key (customer_id) references dim_customer(id),

    constraint fk_sales_seller
        foreign key (seller_id) references dim_seller(id),

    constraint fk_sales_product
        foreign key (product_id) references dim_product(id)
);