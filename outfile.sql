--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.1
-- Dumped by pg_dump version 9.5.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: accounts; Type: TABLE; Schema: public; Owner: paulmcguane
--

CREATE TABLE accounts (
    id integer NOT NULL,
    merchant_id integer,
    account_name character varying,
    bsb integer,
    account_number integer,
    account_type character varying,
    charge numeric(8,2) DEFAULT 4.4 NOT NULL,
    active boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE accounts OWNER TO paulmcguane;

--
-- Name: accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: paulmcguane
--

CREATE SEQUENCE accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE accounts_id_seq OWNER TO paulmcguane;

--
-- Name: accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paulmcguane
--

ALTER SEQUENCE accounts_id_seq OWNED BY accounts.id;


--
-- Name: address_types; Type: TABLE; Schema: public; Owner: paulmcguane
--

CREATE TABLE address_types (
    id integer NOT NULL,
    name character varying,
    description character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE address_types OWNER TO paulmcguane;

--
-- Name: address_types_id_seq; Type: SEQUENCE; Schema: public; Owner: paulmcguane
--

CREATE SEQUENCE address_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE address_types_id_seq OWNER TO paulmcguane;

--
-- Name: address_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paulmcguane
--

ALTER SEQUENCE address_types_id_seq OWNED BY address_types.id;


--
-- Name: addresses; Type: TABLE; Schema: public; Owner: paulmcguane
--

CREATE TABLE addresses (
    id integer NOT NULL,
    address_type_id integer,
    first_name character varying,
    last_name character varying,
    addressable_type character varying,
    addressable_id integer,
    address1 character varying,
    address2 character varying,
    city character varying,
    state_id integer,
    state_name character varying,
    zip_code character varying,
    phone_id integer,
    alternative_phone character varying,
    "default" boolean,
    billing_default boolean,
    active boolean,
    country_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    latitude double precision,
    longitude double precision
);


ALTER TABLE addresses OWNER TO paulmcguane;

--
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: paulmcguane
--

CREATE SEQUENCE addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE addresses_id_seq OWNER TO paulmcguane;

--
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paulmcguane
--

ALTER SEQUENCE addresses_id_seq OWNED BY addresses.id;


--
-- Name: cart_items; Type: TABLE; Schema: public; Owner: paulmcguane
--

CREATE TABLE cart_items (
    id integer NOT NULL,
    user_id integer,
    cart_id integer,
    variant_id integer NOT NULL,
    quantity integer DEFAULT 1,
    item_type_id integer NOT NULL,
    active boolean DEFAULT true,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE cart_items OWNER TO paulmcguane;

--
-- Name: cart_items_id_seq; Type: SEQUENCE; Schema: public; Owner: paulmcguane
--

CREATE SEQUENCE cart_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cart_items_id_seq OWNER TO paulmcguane;

--
-- Name: cart_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paulmcguane
--

ALTER SEQUENCE cart_items_id_seq OWNED BY cart_items.id;


--
-- Name: carts; Type: TABLE; Schema: public; Owner: paulmcguane
--

CREATE TABLE carts (
    id integer NOT NULL,
    user_id integer,
    customer_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE carts OWNER TO paulmcguane;

--
-- Name: carts_id_seq; Type: SEQUENCE; Schema: public; Owner: paulmcguane
--

CREATE SEQUENCE carts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE carts_id_seq OWNER TO paulmcguane;

--
-- Name: carts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paulmcguane
--

ALTER SEQUENCE carts_id_seq OWNED BY carts.id;


--
-- Name: countries; Type: TABLE; Schema: public; Owner: paulmcguane
--

CREATE TABLE countries (
    id integer NOT NULL,
    name character varying(50),
    abbreviation character varying(3),
    active boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE countries OWNER TO paulmcguane;

--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: paulmcguane
--

CREATE SEQUENCE countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE countries_id_seq OWNER TO paulmcguane;

--
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paulmcguane
--

ALTER SEQUENCE countries_id_seq OWNED BY countries.id;


--
-- Name: coupons; Type: TABLE; Schema: public; Owner: paulmcguane
--

CREATE TABLE coupons (
    id integer NOT NULL,
    type character varying(255) NOT NULL,
    code character varying(255) NOT NULL,
    amount numeric(8,2) DEFAULT 0.0,
    minimum_value numeric(8,2),
    percent integer,
    description text,
    combine boolean DEFAULT false,
    starts_at timestamp without time zone,
    expires_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE coupons OWNER TO paulmcguane;

--
-- Name: coupons_id_seq; Type: SEQUENCE; Schema: public; Owner: paulmcguane
--

CREATE SEQUENCE coupons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE coupons_id_seq OWNER TO paulmcguane;

--
-- Name: coupons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paulmcguane
--

ALTER SEQUENCE coupons_id_seq OWNED BY coupons.id;


--
-- Name: friendly_id_slugs; Type: TABLE; Schema: public; Owner: paulmcguane
--

CREATE TABLE friendly_id_slugs (
    id integer NOT NULL,
    slug character varying NOT NULL,
    sluggable_id integer NOT NULL,
    sluggable_type character varying(50),
    scope character varying,
    created_at timestamp without time zone
);


ALTER TABLE friendly_id_slugs OWNER TO paulmcguane;

--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE; Schema: public; Owner: paulmcguane
--

CREATE SEQUENCE friendly_id_slugs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE friendly_id_slugs_id_seq OWNER TO paulmcguane;

--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paulmcguane
--

ALTER SEQUENCE friendly_id_slugs_id_seq OWNED BY friendly_id_slugs.id;


--
-- Name: item_types; Type: TABLE; Schema: public; Owner: paulmcguane
--

CREATE TABLE item_types (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE item_types OWNER TO paulmcguane;

--
-- Name: item_types_id_seq; Type: SEQUENCE; Schema: public; Owner: paulmcguane
--

CREATE SEQUENCE item_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE item_types_id_seq OWNER TO paulmcguane;

--
-- Name: item_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paulmcguane
--

ALTER SEQUENCE item_types_id_seq OWNED BY item_types.id;


--
-- Name: merchant_products; Type: TABLE; Schema: public; Owner: paulmcguane
--

CREATE TABLE merchant_products (
    id integer NOT NULL,
    product_id integer,
    merchant_id integer,
    active boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE merchant_products OWNER TO paulmcguane;

--
-- Name: merchant_products_id_seq; Type: SEQUENCE; Schema: public; Owner: paulmcguane
--

CREATE SEQUENCE merchant_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE merchant_products_id_seq OWNER TO paulmcguane;

--
-- Name: merchant_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paulmcguane
--

ALTER SEQUENCE merchant_products_id_seq OWNED BY merchant_products.id;


--
-- Name: merchants; Type: TABLE; Schema: public; Owner: paulmcguane
--

CREATE TABLE merchants (
    id integer NOT NULL,
    name character varying,
    email character varying,
    account_id integer,
    permalink character varying(255),
    available_at timestamp without time zone,
    deleted_at timestamp without time zone,
    meta_keywords character varying(255),
    meta_description character varying(255),
    featured boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    latitude double precision,
    longitude double precision
);


ALTER TABLE merchants OWNER TO paulmcguane;

--
-- Name: merchants_id_seq; Type: SEQUENCE; Schema: public; Owner: paulmcguane
--

CREATE SEQUENCE merchants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE merchants_id_seq OWNER TO paulmcguane;

--
-- Name: merchants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paulmcguane
--

ALTER SEQUENCE merchants_id_seq OWNED BY merchants.id;


--
-- Name: order_items; Type: TABLE; Schema: public; Owner: paulmcguane
--

CREATE TABLE order_items (
    id integer NOT NULL,
    price numeric(8,2),
    total numeric(8,2),
    order_id integer NOT NULL,
    variant_id integer NOT NULL,
    state character varying(255) NOT NULL,
    tax_rate_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE order_items OWNER TO paulmcguane;

--
-- Name: order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: paulmcguane
--

CREATE SEQUENCE order_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE order_items_id_seq OWNER TO paulmcguane;

--
-- Name: order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paulmcguane
--

ALTER SEQUENCE order_items_id_seq OWNED BY order_items.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: paulmcguane
--

CREATE TABLE orders (
    id integer NOT NULL,
    number character varying(255),
    ip_address character varying(255),
    email character varying(255),
    state character varying,
    user_id integer,
    merchant_id integer,
    bill_address_id integer,
    order_status_id smallint,
    coupon_id integer,
    active boolean DEFAULT true NOT NULL,
    shipped boolean DEFAULT false NOT NULL,
    calculated_at timestamp without time zone,
    completed_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE orders OWNER TO paulmcguane;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: paulmcguane
--

CREATE SEQUENCE orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE orders_id_seq OWNER TO paulmcguane;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paulmcguane
--

ALTER SEQUENCE orders_id_seq OWNED BY orders.id;


--
-- Name: payment_methods; Type: TABLE; Schema: public; Owner: paulmcguane
--

CREATE TABLE payment_methods (
    id integer NOT NULL,
    user_id integer,
    customer_cim_id integer,
    token character varying,
    address_id integer,
    address_cim_id character varying,
    "default" boolean
);


ALTER TABLE payment_methods OWNER TO paulmcguane;

--
-- Name: payment_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: paulmcguane
--

CREATE SEQUENCE payment_methods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE payment_methods_id_seq OWNER TO paulmcguane;

--
-- Name: payment_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paulmcguane
--

ALTER SEQUENCE payment_methods_id_seq OWNED BY payment_methods.id;


--
-- Name: phone_types; Type: TABLE; Schema: public; Owner: paulmcguane
--

CREATE TABLE phone_types (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE phone_types OWNER TO paulmcguane;

--
-- Name: phone_types_id_seq; Type: SEQUENCE; Schema: public; Owner: paulmcguane
--

CREATE SEQUENCE phone_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE phone_types_id_seq OWNER TO paulmcguane;

--
-- Name: phone_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paulmcguane
--

ALTER SEQUENCE phone_types_id_seq OWNED BY phone_types.id;


--
-- Name: phones; Type: TABLE; Schema: public; Owner: paulmcguane
--

CREATE TABLE phones (
    id integer NOT NULL,
    phone_type_id integer,
    number character varying,
    phoneable_type character varying,
    phoneable_id integer,
    "primary" boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE phones OWNER TO paulmcguane;

--
-- Name: phones_id_seq; Type: SEQUENCE; Schema: public; Owner: paulmcguane
--

CREATE SEQUENCE phones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE phones_id_seq OWNER TO paulmcguane;

--
-- Name: phones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paulmcguane
--

ALTER SEQUENCE phones_id_seq OWNED BY phones.id;


--
-- Name: @product_attributes; Type: TABLE; Schema: public; Owner: paulmcguane
--

CREATE TABLE product_properties (
    id integer NOT NULL,
    product_id integer NOT NULL,
    property_id integer NOT NULL,
    description character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE product_properties OWNER TO paulmcguane;

--
-- Name: product_properties_id_seq; Type: SEQUENCE; Schema: public; Owner: paulmcguane
--

CREATE SEQUENCE product_properties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE product_properties_id_seq OWNER TO paulmcguane;

--
-- Name: product_properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paulmcguane
--

ALTER SEQUENCE product_properties_id_seq OWNED BY product_properties.id;


--
-- Name: product_types; Type: TABLE; Schema: public; Owner: paulmcguane
--

CREATE TABLE product_types (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    active boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE product_types OWNER TO paulmcguane;

--
-- Name: product_types_id_seq; Type: SEQUENCE; Schema: public; Owner: paulmcguane
--

CREATE SEQUENCE product_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE product_types_id_seq OWNER TO paulmcguane;

--
-- Name: product_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paulmcguane
--

ALTER SEQUENCE product_types_id_seq OWNED BY product_types.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: paulmcguane
--

CREATE TABLE products (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    product_keywords text,
    product_type_id integer NOT NULL,
    prototype_id integer,
    permalink character varying(255),
    available_at timestamp without time zone,
    deleted_at timestamp without time zone,
    meta_keywords character varying(255),
    meta_description character varying(255),
    featured boolean DEFAULT false,
    description_markup text,
    brand_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE products OWNER TO paulmcguane;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: paulmcguane
--

CREATE SEQUENCE products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE products_id_seq OWNER TO paulmcguane;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paulmcguane
--

ALTER SEQUENCE products_id_seq OWNED BY products.id;


--
-- Name: properties; Type: TABLE; Schema: public; Owner: paulmcguane
--

CREATE TABLE properties (
    id integer NOT NULL,
    display_name character varying(255) NOT NULL,
    identifying_name character varying(255),
    active boolean DEFAULT true,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE properties OWNER TO paulmcguane;

--
-- Name: properties_id_seq; Type: SEQUENCE; Schema: public; Owner: paulmcguane
--

CREATE SEQUENCE properties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE properties_id_seq OWNER TO paulmcguane;

--
-- Name: properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paulmcguane
--

ALTER SEQUENCE properties_id_seq OWNED BY properties.id;


--
-- Name: prototype_properties; Type: TABLE; Schema: public; Owner: paulmcguane
--

CREATE TABLE prototype_properties (
    id integer NOT NULL,
    prototype_id integer,
    property_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE prototype_properties OWNER TO paulmcguane;

--
-- Name: prototype_properties_id_seq; Type: SEQUENCE; Schema: public; Owner: paulmcguane
--

CREATE SEQUENCE prototype_properties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE prototype_properties_id_seq OWNER TO paulmcguane;

--
-- Name: prototype_properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paulmcguane
--

ALTER SEQUENCE prototype_properties_id_seq OWNED BY prototype_properties.id;


--
-- Name: prototypes; Type: TABLE; Schema: public; Owner: paulmcguane
--

CREATE TABLE prototypes (
    id integer NOT NULL,
    name character varying,
    active boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE prototypes OWNER TO paulmcguane;

--
-- Name: prototypes_id_seq; Type: SEQUENCE; Schema: public; Owner: paulmcguane
--

CREATE SEQUENCE prototypes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE prototypes_id_seq OWNER TO paulmcguane;

--
-- Name: prototypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paulmcguane
--

ALTER SEQUENCE prototypes_id_seq OWNED BY prototypes.id;


--
-- Name: referral_bonus; Type: TABLE; Schema: public; Owner: paulmcguane
--

CREATE TABLE referral_bonus (
    id integer NOT NULL,
    amount integer,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE referral_bonus OWNER TO paulmcguane;

--
-- Name: referral_bonus_id_seq; Type: SEQUENCE; Schema: public; Owner: paulmcguane
--

CREATE SEQUENCE referral_bonus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE referral_bonus_id_seq OWNER TO paulmcguane;

--
-- Name: referral_bonus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paulmcguane
--

ALTER SEQUENCE referral_bonus_id_seq OWNED BY referral_bonus.id;


--
-- Name: referral_programs; Type: TABLE; Schema: public; Owner: paulmcguane
--

CREATE TABLE referral_programs (
    id integer NOT NULL,
    active boolean,
    description text,
    name character varying,
    referral_bonus_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE referral_programs OWNER TO paulmcguane;

--
-- Name: referral_programs_id_seq; Type: SEQUENCE; Schema: public; Owner: paulmcguane
--

CREATE SEQUENCE referral_programs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE referral_programs_id_seq OWNER TO paulmcguane;

--
-- Name: referral_programs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paulmcguane
--

ALTER SEQUENCE referral_programs_id_seq OWNED BY referral_programs.id;


--
-- Name: referral_types; Type: TABLE; Schema: public; Owner: paulmcguane
--

CREATE TABLE referral_types (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE referral_types OWNER TO paulmcguane;

--
-- Name: referral_types_id_seq; Type: SEQUENCE; Schema: public; Owner: paulmcguane
--

CREATE SEQUENCE referral_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE referral_types_id_seq OWNER TO paulmcguane;

--
-- Name: referral_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paulmcguane
--

ALTER SEQUENCE referral_types_id_seq OWNED BY referral_types.id;


--
-- Name: referrals; Type: TABLE; Schema: public; Owner: paulmcguane
--

CREATE TABLE referrals (
    id integer NOT NULL,
    applied boolean DEFAULT false,
    clicked_at timestamp without time zone,
    email character varying(255) NOT NULL,
    name character varying(255),
    purchased_at timestamp without time zone,
    referral_program_id integer NOT NULL,
    referral_type_id integer NOT NULL,
    referral_user_id integer,
    referring_user_id integer NOT NULL,
    registered_at timestamp without time zone,
    sent_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE referrals OWNER TO paulmcguane;

--
-- Name: referrals_id_seq; Type: SEQUENCE; Schema: public; Owner: paulmcguane
--

CREATE SEQUENCE referrals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE referrals_id_seq OWNER TO paulmcguane;

--
-- Name: referrals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paulmcguane
--

ALTER SEQUENCE referrals_id_seq OWNED BY referrals.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: paulmcguane
--

CREATE TABLE roles (
    id integer NOT NULL,
    name character varying,
    resource_id integer,
    resource_type character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE roles OWNER TO paulmcguane;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: paulmcguane
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE roles_id_seq OWNER TO paulmcguane;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paulmcguane
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: paulmcguane
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO paulmcguane;

--
-- Name: states; Type: TABLE; Schema: public; Owner: paulmcguane
--

CREATE TABLE states (
    id integer NOT NULL,
    name character varying,
    abbreviation character varying,
    described_as character varying,
    country_id integer,
    shipping_zone_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE states OWNER TO paulmcguane;

--
-- Name: states_id_seq; Type: SEQUENCE; Schema: public; Owner: paulmcguane
--

CREATE SEQUENCE states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE states_id_seq OWNER TO paulmcguane;

--
-- Name: states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paulmcguane
--

ALTER SEQUENCE states_id_seq OWNED BY states.id;


--
-- Name: store_credits; Type: TABLE; Schema: public; Owner: paulmcguane
--

CREATE TABLE store_credits (
    id integer NOT NULL,
    amount numeric(8,2) DEFAULT 0.0,
    user_id integer NOT NULL,
    expire_at timestamp without time zone,
    last_expired_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE store_credits OWNER TO paulmcguane;

--
-- Name: store_credits_id_seq; Type: SEQUENCE; Schema: public; Owner: paulmcguane
--

CREATE SEQUENCE store_credits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE store_credits_id_seq OWNER TO paulmcguane;

--
-- Name: store_credits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paulmcguane
--

ALTER SEQUENCE store_credits_id_seq OWNED BY store_credits.id;


--
-- Name: tax_rates; Type: TABLE; Schema: public; Owner: paulmcguane
--

CREATE TABLE tax_rates (
    id integer NOT NULL,
    percentage numeric(8,2) DEFAULT 0.0 NOT NULL,
    state_id integer,
    country_id integer,
    start_date date DEFAULT '2016-06-30'::date NOT NULL,
    end_date date,
    active boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE tax_rates OWNER TO paulmcguane;

--
-- Name: tax_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: paulmcguane
--

CREATE SEQUENCE tax_rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tax_rates_id_seq OWNER TO paulmcguane;

--
-- Name: tax_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paulmcguane
--

ALTER SEQUENCE tax_rates_id_seq OWNED BY tax_rates.id;


--
-- Name: trading_hours; Type: TABLE; Schema: public; Owner: paulmcguane
--

CREATE TABLE trading_hours (
    id integer NOT NULL,
    merchant_id integer,
    weekday integer,
    open_time time without time zone,
    close_time time without time zone,
    trades boolean
);


ALTER TABLE trading_hours OWNER TO paulmcguane;

--
-- Name: trading_hours_id_seq; Type: SEQUENCE; Schema: public; Owner: paulmcguane
--

CREATE SEQUENCE trading_hours_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trading_hours_id_seq OWNER TO paulmcguane;

--
-- Name: trading_hours_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paulmcguane
--

ALTER SEQUENCE trading_hours_id_seq OWNED BY trading_hours.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: paulmcguane
--

CREATE TABLE users (
    id integer NOT NULL,
    first_name character varying,
    last_name character varying,
    email character varying,
    state character varying,
    mobile character varying,
    customer_cim_id character varying,
    encrypted_password character varying(128) NOT NULL,
    confirmation_token character varying(128),
    access_token character varying,
    comments_count integer DEFAULT 0,
    sms_notification boolean DEFAULT true NOT NULL,
    push_notification boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    latitude double precision,
    longitude double precision,
    role integer,
    remember_token character varying(128)
);


ALTER TABLE users OWNER TO paulmcguane;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: paulmcguane
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO paulmcguane;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paulmcguane
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: users_roles; Type: TABLE; Schema: public; Owner: paulmcguane
--

CREATE TABLE users_roles (
    user_id integer,
    role_id integer
);


ALTER TABLE users_roles OWNER TO paulmcguane;

--
-- Name: variant_merchants; Type: TABLE; Schema: public; Owner: paulmcguane
--

CREATE TABLE variant_merchants (
    id integer NOT NULL,
    variant_id integer,
    merchant_id integer,
    active boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE variant_merchants OWNER TO paulmcguane;

--
-- Name: variant_merchants_id_seq; Type: SEQUENCE; Schema: public; Owner: paulmcguane
--

CREATE SEQUENCE variant_merchants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE variant_merchants_id_seq OWNER TO paulmcguane;

--
-- Name: variant_merchants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paulmcguane
--

ALTER SEQUENCE variant_merchants_id_seq OWNED BY variant_merchants.id;


--
-- Name: variant_properties; Type: TABLE; Schema: public; Owner: paulmcguane
--

CREATE TABLE variant_properties (
    id integer NOT NULL,
    property_id integer,
    variant_id integer,
    description character varying(255),
    "primary" boolean DEFAULT false,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE variant_properties OWNER TO paulmcguane;

--
-- Name: variant_properties_id_seq; Type: SEQUENCE; Schema: public; Owner: paulmcguane
--

CREATE SEQUENCE variant_properties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE variant_properties_id_seq OWNER TO paulmcguane;

--
-- Name: variant_properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paulmcguane
--

ALTER SEQUENCE variant_properties_id_seq OWNED BY variant_properties.id;


--
-- Name: variants; Type: TABLE; Schema: public; Owner: paulmcguane
--

CREATE TABLE variants (
    id integer NOT NULL,
    product_id integer NOT NULL,
    sku character varying(255) NOT NULL,
    price numeric(8,2) DEFAULT 0.0 NOT NULL,
    cost numeric(8,2) DEFAULT 0.0 NOT NULL,
    master boolean DEFAULT false NOT NULL,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE variants OWNER TO paulmcguane;

--
-- Name: variants_id_seq; Type: SEQUENCE; Schema: public; Owner: paulmcguane
--

CREATE SEQUENCE variants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE variants_id_seq OWNER TO paulmcguane;

--
-- Name: variants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paulmcguane
--

ALTER SEQUENCE variants_id_seq OWNED BY variants.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY accounts ALTER COLUMN id SET DEFAULT nextval('accounts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY address_types ALTER COLUMN id SET DEFAULT nextval('address_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY addresses ALTER COLUMN id SET DEFAULT nextval('addresses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY cart_items ALTER COLUMN id SET DEFAULT nextval('cart_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY carts ALTER COLUMN id SET DEFAULT nextval('carts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY countries ALTER COLUMN id SET DEFAULT nextval('countries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY coupons ALTER COLUMN id SET DEFAULT nextval('coupons_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY friendly_id_slugs ALTER COLUMN id SET DEFAULT nextval('friendly_id_slugs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY item_types ALTER COLUMN id SET DEFAULT nextval('item_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY merchant_products ALTER COLUMN id SET DEFAULT nextval('merchant_products_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY merchants ALTER COLUMN id SET DEFAULT nextval('merchants_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY order_items ALTER COLUMN id SET DEFAULT nextval('order_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY orders ALTER COLUMN id SET DEFAULT nextval('orders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY payment_methods ALTER COLUMN id SET DEFAULT nextval('payment_methods_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY phone_types ALTER COLUMN id SET DEFAULT nextval('phone_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY phones ALTER COLUMN id SET DEFAULT nextval('phones_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY product_properties ALTER COLUMN id SET DEFAULT nextval('product_properties_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY product_types ALTER COLUMN id SET DEFAULT nextval('product_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY products ALTER COLUMN id SET DEFAULT nextval('products_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY properties ALTER COLUMN id SET DEFAULT nextval('properties_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY prototype_properties ALTER COLUMN id SET DEFAULT nextval('prototype_properties_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY prototypes ALTER COLUMN id SET DEFAULT nextval('prototypes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY referral_bonus ALTER COLUMN id SET DEFAULT nextval('referral_bonus_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY referral_programs ALTER COLUMN id SET DEFAULT nextval('referral_programs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY referral_types ALTER COLUMN id SET DEFAULT nextval('referral_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY referrals ALTER COLUMN id SET DEFAULT nextval('referrals_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY states ALTER COLUMN id SET DEFAULT nextval('states_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY store_credits ALTER COLUMN id SET DEFAULT nextval('store_credits_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY tax_rates ALTER COLUMN id SET DEFAULT nextval('tax_rates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY trading_hours ALTER COLUMN id SET DEFAULT nextval('trading_hours_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY variant_merchants ALTER COLUMN id SET DEFAULT nextval('variant_merchants_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY variant_properties ALTER COLUMN id SET DEFAULT nextval('variant_properties_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY variants ALTER COLUMN id SET DEFAULT nextval('variants_id_seq'::regclass);


--
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: paulmcguane
--

COPY accounts (id, merchant_id, account_name, bsb, account_number, account_type, charge, active, created_at, updated_at) FROM stdin;
\.


--
-- Name: accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paulmcguane
--

SELECT pg_catalog.setval('accounts_id_seq', 1, false);


--
-- Data for Name: address_types; Type: TABLE DATA; Schema: public; Owner: paulmcguane
--

COPY address_types (id, name, description, created_at, updated_at) FROM stdin;
1	Billing	\N	2016-07-04 20:15:09.249857	2016-07-04 20:15:09.249857
2	Shipping	\N	2016-07-04 20:15:09.25871	2016-07-04 20:15:09.25871
3	Order	\N	2016-07-04 20:15:09.264148	2016-07-04 20:15:09.264148
4	Merchant	\N	2016-07-04 20:15:09.269207	2016-07-04 20:15:09.269207
\.


--
-- Name: address_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paulmcguane
--

SELECT pg_catalog.setval('address_types_id_seq', 4, true);


--
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: paulmcguane
--

COPY addresses (id, address_type_id, first_name, last_name, addressable_type, addressable_id, address1, address2, city, state_id, state_name, zip_code, phone_id, alternative_phone, "default", billing_default, active, country_id, created_at, updated_at, latitude, longitude) FROM stdin;
\.


--
-- Name: addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paulmcguane
--

SELECT pg_catalog.setval('addresses_id_seq', 1, false);


--
-- Data for Name: cart_items; Type: TABLE DATA; Schema: public; Owner: paulmcguane
--

COPY cart_items (id, user_id, cart_id, variant_id, quantity, item_type_id, active, created_at, updated_at) FROM stdin;
\.


--
-- Name: cart_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paulmcguane
--

SELECT pg_catalog.setval('cart_items_id_seq', 1, false);


--
-- Data for Name: carts; Type: TABLE DATA; Schema: public; Owner: paulmcguane
--

COPY carts (id, user_id, customer_id, created_at, updated_at) FROM stdin;
1	1	\N	2016-07-04 23:01:30.474175	2016-07-04 23:01:30.474175
\.


--
-- Name: carts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paulmcguane
--

SELECT pg_catalog.setval('carts_id_seq', 1, true);


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: paulmcguane
--

COPY countries (id, name, abbreviation, active, created_at, updated_at) FROM stdin;
1	Afghanistan	AFG	f	2016-07-04 20:15:05.728514	2016-07-04 20:15:05.728514
2	Albania	ALB	f	2016-07-04 20:15:05.740166	2016-07-04 20:15:05.740166
3	Algeria	DZA	f	2016-07-04 20:15:05.74529	2016-07-04 20:15:05.74529
4	American Samoa	ASM	f	2016-07-04 20:15:05.751486	2016-07-04 20:15:05.751486
5	Andorra	AND	f	2016-07-04 20:15:05.756226	2016-07-04 20:15:05.756226
6	Angola	AGO	f	2016-07-04 20:15:05.760541	2016-07-04 20:15:05.760541
7	Anguilla	AIA	f	2016-07-04 20:15:05.764474	2016-07-04 20:15:05.764474
8	Antigua and Barbuda	ATG	f	2016-07-04 20:15:05.769252	2016-07-04 20:15:05.769252
9	Argentina	ARG	f	2016-07-04 20:15:05.773959	2016-07-04 20:15:05.773959
10	Armenia	ARM	f	2016-07-04 20:15:05.779228	2016-07-04 20:15:05.779228
11	Aruba	ABW	f	2016-07-04 20:15:05.785993	2016-07-04 20:15:05.785993
12	Australia	AUS	t	2016-07-04 20:15:05.792569	2016-07-04 20:15:05.798972
13	Austria	AUT	f	2016-07-04 20:15:05.805456	2016-07-04 20:15:05.805456
14	Azerbaijan	AZE	f	2016-07-04 20:15:05.810738	2016-07-04 20:15:05.810738
15	Bahamas	BHS	f	2016-07-04 20:15:05.814846	2016-07-04 20:15:05.814846
16	Bahrain	BHR	f	2016-07-04 20:15:05.820216	2016-07-04 20:15:05.820216
17	Bangladesh	BGD	f	2016-07-04 20:15:05.825525	2016-07-04 20:15:05.825525
18	Barbados	BRB	f	2016-07-04 20:15:05.830966	2016-07-04 20:15:05.830966
19	Belarus	BLR	f	2016-07-04 20:15:05.836453	2016-07-04 20:15:05.836453
20	Belgium	BEL	f	2016-07-04 20:15:05.842626	2016-07-04 20:15:05.842626
21	Belize	BLZ	f	2016-07-04 20:15:05.847463	2016-07-04 20:15:05.847463
22	Benin	BEN	f	2016-07-04 20:15:05.851965	2016-07-04 20:15:05.851965
23	Bermuda	BMU	f	2016-07-04 20:15:05.85577	2016-07-04 20:15:05.85577
24	Bhutan	BTN	f	2016-07-04 20:15:05.860089	2016-07-04 20:15:05.860089
25	Bolivia	BOL	f	2016-07-04 20:15:05.864062	2016-07-04 20:15:05.864062
26	Bosnia and Herzegovina	BIH	f	2016-07-04 20:15:05.868201	2016-07-04 20:15:05.868201
27	Botswana	BWA	f	2016-07-04 20:15:05.888737	2016-07-04 20:15:05.888737
28	Brazil	BRA	f	2016-07-04 20:15:05.894423	2016-07-04 20:15:05.894423
29	Brunei Darussalam	BRN	f	2016-07-04 20:15:05.900575	2016-07-04 20:15:05.900575
30	Bulgaria	BGR	f	2016-07-04 20:15:05.906144	2016-07-04 20:15:05.906144
31	Burkina Faso	BFA	f	2016-07-04 20:15:05.910383	2016-07-04 20:15:05.910383
32	Burundi	BDI	f	2016-07-04 20:15:05.914355	2016-07-04 20:15:05.914355
33	Cambodia	KHM	f	2016-07-04 20:15:05.918683	2016-07-04 20:15:05.918683
34	Cameroon	CMR	f	2016-07-04 20:15:05.923377	2016-07-04 20:15:05.923377
35	Canada	CAN	f	2016-07-04 20:15:05.928974	2016-07-04 20:15:05.928974
36	Cape Verde	CPV	f	2016-07-04 20:15:05.94136	2016-07-04 20:15:05.94136
37	Cayman Islands	CYM	f	2016-07-04 20:15:05.946266	2016-07-04 20:15:05.946266
38	Central African Republic	CAF	f	2016-07-04 20:15:05.951992	2016-07-04 20:15:05.951992
39	Chad	TCD	f	2016-07-04 20:15:05.957116	2016-07-04 20:15:05.957116
40	Chile	CHL	f	2016-07-04 20:15:05.963405	2016-07-04 20:15:05.963405
41	China	CHN	f	2016-07-04 20:15:05.968919	2016-07-04 20:15:05.968919
42	Colombia	COL	f	2016-07-04 20:15:05.973519	2016-07-04 20:15:05.973519
43	Comoros	COM	f	2016-07-04 20:15:05.978604	2016-07-04 20:15:05.978604
44	Congo	COG	f	2016-07-04 20:15:05.983007	2016-07-04 20:15:05.983007
45	Congo, Democratic Republic	COD	f	2016-07-04 20:15:05.988426	2016-07-04 20:15:05.988426
46	Cook Islands	COK	f	2016-07-04 20:15:05.993658	2016-07-04 20:15:05.993658
47	Costa Rica	CRI	f	2016-07-04 20:15:05.9985	2016-07-04 20:15:05.9985
48	Cote D'Ivoire	CIV	f	2016-07-04 20:15:06.00361	2016-07-04 20:15:06.00361
49	Croatia	HRV	f	2016-07-04 20:15:06.008498	2016-07-04 20:15:06.008498
50	Cuba	CUB	f	2016-07-04 20:15:06.014651	2016-07-04 20:15:06.014651
51	Cyprus	CYP	f	2016-07-04 20:15:06.021448	2016-07-04 20:15:06.021448
52	Czech Republic	CZE	f	2016-07-04 20:15:06.027041	2016-07-04 20:15:06.027041
53	Denmark	DNK	f	2016-07-04 20:15:06.033447	2016-07-04 20:15:06.033447
54	Djibouti	DJI	f	2016-07-04 20:15:06.038598	2016-07-04 20:15:06.038598
55	Dominica	DMA	f	2016-07-04 20:15:06.044063	2016-07-04 20:15:06.044063
56	Dominican Republic	DOM	f	2016-07-04 20:15:06.049419	2016-07-04 20:15:06.049419
57	Ecuador	ECU	f	2016-07-04 20:15:06.055	2016-07-04 20:15:06.055
58	Egypt	EGY	f	2016-07-04 20:15:06.060192	2016-07-04 20:15:06.060192
59	El Salvador	SLV	f	2016-07-04 20:15:06.064555	2016-07-04 20:15:06.064555
60	Equatorial Guinea	GNQ	f	2016-07-04 20:15:06.068542	2016-07-04 20:15:06.068542
61	Eritrea	ERI	f	2016-07-04 20:15:06.073069	2016-07-04 20:15:06.073069
62	Estonia	EST	f	2016-07-04 20:15:06.078044	2016-07-04 20:15:06.078044
63	Ethiopia	ETH	f	2016-07-04 20:15:06.082907	2016-07-04 20:15:06.082907
64	Falkland Islands (Malvinas)	FLK	f	2016-07-04 20:15:06.087338	2016-07-04 20:15:06.087338
65	Faroe Islands	FRO	f	2016-07-04 20:15:06.092246	2016-07-04 20:15:06.092246
66	Fiji	FJI	f	2016-07-04 20:15:06.096802	2016-07-04 20:15:06.096802
67	Finland	FIN	f	2016-07-04 20:15:06.103376	2016-07-04 20:15:06.103376
68	France	FRA	f	2016-07-04 20:15:06.116462	2016-07-04 20:15:06.116462
69	French Guiana	GUF	f	2016-07-04 20:15:06.121169	2016-07-04 20:15:06.121169
70	French Polynesia	PYF	f	2016-07-04 20:15:06.125993	2016-07-04 20:15:06.125993
71	Gabon	GAB	f	2016-07-04 20:15:06.130948	2016-07-04 20:15:06.130948
72	Gambia	GMB	f	2016-07-04 20:15:06.135707	2016-07-04 20:15:06.135707
73	Georgia	GEO	f	2016-07-04 20:15:06.141289	2016-07-04 20:15:06.141289
74	Germany	DEU	f	2016-07-04 20:15:06.146033	2016-07-04 20:15:06.146033
75	Ghana	GHA	f	2016-07-04 20:15:06.153938	2016-07-04 20:15:06.153938
76	Gibraltar	GIB	f	2016-07-04 20:15:06.16092	2016-07-04 20:15:06.16092
77	Greece	GRC	f	2016-07-04 20:15:06.16732	2016-07-04 20:15:06.16732
78	Greenland	GRL	f	2016-07-04 20:15:06.173442	2016-07-04 20:15:06.173442
79	Grenada	GRD	f	2016-07-04 20:15:06.179007	2016-07-04 20:15:06.179007
80	Guadeloupe	GLP	f	2016-07-04 20:15:06.184269	2016-07-04 20:15:06.184269
81	Guam	GUM	f	2016-07-04 20:15:06.189131	2016-07-04 20:15:06.189131
82	Guatemala	GTM	f	2016-07-04 20:15:06.194053	2016-07-04 20:15:06.194053
83	Guinea	GIN	f	2016-07-04 20:15:06.198028	2016-07-04 20:15:06.198028
84	Guinea-Bissau	GNB	f	2016-07-04 20:15:06.202152	2016-07-04 20:15:06.202152
85	Guyana	GUY	f	2016-07-04 20:15:06.206833	2016-07-04 20:15:06.206833
86	Haiti	HTI	f	2016-07-04 20:15:06.212173	2016-07-04 20:15:06.212173
87	Holy See (Vatican City State)	VAT	f	2016-07-04 20:15:06.217311	2016-07-04 20:15:06.217311
88	Honduras	HND	f	2016-07-04 20:15:06.221628	2016-07-04 20:15:06.221628
89	Hong Kong	HKG	f	2016-07-04 20:15:06.226779	2016-07-04 20:15:06.226779
90	Hungary	HUN	f	2016-07-04 20:15:06.233971	2016-07-04 20:15:06.233971
91	Iceland	ISL	f	2016-07-04 20:15:06.240448	2016-07-04 20:15:06.240448
92	India	IND	f	2016-07-04 20:15:06.245415	2016-07-04 20:15:06.245415
93	Indonesia	IDN	f	2016-07-04 20:15:06.25091	2016-07-04 20:15:06.25091
94	Iran	IRN	f	2016-07-04 20:15:06.255511	2016-07-04 20:15:06.255511
95	Iraq	IRQ	f	2016-07-04 20:15:06.261972	2016-07-04 20:15:06.261972
96	Ireland	IRL	f	2016-07-04 20:15:06.266935	2016-07-04 20:15:06.266935
97	Israel	ISR	f	2016-07-04 20:15:06.271165	2016-07-04 20:15:06.271165
98	Italy	ITA	f	2016-07-04 20:15:06.277094	2016-07-04 20:15:06.277094
99	Jamaica	JAM	f	2016-07-04 20:15:06.281627	2016-07-04 20:15:06.281627
100	Japan	JPN	f	2016-07-04 20:15:06.287128	2016-07-04 20:15:06.287128
101	Jordan	JOR	f	2016-07-04 20:15:06.292507	2016-07-04 20:15:06.292507
102	Kazakhstan	KAZ	f	2016-07-04 20:15:06.298784	2016-07-04 20:15:06.298784
103	Kenya	KEN	f	2016-07-04 20:15:06.303101	2016-07-04 20:15:06.303101
104	Kiribati	KIR	f	2016-07-04 20:15:06.307739	2016-07-04 20:15:06.307739
105	North Korea	PRK	f	2016-07-04 20:15:06.311936	2016-07-04 20:15:06.311936
106	South Korea	KOR	f	2016-07-04 20:15:06.317238	2016-07-04 20:15:06.317238
107	Kuwait	KWT	f	2016-07-04 20:15:06.323631	2016-07-04 20:15:06.323631
108	Kyrgyzstan	KGZ	f	2016-07-04 20:15:06.328921	2016-07-04 20:15:06.328921
109	Lao People's Democratic Republic	LAO	f	2016-07-04 20:15:06.332971	2016-07-04 20:15:06.332971
110	Latvia	LVA	f	2016-07-04 20:15:06.337501	2016-07-04 20:15:06.337501
111	Lebanon	LBN	f	2016-07-04 20:15:06.343571	2016-07-04 20:15:06.343571
112	Lesotho	LSO	f	2016-07-04 20:15:06.347846	2016-07-04 20:15:06.347846
113	Liberia	LBR	f	2016-07-04 20:15:06.352033	2016-07-04 20:15:06.352033
114	Libyan Arab Jamahiriya	LBY	f	2016-07-04 20:15:06.356387	2016-07-04 20:15:06.356387
115	Liechtenstein	LIE	f	2016-07-04 20:15:06.360938	2016-07-04 20:15:06.360938
116	Lithuania	LTU	f	2016-07-04 20:15:06.365807	2016-07-04 20:15:06.365807
117	Luxembourg	LUX	f	2016-07-04 20:15:06.370167	2016-07-04 20:15:06.370167
118	Macao	MAC	f	2016-07-04 20:15:06.375111	2016-07-04 20:15:06.375111
119	Macedonia	MKD	f	2016-07-04 20:15:06.379633	2016-07-04 20:15:06.379633
120	Madagascar	MDG	f	2016-07-04 20:15:06.384558	2016-07-04 20:15:06.384558
121	Malawi	MWI	f	2016-07-04 20:15:06.393714	2016-07-04 20:15:06.393714
122	Malaysia	MYS	f	2016-07-04 20:15:06.399633	2016-07-04 20:15:06.399633
123	Maldives	MDV	f	2016-07-04 20:15:06.404084	2016-07-04 20:15:06.404084
124	Mali	MLI	f	2016-07-04 20:15:06.410317	2016-07-04 20:15:06.410317
125	Malta	MLT	f	2016-07-04 20:15:06.416057	2016-07-04 20:15:06.416057
126	Marshall Islands	MHL	f	2016-07-04 20:15:06.422741	2016-07-04 20:15:06.422741
127	Martinique	MTQ	f	2016-07-04 20:15:06.428329	2016-07-04 20:15:06.428329
128	Mauritania	MRT	f	2016-07-04 20:15:06.434544	2016-07-04 20:15:06.434544
129	Mauritius	MUS	f	2016-07-04 20:15:06.44098	2016-07-04 20:15:06.44098
130	Mexico	MEX	f	2016-07-04 20:15:06.446451	2016-07-04 20:15:06.446451
131	Micronesia	FSM	f	2016-07-04 20:15:06.45194	2016-07-04 20:15:06.45194
132	Moldova	MDA	f	2016-07-04 20:15:06.458215	2016-07-04 20:15:06.458215
133	Monaco	MCO	f	2016-07-04 20:15:06.463911	2016-07-04 20:15:06.463911
134	Mongolia	MNG	f	2016-07-04 20:15:06.469149	2016-07-04 20:15:06.469149
135	Montserrat	MSR	f	2016-07-04 20:15:06.477699	2016-07-04 20:15:06.477699
136	Morocco	MAR	f	2016-07-04 20:15:06.484889	2016-07-04 20:15:06.484889
137	Mozambique	MOZ	f	2016-07-04 20:15:06.490182	2016-07-04 20:15:06.490182
138	Myanmar	MMR	f	2016-07-04 20:15:06.49536	2016-07-04 20:15:06.49536
139	Namibia	NAM	f	2016-07-04 20:15:06.500509	2016-07-04 20:15:06.500509
140	Nauru	NRU	f	2016-07-04 20:15:06.505467	2016-07-04 20:15:06.505467
141	Nepal	NPL	f	2016-07-04 20:15:06.511113	2016-07-04 20:15:06.511113
142	Netherlands	NLD	f	2016-07-04 20:15:06.518362	2016-07-04 20:15:06.518362
143	Netherlands Antilles	ANT	f	2016-07-04 20:15:06.524133	2016-07-04 20:15:06.524133
144	New Caledonia	NCL	f	2016-07-04 20:15:06.529842	2016-07-04 20:15:06.529842
145	New Zealand	NZL	f	2016-07-04 20:15:06.538664	2016-07-04 20:15:06.538664
146	Nicaragua	NIC	f	2016-07-04 20:15:06.547194	2016-07-04 20:15:06.547194
147	Niger	NER	f	2016-07-04 20:15:06.552157	2016-07-04 20:15:06.552157
148	Nigeria	NGA	f	2016-07-04 20:15:06.556857	2016-07-04 20:15:06.556857
149	Niue	NIU	f	2016-07-04 20:15:06.562356	2016-07-04 20:15:06.562356
150	Norfolk Island	NFK	f	2016-07-04 20:15:06.567452	2016-07-04 20:15:06.567452
151	Northern Mariana Islands	MNP	f	2016-07-04 20:15:06.573025	2016-07-04 20:15:06.573025
152	Norway	NOR	f	2016-07-04 20:15:06.578425	2016-07-04 20:15:06.578425
153	Oman	OMN	f	2016-07-04 20:15:06.583534	2016-07-04 20:15:06.583534
154	Pakistan	PAK	f	2016-07-04 20:15:06.58831	2016-07-04 20:15:06.58831
155	Palau	PLW	f	2016-07-04 20:15:06.594554	2016-07-04 20:15:06.594554
156	Panama	PAN	f	2016-07-04 20:15:06.600167	2016-07-04 20:15:06.600167
157	Papua New Guinea	PNG	f	2016-07-04 20:15:06.605638	2016-07-04 20:15:06.605638
158	Paraguay	PRY	f	2016-07-04 20:15:06.612307	2016-07-04 20:15:06.612307
159	Peru	PER	f	2016-07-04 20:15:06.619014	2016-07-04 20:15:06.619014
160	Philippines	PHL	f	2016-07-04 20:15:06.628438	2016-07-04 20:15:06.628438
161	Pitcairn	PCN	f	2016-07-04 20:15:06.63492	2016-07-04 20:15:06.63492
162	Poland	POL	f	2016-07-04 20:15:06.641234	2016-07-04 20:15:06.641234
163	Portugal	PRT	f	2016-07-04 20:15:06.646282	2016-07-04 20:15:06.646282
164	Puerto Rico	PRI	f	2016-07-04 20:15:06.656776	2016-07-04 20:15:06.656776
165	Qatar	QAT	f	2016-07-04 20:15:06.662886	2016-07-04 20:15:06.662886
166	Reunion	REU	f	2016-07-04 20:15:06.670907	2016-07-04 20:15:06.670907
167	Romania	ROM	f	2016-07-04 20:15:06.678349	2016-07-04 20:15:06.678349
168	Russian Federation	RUS	f	2016-07-04 20:15:06.683641	2016-07-04 20:15:06.683641
169	Rwanda	RWA	f	2016-07-04 20:15:06.68887	2016-07-04 20:15:06.68887
170	Saint Helena	SHN	f	2016-07-04 20:15:06.694229	2016-07-04 20:15:06.694229
171	Saint Kitts and Nevis	KNA	f	2016-07-04 20:15:06.699833	2016-07-04 20:15:06.699833
172	Saint Lucia	LCA	f	2016-07-04 20:15:06.706101	2016-07-04 20:15:06.706101
173	Saint Pierre and Miquelon	SPM	f	2016-07-04 20:15:06.711879	2016-07-04 20:15:06.711879
174	Saint Vincent and the Grenadines	VCT	f	2016-07-04 20:15:06.71707	2016-07-04 20:15:06.71707
175	Samoa	WSM	f	2016-07-04 20:15:06.722978	2016-07-04 20:15:06.722978
176	San Marino	SMR	f	2016-07-04 20:15:06.72868	2016-07-04 20:15:06.72868
177	Sao Tome and Principe	STP	f	2016-07-04 20:15:06.734184	2016-07-04 20:15:06.734184
178	Saudi Arabia	SAU	f	2016-07-04 20:15:06.741574	2016-07-04 20:15:06.741574
179	Senegal	SEN	f	2016-07-04 20:15:06.747569	2016-07-04 20:15:06.747569
180	Seychelles	SYC	f	2016-07-04 20:15:06.753893	2016-07-04 20:15:06.753893
181	Sierra Leone	SLE	f	2016-07-04 20:15:06.759788	2016-07-04 20:15:06.759788
182	Singapore	SGP	f	2016-07-04 20:15:06.766091	2016-07-04 20:15:06.766091
183	Slovakia	SVK	f	2016-07-04 20:15:06.771461	2016-07-04 20:15:06.771461
184	Slovenia	SVN	f	2016-07-04 20:15:06.778678	2016-07-04 20:15:06.778678
185	Solomon Islands	SLB	f	2016-07-04 20:15:06.786145	2016-07-04 20:15:06.786145
186	Somalia	SOM	f	2016-07-04 20:15:06.79426	2016-07-04 20:15:06.79426
187	South Africa	ZAF	f	2016-07-04 20:15:06.80234	2016-07-04 20:15:06.80234
188	Spain	ESP	f	2016-07-04 20:15:06.809431	2016-07-04 20:15:06.809431
189	Sri Lanka	LKA	f	2016-07-04 20:15:06.815054	2016-07-04 20:15:06.815054
190	Sudan	SDN	f	2016-07-04 20:15:06.821338	2016-07-04 20:15:06.821338
191	Suriname	SUR	f	2016-07-04 20:15:06.827693	2016-07-04 20:15:06.827693
192	Svalbard and Jan Mayen	SJM	f	2016-07-04 20:15:06.833856	2016-07-04 20:15:06.833856
193	Swaziland	SWZ	f	2016-07-04 20:15:06.838749	2016-07-04 20:15:06.838749
194	Sweden	SWE	f	2016-07-04 20:15:06.844726	2016-07-04 20:15:06.844726
195	Switzerland	CHE	f	2016-07-04 20:15:06.850181	2016-07-04 20:15:06.850181
196	Syrian Arab Republic	SYR	f	2016-07-04 20:15:06.859391	2016-07-04 20:15:06.859391
197	Taiwan	TWN	f	2016-07-04 20:15:06.867265	2016-07-04 20:15:06.867265
198	Tajikistan	TJK	f	2016-07-04 20:15:06.8731	2016-07-04 20:15:06.8731
199	Tanzania	TZA	f	2016-07-04 20:15:06.87918	2016-07-04 20:15:06.87918
200	Thailand	THA	f	2016-07-04 20:15:06.887	2016-07-04 20:15:06.887
201	Togo	TGO	f	2016-07-04 20:15:06.894362	2016-07-04 20:15:06.894362
202	Tokelau	TKL	f	2016-07-04 20:15:06.90103	2016-07-04 20:15:06.90103
203	Tonga	TON	f	2016-07-04 20:15:06.9082	2016-07-04 20:15:06.9082
204	Trinidad and Tobago	TTO	f	2016-07-04 20:15:06.914822	2016-07-04 20:15:06.914822
205	Tunisia	TUN	f	2016-07-04 20:15:06.922275	2016-07-04 20:15:06.922275
206	Turkey	TUR	f	2016-07-04 20:15:06.929328	2016-07-04 20:15:06.929328
207	Turkmenistan	TKM	f	2016-07-04 20:15:06.935174	2016-07-04 20:15:06.935174
208	Turks and Caicos Islands	TCA	f	2016-07-04 20:15:06.940168	2016-07-04 20:15:06.940168
209	Tuvalu	TUV	f	2016-07-04 20:15:06.945318	2016-07-04 20:15:06.945318
210	Uganda	UGA	f	2016-07-04 20:15:06.950135	2016-07-04 20:15:06.950135
211	Ukraine	UKR	f	2016-07-04 20:15:06.955101	2016-07-04 20:15:06.955101
212	United Arab Emirates	ARE	f	2016-07-04 20:15:06.961955	2016-07-04 20:15:06.961955
213	United Kingdom	GBR	f	2016-07-04 20:15:06.968734	2016-07-04 20:15:06.968734
214	United States	USA	f	2016-07-04 20:15:06.973132	2016-07-04 20:15:06.973132
215	Uruguay	URY	f	2016-07-04 20:15:06.979597	2016-07-04 20:15:06.979597
216	Uzbekistan	UZB	f	2016-07-04 20:15:06.984281	2016-07-04 20:15:06.984281
217	Vanuatu	VUT	f	2016-07-04 20:15:06.989452	2016-07-04 20:15:06.989452
218	Venezuela	VEN	f	2016-07-04 20:15:06.994014	2016-07-04 20:15:06.994014
219	Viet Nam	VNM	f	2016-07-04 20:15:06.998292	2016-07-04 20:15:06.998292
220	Virgin Islands, British	VGB	f	2016-07-04 20:15:07.002864	2016-07-04 20:15:07.002864
221	Virgin Islands, U.S.	VIR	f	2016-07-04 20:15:07.026243	2016-07-04 20:15:07.026243
222	Wallis and Futuna	WLF	f	2016-07-04 20:15:07.030736	2016-07-04 20:15:07.030736
223	Western Sahara	ESH	f	2016-07-04 20:15:07.037425	2016-07-04 20:15:07.037425
224	Yemen	YEM	f	2016-07-04 20:15:07.0418	2016-07-04 20:15:07.0418
225	Zambia	ZMB	f	2016-07-04 20:15:07.045782	2016-07-04 20:15:07.045782
226	Zimbabwe	ZWE	f	2016-07-04 20:15:07.05165	2016-07-04 20:15:07.05165
\.


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paulmcguane
--

SELECT pg_catalog.setval('countries_id_seq', 1, false);


--
-- Data for Name: coupons; Type: TABLE DATA; Schema: public; Owner: paulmcguane
--

COPY coupons (id, type, code, amount, minimum_value, percent, description, combine, starts_at, expires_at, created_at, updated_at) FROM stdin;
\.


--
-- Name: coupons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paulmcguane
--

SELECT pg_catalog.setval('coupons_id_seq', 1, false);


--
-- Data for Name: friendly_id_slugs; Type: TABLE DATA; Schema: public; Owner: paulmcguane
--

COPY friendly_id_slugs (id, slug, sluggable_id, sluggable_type, scope, created_at) FROM stdin;
\.


--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paulmcguane
--

SELECT pg_catalog.setval('friendly_id_slugs_id_seq', 1, false);


--
-- Data for Name: item_types; Type: TABLE DATA; Schema: public; Owner: paulmcguane
--

COPY item_types (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: item_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paulmcguane
--

SELECT pg_catalog.setval('item_types_id_seq', 1, false);


--
-- Data for Name: merchant_products; Type: TABLE DATA; Schema: public; Owner: paulmcguane
--

COPY merchant_products (id, product_id, merchant_id, active, created_at, updated_at) FROM stdin;
\.


--
-- Name: merchant_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paulmcguane
--

SELECT pg_catalog.setval('merchant_products_id_seq', 1, false);


--
-- Data for Name: merchants; Type: TABLE DATA; Schema: public; Owner: paulmcguane
--

COPY merchants (id, name, email, account_id, permalink, available_at, deleted_at, meta_keywords, meta_description, featured, created_at, updated_at, latitude, longitude) FROM stdin;
1	d1f2219e8aba	test@test.com	\N	d1f2219e8aba	\N	\N	\N	["d1f2219e8aba"]	f	2016-07-04 20:15:07.418233	2016-07-04 20:15:07.418233	\N	\N
2	6a1d419e3922	test@test.com	\N	6a1d419e3922	\N	\N	\N	["6a1d419e3922"]	f	2016-07-04 20:15:07.465342	2016-07-04 20:15:07.465342	\N	\N
3	322d60b8723a	test@test.com	\N	322d60b8723a	\N	\N	\N	["322d60b8723a"]	f	2016-07-04 20:15:07.482543	2016-07-04 20:15:07.482543	\N	\N
4	6e013cf7409e	test@test.com	\N	6e013cf7409e	\N	\N	\N	["6e013cf7409e"]	f	2016-07-04 20:15:07.496943	2016-07-04 20:15:07.496943	\N	\N
5	c9c8d29b34ba	test@test.com	\N	c9c8d29b34ba	\N	\N	\N	["c9c8d29b34ba"]	f	2016-07-04 20:15:07.511342	2016-07-04 20:15:07.511342	\N	\N
6	cfc60f44a465	test@test.com	\N	cfc60f44a465	\N	\N	\N	["cfc60f44a465"]	f	2016-07-04 20:15:07.530068	2016-07-04 20:15:07.530068	\N	\N
7	e9d91b77880c	test@test.com	\N	e9d91b77880c	\N	\N	\N	["e9d91b77880c"]	f	2016-07-04 20:15:07.546568	2016-07-04 20:15:07.546568	\N	\N
8	6eaa39494ffe	test@test.com	\N	6eaa39494ffe	\N	\N	\N	["6eaa39494ffe"]	f	2016-07-04 20:15:07.563792	2016-07-04 20:15:07.563792	\N	\N
9	1976addb22db	test@test.com	\N	1976addb22db	\N	\N	\N	["1976addb22db"]	f	2016-07-04 20:15:07.580237	2016-07-04 20:15:07.580237	\N	\N
10	4c9836655de4	test@test.com	\N	4c9836655de4	\N	\N	\N	["4c9836655de4"]	f	2016-07-04 20:15:07.595556	2016-07-04 20:15:07.595556	\N	\N
11	8498ce95789f	test@test.com	\N	8498ce95789f	\N	\N	\N	["8498ce95789f"]	f	2016-07-04 20:15:07.60967	2016-07-04 20:15:07.60967	\N	\N
12	f7d88e5f9282	test@test.com	\N	f7d88e5f9282	\N	\N	\N	["f7d88e5f9282"]	f	2016-07-04 20:15:07.628368	2016-07-04 20:15:07.628368	\N	\N
13	c99f02740662	test@test.com	\N	c99f02740662	\N	\N	\N	["c99f02740662"]	f	2016-07-04 20:15:07.64245	2016-07-04 20:15:07.64245	\N	\N
14	31e59c54d3ce	test@test.com	\N	31e59c54d3ce	\N	\N	\N	["31e59c54d3ce"]	f	2016-07-04 20:15:07.664245	2016-07-04 20:15:07.664245	\N	\N
15	b1663ec4fa3a	test@test.com	\N	b1663ec4fa3a	\N	\N	\N	["b1663ec4fa3a"]	f	2016-07-04 20:15:07.685473	2016-07-04 20:15:07.685473	\N	\N
16	24e620121437	test@test.com	\N	24e620121437	\N	\N	\N	["24e620121437"]	f	2016-07-04 20:15:07.706821	2016-07-04 20:15:07.706821	\N	\N
17	e1ef831d1afc	test@test.com	\N	e1ef831d1afc	\N	\N	\N	["e1ef831d1afc"]	f	2016-07-04 20:15:07.730097	2016-07-04 20:15:07.730097	\N	\N
18	c3f3a55e7ea5	test@test.com	\N	c3f3a55e7ea5	\N	\N	\N	["c3f3a55e7ea5"]	f	2016-07-04 20:15:07.754656	2016-07-04 20:15:07.754656	\N	\N
19	0fae13b2d4ea	test@test.com	\N	0fae13b2d4ea	\N	\N	\N	["0fae13b2d4ea"]	f	2016-07-04 20:15:07.770251	2016-07-04 20:15:07.770251	\N	\N
20	13edc5ce9f8e	test@test.com	\N	13edc5ce9f8e	\N	\N	\N	["13edc5ce9f8e"]	f	2016-07-04 20:15:07.783849	2016-07-04 20:15:07.783849	\N	\N
21	f6e461f2fe3a	test@test.com	\N	f6e461f2fe3a	\N	\N	\N	["f6e461f2fe3a"]	f	2016-07-04 20:15:07.79601	2016-07-04 20:15:07.79601	\N	\N
22	275b24f87e4b	test@test.com	\N	275b24f87e4b	\N	\N	\N	["275b24f87e4b"]	f	2016-07-04 20:15:07.809436	2016-07-04 20:15:07.809436	\N	\N
23	ca2cc77f10d1	test@test.com	\N	ca2cc77f10d1	\N	\N	\N	["ca2cc77f10d1"]	f	2016-07-04 20:15:07.824396	2016-07-04 20:15:07.824396	\N	\N
24	4a13576bbdab	test@test.com	\N	4a13576bbdab	\N	\N	\N	["4a13576bbdab"]	f	2016-07-04 20:15:07.841793	2016-07-04 20:15:07.841793	\N	\N
25	0ee446a4607f	test@test.com	\N	0ee446a4607f	\N	\N	\N	["0ee446a4607f"]	f	2016-07-04 20:15:07.857163	2016-07-04 20:15:07.857163	\N	\N
26	f1a8294073f2	test@test.com	\N	f1a8294073f2	\N	\N	\N	["f1a8294073f2"]	f	2016-07-04 20:15:07.873871	2016-07-04 20:15:07.873871	\N	\N
27	8e3f6146a442	test@test.com	\N	8e3f6146a442	\N	\N	\N	["8e3f6146a442"]	f	2016-07-04 20:15:07.905397	2016-07-04 20:15:07.905397	\N	\N
28	29ab1e41f59d	test@test.com	\N	29ab1e41f59d	\N	\N	\N	["29ab1e41f59d"]	f	2016-07-04 20:15:07.921933	2016-07-04 20:15:07.921933	\N	\N
29	6dabde02e019	test@test.com	\N	6dabde02e019	\N	\N	\N	["6dabde02e019"]	f	2016-07-04 20:15:07.940128	2016-07-04 20:15:07.940128	\N	\N
30	875889aa215e	test@test.com	\N	875889aa215e	\N	\N	\N	["875889aa215e"]	f	2016-07-04 20:15:07.960712	2016-07-04 20:15:07.960712	\N	\N
31	729cc14ca520	test@test.com	\N	729cc14ca520	\N	\N	\N	["729cc14ca520"]	f	2016-07-04 20:15:07.978258	2016-07-04 20:15:07.978258	\N	\N
32	8171784c30ee	test@test.com	\N	8171784c30ee	\N	\N	\N	["8171784c30ee"]	f	2016-07-04 20:15:07.994422	2016-07-04 20:15:07.994422	\N	\N
33	77030c4bc451	test@test.com	\N	77030c4bc451	\N	\N	\N	["77030c4bc451"]	f	2016-07-04 20:15:08.014426	2016-07-04 20:15:08.014426	\N	\N
34	113834126910	test@test.com	\N	113834126910	\N	\N	\N	["113834126910"]	f	2016-07-04 20:15:08.034407	2016-07-04 20:15:08.034407	\N	\N
35	51f4366e0e42	test@test.com	\N	51f4366e0e42	\N	\N	\N	["51f4366e0e42"]	f	2016-07-04 20:15:08.052964	2016-07-04 20:15:08.052964	\N	\N
36	0cee2135ecdb	test@test.com	\N	0cee2135ecdb	\N	\N	\N	["0cee2135ecdb"]	f	2016-07-04 20:15:08.066867	2016-07-04 20:15:08.066867	\N	\N
37	a51ad4983281	test@test.com	\N	a51ad4983281	\N	\N	\N	["a51ad4983281"]	f	2016-07-04 20:15:08.081703	2016-07-04 20:15:08.081703	\N	\N
38	067dd08410f7	test@test.com	\N	067dd08410f7	\N	\N	\N	["067dd08410f7"]	f	2016-07-04 20:15:08.093982	2016-07-04 20:15:08.093982	\N	\N
39	a9c895f5042a	test@test.com	\N	a9c895f5042a	\N	\N	\N	["a9c895f5042a"]	f	2016-07-04 20:15:08.107055	2016-07-04 20:15:08.107055	\N	\N
40	86c3f5b8e1fe	test@test.com	\N	86c3f5b8e1fe	\N	\N	\N	["86c3f5b8e1fe"]	f	2016-07-04 20:15:08.120796	2016-07-04 20:15:08.120796	\N	\N
41	5cb2b3a7199d	test@test.com	\N	5cb2b3a7199d	\N	\N	\N	["5cb2b3a7199d"]	f	2016-07-04 20:15:08.13823	2016-07-04 20:15:08.13823	\N	\N
42	9fe62d2b6fd1	test@test.com	\N	9fe62d2b6fd1	\N	\N	\N	["9fe62d2b6fd1"]	f	2016-07-04 20:15:08.155035	2016-07-04 20:15:08.155035	\N	\N
43	b9d6d0ec7d55	test@test.com	\N	b9d6d0ec7d55	\N	\N	\N	["b9d6d0ec7d55"]	f	2016-07-04 20:15:08.171342	2016-07-04 20:15:08.171342	\N	\N
44	0bc0de6090a7	test@test.com	\N	0bc0de6090a7	\N	\N	\N	["0bc0de6090a7"]	f	2016-07-04 20:15:08.184056	2016-07-04 20:15:08.184056	\N	\N
45	2f5ee6befd30	test@test.com	\N	2f5ee6befd30	\N	\N	\N	["2f5ee6befd30"]	f	2016-07-04 20:15:08.19701	2016-07-04 20:15:08.19701	\N	\N
46	f5cc154f7481	test@test.com	\N	f5cc154f7481	\N	\N	\N	["f5cc154f7481"]	f	2016-07-04 20:15:08.223541	2016-07-04 20:15:08.223541	\N	\N
47	7de687069f54	test@test.com	\N	7de687069f54	\N	\N	\N	["7de687069f54"]	f	2016-07-04 20:15:08.245549	2016-07-04 20:15:08.245549	\N	\N
48	3e336a3b7d88	test@test.com	\N	3e336a3b7d88	\N	\N	\N	["3e336a3b7d88"]	f	2016-07-04 20:15:08.25853	2016-07-04 20:15:08.25853	\N	\N
49	07c6d12f84ca	test@test.com	\N	07c6d12f84ca	\N	\N	\N	["07c6d12f84ca"]	f	2016-07-04 20:15:08.284828	2016-07-04 20:15:08.284828	\N	\N
50	501ed640d26a	test@test.com	\N	501ed640d26a	\N	\N	\N	["501ed640d26a"]	f	2016-07-04 20:15:08.301427	2016-07-04 20:15:08.301427	\N	\N
51	47c26ee9d809	test@test.com	\N	47c26ee9d809	\N	\N	\N	["47c26ee9d809"]	f	2016-07-04 20:15:08.319043	2016-07-04 20:15:08.319043	\N	\N
52	6795f1f079ba	test@test.com	\N	6795f1f079ba	\N	\N	\N	["6795f1f079ba"]	f	2016-07-04 20:15:08.336103	2016-07-04 20:15:08.336103	\N	\N
53	b9c1be64532c	test@test.com	\N	b9c1be64532c	\N	\N	\N	["b9c1be64532c"]	f	2016-07-04 20:15:08.352785	2016-07-04 20:15:08.352785	\N	\N
54	2d1cdf9a034f	test@test.com	\N	2d1cdf9a034f	\N	\N	\N	["2d1cdf9a034f"]	f	2016-07-04 20:15:08.369954	2016-07-04 20:15:08.369954	\N	\N
55	ecdc002c2e86	test@test.com	\N	ecdc002c2e86	\N	\N	\N	["ecdc002c2e86"]	f	2016-07-04 20:15:08.384795	2016-07-04 20:15:08.384795	\N	\N
56	f05758aa6d1f	test@test.com	\N	f05758aa6d1f	\N	\N	\N	["f05758aa6d1f"]	f	2016-07-04 20:15:08.400653	2016-07-04 20:15:08.400653	\N	\N
57	7ffade61fe45	test@test.com	\N	7ffade61fe45	\N	\N	\N	["7ffade61fe45"]	f	2016-07-04 20:15:08.41664	2016-07-04 20:15:08.41664	\N	\N
58	82787cbf0c8b	test@test.com	\N	82787cbf0c8b	\N	\N	\N	["82787cbf0c8b"]	f	2016-07-04 20:15:08.441234	2016-07-04 20:15:08.441234	\N	\N
59	3860e747e4b1	test@test.com	\N	3860e747e4b1	\N	\N	\N	["3860e747e4b1"]	f	2016-07-04 20:15:08.458287	2016-07-04 20:15:08.458287	\N	\N
60	db5f846267cf	test@test.com	\N	db5f846267cf	\N	\N	\N	["db5f846267cf"]	f	2016-07-04 20:15:08.479127	2016-07-04 20:15:08.479127	\N	\N
61	42fa01039442	test@test.com	\N	42fa01039442	\N	\N	\N	["42fa01039442"]	f	2016-07-04 20:15:08.494512	2016-07-04 20:15:08.494512	\N	\N
62	3f3892f0550b	test@test.com	\N	3f3892f0550b	\N	\N	\N	["3f3892f0550b"]	f	2016-07-04 20:15:08.510442	2016-07-04 20:15:08.510442	\N	\N
63	1d858411be7c	test@test.com	\N	1d858411be7c	\N	\N	\N	["1d858411be7c"]	f	2016-07-04 20:15:08.525315	2016-07-04 20:15:08.525315	\N	\N
64	1c09a0769ba1	test@test.com	\N	1c09a0769ba1	\N	\N	\N	["1c09a0769ba1"]	f	2016-07-04 20:15:08.539699	2016-07-04 20:15:08.539699	\N	\N
65	63d9aff57c11	test@test.com	\N	63d9aff57c11	\N	\N	\N	["63d9aff57c11"]	f	2016-07-04 20:15:08.555329	2016-07-04 20:15:08.555329	\N	\N
66	dfbe6ed34112	test@test.com	\N	dfbe6ed34112	\N	\N	\N	["dfbe6ed34112"]	f	2016-07-04 20:15:08.570736	2016-07-04 20:15:08.570736	\N	\N
67	4ea891d1367f	test@test.com	\N	4ea891d1367f	\N	\N	\N	["4ea891d1367f"]	f	2016-07-04 20:15:08.585436	2016-07-04 20:15:08.585436	\N	\N
68	da88274f4940	test@test.com	\N	da88274f4940	\N	\N	\N	["da88274f4940"]	f	2016-07-04 20:15:08.599489	2016-07-04 20:15:08.599489	\N	\N
69	e65a6877e454	test@test.com	\N	e65a6877e454	\N	\N	\N	["e65a6877e454"]	f	2016-07-04 20:15:08.616125	2016-07-04 20:15:08.616125	\N	\N
70	c1481260c4e8	test@test.com	\N	c1481260c4e8	\N	\N	\N	["c1481260c4e8"]	f	2016-07-04 20:15:08.633672	2016-07-04 20:15:08.633672	\N	\N
71	176f126f8420	test@test.com	\N	176f126f8420	\N	\N	\N	["176f126f8420"]	f	2016-07-04 20:15:08.651483	2016-07-04 20:15:08.651483	\N	\N
72	5a86e3fc1789	test@test.com	\N	5a86e3fc1789	\N	\N	\N	["5a86e3fc1789"]	f	2016-07-04 20:15:08.690485	2016-07-04 20:15:08.690485	\N	\N
73	62449a819cce	test@test.com	\N	62449a819cce	\N	\N	\N	["62449a819cce"]	f	2016-07-04 20:15:08.706937	2016-07-04 20:15:08.706937	\N	\N
74	f26678efd0ff	test@test.com	\N	f26678efd0ff	\N	\N	\N	["f26678efd0ff"]	f	2016-07-04 20:15:08.722504	2016-07-04 20:15:08.722504	\N	\N
75	7f29e580ba3f	test@test.com	\N	7f29e580ba3f	\N	\N	\N	["7f29e580ba3f"]	f	2016-07-04 20:15:08.737743	2016-07-04 20:15:08.737743	\N	\N
76	6ee7b0a1a829	test@test.com	\N	6ee7b0a1a829	\N	\N	\N	["6ee7b0a1a829"]	f	2016-07-04 20:15:08.753299	2016-07-04 20:15:08.753299	\N	\N
77	ed26342f56a5	test@test.com	\N	ed26342f56a5	\N	\N	\N	["ed26342f56a5"]	f	2016-07-04 20:15:08.767733	2016-07-04 20:15:08.767733	\N	\N
78	0ea59c053c64	test@test.com	\N	0ea59c053c64	\N	\N	\N	["0ea59c053c64"]	f	2016-07-04 20:15:08.783197	2016-07-04 20:15:08.783197	\N	\N
79	59285ebf3df4	test@test.com	\N	59285ebf3df4	\N	\N	\N	["59285ebf3df4"]	f	2016-07-04 20:15:08.798057	2016-07-04 20:15:08.798057	\N	\N
80	9c1cae698137	test@test.com	\N	9c1cae698137	\N	\N	\N	["9c1cae698137"]	f	2016-07-04 20:15:08.815501	2016-07-04 20:15:08.815501	\N	\N
81	9f3558e9675b	test@test.com	\N	9f3558e9675b	\N	\N	\N	["9f3558e9675b"]	f	2016-07-04 20:15:08.830317	2016-07-04 20:15:08.830317	\N	\N
82	b87043cb9975	test@test.com	\N	b87043cb9975	\N	\N	\N	["b87043cb9975"]	f	2016-07-04 20:15:08.845868	2016-07-04 20:15:08.845868	\N	\N
83	eca36fc176d9	test@test.com	\N	eca36fc176d9	\N	\N	\N	["eca36fc176d9"]	f	2016-07-04 20:15:08.859814	2016-07-04 20:15:08.859814	\N	\N
84	59f86047acb6	test@test.com	\N	59f86047acb6	\N	\N	\N	["59f86047acb6"]	f	2016-07-04 20:15:08.881576	2016-07-04 20:15:08.881576	\N	\N
85	dded113de4ed	test@test.com	\N	dded113de4ed	\N	\N	\N	["dded113de4ed"]	f	2016-07-04 20:15:08.896162	2016-07-04 20:15:08.896162	\N	\N
86	f6d2dfa29363	test@test.com	\N	f6d2dfa29363	\N	\N	\N	["f6d2dfa29363"]	f	2016-07-04 20:15:08.909559	2016-07-04 20:15:08.909559	\N	\N
87	0330d3bfac9c	test@test.com	\N	0330d3bfac9c	\N	\N	\N	["0330d3bfac9c"]	f	2016-07-04 20:15:08.923923	2016-07-04 20:15:08.923923	\N	\N
88	7d2d2dbf5ef7	test@test.com	\N	7d2d2dbf5ef7	\N	\N	\N	["7d2d2dbf5ef7"]	f	2016-07-04 20:15:08.939292	2016-07-04 20:15:08.939292	\N	\N
89	3eb8058a24a6	test@test.com	\N	3eb8058a24a6	\N	\N	\N	["3eb8058a24a6"]	f	2016-07-04 20:15:08.953126	2016-07-04 20:15:08.953126	\N	\N
90	98dbdf7cdbf7	test@test.com	\N	98dbdf7cdbf7	\N	\N	\N	["98dbdf7cdbf7"]	f	2016-07-04 20:15:08.968227	2016-07-04 20:15:08.968227	\N	\N
91	9cc76f1e5783	test@test.com	\N	9cc76f1e5783	\N	\N	\N	["9cc76f1e5783"]	f	2016-07-04 20:15:08.985335	2016-07-04 20:15:08.985335	\N	\N
92	581ac9ee1247	test@test.com	\N	581ac9ee1247	\N	\N	\N	["581ac9ee1247"]	f	2016-07-04 20:15:09.000167	2016-07-04 20:15:09.000167	\N	\N
93	225eaf2b1f84	test@test.com	\N	225eaf2b1f84	\N	\N	\N	["225eaf2b1f84"]	f	2016-07-04 20:15:09.015837	2016-07-04 20:15:09.015837	\N	\N
94	afe411003c3d	test@test.com	\N	afe411003c3d	\N	\N	\N	["afe411003c3d"]	f	2016-07-04 20:15:09.031088	2016-07-04 20:15:09.031088	\N	\N
95	0fdba89dcf6d	test@test.com	\N	0fdba89dcf6d	\N	\N	\N	["0fdba89dcf6d"]	f	2016-07-04 20:15:09.049001	2016-07-04 20:15:09.049001	\N	\N
96	eb249a2aec7a	test@test.com	\N	eb249a2aec7a	\N	\N	\N	["eb249a2aec7a"]	f	2016-07-04 20:15:09.065422	2016-07-04 20:15:09.065422	\N	\N
97	5d6e31971154	test@test.com	\N	5d6e31971154	\N	\N	\N	["5d6e31971154"]	f	2016-07-04 20:15:09.080912	2016-07-04 20:15:09.080912	\N	\N
98	0370fa88f451	test@test.com	\N	0370fa88f451	\N	\N	\N	["0370fa88f451"]	f	2016-07-04 20:15:09.099909	2016-07-04 20:15:09.099909	\N	\N
99	e8aeb5a99b4d	test@test.com	\N	e8aeb5a99b4d	\N	\N	\N	["e8aeb5a99b4d"]	f	2016-07-04 20:15:09.115078	2016-07-04 20:15:09.115078	\N	\N
100	1fdbc584d259	test@test.com	\N	1fdbc584d259	\N	\N	\N	["1fdbc584d259"]	f	2016-07-04 20:15:09.129331	2016-07-04 20:15:09.129331	\N	\N
\.


--
-- Name: merchants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paulmcguane
--

SELECT pg_catalog.setval('merchants_id_seq', 100, true);


--
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: paulmcguane
--

COPY order_items (id, price, total, order_id, variant_id, state, tax_rate_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paulmcguane
--

SELECT pg_catalog.setval('order_items_id_seq', 1, false);


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: paulmcguane
--

COPY orders (id, number, ip_address, email, state, user_id, merchant_id, bill_address_id, order_status_id, coupon_id, active, shipped, calculated_at, completed_at, created_at, updated_at) FROM stdin;
\.


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paulmcguane
--

SELECT pg_catalog.setval('orders_id_seq', 1, false);


--
-- Data for Name: payment_methods; Type: TABLE DATA; Schema: public; Owner: paulmcguane
--

COPY payment_methods (id, user_id, customer_cim_id, token, address_id, address_cim_id, "default") FROM stdin;
\.


--
-- Name: payment_methods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paulmcguane
--

SELECT pg_catalog.setval('payment_methods_id_seq', 1, false);


--
-- Data for Name: phone_types; Type: TABLE DATA; Schema: public; Owner: paulmcguane
--

COPY phone_types (id, name, created_at, updated_at) FROM stdin;
1	Mobile	2016-07-04 20:15:09.299378	2016-07-04 20:15:09.299378
2	Land	2016-07-04 20:15:09.307456	2016-07-04 20:15:09.307456
3	Work	2016-07-04 20:15:09.312162	2016-07-04 20:15:09.312162
4	Other	2016-07-04 20:15:09.318714	2016-07-04 20:15:09.318714
\.


--
-- Name: phone_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paulmcguane
--

SELECT pg_catalog.setval('phone_types_id_seq', 4, true);


--
-- Data for Name: phones; Type: TABLE DATA; Schema: public; Owner: paulmcguane
--

COPY phones (id, phone_type_id, number, phoneable_type, phoneable_id, "primary", created_at, updated_at) FROM stdin;
\.


--
-- Name: phones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paulmcguane
--

SELECT pg_catalog.setval('phones_id_seq', 1, false);


--
-- Data for Name: @product_attributes; Type: TABLE DATA; Schema: public; Owner: paulmcguane
--

COPY product_properties (id, product_id, property_id, description, created_at, updated_at) FROM stdin;
\.


--
-- Name: product_properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paulmcguane
--

SELECT pg_catalog.setval('product_properties_id_seq', 1, false);


--
-- Data for Name: product_types; Type: TABLE DATA; Schema: public; Owner: paulmcguane
--

COPY product_types (id, name, active, created_at, updated_at) FROM stdin;
1	Hot	t	2016-07-04 20:15:07.154022	2016-07-04 20:15:07.154022
2	Cold 	t	2016-07-04 20:15:07.16282	2016-07-04 20:15:07.16282
\.


--
-- Name: product_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paulmcguane
--

SELECT pg_catalog.setval('product_types_id_seq', 1, false);


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: paulmcguane
--

COPY products (id, name, description, product_keywords, product_type_id, prototype_id, permalink, available_at, deleted_at, meta_keywords, meta_description, featured, description_markup, brand_id, created_at, updated_at) FROM stdin;
1	Bubble Tea	A refreshing flavoured fruit tea or milk teas served ice cold or piping hot with chewy natural tapioca balls.	\N	1	\N	bubble-tea	\N	2016-07-04 20:15:07.317205	Bubble Tea: Arefreshingflavouredfruitteaormilkteasservedicecoldorpipinghotwithchewynaturaltapiocaballs	Bubble Tea: A refreshing flavoured fruit tea or milk teas served ice cold or piping hot with chewy natural tapioca balls.	f	\N	\N	2016-07-04 20:15:07.318393	2016-07-04 20:15:07.318393
2	Cappuccino	Silky frothed milk poured over a shot of espresso, topped with a touch of chocolate.	\N	1	\N	cappuccino	\N	2016-07-04 20:15:07.331759	Cappuccino: Silkyfrothedmilkpouredoverashotofespressotoppedwithatouchofchocolate	Cappuccino: Silky frothed milk poured over a shot of espresso, topped with a touch of chocolate.	f	\N	\N	2016-07-04 20:15:07.332346	2016-07-04 20:15:07.332346
3	Chai Latte	\N	\N	1	\N	chai-latte	\N	2016-07-04 20:15:07.338933	\N	\N	f	\N	\N	2016-07-04 20:15:07.33954	2016-07-04 20:15:07.33954
4	Flat White	Steamed milk with small, fine bubbles and a glossy or velvety consistency poured over a shot of espresso.	\N	1	\N	flat-white	\N	2016-07-04 20:15:07.347281	Flat White: Steamedmilkwithsmallfinebubblesandaglossyorvelvetyconsistencypouredoverashotofespresso	Flat White: Steamed milk with small, fine bubbles and a glossy or velvety consistency poured over a shot of espresso.	f	\N	\N	2016-07-04 20:15:07.347864	2016-07-04 20:15:07.347864
5	Hot Chocolate	Silky steamed milk poured over melted chocolate topped with chocolate powder.	\N	1	\N	hot-chocolate	\N	2016-07-04 20:15:07.353184	Hot Chocolate: Silkysteamedmilkpouredovermeltedchocolatetoppedwithchocolatepowder	Hot Chocolate: Silky steamed milk poured over melted chocolate topped with chocolate powder.	f	\N	\N	2016-07-04 20:15:07.353891	2016-07-04 20:15:07.353891
6	Latte	A drink made by adding perfectly steamed milk to a shot of espresso served in a glass.	\N	1	\N	latte	\N	2016-07-04 20:15:07.360012	Latte: Adrinkmadebyaddingperfectlysteamedmilktoashotofespressoservedinaglass	Latte: A drink made by adding perfectly steamed milk to a shot of espresso served in a glass.	f	\N	\N	2016-07-04 20:15:07.36059	2016-07-04 20:15:07.36059
7	Long Black	A long black is made by pouring a double-shot of espresso or ristretto over hot water.	\N	1	\N	long-black	\N	2016-07-04 20:15:07.366608	Long Black: Alongblackismadebypouringadoubleshotofespressoorristrettooverhotwater	Long Black: A long black is made by pouring a double-shot of espresso or ristretto over hot water.	f	\N	\N	2016-07-04 20:15:07.367374	2016-07-04 20:15:07.367374
8	Long Macchiato	A double shot of espresso with a small amount of steamed milk.	\N	1	\N	long-macchiato	\N	2016-07-04 20:15:07.373827	Long Macchiato: Adoubleshotofespressowithasmallamountofsteamedmilk	Long Macchiato: A double shot of espresso with a small amount of steamed milk.	f	\N	\N	2016-07-04 20:15:07.374522	2016-07-04 20:15:07.374522
9	Macchiato	A single shot of espresso with a small amount of steamed milk.	\N	1	\N	macchiato	\N	2016-07-04 20:15:07.381258	Macchiato: Asingleshotofespressowithasmallamountofsteamedmilk	Macchiato: A single shot of espresso with a small amount of steamed milk.	f	\N	\N	2016-07-04 20:15:07.381981	2016-07-04 20:15:07.381981
10	Mocha	Mocha, in its most basic formulation, can also be referred to as hot chocolate with a shot of espresso added to it.	\N	1	\N	mocha	\N	2016-07-04 20:15:07.387895	Mocha: Mochainitsmostbasicformulationcanalsobereferredtoashotchocolatewithashotofespressoaddedtoit	Mocha: Mocha, in its most basic formulation, can also be referred to as hot chocolate with a shot of espresso added to it.	f	\N	\N	2016-07-04 20:15:07.389306	2016-07-04 20:15:07.389306
11	Short Black	A short black is made by pouring a single-shot of espresso or ristretto over hot water.	\N	1	\N	short-black	\N	2016-07-04 20:15:07.394673	Short Black: Ashortblackismadebypouringasingleshotofespressoorristrettooverhotwater	Short Black: A short black is made by pouring a single-shot of espresso or ristretto over hot water.	f	\N	\N	2016-07-04 20:15:07.39515	2016-07-04 20:15:07.39515
12	Tea	\N	\N	1	\N	tea	\N	2016-07-04 20:15:07.399907	\N	\N	f	\N	\N	2016-07-04 20:15:07.400587	2016-07-04 20:15:07.400587
\.


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paulmcguane
--

SELECT pg_catalog.setval('products_id_seq', 12, true);


--
-- Data for Name: properties; Type: TABLE DATA; Schema: public; Owner: paulmcguane
--

COPY properties (id, display_name, identifying_name, active, created_at, updated_at) FROM stdin;
1	Size	Size	t	2016-07-04 20:15:07.247442	2016-07-04 20:15:07.247442
2	Milk	Milk	t	2016-07-04 20:15:07.253106	2016-07-04 20:15:07.253106
3	Sugar	Sugar	t	2016-07-04 20:15:07.257338	2016-07-04 20:15:07.257338
4	Coffee Blend	Coffee Blend	t	2016-07-04 20:15:07.260985	2016-07-04 20:15:07.260985
5	Strength	Strenth	t	2016-07-04 20:15:07.265036	2016-07-04 20:15:07.265036
6	Extra Shot	Extra Shot	t	2016-07-04 20:15:07.268483	2016-07-04 20:15:07.268483
7	Syrup	Syrup	t	2016-07-04 20:15:07.272252	2016-07-04 20:15:07.272252
8	Flavour	Flavour	t	2016-07-04 20:15:07.275962	2016-07-04 20:15:07.275962
9	Topping	Toppings	t	2016-07-04 20:15:07.280482	2016-07-04 20:15:07.280482
10	Sweetness	Sweetness	t	2016-07-04 20:15:07.284491	2016-07-04 20:15:07.284491
\.


--
-- Name: properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paulmcguane
--

SELECT pg_catalog.setval('properties_id_seq', 1, false);


--
-- Data for Name: prototype_properties; Type: TABLE DATA; Schema: public; Owner: paulmcguane
--

COPY prototype_properties (id, prototype_id, property_id, created_at, updated_at) FROM stdin;
1	1	1	2016-07-04 20:15:07.199474	2016-07-04 20:15:07.199474
2	2	1	2016-07-04 20:15:07.205892	2016-07-04 20:15:07.205892
3	1	2	2016-07-04 20:15:07.210619	2016-07-04 20:15:07.210619
4	2	2	2016-07-04 20:15:07.216111	2016-07-04 20:15:07.216111
5	1	3	2016-07-04 20:15:07.221769	2016-07-04 20:15:07.221769
6	1	4	2016-07-04 20:15:07.226796	2016-07-04 20:15:07.226796
7	1	5	2016-07-04 20:15:07.231652	2016-07-04 20:15:07.231652
8	2	5	2016-07-04 20:15:07.23505	2016-07-04 20:15:07.23505
\.


--
-- Name: prototype_properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paulmcguane
--

SELECT pg_catalog.setval('prototype_properties_id_seq', 8, true);


--
-- Data for Name: prototypes; Type: TABLE DATA; Schema: public; Owner: paulmcguane
--

COPY prototypes (id, name, active, created_at, updated_at) FROM stdin;
1	Hot	t	2016-07-04 20:15:07.182324	2016-07-04 20:15:07.182324
2	Cold	t	2016-07-04 20:15:07.188792	2016-07-04 20:15:07.188792
\.


--
-- Name: prototypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paulmcguane
--

SELECT pg_catalog.setval('prototypes_id_seq', 1, false);


--
-- Data for Name: referral_bonus; Type: TABLE DATA; Schema: public; Owner: paulmcguane
--

COPY referral_bonus (id, amount, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: referral_bonus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paulmcguane
--

SELECT pg_catalog.setval('referral_bonus_id_seq', 1, false);


--
-- Data for Name: referral_programs; Type: TABLE DATA; Schema: public; Owner: paulmcguane
--

COPY referral_programs (id, active, description, name, referral_bonus_id, created_at, updated_at) FROM stdin;
1	t	For every referral that joins translation missing: en.company and makes a purchase.  $5 will be given to you as store credit.	$5 per Referral	1	2016-07-04 20:15:09.178336	2016-07-04 20:15:09.178336
\.


--
-- Name: referral_programs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paulmcguane
--

SELECT pg_catalog.setval('referral_programs_id_seq', 1, true);


--
-- Data for Name: referral_types; Type: TABLE DATA; Schema: public; Owner: paulmcguane
--

COPY referral_types (id, name, created_at, updated_at) FROM stdin;
1	Directly through Web Form	2016-07-04 20:15:09.203389	2016-07-04 20:15:09.203389
2	Admin Web Form	2016-07-04 20:15:09.212223	2016-07-04 20:15:09.212223
\.


--
-- Name: referral_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paulmcguane
--

SELECT pg_catalog.setval('referral_types_id_seq', 2, true);


--
-- Data for Name: referrals; Type: TABLE DATA; Schema: public; Owner: paulmcguane
--

COPY referrals (id, applied, clicked_at, email, name, purchased_at, referral_program_id, referral_type_id, referral_user_id, referring_user_id, registered_at, sent_at, created_at, updated_at) FROM stdin;
4	f	\N	paul.mcguane@me.com	Paul	\N	1	2	3	1	2016-07-06 21:47:17.67977	\N	2016-07-05 19:05:50.539628	2016-07-06 21:47:17.680795
\.


--
-- Name: referrals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paulmcguane
--

SELECT pg_catalog.setval('referrals_id_seq', 4, true);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: paulmcguane
--

COPY roles (id, name, resource_id, resource_type, created_at, updated_at) FROM stdin;
1	customer	\N	\N	2016-07-04 20:15:01.195031	2016-07-04 20:15:01.195031
2	banned	\N	\N	2016-07-04 20:15:01.21232	2016-07-04 20:15:01.21232
3	merchant	\N	\N	2016-07-04 20:15:01.21715	2016-07-04 20:15:01.21715
4	staff	\N	\N	2016-07-04 20:15:01.221468	2016-07-04 20:15:01.221468
5	admin	\N	\N	2016-07-04 20:15:01.225664	2016-07-04 20:15:01.225664
\.


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paulmcguane
--

SELECT pg_catalog.setval('roles_id_seq', 5, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: paulmcguane
--

COPY schema_migrations (version) FROM stdin;
20160630113707
20130109195538
20150108210139
20150908130433
20150908132702
20150909114100
20150915120455
20150917130511
20150920114415
20151128115522
20151213121355
20151213140537
20151213142552
20151220133023
20151220140300
20151220140458
20151220141620
20151220225858
20151222113357
20151222113519
20151222113706
20151222113851
20151227135707
20151228032518
20151228033502
20151228111124
20151229005544
20151229005628
20160102053104
20160102053311
20160121122141
20160121122419
20160325043015
20160326000527
20160401130909
20160516083238
20160525102303
20160527120121
20160607081035
20160710142050
\.


--
-- Data for Name: states; Type: TABLE DATA; Schema: public; Owner: paulmcguane
--

COPY states (id, name, abbreviation, described_as, country_id, shipping_zone_id, created_at, updated_at) FROM stdin;
1	Victoria	VIC	State	12	2	2016-07-04 20:15:07.085599	2016-07-04 20:15:07.085599
2	New South Wales	NSW	State	12	1	2016-07-04 20:15:07.098682	2016-07-04 20:15:07.098682
3	Queensland	QLD	State	12	1	2016-07-04 20:15:07.103646	2016-07-04 20:15:07.103646
4	Tasmania	TAS	State	12	4	2016-07-04 20:15:07.108377	2016-07-04 20:15:07.108377
5	South Australia	SA	State	12	1	2016-07-04 20:15:07.11652	2016-07-04 20:15:07.11652
6	Western Australia	WA	State	12	1	2016-07-04 20:15:07.122485	2016-07-04 20:15:07.122485
7	Northern Territory	NT	Territory	12	1	2016-07-04 20:15:07.129262	2016-07-04 20:15:07.129262
8	Australia Capital Territory	ACT	Territory	12	1	2016-07-04 20:15:07.136413	2016-07-04 20:15:07.136413
\.


--
-- Name: states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paulmcguane
--

SELECT pg_catalog.setval('states_id_seq', 1, false);


--
-- Data for Name: store_credits; Type: TABLE DATA; Schema: public; Owner: paulmcguane
--

COPY store_credits (id, amount, user_id, expire_at, last_expired_at, created_at, updated_at) FROM stdin;
1	0.00	1	2017-01-04 23:59:59.999999	\N	2016-07-04 20:15:01.456066	2016-07-04 20:15:01.456066
2	0.00	2	2017-01-04 23:59:59.999999	\N	2016-07-04 20:15:03.996396	2016-07-04 20:15:03.996396
3	0.00	3	2017-01-06 23:59:59.999999	\N	2016-07-06 21:47:17.596413	2016-07-06 21:47:17.596413
\.


--
-- Name: store_credits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paulmcguane
--

SELECT pg_catalog.setval('store_credits_id_seq', 3, true);


--
-- Data for Name: tax_rates; Type: TABLE DATA; Schema: public; Owner: paulmcguane
--

COPY tax_rates (id, percentage, state_id, country_id, start_date, end_date, active, created_at, updated_at) FROM stdin;
\.


--
-- Name: tax_rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paulmcguane
--

SELECT pg_catalog.setval('tax_rates_id_seq', 1, false);


--
-- Data for Name: trading_hours; Type: TABLE DATA; Schema: public; Owner: paulmcguane
--

COPY trading_hours (id, merchant_id, weekday, open_time, close_time, trades) FROM stdin;
1	1	0	\N	\N	t
2	1	1	\N	\N	t
3	1	2	\N	\N	t
4	1	3	\N	\N	t
5	1	4	\N	\N	t
6	1	5	\N	\N	t
7	1	6	\N	\N	t
8	2	0	\N	\N	t
9	2	1	\N	\N	t
10	2	2	\N	\N	t
11	2	3	\N	\N	t
12	2	4	\N	\N	t
13	2	5	\N	\N	t
14	2	6	\N	\N	t
15	3	0	\N	\N	t
16	3	1	\N	\N	t
17	3	2	\N	\N	t
18	3	3	\N	\N	t
19	3	4	\N	\N	t
20	3	5	\N	\N	t
21	3	6	\N	\N	t
22	4	0	\N	\N	t
23	4	1	\N	\N	t
24	4	2	\N	\N	t
25	4	3	\N	\N	t
26	4	4	\N	\N	t
27	4	5	\N	\N	t
28	4	6	\N	\N	t
29	5	0	\N	\N	t
30	5	1	\N	\N	t
31	5	2	\N	\N	t
32	5	3	\N	\N	t
33	5	4	\N	\N	t
34	5	5	\N	\N	t
35	5	6	\N	\N	t
36	6	0	\N	\N	t
37	6	1	\N	\N	t
38	6	2	\N	\N	t
39	6	3	\N	\N	t
40	6	4	\N	\N	t
41	6	5	\N	\N	t
42	6	6	\N	\N	t
43	7	0	\N	\N	t
44	7	1	\N	\N	t
45	7	2	\N	\N	t
46	7	3	\N	\N	t
47	7	4	\N	\N	t
48	7	5	\N	\N	t
49	7	6	\N	\N	t
50	8	0	\N	\N	t
51	8	1	\N	\N	t
52	8	2	\N	\N	t
53	8	3	\N	\N	t
54	8	4	\N	\N	t
55	8	5	\N	\N	t
56	8	6	\N	\N	t
57	9	0	\N	\N	t
58	9	1	\N	\N	t
59	9	2	\N	\N	t
60	9	3	\N	\N	t
61	9	4	\N	\N	t
62	9	5	\N	\N	t
63	9	6	\N	\N	t
64	10	0	\N	\N	t
65	10	1	\N	\N	t
66	10	2	\N	\N	t
67	10	3	\N	\N	t
68	10	4	\N	\N	t
69	10	5	\N	\N	t
70	10	6	\N	\N	t
71	11	0	\N	\N	t
72	11	1	\N	\N	t
73	11	2	\N	\N	t
74	11	3	\N	\N	t
75	11	4	\N	\N	t
76	11	5	\N	\N	t
77	11	6	\N	\N	t
78	12	0	\N	\N	t
79	12	1	\N	\N	t
80	12	2	\N	\N	t
81	12	3	\N	\N	t
82	12	4	\N	\N	t
83	12	5	\N	\N	t
84	12	6	\N	\N	t
85	13	0	\N	\N	t
86	13	1	\N	\N	t
87	13	2	\N	\N	t
88	13	3	\N	\N	t
89	13	4	\N	\N	t
90	13	5	\N	\N	t
91	13	6	\N	\N	t
92	14	0	\N	\N	t
93	14	1	\N	\N	t
94	14	2	\N	\N	t
95	14	3	\N	\N	t
96	14	4	\N	\N	t
97	14	5	\N	\N	t
98	14	6	\N	\N	t
99	15	0	\N	\N	t
100	15	1	\N	\N	t
101	15	2	\N	\N	t
102	15	3	\N	\N	t
103	15	4	\N	\N	t
104	15	5	\N	\N	t
105	15	6	\N	\N	t
106	16	0	\N	\N	t
107	16	1	\N	\N	t
108	16	2	\N	\N	t
109	16	3	\N	\N	t
110	16	4	\N	\N	t
111	16	5	\N	\N	t
112	16	6	\N	\N	t
113	17	0	\N	\N	t
114	17	1	\N	\N	t
115	17	2	\N	\N	t
116	17	3	\N	\N	t
117	17	4	\N	\N	t
118	17	5	\N	\N	t
119	17	6	\N	\N	t
120	18	0	\N	\N	t
121	18	1	\N	\N	t
122	18	2	\N	\N	t
123	18	3	\N	\N	t
124	18	4	\N	\N	t
125	18	5	\N	\N	t
126	18	6	\N	\N	t
127	19	0	\N	\N	t
128	19	1	\N	\N	t
129	19	2	\N	\N	t
130	19	3	\N	\N	t
131	19	4	\N	\N	t
132	19	5	\N	\N	t
133	19	6	\N	\N	t
134	20	0	\N	\N	t
135	20	1	\N	\N	t
136	20	2	\N	\N	t
137	20	3	\N	\N	t
138	20	4	\N	\N	t
139	20	5	\N	\N	t
140	20	6	\N	\N	t
141	21	0	\N	\N	t
142	21	1	\N	\N	t
143	21	2	\N	\N	t
144	21	3	\N	\N	t
145	21	4	\N	\N	t
146	21	5	\N	\N	t
147	21	6	\N	\N	t
148	22	0	\N	\N	t
149	22	1	\N	\N	t
150	22	2	\N	\N	t
151	22	3	\N	\N	t
152	22	4	\N	\N	t
153	22	5	\N	\N	t
154	22	6	\N	\N	t
155	23	0	\N	\N	t
156	23	1	\N	\N	t
157	23	2	\N	\N	t
158	23	3	\N	\N	t
159	23	4	\N	\N	t
160	23	5	\N	\N	t
161	23	6	\N	\N	t
162	24	0	\N	\N	t
163	24	1	\N	\N	t
164	24	2	\N	\N	t
165	24	3	\N	\N	t
166	24	4	\N	\N	t
167	24	5	\N	\N	t
168	24	6	\N	\N	t
169	25	0	\N	\N	t
170	25	1	\N	\N	t
171	25	2	\N	\N	t
172	25	3	\N	\N	t
173	25	4	\N	\N	t
174	25	5	\N	\N	t
175	25	6	\N	\N	t
176	26	0	\N	\N	t
177	26	1	\N	\N	t
178	26	2	\N	\N	t
179	26	3	\N	\N	t
180	26	4	\N	\N	t
181	26	5	\N	\N	t
182	26	6	\N	\N	t
183	27	0	\N	\N	t
184	27	1	\N	\N	t
185	27	2	\N	\N	t
186	27	3	\N	\N	t
187	27	4	\N	\N	t
188	27	5	\N	\N	t
189	27	6	\N	\N	t
190	28	0	\N	\N	t
191	28	1	\N	\N	t
192	28	2	\N	\N	t
193	28	3	\N	\N	t
194	28	4	\N	\N	t
195	28	5	\N	\N	t
196	28	6	\N	\N	t
197	29	0	\N	\N	t
198	29	1	\N	\N	t
199	29	2	\N	\N	t
200	29	3	\N	\N	t
201	29	4	\N	\N	t
202	29	5	\N	\N	t
203	29	6	\N	\N	t
204	30	0	\N	\N	t
205	30	1	\N	\N	t
206	30	2	\N	\N	t
207	30	3	\N	\N	t
208	30	4	\N	\N	t
209	30	5	\N	\N	t
210	30	6	\N	\N	t
211	31	0	\N	\N	t
212	31	1	\N	\N	t
213	31	2	\N	\N	t
214	31	3	\N	\N	t
215	31	4	\N	\N	t
216	31	5	\N	\N	t
217	31	6	\N	\N	t
218	32	0	\N	\N	t
219	32	1	\N	\N	t
220	32	2	\N	\N	t
221	32	3	\N	\N	t
222	32	4	\N	\N	t
223	32	5	\N	\N	t
224	32	6	\N	\N	t
225	33	0	\N	\N	t
226	33	1	\N	\N	t
227	33	2	\N	\N	t
228	33	3	\N	\N	t
229	33	4	\N	\N	t
230	33	5	\N	\N	t
231	33	6	\N	\N	t
232	34	0	\N	\N	t
233	34	1	\N	\N	t
234	34	2	\N	\N	t
235	34	3	\N	\N	t
236	34	4	\N	\N	t
237	34	5	\N	\N	t
238	34	6	\N	\N	t
239	35	0	\N	\N	t
240	35	1	\N	\N	t
241	35	2	\N	\N	t
242	35	3	\N	\N	t
243	35	4	\N	\N	t
244	35	5	\N	\N	t
245	35	6	\N	\N	t
246	36	0	\N	\N	t
247	36	1	\N	\N	t
248	36	2	\N	\N	t
249	36	3	\N	\N	t
250	36	4	\N	\N	t
251	36	5	\N	\N	t
252	36	6	\N	\N	t
253	37	0	\N	\N	t
254	37	1	\N	\N	t
255	37	2	\N	\N	t
256	37	3	\N	\N	t
257	37	4	\N	\N	t
258	37	5	\N	\N	t
259	37	6	\N	\N	t
260	38	0	\N	\N	t
261	38	1	\N	\N	t
262	38	2	\N	\N	t
263	38	3	\N	\N	t
264	38	4	\N	\N	t
265	38	5	\N	\N	t
266	38	6	\N	\N	t
267	39	0	\N	\N	t
268	39	1	\N	\N	t
269	39	2	\N	\N	t
270	39	3	\N	\N	t
271	39	4	\N	\N	t
272	39	5	\N	\N	t
273	39	6	\N	\N	t
274	40	0	\N	\N	t
275	40	1	\N	\N	t
276	40	2	\N	\N	t
277	40	3	\N	\N	t
278	40	4	\N	\N	t
279	40	5	\N	\N	t
280	40	6	\N	\N	t
281	41	0	\N	\N	t
282	41	1	\N	\N	t
283	41	2	\N	\N	t
284	41	3	\N	\N	t
285	41	4	\N	\N	t
286	41	5	\N	\N	t
287	41	6	\N	\N	t
288	42	0	\N	\N	t
289	42	1	\N	\N	t
290	42	2	\N	\N	t
291	42	3	\N	\N	t
292	42	4	\N	\N	t
293	42	5	\N	\N	t
294	42	6	\N	\N	t
295	43	0	\N	\N	t
296	43	1	\N	\N	t
297	43	2	\N	\N	t
298	43	3	\N	\N	t
299	43	4	\N	\N	t
300	43	5	\N	\N	t
301	43	6	\N	\N	t
302	44	0	\N	\N	t
303	44	1	\N	\N	t
304	44	2	\N	\N	t
305	44	3	\N	\N	t
306	44	4	\N	\N	t
307	44	5	\N	\N	t
308	44	6	\N	\N	t
309	45	0	\N	\N	t
310	45	1	\N	\N	t
311	45	2	\N	\N	t
312	45	3	\N	\N	t
313	45	4	\N	\N	t
314	45	5	\N	\N	t
315	45	6	\N	\N	t
316	46	0	\N	\N	t
317	46	1	\N	\N	t
318	46	2	\N	\N	t
319	46	3	\N	\N	t
320	46	4	\N	\N	t
321	46	5	\N	\N	t
322	46	6	\N	\N	t
323	47	0	\N	\N	t
324	47	1	\N	\N	t
325	47	2	\N	\N	t
326	47	3	\N	\N	t
327	47	4	\N	\N	t
328	47	5	\N	\N	t
329	47	6	\N	\N	t
330	48	0	\N	\N	t
331	48	1	\N	\N	t
332	48	2	\N	\N	t
333	48	3	\N	\N	t
334	48	4	\N	\N	t
335	48	5	\N	\N	t
336	48	6	\N	\N	t
337	49	0	\N	\N	t
338	49	1	\N	\N	t
339	49	2	\N	\N	t
340	49	3	\N	\N	t
341	49	4	\N	\N	t
342	49	5	\N	\N	t
343	49	6	\N	\N	t
344	50	0	\N	\N	t
345	50	1	\N	\N	t
346	50	2	\N	\N	t
347	50	3	\N	\N	t
348	50	4	\N	\N	t
349	50	5	\N	\N	t
350	50	6	\N	\N	t
351	51	0	\N	\N	t
352	51	1	\N	\N	t
353	51	2	\N	\N	t
354	51	3	\N	\N	t
355	51	4	\N	\N	t
356	51	5	\N	\N	t
357	51	6	\N	\N	t
358	52	0	\N	\N	t
359	52	1	\N	\N	t
360	52	2	\N	\N	t
361	52	3	\N	\N	t
362	52	4	\N	\N	t
363	52	5	\N	\N	t
364	52	6	\N	\N	t
365	53	0	\N	\N	t
366	53	1	\N	\N	t
367	53	2	\N	\N	t
368	53	3	\N	\N	t
369	53	4	\N	\N	t
370	53	5	\N	\N	t
371	53	6	\N	\N	t
372	54	0	\N	\N	t
373	54	1	\N	\N	t
374	54	2	\N	\N	t
375	54	3	\N	\N	t
376	54	4	\N	\N	t
377	54	5	\N	\N	t
378	54	6	\N	\N	t
379	55	0	\N	\N	t
380	55	1	\N	\N	t
381	55	2	\N	\N	t
382	55	3	\N	\N	t
383	55	4	\N	\N	t
384	55	5	\N	\N	t
385	55	6	\N	\N	t
386	56	0	\N	\N	t
387	56	1	\N	\N	t
388	56	2	\N	\N	t
389	56	3	\N	\N	t
390	56	4	\N	\N	t
391	56	5	\N	\N	t
392	56	6	\N	\N	t
393	57	0	\N	\N	t
394	57	1	\N	\N	t
395	57	2	\N	\N	t
396	57	3	\N	\N	t
397	57	4	\N	\N	t
398	57	5	\N	\N	t
399	57	6	\N	\N	t
400	58	0	\N	\N	t
401	58	1	\N	\N	t
402	58	2	\N	\N	t
403	58	3	\N	\N	t
404	58	4	\N	\N	t
405	58	5	\N	\N	t
406	58	6	\N	\N	t
407	59	0	\N	\N	t
408	59	1	\N	\N	t
409	59	2	\N	\N	t
410	59	3	\N	\N	t
411	59	4	\N	\N	t
412	59	5	\N	\N	t
413	59	6	\N	\N	t
414	60	0	\N	\N	t
415	60	1	\N	\N	t
416	60	2	\N	\N	t
417	60	3	\N	\N	t
418	60	4	\N	\N	t
419	60	5	\N	\N	t
420	60	6	\N	\N	t
421	61	0	\N	\N	t
422	61	1	\N	\N	t
423	61	2	\N	\N	t
424	61	3	\N	\N	t
425	61	4	\N	\N	t
426	61	5	\N	\N	t
427	61	6	\N	\N	t
428	62	0	\N	\N	t
429	62	1	\N	\N	t
430	62	2	\N	\N	t
431	62	3	\N	\N	t
432	62	4	\N	\N	t
433	62	5	\N	\N	t
434	62	6	\N	\N	t
435	63	0	\N	\N	t
436	63	1	\N	\N	t
437	63	2	\N	\N	t
438	63	3	\N	\N	t
439	63	4	\N	\N	t
440	63	5	\N	\N	t
441	63	6	\N	\N	t
442	64	0	\N	\N	t
443	64	1	\N	\N	t
444	64	2	\N	\N	t
445	64	3	\N	\N	t
446	64	4	\N	\N	t
447	64	5	\N	\N	t
448	64	6	\N	\N	t
449	65	0	\N	\N	t
450	65	1	\N	\N	t
451	65	2	\N	\N	t
452	65	3	\N	\N	t
453	65	4	\N	\N	t
454	65	5	\N	\N	t
455	65	6	\N	\N	t
456	66	0	\N	\N	t
457	66	1	\N	\N	t
458	66	2	\N	\N	t
459	66	3	\N	\N	t
460	66	4	\N	\N	t
461	66	5	\N	\N	t
462	66	6	\N	\N	t
463	67	0	\N	\N	t
464	67	1	\N	\N	t
465	67	2	\N	\N	t
466	67	3	\N	\N	t
467	67	4	\N	\N	t
468	67	5	\N	\N	t
469	67	6	\N	\N	t
470	68	0	\N	\N	t
471	68	1	\N	\N	t
472	68	2	\N	\N	t
473	68	3	\N	\N	t
474	68	4	\N	\N	t
475	68	5	\N	\N	t
476	68	6	\N	\N	t
477	69	0	\N	\N	t
478	69	1	\N	\N	t
479	69	2	\N	\N	t
480	69	3	\N	\N	t
481	69	4	\N	\N	t
482	69	5	\N	\N	t
483	69	6	\N	\N	t
484	70	0	\N	\N	t
485	70	1	\N	\N	t
486	70	2	\N	\N	t
487	70	3	\N	\N	t
488	70	4	\N	\N	t
489	70	5	\N	\N	t
490	70	6	\N	\N	t
491	71	0	\N	\N	t
492	71	1	\N	\N	t
493	71	2	\N	\N	t
494	71	3	\N	\N	t
495	71	4	\N	\N	t
496	71	5	\N	\N	t
497	71	6	\N	\N	t
498	72	0	\N	\N	t
499	72	1	\N	\N	t
500	72	2	\N	\N	t
501	72	3	\N	\N	t
502	72	4	\N	\N	t
503	72	5	\N	\N	t
504	72	6	\N	\N	t
505	73	0	\N	\N	t
506	73	1	\N	\N	t
507	73	2	\N	\N	t
508	73	3	\N	\N	t
509	73	4	\N	\N	t
510	73	5	\N	\N	t
511	73	6	\N	\N	t
512	74	0	\N	\N	t
513	74	1	\N	\N	t
514	74	2	\N	\N	t
515	74	3	\N	\N	t
516	74	4	\N	\N	t
517	74	5	\N	\N	t
518	74	6	\N	\N	t
519	75	0	\N	\N	t
520	75	1	\N	\N	t
521	75	2	\N	\N	t
522	75	3	\N	\N	t
523	75	4	\N	\N	t
524	75	5	\N	\N	t
525	75	6	\N	\N	t
526	76	0	\N	\N	t
527	76	1	\N	\N	t
528	76	2	\N	\N	t
529	76	3	\N	\N	t
530	76	4	\N	\N	t
531	76	5	\N	\N	t
532	76	6	\N	\N	t
533	77	0	\N	\N	t
534	77	1	\N	\N	t
535	77	2	\N	\N	t
536	77	3	\N	\N	t
537	77	4	\N	\N	t
538	77	5	\N	\N	t
539	77	6	\N	\N	t
540	78	0	\N	\N	t
541	78	1	\N	\N	t
542	78	2	\N	\N	t
543	78	3	\N	\N	t
544	78	4	\N	\N	t
545	78	5	\N	\N	t
546	78	6	\N	\N	t
547	79	0	\N	\N	t
548	79	1	\N	\N	t
549	79	2	\N	\N	t
550	79	3	\N	\N	t
551	79	4	\N	\N	t
552	79	5	\N	\N	t
553	79	6	\N	\N	t
554	80	0	\N	\N	t
555	80	1	\N	\N	t
556	80	2	\N	\N	t
557	80	3	\N	\N	t
558	80	4	\N	\N	t
559	80	5	\N	\N	t
560	80	6	\N	\N	t
561	81	0	\N	\N	t
562	81	1	\N	\N	t
563	81	2	\N	\N	t
564	81	3	\N	\N	t
565	81	4	\N	\N	t
566	81	5	\N	\N	t
567	81	6	\N	\N	t
568	82	0	\N	\N	t
569	82	1	\N	\N	t
570	82	2	\N	\N	t
571	82	3	\N	\N	t
572	82	4	\N	\N	t
573	82	5	\N	\N	t
574	82	6	\N	\N	t
575	83	0	\N	\N	t
576	83	1	\N	\N	t
577	83	2	\N	\N	t
578	83	3	\N	\N	t
579	83	4	\N	\N	t
580	83	5	\N	\N	t
581	83	6	\N	\N	t
582	84	0	\N	\N	t
583	84	1	\N	\N	t
584	84	2	\N	\N	t
585	84	3	\N	\N	t
586	84	4	\N	\N	t
587	84	5	\N	\N	t
588	84	6	\N	\N	t
589	85	0	\N	\N	t
590	85	1	\N	\N	t
591	85	2	\N	\N	t
592	85	3	\N	\N	t
593	85	4	\N	\N	t
594	85	5	\N	\N	t
595	85	6	\N	\N	t
596	86	0	\N	\N	t
597	86	1	\N	\N	t
598	86	2	\N	\N	t
599	86	3	\N	\N	t
600	86	4	\N	\N	t
601	86	5	\N	\N	t
602	86	6	\N	\N	t
603	87	0	\N	\N	t
604	87	1	\N	\N	t
605	87	2	\N	\N	t
606	87	3	\N	\N	t
607	87	4	\N	\N	t
608	87	5	\N	\N	t
609	87	6	\N	\N	t
610	88	0	\N	\N	t
611	88	1	\N	\N	t
612	88	2	\N	\N	t
613	88	3	\N	\N	t
614	88	4	\N	\N	t
615	88	5	\N	\N	t
616	88	6	\N	\N	t
617	89	0	\N	\N	t
618	89	1	\N	\N	t
619	89	2	\N	\N	t
620	89	3	\N	\N	t
621	89	4	\N	\N	t
622	89	5	\N	\N	t
623	89	6	\N	\N	t
624	90	0	\N	\N	t
625	90	1	\N	\N	t
626	90	2	\N	\N	t
627	90	3	\N	\N	t
628	90	4	\N	\N	t
629	90	5	\N	\N	t
630	90	6	\N	\N	t
631	91	0	\N	\N	t
632	91	1	\N	\N	t
633	91	2	\N	\N	t
634	91	3	\N	\N	t
635	91	4	\N	\N	t
636	91	5	\N	\N	t
637	91	6	\N	\N	t
638	92	0	\N	\N	t
639	92	1	\N	\N	t
640	92	2	\N	\N	t
641	92	3	\N	\N	t
642	92	4	\N	\N	t
643	92	5	\N	\N	t
644	92	6	\N	\N	t
645	93	0	\N	\N	t
646	93	1	\N	\N	t
647	93	2	\N	\N	t
648	93	3	\N	\N	t
649	93	4	\N	\N	t
650	93	5	\N	\N	t
651	93	6	\N	\N	t
652	94	0	\N	\N	t
653	94	1	\N	\N	t
654	94	2	\N	\N	t
655	94	3	\N	\N	t
656	94	4	\N	\N	t
657	94	5	\N	\N	t
658	94	6	\N	\N	t
659	95	0	\N	\N	t
660	95	1	\N	\N	t
661	95	2	\N	\N	t
662	95	3	\N	\N	t
663	95	4	\N	\N	t
664	95	5	\N	\N	t
665	95	6	\N	\N	t
666	96	0	\N	\N	t
667	96	1	\N	\N	t
668	96	2	\N	\N	t
669	96	3	\N	\N	t
670	96	4	\N	\N	t
671	96	5	\N	\N	t
672	96	6	\N	\N	t
673	97	0	\N	\N	t
674	97	1	\N	\N	t
675	97	2	\N	\N	t
676	97	3	\N	\N	t
677	97	4	\N	\N	t
678	97	5	\N	\N	t
679	97	6	\N	\N	t
680	98	0	\N	\N	t
681	98	1	\N	\N	t
682	98	2	\N	\N	t
683	98	3	\N	\N	t
684	98	4	\N	\N	t
685	98	5	\N	\N	t
686	98	6	\N	\N	t
687	99	0	\N	\N	t
688	99	1	\N	\N	t
689	99	2	\N	\N	t
690	99	3	\N	\N	t
691	99	4	\N	\N	t
692	99	5	\N	\N	t
693	99	6	\N	\N	t
694	100	0	\N	\N	t
695	100	1	\N	\N	t
696	100	2	\N	\N	t
697	100	3	\N	\N	t
698	100	4	\N	\N	t
699	100	5	\N	\N	t
700	100	6	\N	\N	t
\.


--
-- Name: trading_hours_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paulmcguane
--

SELECT pg_catalog.setval('trading_hours_id_seq', 700, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: paulmcguane
--

COPY users (id, first_name, last_name, email, state, mobile, customer_cim_id, encrypted_password, confirmation_token, access_token, comments_count, sms_notification, push_notification, created_at, updated_at, latitude, longitude, role, remember_token) FROM stdin;
2	Merchant	Admin	paul.mcguane@icloud.com	active	0430091461	20169040	$2a$10$6pbzD9S1UIJ1RA7rw59f9ugaaoGLA7WuSIUXtcNX7UvlLowcU4ekm	fe30e158902bc302666c46c71d7b4a09933db1ce	\N	0	t	t	2016-07-04 20:15:03.992895	2016-07-06 20:18:49.6155	\N	\N	\N	c1d4ae328b03ddaca25d3745e0bcda1fc3b99340
3	Paul	Mcguane	paul.mcguane@me.com	active	0430091474	76880060	$2a$10$h97RWdZ5g1gT2Zw5L2ul7enB014yccwg/hBQjVCUoroBW80r6SdDa	\N	\N	0	t	t	2016-07-06 21:47:17.480198	2016-07-06 22:27:07.136501	\N	\N	\N	74264ea2909968ed0d8e948fb1e0c701b8df898b
1	Paul	Mcguane	admin@cup.town	active	0430091465	61678305	$2a$10$LRyYsy99EgYziMnyhUimYOD2YTj2zW.6n/rnqlY0HMSmdfw8JXJPu	\N	\N	0	t	t	2016-07-04 20:15:01.407687	2016-07-07 22:04:18.027723	\N	\N	\N	f79cf4bf9156b7309530ef2b921ae21a063946cd
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paulmcguane
--

SELECT pg_catalog.setval('users_id_seq', 3, true);


--
-- Data for Name: users_roles; Type: TABLE DATA; Schema: public; Owner: paulmcguane
--

COPY users_roles (user_id, role_id) FROM stdin;
\.


--
-- Data for Name: variant_merchants; Type: TABLE DATA; Schema: public; Owner: paulmcguane
--

COPY variant_merchants (id, variant_id, merchant_id, active, created_at, updated_at) FROM stdin;
\.


--
-- Name: variant_merchants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paulmcguane
--

SELECT pg_catalog.setval('variant_merchants_id_seq', 1, false);


--
-- Data for Name: variant_properties; Type: TABLE DATA; Schema: public; Owner: paulmcguane
--

COPY variant_properties (id, property_id, variant_id, description, "primary", created_at, updated_at) FROM stdin;
\.


--
-- Name: variant_properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paulmcguane
--

SELECT pg_catalog.setval('variant_properties_id_seq', 1, false);


--
-- Data for Name: variants; Type: TABLE DATA; Schema: public; Owner: paulmcguane
--

COPY variants (id, product_id, sku, price, cost, master, deleted_at, created_at, updated_at) FROM stdin;
\.


--
-- Name: variants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paulmcguane
--

SELECT pg_catalog.setval('variants_id_seq', 1, false);


--
-- Name: accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- Name: address_types_pkey; Type: CONSTRAINT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY address_types
    ADD CONSTRAINT address_types_pkey PRIMARY KEY (id);


--
-- Name: addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: cart_items_pkey; Type: CONSTRAINT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY cart_items
    ADD CONSTRAINT cart_items_pkey PRIMARY KEY (id);


--
-- Name: carts_pkey; Type: CONSTRAINT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY (id);


--
-- Name: countries_pkey; Type: CONSTRAINT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: coupons_pkey; Type: CONSTRAINT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY coupons
    ADD CONSTRAINT coupons_pkey PRIMARY KEY (id);


--
-- Name: friendly_id_slugs_pkey; Type: CONSTRAINT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY friendly_id_slugs
    ADD CONSTRAINT friendly_id_slugs_pkey PRIMARY KEY (id);


--
-- Name: item_types_pkey; Type: CONSTRAINT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY item_types
    ADD CONSTRAINT item_types_pkey PRIMARY KEY (id);


--
-- Name: merchant_products_pkey; Type: CONSTRAINT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY merchant_products
    ADD CONSTRAINT merchant_products_pkey PRIMARY KEY (id);


--
-- Name: merchants_pkey; Type: CONSTRAINT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY merchants
    ADD CONSTRAINT merchants_pkey PRIMARY KEY (id);


--
-- Name: order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id);


--
-- Name: orders_pkey; Type: CONSTRAINT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: payment_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY payment_methods
    ADD CONSTRAINT payment_methods_pkey PRIMARY KEY (id);


--
-- Name: phone_types_pkey; Type: CONSTRAINT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY phone_types
    ADD CONSTRAINT phone_types_pkey PRIMARY KEY (id);


--
-- Name: phones_pkey; Type: CONSTRAINT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY phones
    ADD CONSTRAINT phones_pkey PRIMARY KEY (id);


--
-- Name: product_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY product_properties
    ADD CONSTRAINT product_properties_pkey PRIMARY KEY (id);


--
-- Name: product_types_pkey; Type: CONSTRAINT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY product_types
    ADD CONSTRAINT product_types_pkey PRIMARY KEY (id);


--
-- Name: products_pkey; Type: CONSTRAINT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: properties_pkey; Type: CONSTRAINT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY properties
    ADD CONSTRAINT properties_pkey PRIMARY KEY (id);


--
-- Name: prototype_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY prototype_properties
    ADD CONSTRAINT prototype_properties_pkey PRIMARY KEY (id);


--
-- Name: prototypes_pkey; Type: CONSTRAINT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY prototypes
    ADD CONSTRAINT prototypes_pkey PRIMARY KEY (id);


--
-- Name: referral_bonus_pkey; Type: CONSTRAINT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY referral_bonus
    ADD CONSTRAINT referral_bonus_pkey PRIMARY KEY (id);


--
-- Name: referral_programs_pkey; Type: CONSTRAINT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY referral_programs
    ADD CONSTRAINT referral_programs_pkey PRIMARY KEY (id);


--
-- Name: referral_types_pkey; Type: CONSTRAINT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY referral_types
    ADD CONSTRAINT referral_types_pkey PRIMARY KEY (id);


--
-- Name: referrals_pkey; Type: CONSTRAINT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY referrals
    ADD CONSTRAINT referrals_pkey PRIMARY KEY (id);


--
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: states_pkey; Type: CONSTRAINT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY states
    ADD CONSTRAINT states_pkey PRIMARY KEY (id);


--
-- Name: store_credits_pkey; Type: CONSTRAINT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY store_credits
    ADD CONSTRAINT store_credits_pkey PRIMARY KEY (id);


--
-- Name: tax_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY tax_rates
    ADD CONSTRAINT tax_rates_pkey PRIMARY KEY (id);


--
-- Name: trading_hours_pkey; Type: CONSTRAINT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY trading_hours
    ADD CONSTRAINT trading_hours_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: variant_merchants_pkey; Type: CONSTRAINT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY variant_merchants
    ADD CONSTRAINT variant_merchants_pkey PRIMARY KEY (id);


--
-- Name: variant_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY variant_properties
    ADD CONSTRAINT variant_properties_pkey PRIMARY KEY (id);


--
-- Name: variants_pkey; Type: CONSTRAINT; Schema: public; Owner: paulmcguane
--

ALTER TABLE ONLY variants
    ADD CONSTRAINT variants_pkey PRIMARY KEY (id);


--
-- Name: index_accounts_on_merchant_id; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_accounts_on_merchant_id ON accounts USING btree (merchant_id);


--
-- Name: index_address_types_on_name; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_address_types_on_name ON address_types USING btree (name);


--
-- Name: index_addresses_on_addressable_id; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_addresses_on_addressable_id ON addresses USING btree (addressable_id);


--
-- Name: index_addresses_on_addressable_type; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_addresses_on_addressable_type ON addresses USING btree (addressable_type);


--
-- Name: index_addresses_on_state_id; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_addresses_on_state_id ON addresses USING btree (state_id);


--
-- Name: index_cart_items_on_cart_id; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_cart_items_on_cart_id ON cart_items USING btree (cart_id);


--
-- Name: index_cart_items_on_item_type_id; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_cart_items_on_item_type_id ON cart_items USING btree (item_type_id);


--
-- Name: index_cart_items_on_user_id; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_cart_items_on_user_id ON cart_items USING btree (user_id);


--
-- Name: index_cart_items_on_variant_id; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_cart_items_on_variant_id ON cart_items USING btree (variant_id);


--
-- Name: index_carts_on_customer_id; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_carts_on_customer_id ON carts USING btree (customer_id);


--
-- Name: index_carts_on_user_id; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_carts_on_user_id ON carts USING btree (user_id);


--
-- Name: index_countries_on_active; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_countries_on_active ON countries USING btree (active);


--
-- Name: index_countries_on_name; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_countries_on_name ON countries USING btree (name);


--
-- Name: index_coupons_on_code; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_coupons_on_code ON coupons USING btree (code);


--
-- Name: index_coupons_on_expires_at; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_coupons_on_expires_at ON coupons USING btree (expires_at);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type ON friendly_id_slugs USING btree (slug, sluggable_type);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE UNIQUE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope ON friendly_id_slugs USING btree (slug, sluggable_type, scope);


--
-- Name: index_friendly_id_slugs_on_sluggable_id; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_id ON friendly_id_slugs USING btree (sluggable_id);


--
-- Name: index_friendly_id_slugs_on_sluggable_type; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_type ON friendly_id_slugs USING btree (sluggable_type);


--
-- Name: index_merchants_on_name; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_merchants_on_name ON merchants USING btree (name);


--
-- Name: index_merchants_on_permalink; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE UNIQUE INDEX index_merchants_on_permalink ON merchants USING btree (permalink);


--
-- Name: index_order_items_on_order_id; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_order_items_on_order_id ON order_items USING btree (order_id);


--
-- Name: index_order_items_on_tax_rate_id; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_order_items_on_tax_rate_id ON order_items USING btree (tax_rate_id);


--
-- Name: index_order_items_on_variant_id; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_order_items_on_variant_id ON order_items USING btree (variant_id);


--
-- Name: index_orders_on_bill_address_id; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_orders_on_bill_address_id ON orders USING btree (bill_address_id);


--
-- Name: index_orders_on_coupon_id; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_orders_on_coupon_id ON orders USING btree (coupon_id);


--
-- Name: index_orders_on_email; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_orders_on_email ON orders USING btree (email);


--
-- Name: index_orders_on_merchant_id; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_orders_on_merchant_id ON orders USING btree (merchant_id);


--
-- Name: index_orders_on_number; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_orders_on_number ON orders USING btree (number);


--
-- Name: index_orders_on_user_id; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_orders_on_user_id ON orders USING btree (user_id);


--
-- Name: index_payment_methods_on_address_id; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_payment_methods_on_address_id ON payment_methods USING btree (address_id);


--
-- Name: index_payment_methods_on_customer_cim_id; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_payment_methods_on_customer_cim_id ON payment_methods USING btree (customer_cim_id);


--
-- Name: index_payment_methods_on_user_id; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_payment_methods_on_user_id ON payment_methods USING btree (user_id);


--
-- Name: index_products_on_brand_id; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_products_on_brand_id ON products USING btree (brand_id);


--
-- Name: index_products_on_deleted_at; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_products_on_deleted_at ON products USING btree (deleted_at);


--
-- Name: index_products_on_name; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_products_on_name ON products USING btree (name);


--
-- Name: index_products_on_permalink; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE UNIQUE INDEX index_products_on_permalink ON products USING btree (permalink);


--
-- Name: index_products_on_product_type_id; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_products_on_product_type_id ON products USING btree (product_type_id);


--
-- Name: index_products_on_prototype_id; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_products_on_prototype_id ON products USING btree (prototype_id);


--
-- Name: index_referral_programs_on_referral_bonus_id; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_referral_programs_on_referral_bonus_id ON referral_programs USING btree (referral_bonus_id);


--
-- Name: index_referrals_on_email; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_referrals_on_email ON referrals USING btree (email);


--
-- Name: index_referrals_on_referral_program_id; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_referrals_on_referral_program_id ON referrals USING btree (referral_program_id);


--
-- Name: index_referrals_on_referral_type_id; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_referrals_on_referral_type_id ON referrals USING btree (referral_type_id);


--
-- Name: index_referrals_on_referral_user_id; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_referrals_on_referral_user_id ON referrals USING btree (referral_user_id);


--
-- Name: index_referrals_on_referring_user_id; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_referrals_on_referring_user_id ON referrals USING btree (referring_user_id);


--
-- Name: index_roles_on_name; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_roles_on_name ON roles USING btree (name);


--
-- Name: index_roles_on_name_and_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_roles_on_name_and_resource_type_and_resource_id ON roles USING btree (name, resource_type, resource_id);


--
-- Name: index_states_on_abbreviation; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_states_on_abbreviation ON states USING btree (abbreviation);


--
-- Name: index_states_on_country_id; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_states_on_country_id ON states USING btree (country_id);


--
-- Name: index_states_on_name; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_states_on_name ON states USING btree (name);


--
-- Name: index_store_credits_on_user_id; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_store_credits_on_user_id ON store_credits USING btree (user_id);


--
-- Name: index_tax_rates_on_country_id; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_tax_rates_on_country_id ON tax_rates USING btree (country_id);


--
-- Name: index_tax_rates_on_state_id; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_tax_rates_on_state_id ON tax_rates USING btree (state_id);


--
-- Name: index_trading_hours_on_merchant_id; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_trading_hours_on_merchant_id ON trading_hours USING btree (merchant_id);


--
-- Name: index_users_on_access_token; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE UNIQUE INDEX index_users_on_access_token ON users USING btree (access_token);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_first_name; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_users_on_first_name ON users USING btree (first_name);


--
-- Name: index_users_on_last_name; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_users_on_last_name ON users USING btree (last_name);


--
-- Name: index_users_on_mobile; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE UNIQUE INDEX index_users_on_mobile ON users USING btree (mobile);


--
-- Name: index_users_on_remember_token; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_users_on_remember_token ON users USING btree (remember_token);


--
-- Name: index_users_roles_on_role_id_and_user_id; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_users_roles_on_role_id_and_user_id ON users_roles USING btree (role_id, user_id);


--
-- Name: index_variant_properties_on_property_id; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_variant_properties_on_property_id ON variant_properties USING btree (property_id);


--
-- Name: index_variant_properties_on_variant_id; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_variant_properties_on_variant_id ON variant_properties USING btree (variant_id);


--
-- Name: index_variants_on_product_id; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE INDEX index_variants_on_product_id ON variants USING btree (product_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: paulmcguane
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: paulmcguane
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM paulmcguane;
GRANT ALL ON SCHEMA public TO paulmcguane;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

