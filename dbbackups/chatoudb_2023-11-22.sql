--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.15
-- Dumped by pg_dump version 9.6.15

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
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


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: lionhart
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO lionhart;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: lionhart
--

CREATE SEQUENCE public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO lionhart;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lionhart
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: lionhart
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO lionhart;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: lionhart
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO lionhart;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lionhart
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: lionhart
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO lionhart;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: lionhart
--

CREATE SEQUENCE public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO lionhart;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lionhart
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: lionhart
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO lionhart;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: lionhart
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO lionhart;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: lionhart
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO lionhart;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lionhart
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: lionhart
--

CREATE SEQUENCE public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO lionhart;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lionhart
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: lionhart
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO lionhart;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: lionhart
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO lionhart;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lionhart
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: chatou_auto_audio_page; Type: TABLE; Schema: public; Owner: lionhart
--

CREATE TABLE public.chatou_auto_audio_page (
    ap_id integer NOT NULL,
    audio_appearnce_order integer NOT NULL,
    is_audio_present_on_page boolean NOT NULL,
    audio_id integer NOT NULL,
    page_description_id integer NOT NULL
);


ALTER TABLE public.chatou_auto_audio_page OWNER TO lionhart;

--
-- Name: chatou_auto_audio_page_ap_id_seq; Type: SEQUENCE; Schema: public; Owner: lionhart
--

CREATE SEQUENCE public.chatou_auto_audio_page_ap_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chatou_auto_audio_page_ap_id_seq OWNER TO lionhart;

--
-- Name: chatou_auto_audio_page_ap_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lionhart
--

ALTER SEQUENCE public.chatou_auto_audio_page_ap_id_seq OWNED BY public.chatou_auto_audio_page.ap_id;


--
-- Name: chatou_auto_audios; Type: TABLE; Schema: public; Owner: lionhart
--

CREATE TABLE public.chatou_auto_audios (
    audio_id integer NOT NULL,
    audio_description text NOT NULL,
    audio_title character varying(520) NOT NULL,
    audio_file character varying(100) NOT NULL
);


ALTER TABLE public.chatou_auto_audios OWNER TO lionhart;

--
-- Name: chatou_auto_audios_audio_id_seq; Type: SEQUENCE; Schema: public; Owner: lionhart
--

CREATE SEQUENCE public.chatou_auto_audios_audio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chatou_auto_audios_audio_id_seq OWNER TO lionhart;

--
-- Name: chatou_auto_audios_audio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lionhart
--

ALTER SEQUENCE public.chatou_auto_audios_audio_id_seq OWNED BY public.chatou_auto_audios.audio_id;


--
-- Name: chatou_auto_bar; Type: TABLE; Schema: public; Owner: lionhart
--

CREATE TABLE public.chatou_auto_bar (
    "Bar_id" integer NOT NULL,
    "Page_id" integer NOT NULL,
    "Bar_Description" text
);


ALTER TABLE public.chatou_auto_bar OWNER TO lionhart;

--
-- Name: chatou_auto_bar_Bar_id_seq; Type: SEQUENCE; Schema: public; Owner: lionhart
--

CREATE SEQUENCE public."chatou_auto_bar_Bar_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."chatou_auto_bar_Bar_id_seq" OWNER TO lionhart;

--
-- Name: chatou_auto_bar_Bar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lionhart
--

ALTER SEQUENCE public."chatou_auto_bar_Bar_id_seq" OWNED BY public.chatou_auto_bar."Bar_id";


--
-- Name: chatou_auto_burger_menu_ordering; Type: TABLE; Schema: public; Owner: lionhart
--

CREATE TABLE public.chatou_auto_burger_menu_ordering (
    "BMO_id" integer NOT NULL,
    appearnce_order_in_burger_menu integer NOT NULL,
    itinerary_id integer NOT NULL,
    menu_id integer
);


ALTER TABLE public.chatou_auto_burger_menu_ordering OWNER TO lionhart;

--
-- Name: chatou_auto_burger_menu_ordering_BMO_id_seq; Type: SEQUENCE; Schema: public; Owner: lionhart
--

CREATE SEQUENCE public."chatou_auto_burger_menu_ordering_BMO_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."chatou_auto_burger_menu_ordering_BMO_id_seq" OWNER TO lionhart;

--
-- Name: chatou_auto_burger_menu_ordering_BMO_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lionhart
--

ALTER SEQUENCE public."chatou_auto_burger_menu_ordering_BMO_id_seq" OWNED BY public.chatou_auto_burger_menu_ordering."BMO_id";


--
-- Name: chatou_auto_childrenentertainment; Type: TABLE; Schema: public; Owner: lionhart
--

CREATE TABLE public.chatou_auto_childrenentertainment (
    "CE_id" integer NOT NULL,
    "Page_id" integer NOT NULL,
    "CE_Description" text
);


ALTER TABLE public.chatou_auto_childrenentertainment OWNER TO lionhart;

--
-- Name: chatou_auto_childrenentertainment_CE_id_seq; Type: SEQUENCE; Schema: public; Owner: lionhart
--

CREATE SEQUENCE public."chatou_auto_childrenentertainment_CE_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."chatou_auto_childrenentertainment_CE_id_seq" OWNER TO lionhart;

--
-- Name: chatou_auto_childrenentertainment_CE_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lionhart
--

ALTER SEQUENCE public."chatou_auto_childrenentertainment_CE_id_seq" OWNED BY public.chatou_auto_childrenentertainment."CE_id";


--
-- Name: chatou_auto_images; Type: TABLE; Schema: public; Owner: lionhart
--

CREATE TABLE public.chatou_auto_images (
    image_id integer NOT NULL,
    filename character varying(300) NOT NULL,
    image_name character varying(1000) NOT NULL,
    long_description text NOT NULL,
    short_description text NOT NULL
);


ALTER TABLE public.chatou_auto_images OWNER TO lionhart;

--
-- Name: chatou_auto_images_image_id_seq; Type: SEQUENCE; Schema: public; Owner: lionhart
--

CREATE SEQUENCE public.chatou_auto_images_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chatou_auto_images_image_id_seq OWNER TO lionhart;

--
-- Name: chatou_auto_images_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lionhart
--

ALTER SEQUENCE public.chatou_auto_images_image_id_seq OWNED BY public.chatou_auto_images.image_id;


--
-- Name: chatou_auto_itinerary; Type: TABLE; Schema: public; Owner: lionhart
--

CREATE TABLE public.chatou_auto_itinerary (
    itinerary_id integer NOT NULL,
    itinerary_name character varying(520) NOT NULL,
    itinerary_steps integer NOT NULL,
    itinerary_type character varying(520) NOT NULL,
    is_visible_on_homepage boolean NOT NULL
);


ALTER TABLE public.chatou_auto_itinerary OWNER TO lionhart;

--
-- Name: chatou_auto_itinerary_color_scheme; Type: TABLE; Schema: public; Owner: lionhart
--

CREATE TABLE public.chatou_auto_itinerary_color_scheme (
    "ICS_id" integer NOT NULL,
    itinerary_colors character varying(520) NOT NULL,
    itinerary_id integer
);


ALTER TABLE public.chatou_auto_itinerary_color_scheme OWNER TO lionhart;

--
-- Name: chatou_auto_itinerary_color_scheme_ICS_id_seq; Type: SEQUENCE; Schema: public; Owner: lionhart
--

CREATE SEQUENCE public."chatou_auto_itinerary_color_scheme_ICS_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."chatou_auto_itinerary_color_scheme_ICS_id_seq" OWNER TO lionhart;

--
-- Name: chatou_auto_itinerary_color_scheme_ICS_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lionhart
--

ALTER SEQUENCE public."chatou_auto_itinerary_color_scheme_ICS_id_seq" OWNED BY public.chatou_auto_itinerary_color_scheme."ICS_id";


--
-- Name: chatou_auto_itinerary_itinerary_id_seq; Type: SEQUENCE; Schema: public; Owner: lionhart
--

CREATE SEQUENCE public.chatou_auto_itinerary_itinerary_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chatou_auto_itinerary_itinerary_id_seq OWNER TO lionhart;

--
-- Name: chatou_auto_itinerary_itinerary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lionhart
--

ALTER SEQUENCE public.chatou_auto_itinerary_itinerary_id_seq OWNED BY public.chatou_auto_itinerary.itinerary_id;


--
-- Name: chatou_auto_lieu; Type: TABLE; Schema: public; Owner: lionhart
--

CREATE TABLE public.chatou_auto_lieu (
    "Lieu_id" integer NOT NULL,
    "Page_id" integer NOT NULL,
    "Lieu_Description" text
);


ALTER TABLE public.chatou_auto_lieu OWNER TO lionhart;

--
-- Name: chatou_auto_lieu_Lieu_id_seq; Type: SEQUENCE; Schema: public; Owner: lionhart
--

CREATE SEQUENCE public."chatou_auto_lieu_Lieu_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."chatou_auto_lieu_Lieu_id_seq" OWNER TO lionhart;

--
-- Name: chatou_auto_lieu_Lieu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lionhart
--

ALTER SEQUENCE public."chatou_auto_lieu_Lieu_id_seq" OWNED BY public.chatou_auto_lieu."Lieu_id";


--
-- Name: chatou_auto_map; Type: TABLE; Schema: public; Owner: lionhart
--

CREATE TABLE public.chatou_auto_map (
    page_id integer NOT NULL,
    lat character varying(520) NOT NULL,
    longt character varying(520) NOT NULL,
    "Page_id" integer NOT NULL,
    itinerary_id integer NOT NULL,
    map_images_id integer
);


ALTER TABLE public.chatou_auto_map OWNER TO lionhart;

--
-- Name: chatou_auto_map_controls; Type: TABLE; Schema: public; Owner: lionhart
--

CREATE TABLE public.chatou_auto_map_controls (
    "MC_id" integer NOT NULL,
    zoom_for_home numeric(3,1) NOT NULL,
    pin_zoom numeric(3,1) NOT NULL
);


ALTER TABLE public.chatou_auto_map_controls OWNER TO lionhart;

--
-- Name: chatou_auto_map_controls_MC_id_seq; Type: SEQUENCE; Schema: public; Owner: lionhart
--

CREATE SEQUENCE public."chatou_auto_map_controls_MC_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."chatou_auto_map_controls_MC_id_seq" OWNER TO lionhart;

--
-- Name: chatou_auto_map_controls_MC_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lionhart
--

ALTER SEQUENCE public."chatou_auto_map_controls_MC_id_seq" OWNED BY public.chatou_auto_map_controls."MC_id";


--
-- Name: chatou_auto_map_page_id_seq; Type: SEQUENCE; Schema: public; Owner: lionhart
--

CREATE SEQUENCE public.chatou_auto_map_page_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chatou_auto_map_page_id_seq OWNER TO lionhart;

--
-- Name: chatou_auto_map_page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lionhart
--

ALTER SEQUENCE public.chatou_auto_map_page_id_seq OWNED BY public.chatou_auto_map.page_id;


--
-- Name: chatou_auto_menu; Type: TABLE; Schema: public; Owner: lionhart
--

CREATE TABLE public.chatou_auto_menu (
    menu_id integer NOT NULL,
    menu_title character varying(520) NOT NULL,
    menu_link character varying(520) NOT NULL,
    menu_type character varying(520) NOT NULL,
    itinerary_id integer NOT NULL,
    menu_images_id integer
);


ALTER TABLE public.chatou_auto_menu OWNER TO lionhart;

--
-- Name: chatou_auto_menu_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: lionhart
--

CREATE SEQUENCE public.chatou_auto_menu_menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chatou_auto_menu_menu_id_seq OWNER TO lionhart;

--
-- Name: chatou_auto_menu_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lionhart
--

ALTER SEQUENCE public.chatou_auto_menu_menu_id_seq OWNED BY public.chatou_auto_menu.menu_id;


--
-- Name: chatou_auto_opening_hours; Type: TABLE; Schema: public; Owner: lionhart
--

CREATE TABLE public.chatou_auto_opening_hours (
    oh_id integer NOT NULL,
    "Page_id" integer NOT NULL,
    "oh_Description" text
);


ALTER TABLE public.chatou_auto_opening_hours OWNER TO lionhart;

--
-- Name: chatou_auto_opening_hours_oh_id_seq; Type: SEQUENCE; Schema: public; Owner: lionhart
--

CREATE SEQUENCE public.chatou_auto_opening_hours_oh_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chatou_auto_opening_hours_oh_id_seq OWNER TO lionhart;

--
-- Name: chatou_auto_opening_hours_oh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lionhart
--

ALTER SEQUENCE public.chatou_auto_opening_hours_oh_id_seq OWNED BY public.chatou_auto_opening_hours.oh_id;


--
-- Name: chatou_auto_page; Type: TABLE; Schema: public; Owner: lionhart
--

CREATE TABLE public.chatou_auto_page (
    page_id integer NOT NULL,
    page_title character varying(520) NOT NULL,
    page_type character varying(520) NOT NULL,
    page_order integer,
    itinerary_id integer NOT NULL,
    "page_Summary" character varying(100000) NOT NULL
);


ALTER TABLE public.chatou_auto_page OWNER TO lionhart;

--
-- Name: chatou_auto_page_before_after_image_order; Type: TABLE; Schema: public; Owner: lionhart
--

CREATE TABLE public.chatou_auto_page_before_after_image_order (
    "PD_id" integer NOT NULL,
    is_page_in_present boolean NOT NULL,
    appearnce_order_in_page integer NOT NULL,
    page_description_id integer NOT NULL,
    page_image_after_id integer NOT NULL,
    page_image_before_id integer NOT NULL
);


ALTER TABLE public.chatou_auto_page_before_after_image_order OWNER TO lionhart;

--
-- Name: chatou_auto_page_before_after_image_order_PD_id_seq; Type: SEQUENCE; Schema: public; Owner: lionhart
--

CREATE SEQUENCE public."chatou_auto_page_before_after_image_order_PD_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."chatou_auto_page_before_after_image_order_PD_id_seq" OWNER TO lionhart;

--
-- Name: chatou_auto_page_before_after_image_order_PD_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lionhart
--

ALTER SEQUENCE public."chatou_auto_page_before_after_image_order_PD_id_seq" OWNED BY public.chatou_auto_page_before_after_image_order."PD_id";


--
-- Name: chatou_auto_page_description; Type: TABLE; Schema: public; Owner: lionhart
--

CREATE TABLE public.chatou_auto_page_description (
    "PD_id" integer NOT NULL,
    "page_Text" text NOT NULL,
    page_id integer NOT NULL,
    page_map_id integer,
    page_title_image_id integer
);


ALTER TABLE public.chatou_auto_page_description OWNER TO lionhart;

--
-- Name: chatou_auto_page_description_PD_id_seq; Type: SEQUENCE; Schema: public; Owner: lionhart
--

CREATE SEQUENCE public."chatou_auto_page_description_PD_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."chatou_auto_page_description_PD_id_seq" OWNER TO lionhart;

--
-- Name: chatou_auto_page_description_PD_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lionhart
--

ALTER SEQUENCE public."chatou_auto_page_description_PD_id_seq" OWNED BY public.chatou_auto_page_description."PD_id";


--
-- Name: chatou_auto_page_image_order; Type: TABLE; Schema: public; Owner: lionhart
--

CREATE TABLE public.chatou_auto_page_image_order (
    "PD_id" integer NOT NULL,
    appearnce_order integer NOT NULL,
    page_description_id integer NOT NULL,
    page_image_id integer NOT NULL,
    is_page_present boolean NOT NULL
);


ALTER TABLE public.chatou_auto_page_image_order OWNER TO lionhart;

--
-- Name: chatou_auto_page_image_order_PD_id_seq; Type: SEQUENCE; Schema: public; Owner: lionhart
--

CREATE SEQUENCE public."chatou_auto_page_image_order_PD_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."chatou_auto_page_image_order_PD_id_seq" OWNER TO lionhart;

--
-- Name: chatou_auto_page_image_order_PD_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lionhart
--

ALTER SEQUENCE public."chatou_auto_page_image_order_PD_id_seq" OWNED BY public.chatou_auto_page_image_order."PD_id";


--
-- Name: chatou_auto_page_page_id_seq; Type: SEQUENCE; Schema: public; Owner: lionhart
--

CREATE SEQUENCE public.chatou_auto_page_page_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chatou_auto_page_page_id_seq OWNER TO lionhart;

--
-- Name: chatou_auto_page_page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lionhart
--

ALTER SEQUENCE public.chatou_auto_page_page_id_seq OWNED BY public.chatou_auto_page.page_id;


--
-- Name: chatou_auto_resturant; Type: TABLE; Schema: public; Owner: lionhart
--

CREATE TABLE public.chatou_auto_resturant (
    "Resturant_id" integer NOT NULL,
    "Page_id" integer NOT NULL,
    "Resturant_Description" text
);


ALTER TABLE public.chatou_auto_resturant OWNER TO lionhart;

--
-- Name: chatou_auto_resturant_Resturant_id_seq; Type: SEQUENCE; Schema: public; Owner: lionhart
--

CREATE SEQUENCE public."chatou_auto_resturant_Resturant_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."chatou_auto_resturant_Resturant_id_seq" OWNER TO lionhart;

--
-- Name: chatou_auto_resturant_Resturant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lionhart
--

ALTER SEQUENCE public."chatou_auto_resturant_Resturant_id_seq" OWNED BY public.chatou_auto_resturant."Resturant_id";


--
-- Name: chatou_auto_shopping; Type: TABLE; Schema: public; Owner: lionhart
--

CREATE TABLE public.chatou_auto_shopping (
    "Shopping_id" integer NOT NULL,
    "Page_id" integer NOT NULL,
    "Shopping_Description" text
);


ALTER TABLE public.chatou_auto_shopping OWNER TO lionhart;

--
-- Name: chatou_auto_shopping_Shopping_id_seq; Type: SEQUENCE; Schema: public; Owner: lionhart
--

CREATE SEQUENCE public."chatou_auto_shopping_Shopping_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."chatou_auto_shopping_Shopping_id_seq" OWNER TO lionhart;

--
-- Name: chatou_auto_shopping_Shopping_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lionhart
--

ALTER SEQUENCE public."chatou_auto_shopping_Shopping_id_seq" OWNED BY public.chatou_auto_shopping."Shopping_id";


--
-- Name: chatou_auto_tickets; Type: TABLE; Schema: public; Owner: lionhart
--

CREATE TABLE public.chatou_auto_tickets (
    tickets_id integer NOT NULL,
    "Page_id" integer NOT NULL,
    "tickets_Description" text
);


ALTER TABLE public.chatou_auto_tickets OWNER TO lionhart;

--
-- Name: chatou_auto_tickets_tickets_id_seq; Type: SEQUENCE; Schema: public; Owner: lionhart
--

CREATE SEQUENCE public.chatou_auto_tickets_tickets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chatou_auto_tickets_tickets_id_seq OWNER TO lionhart;

--
-- Name: chatou_auto_tickets_tickets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lionhart
--

ALTER SEQUENCE public.chatou_auto_tickets_tickets_id_seq OWNED BY public.chatou_auto_tickets.tickets_id;


--
-- Name: chatou_auto_toilets; Type: TABLE; Schema: public; Owner: lionhart
--

CREATE TABLE public.chatou_auto_toilets (
    "Toilet_id" integer NOT NULL,
    "Page_id" integer NOT NULL,
    "Toilet_Description" text
);


ALTER TABLE public.chatou_auto_toilets OWNER TO lionhart;

--
-- Name: chatou_auto_toilets_Toilet_id_seq; Type: SEQUENCE; Schema: public; Owner: lionhart
--

CREATE SEQUENCE public."chatou_auto_toilets_Toilet_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."chatou_auto_toilets_Toilet_id_seq" OWNER TO lionhart;

--
-- Name: chatou_auto_toilets_Toilet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lionhart
--

ALTER SEQUENCE public."chatou_auto_toilets_Toilet_id_seq" OWNED BY public.chatou_auto_toilets."Toilet_id";


--
-- Name: chatou_auto_transport; Type: TABLE; Schema: public; Owner: lionhart
--

CREATE TABLE public.chatou_auto_transport (
    transport_id integer NOT NULL,
    "Page_id" integer NOT NULL,
    "transport_Description" text
);


ALTER TABLE public.chatou_auto_transport OWNER TO lionhart;

--
-- Name: chatou_auto_transport_transport_id_seq; Type: SEQUENCE; Schema: public; Owner: lionhart
--

CREATE SEQUENCE public.chatou_auto_transport_transport_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chatou_auto_transport_transport_id_seq OWNER TO lionhart;

--
-- Name: chatou_auto_transport_transport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lionhart
--

ALTER SEQUENCE public.chatou_auto_transport_transport_id_seq OWNED BY public.chatou_auto_transport.transport_id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: lionhart
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO lionhart;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: lionhart
--

CREATE SEQUENCE public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO lionhart;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lionhart
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: lionhart
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO lionhart;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: lionhart
--

CREATE SEQUENCE public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO lionhart;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lionhart
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: lionhart
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO lionhart;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: lionhart
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO lionhart;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lionhart
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: lionhart
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO lionhart;

--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: chatou_auto_audio_page ap_id; Type: DEFAULT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_audio_page ALTER COLUMN ap_id SET DEFAULT nextval('public.chatou_auto_audio_page_ap_id_seq'::regclass);


--
-- Name: chatou_auto_audios audio_id; Type: DEFAULT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_audios ALTER COLUMN audio_id SET DEFAULT nextval('public.chatou_auto_audios_audio_id_seq'::regclass);


--
-- Name: chatou_auto_bar Bar_id; Type: DEFAULT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_bar ALTER COLUMN "Bar_id" SET DEFAULT nextval('public."chatou_auto_bar_Bar_id_seq"'::regclass);


--
-- Name: chatou_auto_burger_menu_ordering BMO_id; Type: DEFAULT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_burger_menu_ordering ALTER COLUMN "BMO_id" SET DEFAULT nextval('public."chatou_auto_burger_menu_ordering_BMO_id_seq"'::regclass);


--
-- Name: chatou_auto_childrenentertainment CE_id; Type: DEFAULT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_childrenentertainment ALTER COLUMN "CE_id" SET DEFAULT nextval('public."chatou_auto_childrenentertainment_CE_id_seq"'::regclass);


--
-- Name: chatou_auto_images image_id; Type: DEFAULT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_images ALTER COLUMN image_id SET DEFAULT nextval('public.chatou_auto_images_image_id_seq'::regclass);


--
-- Name: chatou_auto_itinerary itinerary_id; Type: DEFAULT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_itinerary ALTER COLUMN itinerary_id SET DEFAULT nextval('public.chatou_auto_itinerary_itinerary_id_seq'::regclass);


--
-- Name: chatou_auto_itinerary_color_scheme ICS_id; Type: DEFAULT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_itinerary_color_scheme ALTER COLUMN "ICS_id" SET DEFAULT nextval('public."chatou_auto_itinerary_color_scheme_ICS_id_seq"'::regclass);


--
-- Name: chatou_auto_lieu Lieu_id; Type: DEFAULT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_lieu ALTER COLUMN "Lieu_id" SET DEFAULT nextval('public."chatou_auto_lieu_Lieu_id_seq"'::regclass);


--
-- Name: chatou_auto_map page_id; Type: DEFAULT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_map ALTER COLUMN page_id SET DEFAULT nextval('public.chatou_auto_map_page_id_seq'::regclass);


--
-- Name: chatou_auto_map_controls MC_id; Type: DEFAULT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_map_controls ALTER COLUMN "MC_id" SET DEFAULT nextval('public."chatou_auto_map_controls_MC_id_seq"'::regclass);


--
-- Name: chatou_auto_menu menu_id; Type: DEFAULT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_menu ALTER COLUMN menu_id SET DEFAULT nextval('public.chatou_auto_menu_menu_id_seq'::regclass);


--
-- Name: chatou_auto_opening_hours oh_id; Type: DEFAULT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_opening_hours ALTER COLUMN oh_id SET DEFAULT nextval('public.chatou_auto_opening_hours_oh_id_seq'::regclass);


--
-- Name: chatou_auto_page page_id; Type: DEFAULT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_page ALTER COLUMN page_id SET DEFAULT nextval('public.chatou_auto_page_page_id_seq'::regclass);


--
-- Name: chatou_auto_page_before_after_image_order PD_id; Type: DEFAULT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_page_before_after_image_order ALTER COLUMN "PD_id" SET DEFAULT nextval('public."chatou_auto_page_before_after_image_order_PD_id_seq"'::regclass);


--
-- Name: chatou_auto_page_description PD_id; Type: DEFAULT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_page_description ALTER COLUMN "PD_id" SET DEFAULT nextval('public."chatou_auto_page_description_PD_id_seq"'::regclass);


--
-- Name: chatou_auto_page_image_order PD_id; Type: DEFAULT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_page_image_order ALTER COLUMN "PD_id" SET DEFAULT nextval('public."chatou_auto_page_image_order_PD_id_seq"'::regclass);


--
-- Name: chatou_auto_resturant Resturant_id; Type: DEFAULT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_resturant ALTER COLUMN "Resturant_id" SET DEFAULT nextval('public."chatou_auto_resturant_Resturant_id_seq"'::regclass);


--
-- Name: chatou_auto_shopping Shopping_id; Type: DEFAULT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_shopping ALTER COLUMN "Shopping_id" SET DEFAULT nextval('public."chatou_auto_shopping_Shopping_id_seq"'::regclass);


--
-- Name: chatou_auto_tickets tickets_id; Type: DEFAULT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_tickets ALTER COLUMN tickets_id SET DEFAULT nextval('public.chatou_auto_tickets_tickets_id_seq'::regclass);


--
-- Name: chatou_auto_toilets Toilet_id; Type: DEFAULT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_toilets ALTER COLUMN "Toilet_id" SET DEFAULT nextval('public."chatou_auto_toilets_Toilet_id_seq"'::regclass);


--
-- Name: chatou_auto_transport transport_id; Type: DEFAULT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_transport ALTER COLUMN transport_id SET DEFAULT nextval('public.chatou_auto_transport_transport_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: lionhart
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lionhart
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: lionhart
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lionhart
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: lionhart
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	3	add_permission
6	Can change permission	3	change_permission
7	Can delete permission	3	delete_permission
8	Can view permission	3	view_permission
9	Can add user	2	add_user
10	Can change user	2	change_user
11	Can delete user	2	delete_user
12	Can view user	2	view_user
13	Can add group	4	add_group
14	Can change group	4	change_group
15	Can delete group	4	delete_group
16	Can view group	4	view_group
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add itinerary	8	add_itinerary
26	Can change itinerary	8	change_itinerary
27	Can delete itinerary	8	delete_itinerary
28	Can view itinerary	8	view_itinerary
29	Can add menu	7	add_menu
30	Can change menu	7	change_menu
31	Can delete menu	7	delete_menu
32	Can view menu	7	view_menu
33	Can add images	9	add_images
34	Can change images	9	change_images
35	Can delete images	9	delete_images
36	Can view images	9	view_images
37	Can add menu_ images	10	add_menu_images
38	Can change menu_ images	10	change_menu_images
39	Can delete menu_ images	10	delete_menu_images
40	Can view menu_ images	10	view_menu_images
41	Can add lieu	11	add_lieu
42	Can change lieu	11	change_lieu
43	Can delete lieu	11	delete_lieu
44	Can view lieu	11	view_lieu
45	Can add resturant	16	add_resturant
46	Can change resturant	16	change_resturant
47	Can delete resturant	16	delete_resturant
48	Can view resturant	16	view_resturant
49	Can add shopping	18	add_shopping
50	Can change shopping	18	change_shopping
51	Can delete shopping	18	delete_shopping
52	Can view shopping	18	view_shopping
53	Can add page	13	add_page
54	Can change page	13	change_page
55	Can delete page	13	delete_page
56	Can view page	13	view_page
57	Can add bar	14	add_bar
58	Can change bar	14	change_bar
59	Can delete bar	14	delete_bar
60	Can view bar	14	view_bar
61	Can add map	17	add_map
62	Can change map	17	change_map
63	Can delete map	17	delete_map
64	Can view map	17	view_map
65	Can add page_ description	12	add_page_description
66	Can change page_ description	12	change_page_description
67	Can delete page_ description	12	delete_page_description
68	Can view page_ description	12	view_page_description
69	Can add children entertainment	15	add_childrenentertainment
70	Can change children entertainment	15	change_childrenentertainment
71	Can delete children entertainment	15	delete_childrenentertainment
72	Can view children entertainment	15	view_childrenentertainment
73	Can add page_ image_ order	19	add_page_image_order
74	Can change page_ image_ order	19	change_page_image_order
75	Can delete page_ image_ order	19	delete_page_image_order
76	Can view page_ image_ order	19	view_page_image_order
77	Can add toilets	20	add_toilets
78	Can change toilets	20	change_toilets
79	Can delete toilets	20	delete_toilets
80	Can view toilets	20	view_toilets
81	Can add page_ before_ after_ image_ order	21	add_page_before_after_image_order
82	Can change page_ before_ after_ image_ order	21	change_page_before_after_image_order
83	Can delete page_ before_ after_ image_ order	21	delete_page_before_after_image_order
84	Can view page_ before_ after_ image_ order	21	view_page_before_after_image_order
85	Can add burger_ menu_ ordering	22	add_burger_menu_ordering
86	Can change burger_ menu_ ordering	22	change_burger_menu_ordering
87	Can delete burger_ menu_ ordering	22	delete_burger_menu_ordering
88	Can view burger_ menu_ ordering	22	view_burger_menu_ordering
89	Can add itinerar y_ color_ scheme	23	add_itinerary_color_scheme
90	Can change itinerar y_ color_ scheme	23	change_itinerary_color_scheme
91	Can delete itinerar y_ color_ scheme	23	delete_itinerary_color_scheme
92	Can view itinerar y_ color_ scheme	23	view_itinerary_color_scheme
93	Can add audios	24	add_audios
94	Can change audios	24	change_audios
95	Can delete audios	24	delete_audios
96	Can view audios	24	view_audios
97	Can add audio_page	25	add_audio_page
98	Can change audio_page	25	change_audio_page
99	Can delete audio_page	25	delete_audio_page
100	Can view audio_page	25	view_audio_page
101	Can add map_ controls	26	add_map_controls
102	Can change map_ controls	26	change_map_controls
103	Can delete map_ controls	26	delete_map_controls
104	Can view map_ controls	26	view_map_controls
105	Can add tickets	27	add_tickets
106	Can change tickets	27	change_tickets
107	Can delete tickets	27	delete_tickets
108	Can view tickets	27	view_tickets
109	Can add transport	29	add_transport
110	Can change transport	29	change_transport
111	Can delete transport	29	delete_transport
112	Can view transport	29	view_transport
113	Can add opening_hours	28	add_opening_hours
114	Can change opening_hours	28	change_opening_hours
115	Can delete opening_hours	28	delete_opening_hours
116	Can view opening_hours	28	view_opening_hours
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lionhart
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 116, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: lionhart
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: lionhart
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lionhart
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lionhart
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: lionhart
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lionhart
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: chatou_auto_audio_page; Type: TABLE DATA; Schema: public; Owner: lionhart
--

COPY public.chatou_auto_audio_page (ap_id, audio_appearnce_order, is_audio_present_on_page, audio_id, page_description_id) FROM stdin;
7	1	t	4	35
8	1	t	5	43
9	1	t	9	7
10	1	t	10	38
11	1	t	8	39
12	1	t	7	41
13	1	t	6	33
14	1	t	11	44
15	1	t	12	32
16	1	t	13	34
17	1	t	14	36
18	1	t	15	37
19	1	t	16	40
20	1	t	17	47
\.


--
-- Name: chatou_auto_audio_page_ap_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lionhart
--

SELECT pg_catalog.setval('public.chatou_auto_audio_page_ap_id_seq', 20, true);


--
-- Data for Name: chatou_auto_audios; Type: TABLE DATA; Schema: public; Owner: lionhart
--

COPY public.chatou_auto_audios (audio_id, audio_description, audio_title, audio_file) FROM stdin;
3	<p>NA</p>	Le Nymphée de Soufflot	media/chatou_auto/audio_files/Chatou_Nymphee_3.mp3
4	<p>NA</p>	Le Nymphée de Soufflot	media/chatou_auto/audio_files/Chatou_Nymphee_NvBzaKx.mp3
5	<p>NA</p>	Un peu d'histoire	media/chatou_auto/audio_files/Chatou_Intro_Histo.mp3
6	<p>NA</p>	Église de Notre-Dame	media/chatou_auto/audio_files/Chatou_Eglise.mp3
7	<p>NA</p>	Gare de Chatou-Croissy	media/chatou_auto/audio_files/Chatou_Gare.mp3
8	<p>NA</p>	Mairie de Chatou	media/chatou_auto/audio_files/Chatou_Mairie.mp3
9	<p>NA</p>	Maison Fournaise	media/chatou_auto/audio_files/Chatou_Fournaise.mp3
10	<p>NA</p>	Usines Pathé	media/chatou_auto/audio_files/Chatou_Pathe.mp3
11	<p>NA</p>	À la source de l'Impresssionnisme	media/chatou_auto/audio_files/Chatou_Source_Impressionnisme.mp3
12	<p>NA</p>	La Maison Levanneur	media/chatou_auto/audio_files/Chatou_Levanneur.mp3
13	<p>NA</p>	Le château Bertin	media/chatou_auto/audio_files/Chatou_Bertin.mp3
14	<p>NA</p>	La Villa Lambert	media/chatou_auto/audio_files/Chatou_Villa_Lambert.mp3
15	<p>NA</p>	Le château de la Faisanderie	media/chatou_auto/audio_files/Chatou_Faisanderie.mp3
16	<p>NA</p>	La place Berteaux	media/chatou_auto/audio_files/Chatou_Place_Berteaux.mp3
17	<p>Le barrage de Chatou, lecture de Eric Aubrahn</p>	Le barrage de Chatou	media/chatou_auto/audio_files/Chatou_Barrage.mp3
\.


--
-- Name: chatou_auto_audios_audio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lionhart
--

SELECT pg_catalog.setval('public.chatou_auto_audios_audio_id_seq', 17, true);


--
-- Data for Name: chatou_auto_bar; Type: TABLE DATA; Schema: public; Owner: lionhart
--

COPY public.chatou_auto_bar ("Bar_id", "Page_id", "Bar_Description") FROM stdin;
\.


--
-- Name: chatou_auto_bar_Bar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lionhart
--

SELECT pg_catalog.setval('public."chatou_auto_bar_Bar_id_seq"', 1, false);


--
-- Data for Name: chatou_auto_burger_menu_ordering; Type: TABLE DATA; Schema: public; Owner: lionhart
--

COPY public.chatou_auto_burger_menu_ordering ("BMO_id", appearnce_order_in_burger_menu, itinerary_id, menu_id) FROM stdin;
1	1	23	56
2	2	24	59
3	3	21	16
4	4	22	20
5	5	25	62
\.


--
-- Name: chatou_auto_burger_menu_ordering_BMO_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lionhart
--

SELECT pg_catalog.setval('public."chatou_auto_burger_menu_ordering_BMO_id_seq"', 5, true);


--
-- Data for Name: chatou_auto_childrenentertainment; Type: TABLE DATA; Schema: public; Owner: lionhart
--

COPY public.chatou_auto_childrenentertainment ("CE_id", "Page_id", "CE_Description") FROM stdin;
\.


--
-- Name: chatou_auto_childrenentertainment_CE_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lionhart
--

SELECT pg_catalog.setval('public."chatou_auto_childrenentertainment_CE_id_seq"', 1, false);


--
-- Data for Name: chatou_auto_images; Type: TABLE DATA; Schema: public; Owner: lionhart
--

COPY public.chatou_auto_images (image_id, filename, image_name, long_description, short_description) FROM stdin;
3	media/chatou_auto/Header_1st_Itinerary_Plan_de_la_forest_du_Vezinet_fait_en_lannée_1783_par_Main_premier_arpenteur_en_la_Maîtrise_des_Eaux_et_Forest_de_St_Germain_1783_Fyrkdlh.jpg	NA	<p><em>Atlas censier de la Seigneurie de Chatou, &eacute;tabli en 1780 par le Seigneur de Chatou et de Montesson de l&rsquo;&eacute;poque, Henri-L&eacute;onard Jean-Baptiste de Bertin</em> (detail), Archives de la Ville de Chatou.</p>	<p>NA</p>
4	media/chatou_auto/Chatou_Île_042_La_Maison_Fournaise_depuis_le_Pont.jpg	NA	<p>NA</p>	<p><em>Le Restaurant Fournaise, </em>Vue depuis l&rsquo;ancien pont de Chatou, vers 1905, carte postale</p>
5	media/chatou_auto/Chatou_Île_047_La_Maison_Fournaise_Façade_laterale_Moonik_W.jpg	NA	<p><em>La fa&ccedil;ade lat&eacute;rale de la maison Fournaise</em>, Cr&eacute;dit photo&nbsp;: Moonik, Wikipedia</p>	<p><em>La fa&ccedil;ade lat&eacute;rale de la maison Fournaise</em></p>
7	media/chatou_auto/Pierre_Auguste_Renoir_Alphonsine_Fournaise_on_the_Isle_of_Chatou_1879_Res_1280.jpg	NA	<p>Pierre-Auguste Renoir, <em>Portrait d&#39;Alphonsine Fournaise</em>, (1879), Mus&eacute;e d&#39;Orsay, Paris, France</p>	<p>Renoir, <em>Portrait d&#39;Alphonsine Fournaise</em>, 1879</p>
8	media/chatou_auto/Chatou_Gare_012_Place_de_la_Gare.jpg	NA	<p>La gare de Chatou en 1910, carte postale</p>	<p>NA</p>
9	media/chatou_auto/Res_1200Chatou_Bords_de_Seine_030d_Avenue_des_Tilleuls_1911.jpg	NA	<p>Avenue des Tilleuls, carte postale, 1911</p>	<p>NA</p>
11	media/chatou_auto/Chatou_Mairie_022c_Avenue_Aligre_avant_1905.jpg	NA	<p>Avenue d&#39;Aligre, carte postale, sans date (avant 1905)</p>	<p>NA</p>
12	media/chatou_auto/Chatou_Bords_de_Seine_054_Villa_Realier-Dumas.jpg	NA	<p>Chatou, Vue bord de Seine, avec la villa R&eacute;alier-Dumas, carte postale, sans date (avant 1902)</p>	<p>NA</p>
13	media/chatou_auto/Res_1200Chatou_Bords_de_Seine_051d_Vue_sur_le_Quai_Mouchez.jpg	NA	<p>Quai Amiral Mouchez, carte postale, sans date</p>	<p>NA</p>
14	media/chatou_auto/Res_1200Chatou_Eglise_062c_Square_et_Église.jpg	NA	<p>Le square R&eacute;alier-Dumas et l&#39;&eacute;glise de Notre-Dame de l&#39;Assomption, carte postale, sansa date</p>	<p>NA</p>
15	media/chatou_auto/Res_1200Chatou_Eglise_041_Rue_de_la_Paroisse.jpg	NA	<p>Chatou, rue de la Paroisse, carte postale, sans date (avant 1910)</p>	<p>NA</p>
16	media/chatou_auto/Res_1200_Chatou_Eglise_039b_Rue_de_la_Paroisse_Devanture_Magasin_du_Père_Jarry.jpg	NA	<p>Le caf&eacute; du Pont et le magazin du P&egrave;re Jarry, au con entre la rue du Pont et la rue de la Paroisse, carte postale, sans date</p>	<p>NA</p>
17	media/chatou_auto/Res_1200_Chatou_Parc_051c_Lentrée_du_Parc.jpg	NA	<p>Chatou, L&#39;entr&eacute;e du Parc, carte postale, sans date</p>	<p>NA</p>
18	media/chatou_auto/Res_1200_Chatou_Parc_052b_La_grille_du_Château_Probable_erreur_dans_la_description.jpg	NA	<p>Parc du ch&acirc;teau Bertin: grille &agrave; l&#39;entr&eacute;e du Parc (la description de la carte est erron&eacute;e), carte postale, sans date (avant 1910)</p>	<p>NA</p>
19	media/chatou_auto/Res_1200_Chatou_Brimont_011b_Sortie_de_lécole_exp_1908.jpg	NA	<p>Chatou, L&#39;&eacute;cole des filles, carte postale, sans date (estim&eacute;e avant 1910). Il s&#39;agit de l&#39;&eacute;cole situ&eacute;e rue de l&#39;Asile.</p>	<p>NA</p>
20	media/chatou_auto/Res_1200_Chatou_Pièce_dEau_011b_Avenue_de_la_Pièce_dEau.jpg	NA	<p>Chatou, Avenue de la Pi&egrave;ce d&#39;Eau et Route des Carri&egrave;res Saint-Denis, carte postale, sans date (&eacute;stim&eacute;e avant 1910)</p>	<p>NA</p>
21	media/chatou_auto/Res_1200_Chatou_Pièce_dEau_025_Villa_Lambert.jpg	NA	<p>Chatou - Ch&acirc;teau de la Pi&egrave;ce d&#39;eau, carte postale, sans date (estim&eacute;e avant 1910)</p>	<p>NA</p>
22	media/chatou_auto/Res_1200_Entreprises_Laubeuf_2.jpg	NA	<p>Plan cadastral de Chatou, 1885, Archives de la Ville de Chatou, d&eacute;tail</p>	<p>NA</p>
23	media/chatou_auto/Chatou_Parc_073b_Le_Châtelet_Route_de_Montesson.jpg	NA	<p>Chatou - Route de Montesson, carte postale, sans date (estim&eacute;e avant 1910). L&#39;image est prise au carrefour du Ch&acirc;telet. La route de Montesson correspond aujourd&#39;hui &agrave; la rue du G&eacute;n&eacute;ral Leclerc.</p>	<p>NA</p>
24	media/chatou_auto/Res_1200_Chatou_République_010c_Carrefour_Route_de_Montesson.jpg	NA	<p>Chatou, Boulevard de la R&eacute;publique, carte postale, sans date (estim&eacute;e avant 1910). La prise de vue est r&eacute;alis&eacute;e &agrave; la hauteur du carrefour avec la rue du G&eacute;n&eacute;ral Leclerc.</p>	<p>NA</p>
25	media/chatou_auto/Res_1200_Chatou_Landes_020b_Rue_des_Landes.jpg	NA	<p>Chatou (S.-et-O.) - La Rue des Landes, carte postale, sans date (estim&eacute;e avant 1910)</p>	<p>NA</p>
26	media/chatou_auto/Res_1200_Chatou_République_011_Boulevard_de_la_République.jpg	NA	<p>Chatou - Boulevard de la R&eacute;publique, carte postale, sans date (estim&eacute;e avant 1910)</p>	<p>NA</p>
27	media/chatou_auto/Res_1200_Chatou_La_faisanderie.jpg	NA	<p>Chatou - La Faisanderie, carte postale, sans date (estim&eacute;e avant 1910)</p>	<p>NA</p>
29	media/chatou_auto/Res_1200_Chatou_Mairie_097_Rue_de_Saint-Germain_devant_la_Mairie_circulée_1907.jpg	NA	<p>Chatou, Rue de Saint-Germain, carte postale, sams date (circul&eacute;e vers 1907)</p>	<p>NA</p>
30	media/chatou_auto/Res_1200_Chatou_Mairie_065_Tramway_Vapeur.jpg	NA	<p>Chatou - Place de l&#39;H&ocirc;tel de Ville - Station de Tramway, carte postale, sans date (estim&eacute;e avant 1910)</p>	<p>NA</p>
31	media/chatou_auto/Res_1200_Header_2nd_Itinerary_Chatou_-_Hôtel_de_Ville_-_Tramway_à_vapeur_1905.jpg	NA	<p>Chatou (S.-et-O.) - Place de l&#39;H&ocirc;tel de Ville, carte postale, sans date (vers 1905)</p>	<p>NA</p>
32	media/chatou_auto/Chatou_Île_042_La_Maison_Fournaise_depuis_le_Pont_RnxKUW0.jpg	NA	<p><em>Le Restaurant Fournaise, </em>Vue depuis l&rsquo;ancien pont de Chatou, carte postale, vers 1905</p>	<p>NA</p>
35	media/chatou_auto/Derain_et_Vlaminck_en_1942.jpg	NA	<p>Derain et Vlaminck en 1942<em>, </em>coupure de journal</p>	<p><em>Derain et Vlaminck</em> <em>en 1942</em></p>
28	media/chatou_auto/Res_1200_Chatou_Mairie_053_Rue_Périer__lancienne_Poste_Bd_Foch_vers_1911.jpg	NA	<p>Chatou (S.-et-O) - La Rue Camille Perrier et la Poste, carte postale, sans date (circul&eacute;e en 1911)</p>	<p>NA</p>
10	media/chatou_auto/Res_1200Chatou_Berteaux_050_Rue_Général_Colin.jpg	NA	<p>Rue du G&eacute;n&eacute;ral Colin, carte postale, sans date (vers 1910)</p>	<p>NA</p>
41	media/chatou_auto/Chatou_Parc_082b_Plan_de_la_propriété_Bertin_1780.jpg	NA	<p>Les jardins de Bertin &agrave; Chatou, Folios 71 et 72 de l&#39;atlas-censier dress&eacute; pour Bertin en 1780. Dessin&eacute; et acquarell&eacute; par P. Baudry. Archives de la ville de Chatou</p>	<p>Le plan des jardins de Bertin, 1780</p>
42	media/chatou_auto/Chatou_Parc_065_Le_Nymphée_1905.jpg	NA	<p><em>Chatou &ndash; Grotte du Ch&acirc;teau</em> [<em>Le Nymph&eacute;e du ch&acirc;teau Bertin</em>], vers 1905, carte postale</p>	<p>NA</p>
53	media/chatou_auto/Res_1200_Chatou_République_023_Usines_Pathé.jpg	NA	<p><em>Chatou - Usine des phonographes</em> <em>- Entr&eacute;e principale</em>, sans date (vers 1905), carte postale</p>	<p><em>Les usines phonographiques Path&eacute; vers 1905</em></p>
36	media/chatou_auto/De_Vlaminck_Le_pont_de_Chatou_et_lIle_1907.jpg	NA	<p>Maurice De Vlaminck, <em>Le Pont de Chatou et l&rsquo;&Icirc;le, </em>1906, huile sur toile, Collection priv&eacute;e</p>	<p><em>De Vlaminck, Le Pont de Chatou et l&rsquo;&Icirc;le, </em>1906</p>
43	media/chatou_auto/Res_Nymphée_New_7_of_10_Res_1280.jpg	NA	<p>Le Nymph&eacute;e de Soufflot (photographie : Antonio Ca&rsquo; Zorzi, 2011)</p>	<p><span style="color:#ffffff">NA</span></p>
45	media/chatou_auto/Res_Nymphée_New_9_of_10_Res_1280.jpg	NA	<p>Le Nymph&eacute;e de Soufflot (photographie : Antonio Ca&rsquo; Zorzi, 2011)</p>	<p><em>Le Nymph&eacute;e de Soufflot</em></p>
57	media/chatou_auto/Res_1200_Chatou_Gare_065_-_Place_du_Marché.jpg	NA	<p><em>Chatou. &ndash; Le March&eacute;</em>, sans date (vers 1900-1910), carte postale, A. Tranquard &eacute;dit. rue de St-Germain.</p>	<p><em>Le march&eacute; de Chatou avant 1910</em></p>
39	media/chatou_auto/Chatou_Parc_080_Le_Château_Bertin_1910_Res_1280.jpg	NA	<p><em>Ch&acirc;teau de Chatou, construit en 1780 pour le Ministre Bertin&nbsp;; demoli en 1910</em>, sans date (avant 1910), carte postale.</p>	<p>NA</p>
38	media/chatou_auto/Chatou_Eglise_06_Vue_Aerienne_est_après_1960.jpg	NA	<p>Vue a&eacute;rienne sur l&#39;&eacute;glise de Notre-Dame &agrave; Chatou, sans date (vers 1960), carte postale.</p>	<p><em>Chatou: Vue a&eacute;rienne, vers 1960</em></p>
52	media/chatou_auto/Chatou_Sortie_de_lUsine_Pathé_avant_1908.jpg	NA	<p><em>CHATOU, - Sortie de l&rsquo;Usine Path&eacute;</em>, sans date (vers 1900-1910), carte postale</p>	<p>NA</p>
37	media/chatou_auto/Res_Eglise_04_Res_1280.jpg	NA	<p>L&#39;&eacute;glise de Notre-Dame de l&#39;Assomption &agrave; Chatou (photographie: Antonio Ca&#39; Zorzi, 2019)</p>	<p>NA</p>
34	media/chatou_auto/W_Adam78_Maison_Levanneur.jpg	NA	<p>Chatou: la maison Levanneur (photographie: Adam78, Wikimedia)</p>	<p>NA</p>
46	media/chatou_auto/Chatou_Pièce_dEau_023_Villa_Lambert.jpg	NA	<p><em>Chatou (S.-et-O.) &ndash; Ch&acirc;teau de la Pi&egrave;ce d&rsquo;Eau</em>, date inconnue (avant 1910), carte postale</p>	<p>NA</p>
49	media/chatou_auto/Chatou_République_041_La_Faisandérie_Res_1280.jpg	NA	<p><em>Chatou &ndash; La Faisanderie &ndash; fa&ccedil;ade principale</em>,<em> </em>sans date (vers 1900-1910), carte postale</p>	<p><em>Chatou &ndash; La Faisanderie</em>, avant 1910</p>
50	media/chatou_auto/BNF_Gallica_Pathé_Phonographe_Le_Coquet_-_Je_chante_haut_et_clair_.jpeg	NA	<p><em>Phonographe &agrave; cylindre Path&eacute; Le Coquet d&#39;Hubert Pernot &eacute;quip&eacute; d&#39;un mandrin Inter</em>, (Source&nbsp;: Gallica, BNF)</p>	<p><em>Le phonographe &agrave; cylindre Path&eacute; &laquo;&nbsp;Le Coquet&nbsp;&raquo; d&rsquo;Hubert Pernot</em></p>
58	media/chatou_auto/Res_1200_Chatou_Berteaux_020c_Salle_des_Fêtes.jpg	NA	<p><em>Chatou &ndash; Salle des F&ecirc;tes</em>, sans date (avant 1910), carte postale, P. Nardot &agrave; Montesson</p>	<p><em>L&rsquo;ancienne salle des f&ecirc;tes sur la place Berteaux</em></p>
59	media/chatou_auto/Chatou_Gare_105c_Funérailles_Berteaux_1911.jpg	NA	<p><em>Fun&eacute;railles Nationales de M. Berteaux, Ministre de la Guerre. Chatou &ndash; L&rsquo;H&ocirc;tel de Ville,</em> 1911, carte postale, E. L. D.</p>	<p><em>Les fun&eacute;railles de Berteaux &agrave; l&rsquo;H&ocirc;tel de Ville de Chatou,</em> <em>1911</em></p>
54	media/chatou_auto/Chatou_Mairie_par_Moonik_Hôtel_de_Ville_W.JPG	NA	<p>L&#39;H&ocirc;tel de ville de Chatou (photographie: Moonik, Wikimedia)</p>	<p>NA</p>
56	media/chatou_auto/Chatou_Entrée_du_Pays_-_Place_du_Marché_1910_Res_1280.jpg	NA	<p><em>Chatou, L&rsquo;Entr&eacute;e du Pays</em>, sans date (vers 1905), carte postale</p>	<p>NA</p>
60	media/chatou_auto/Chatou_Gare_101_Monument_Berteaux.jpg	NA	<p>Auguste Maillard (sculpteur), <em>Monument &agrave; Maurice Berteaux</em>, 1922, carte postale, R. Morand, Imp. Edit., Chatou, sans date.</p>	<p><em>Monument &agrave; Maurice Berteaux, 1922</em></p>
61	media/chatou_auto/Res_1200_Chatou_Gare_013b_Le_Quai_vers_1910.jpg	NA	<p><em>Gare de Chatou-Croissy</em>, sans date (vers 1910), carte postale, Nardot, Edit. &agrave; Montesson</p>	<p>NA</p>
55	media/chatou_auto/Res_1200_Chatou_Mairie_035_La_Mairie.jpg	NA	<p>L&#39;H&ocirc;tel de Ville de Chatou, sans date (avant 1910), carte postale</p>	<p><em>L&#39;H&ocirc;tel de Ville de Chatou vers 1910 </em></p>
47	media/chatou_auto/Chatou_Pièce_dEau_031_Le_petit_lac.jpg	NA	<p><em>CHATOU (Seine et Oise) &ndash; La Pi&egrave;ce d&rsquo;eau, le petit pont et le Ch&acirc;teau</em>, sans date (vers 1900-1910), carte postale</p>	<p><em>La Pi&egrave;ce d&#39;Eau, le petit pont et le Ch&acirc;teau, avant 1910</em></p>
63	media/chatou_auto/Châtelet_Before_1200.jpg	NA	<p>NA</p>	<p>NA</p>
64	media/chatou_auto/Chatelet_After_1200_wiVWOLM.jpg	NA	<p>Le Ch&acirc;telet en 2020 et au d&eacute;but du XXe si&egrave;cle</p>	<p>Le Ch&acirc;telet en 2020 et au d&eacute;but du XXe si&egrave;cle, sans date, carte&nbsp;postale</p>
65	media/chatou_auto/NewChatelet_After_1200.jpg	NA	<p>Le Ch&acirc;telet en 2020 et au d&eacute;but du XXe si&egrave;cle</p>	<p>Le Ch&acirc;telet en 2020 et au d&eacute;but du XXe si&egrave;cle</p>
44	media/chatou_auto/Res_Nymphée_New_1_of_10_Res_1280.jpg	NA	<p>Le Nymph&eacute;e de Soufflot (photographie : Antonio Ca&rsquo; Zorzi, 2011)</p>	<p><span style="color:#ffffff">NA</span></p>
66	media/chatou_auto/Gare_Après.jpg	NA	<p>La gare de Chatou-Croissy en 2020 et au d&eacute;but du XXe si&egrave;cle</p>	<p>La Gare de Chatou-Croissy avant et apr&egrave;s</p>
67	media/chatou_auto/Chatou_Gare_011_Façade_de_la_Gare.jpg	NA	<p>NA</p>	<p>NA</p>
69	media/chatou_auto/Cote_Croissy_Gare_Avant.jpg	NA	<p>NA</p>	<p>NA</p>
70	media/chatou_auto/Avenue_des_Tilleuls_1910_Avant.jpg	NA	<p>NA</p>	<p>NA</p>
71	media/chatou_auto/Avenue_des_Tilleuls_Apres.jpg	NA	<p>Avenue des Tilleuls aujourd&#39;hui et vers 1910</p>	<p>Avenue des Tilleuls avant et apr&egrave;s</p>
72	media/chatou_auto/Rue_Colin_Apres.jpg	NA	<p>La rue du G&eacute;n&eacute;ral Colin en 2020 cent ans avant</p>	<p>La rue du G&eacute;n&eacute;ral Colin avant et apr&egrave;s</p>
73	media/chatou_auto/Rue_Colin_Avant.jpg	NA	<p>NA</p>	<p>NA</p>
74	media/chatou_auto/Avenue_Aligre_Apres_2020.jpg	NA	<p>Avenue d&#39;Aligre aujourd&#39;hui et en 1907</p>	<p>Avenue d&#39;Aligre avant et apr&egrave;s</p>
75	media/chatou_auto/Avenue_Aligre_Avant_1907.jpg	NA	<p>NA</p>	<p>NA</p>
76	media/chatou_auto/Villa_Realier-Dumas_Apres_vs5.jpg	NA	<p>Square R&eacute;alier-Dumas aujourd&#39;hui et il y a cent ans</p>	<p>Square R&eacute;alier-Dumas avant et apr&egrave;s</p>
77	media/chatou_auto/Villa_Realier-Dumas_Avant.jpg	NA	<p>NA</p>	<p>NA</p>
79	media/chatou_auto/Quai_Mouchez_2_Avant.jpg	NA	<p>NA</p>	<p>NA</p>
78	media/chatou_auto/Quai_Mouchez_2_Apres.jpg	NA	<p>Le quai Amiral Mouchez aujourd&#39;hui et il a cent ans</p>	<p>Le quai Amiral Mouchez avant et apr&egrave;s</p>
81	media/chatou_auto/Eglise_et_Creche_Avant.jpg	NA	<p>NA</p>	<p>NA</p>
82	media/chatou_auto/Rue_de_la_Paroisse_Apres.jpg	NA	<p>La rue de la Paroisse aujourd&#39;huil et avant les transformations</p>	<p>La rue de la Paroisse avant et apr&egrave;s</p>
83	media/chatou_auto/Rue_de_la_Paroisse_Avant_Vers_1960.jpg	NA	<p>NA</p>	<p>NA</p>
84	media/chatou_auto/Rue_de_la_Paroisse_Apres_vs2.jpg	NA	<p>La rue de Paroisse aujourd&#39;hui et avant les transformations</p>	<p>La rue de la Paroisse avant et apr&egrave;s&nbsp;</p>
86	media/chatou_auto/Rue_du_Port_Avant.jpg	NA	<p>NA</p>	<p>NA</p>
87	media/chatou_auto/Dans_le_Parc_de_Chatou_Avant.jpg	NA	<p>NA</p>	<p>NA</p>
88	media/chatou_auto/Dans_le_Parc_de_Chatou_Apres.jpg	NA	<p>Dans le Parc de Chatou aujourd&#39;hui et il a cent ans</p>	<p>Dans le Parc de Chatou avant et apr&egrave;s</p>
89	media/chatou_auto/Vue_sur_Ile_Apres.jpg	NA	<p>Vue sur l&#39;&icirc;le de Chatou aujourd&#39;hui et il y a cent ans</p>	<p>Vue sur l&#39;&Icirc;le avant et apr&egrave;s</p>
90	media/chatou_auto/Vue_sur_Ile_Avant.jpg	NA	<p>NA</p>	<p>NA</p>
92	media/chatou_auto/Docteur_Rochefort_Avant.jpg	NA	<p>NA</p>	<p>NA</p>
94	media/chatou_auto/Ecole_maternelle_Bousson_Avant.jpg	NA	<p>NA</p>	<p>NA</p>
96	media/chatou_auto/Avenue_27_Martyrs_Avant.jpg	NA	<p>NA</p>	<p>NA</p>
98	media/chatou_auto/Grille_Villa_Lambert_Avant_1915.jpg	NA	<p>NA</p>	<p>NA</p>
100	media/chatou_auto/Chalet_Laubeuf_Avant.jpg	NA	<p>NA</p>	<p>NA</p>
99	media/chatou_auto/Chalet_Laubeuf_Apres.jpg	NA	<p>Le chalet Laubeuf aujourd&#39;hui et il y a cent ans</p>	<p>A-t-il chang&eacute; beaucoup dans le temps? D&eacute;couvrez le chalet Laubeuf de jadis en cliquant sur l&#39;image</p>
102	media/chatou_auto/Landes_Avant.jpg	NA	<p>NA</p>	<p>NA</p>
48	media/chatou_auto/Res_1200_Chatou_République_013_Boulevard_de_la_République.jpg	NA	<p><em>Chatou. - Boulevard de la R&eacute;publique</em>, sans date (circul&eacute;e 1920), carte postale</p>	<p>Le boulevard de la R&eacute;publique au d&eacute;but du XXe si&egrave;cle</p>
104	media/chatou_auto/Republique_Avant_1913.jpg	NA	<p>NA</p>	<p>NA</p>
106	media/chatou_auto/La_Faisandérie_Avant.jpg	NA	<p>NA</p>	<p>NA</p>
108	media/chatou_auto/Ancienne_Poste_Avant.jpg	NA	<p>NA</p>	<p>NA</p>
110	media/chatou_auto/Cafe_Hotel_de_Ville_Avant.jpg	NA	<p>NA</p>	<p>NA</p>
112	media/chatou_auto/Tramway_vapeur_Avant.jpg	NA	<p>NA</p>	<p>NA</p>
80	media/chatou_auto/Eglise_et_Creche_Apres.jpg	NA	<p>L&#39;&Eacute;glise de Notre-Dame aujourd&#39;hui et il y a cent ans</p>	<p>L&#39;&Eacute;glise de Notre-Dame avant et apr&egrave;s</p>
111	media/chatou_auto/Tramway_vapeur_Apres.jpg	NA	<p>Le tramway s&#39;arr&ecirc;tait devant la Mairie (vers 1905)</p>	<p>Cliquez sur l&#39;image pour voir l&#39;ancien tramway &agrave; vapeur gar&eacute; devant la Mairie</p>
109	media/chatou_auto/Cafe_Hotel_de_Ville_Apres.jpg	NA	<p>Le Caf&eacute; de l&#39;H&ocirc;tel de Ville est toujours l&agrave;</p>	<p>Cliquez sur l&#39;image pour d&eacute;couvrir le Caf&eacute; de l&#39;H&ocirc;tel de Ville de jadis</p>
107	media/chatou_auto/Ancienne_Poste_Apres.jpg	NA	<p>L&#39;ancien bureau de la Poste vers 1910 et aujourd&#39;hui</p>	<p>En cliquant sur l&#39;image vous pourrez voir l&#39;ancien bureau postal de Chatou</p>
105	media/chatou_auto/La_Faisanderie_Apres.jpg	NA	<p>Le ch&acirc;teau de la Faisanderie aujourd&#39;hui et il y a cent ans</p>	<p>Cliquez sur l&#39;image pour voir une vue d&#39;antan de la Faisanderie</p>
148	media/chatou_auto/Restaurant_Fournaise_Apres_2.jpg	Le Restaurant Fournaise	<p>NA</p>	<p>Vue sur le Restaurant Fournaise avant et apr&egrave;s</p>
101	media/chatou_auto/Landes_Apres.jpg	NA	<p>La rue des Landes aujourd&#39;hui et il y a cent ans</p>	<p>D&eacute;couvrez la rue des Landes d&#39;autrefois en cliquant sur l&#39;image</p>
95	media/chatou_auto/Avenue_27_Martyrs_Apres.jpg	NA	<p>L&#39;avenue des 27 Martyrs aujourd&#39;hui et il y a cent ans</p>	<p>Cliquez sur l&#39;image pour voir la rue des 27 Martyrs d&#39;autrefois&nbsp;&nbsp;</p>
91	media/chatou_auto/Docteur_Rochefort_Apres.jpg	NA	<p>La rue du Docteur Rochefort aujourd&#39;hui et il y a cent ans</p>	<p>Cliquez sur l&#39;image pour voir la rue du Docteur Rochefort de jadis&nbsp;</p>
68	media/chatou_auto/Cote_Croissy_Gare_Apres.jpg	NA	<p>Le square de la gare du cot&eacute; de Croissy en 2020 et au d&eacute;but du XXe si&egrave;cle</p>	<p>Le square de la gare cot&eacute; Croissy avant et apr&egrave;s</p>
113	media/chatou_auto/Vue_sur_Ile_Apres_2.jpg	NA	<p>NA</p>	<p>Vue sur l&#39;&Icirc;le des Impressionnistes avant et apr&egrave;s</p>
97	media/chatou_auto/Grille_Villa_Lambert_Apres.jpg	NA	<p>L&#39;entr&eacute;e de la Villa Lambert aujourd&#39;hui et il a cent ans&nbsp;</p>	<p>D&eacute;couvrez l&#39;entr&eacute;e de la Villa Lambert de jadis en cliquant sur l&#39;image&nbsp;</p>
114	media/chatou_auto/Res_1200_Chatou_Mairie_097_Rue_de_Saint-Germain_devant_la_Mairie_circulee_1907.jpg	NA	<p><em>Chatou - La rue de Saint-Germain</em>, sans date (circul&eacute;e 1907), carte postale&nbsp;</p>	<p>NA</p>
51	media/chatou_auto/Chatou_République_024_Usines_Pathé-Marconi.jpg	NA	<p><em>L&rsquo;ancien b&acirc;timent industriel de Path&eacute;-Marconi dans les ann&eacute;es 1950</em>, sans date, (photographie: J.-B. Vialles)</p>	<p><em>L&rsquo;ancien b&acirc;timent industriel de Path&eacute;-Marconi</em>,<em> vers 1950 </em></p>
85	media/chatou_auto/Rue_du_Port_Apres.jpg	NA	<p>La rue du Port aujourd&#39;hui et il y a cent ans&nbsp;</p>	<p>Cliquez sur l&#39;image pour d&eacute;couvrir la rue du Port d&#39;antan.</p>
115	media/chatou_auto/Route_de_Maisons_Apres.jpg	NA	<p>La Route de Maisons aujourd&#39;hui et il y a cent ans</p>	<p>Cliquez sur l&#39;image pour d&eacute;couvrir la Route de Maisons de jadis</p>
116	media/chatou_auto/Route_de_Maisons_Avant.jpg	NA	<p>NA</p>	<p>NA</p>
117	media/chatou_auto/Sequana_Chatou.jpg	NA	<p>L&#39;atelier-mus&eacute;e de l&#39;association Sequana &agrave; Chatou (photographie, Antonio Ca&#39; Zorzi)</p>	<p>L&#39;atelier-mus&eacute;e Sequana &agrave; Chatou</p>
118	media/chatou_auto/Une_classe_de_maternelle.jpg	NA	<p>Une classe dans une &eacute;cole maternelle en France&nbsp;</p>	<p>NA</p>
103	media/chatou_auto/Republique_Apres.jpg	NA	<p>Le boulevard de la R&eacute;publique aujourd&#39;hui et il y a cent ans</p>	<p>Pour d&eacute;couvrir le boulevard de la R&eacute;publique d&#39;avant il suffit de cliquez sur l&#39;image</p>
93	media/chatou_auto/Ecole_maternelle_Bousson_Apres.jpg	NA	<p>L&#39;&eacute;cole maternelle aujourd&#39;hui et il y a cent ans</p>	<p>Pour d&eacute;couvrir l&#39;&eacute;cole maternelle de la rue Bousson d&#39;autrefois cliquez sur l&#39;image</p>
119	media/chatou_auto/Camille_Corot_la_Seine_à_Chatou_1855_Res_1280.jpg	NA	<p>Camille Corot,&nbsp;<em>La Seine &agrave; Chatou</em>, huile sur toile, 1855, Staatsmuseum Berlin</p>	<p>NA</p>
120	media/chatou_auto/Roslin_Bertin.png	NA	<p>Alexander Roslin (1718-1793),&nbsp;<em>Portrait de Henri-L&eacute;onard-Jean-Baptiste Bertin</em>, huile sur toile, Ch&acirc;teau de Versailles</p>	<p>Alexander Roslin,&nbsp;Portrait de Henri-L&eacute;onard-Jean-Baptiste Bertin</p>
121	media/chatou_auto/BNF_Parc_du_Vesinet_Plan_general_indiquant_le_lotissement.jpeg	NA	<p><em>Plan g&eacute;n&eacute;ral indiquant le lotissement du parc du V&eacute;sinet</em>,&nbsp;s.d. (vers 1858-1869), BNF, Gallica</p>	<p>Le plan du lotissement du parc du V&eacute;sinet, s.d. (vers 1858-1869)</p>
122	media/chatou_auto/Voiture_a_vapeur_et_chemin_de_fer_Anonyme.JPG	NA	<p>Anonyme, <em>La locomotive &agrave; vapeur et le chemin de fer</em>, caricature, sans date (vers 1840), RMN</p>	<p>Anonyme, <em>La locomotive &agrave; vapeur et le chemin de fer</em>, caricature, vers 1840</p>
123	media/chatou_auto/Pierre-Auguste_Renoir_les_canotiers_à_Chatou_vers_1879_National_Gallery_of_Art.jpg	NA	<p>Pierre-Auguste Renoir, <em>Les canotiers &agrave; Chatou</em> (vers 1879), Huile sur toile, National Gallery of Art, Washington, DC, Etats Unis</p>	<p>NA</p>
124	media/chatou_auto/Mairie_et_Place.jpg	NA	<p>La mairie de Chatou (photographie: Antonio Ca&#39; Zorzi)</p>	<p>NA</p>
125	media/chatou_auto/BL_logos_blanc_apps_v2_cropped_200.jpg	NA	<p>NA</p>	<p>NA</p>
143	media/chatou_auto/Restaurant_Fournaise_Avant.jpg	NA	<p>NA</p>	<p>NA</p>
126	media/chatou_auto/BL_Apps_logos_Res_75.jpg	NA	<p>NA</p>	<p><span style="color:#ffffff">.</span></p>
127	media/chatou_auto/ville-de-chatou_100.jpg	NA	<p>NA</p>	<p><span style="color:#ffffff">NA</span></p>
128	media/chatou_auto/ville-de-chatou_200.jpg	NA	<p>NA</p>	<p><span style="color:#ffffff">NA</span></p>
129	media/chatou_auto/BL_Apps_Logos_Res_150.jpg	NA	<p>NA</p>	<p><span style="color:#ffffff">NA</span></p>
130	media/chatou_auto/48x48facebook3.png	NA	<p>NA</p>	<p><span style="color:#ffffff">NA</span></p>
131	media/chatou_auto/48x48twitter.png	NA	<p>NA</p>	<p><span style="color:#ffffff">NA</span></p>
132	media/chatou_auto/DSC_8011-20200206_Mairie_Res_1200.jpg	L'Hôtel de ville de Chatou	<p>L&#39;H&ocirc;tel de ville de Chatou, photographie de l&#39;auteur</p>	<p><span style="color:#ffffff">NA</span></p>
6	media/chatou_auto/Pierre-Auguste_Renoir_-_Luncheon_of_the_Boating_Party_vs2_Google_Art_Project.jpg	NA	<p>Pierre-Auguste Renoir, <em>Le D&eacute;jeuner des Canotiers</em> (vers 1880-81), Huile sur toile, The Phillips Collection, Washington DC, Etats Unis</p>	<p>Renoir, <em>Le D&eacute;jeuner des Canotiers</em>, 1880-81</p>
133	media/chatou_auto/Chatou_Barrage_1200.jpg	Le barrage de Chatou	<p>Le barrage de Chatou (2020)</p>	<p>NA</p>
134	media/chatou_auto/Ancien_Barrage_Chatou_Moonik_W.JPG	L'ancien barrage de Chatou	<p>L&#39;ancien barrage de Chatou, Photographie: Moonik, via Wikimedia</p>	<p>L&#39;ancien barrage de Chatou</p>
135	media/chatou_auto/Nymphee_13_Res_1200.jpg	Le Nymphée de Soufflot	<p>Le Nymph&eacute;e de Soufflot (2011)</p>	<p>NA</p>
136	media/chatou_auto/Nymphee_New_1_of_10_Res_1200.jpg	Le Nymphée de Soufflot	<p>Le Nymph&eacute;e de Soufflot (2011)</p>	<p>NA</p>
137	media/chatou_auto/R_Chatou_-20200914-DSC_cropped_1200.jpg	Le hameau Fournaise sur l'île	<p>Le Restaurant Fournaise, vu depuis la rive de Rueil Malmaison (2020)</p>	<p>NA</p>
138	media/chatou_auto/Chatou_Piece_Eau_025_Le_Chateau.jpg	Le château de la Pièce d'Eau	<p>Le ch&acirc;teau de la Pi&egrave;ce d&#39;Eau, carte postale, vers 1905</p>	<p>NA</p>
139	media/chatou_auto/Place_Berteaux_01_Res_1200.jpg	La place Berteaux	<p>La place Berteaux en 2020</p>	<p>NA</p>
140	media/chatou_auto/Chatou-Faisanderie_1200.jpg	Le château de al Faisanderie	<p>Le ch&acirc;teau de la Faisanderie en 2020</p>	<p>NA</p>
141	media/chatou_auto/Gare_de_Chatou_1200.jpg	La gare de Chatou-Croissy	<p>La gare de Chatou-Croissy en 2020</p>	<p>NA</p>
142	media/chatou_auto/Restaurant_Fournaise_Apres.jpg	Le Restaurant Fournaise	<p>NA</p>	<p>Vue sur le Restaurant Fournaise avant et apr&egrave;s</p>
144	media/chatou_auto/Hotel_de_Ville_Facade_Apres.jpg	L'Hôtel de ville de Chatou	<p>NA</p>	<p>L&#39;H&ocirc;tel de Ville avant et apr&egrave;s</p>
145	media/chatou_auto/Hotel_de_Ville_Facade_Avant.jpg	NA	<p>NA</p>	<p>NA</p>
146	media/chatou_auto/Restaurant_Fournaise_vers_1905.jpg	Le Restaurant Fournaise vers 1905	<p>Le Retaurant Fournaise, carte postale, sans date (vers 1910)</p>	<p>NA</p>
147	media/chatou_auto/Ancien_Barrage_Chatou_Moonik_W_2.JPG	L'ancien barrage de Chatou	<p>L&#39;ancien barrage de Chatou, photographie: Moonik, via Wikimedia</p>	<p>L&#39;ancien barrage de Chatou</p>
40	media/chatou_auto/Res_Ancienne_entrée_Chateau_de_la_pièce_deau_Res_1280.jpg	NA	<p><em>Chatou. - La Pi&egrave;ce d&#39;Eau, avenue Entr&eacute;e du Ch&acirc;teau</em>, sans date (vers 1905), carte postale. Il ne s&#39;agit pas de l&#39;entr&eacute;e au ch&acirc;teau de la pi&egrave;ce d&#39;Eau, mais bien de celui de l&#39;ancien ch&acirc;teau de Bertin</p>	<p><em>L&#39;ancienne entr&eacute;e du ch&acirc;teau de Bertin, vers 1905 (N.B. La l&eacute;gende isncrite sur la carte n&#39;est pas correcte, il ne s&#39;agit pas de la grille du ch&acirc;teau de la Pi&egrave;ce d&#39;Eau, mais bien de celle du ch&acirc;teau Bertin).</em></p>
\.


--
-- Name: chatou_auto_images_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lionhart
--

SELECT pg_catalog.setval('public.chatou_auto_images_image_id_seq', 148, true);


--
-- Data for Name: chatou_auto_itinerary; Type: TABLE DATA; Schema: public; Owner: lionhart
--

COPY public.chatou_auto_itinerary (itinerary_id, itinerary_name, itinerary_steps, itinerary_type, is_visible_on_homepage) FROM stdin;
22	Chatou d'antan	23	ITIN	t
23	Un peu d’histoire	0	INTRO	t
24	À la source de l’impressionnisme	0	INTRO	t
25	À Propos	0	INTRO	f
26	MENTIONS LÉGALES	0	INTRO	f
21	Itinéraire d’art et d'histoire	12	ITIN	t
\.


--
-- Data for Name: chatou_auto_itinerary_color_scheme; Type: TABLE DATA; Schema: public; Owner: lionhart
--

COPY public.chatou_auto_itinerary_color_scheme ("ICS_id", itinerary_colors, itinerary_id) FROM stdin;
1	BLUE	21
2	RED	22
\.


--
-- Name: chatou_auto_itinerary_color_scheme_ICS_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lionhart
--

SELECT pg_catalog.setval('public."chatou_auto_itinerary_color_scheme_ICS_id_seq"', 2, true);


--
-- Name: chatou_auto_itinerary_itinerary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lionhart
--

SELECT pg_catalog.setval('public.chatou_auto_itinerary_itinerary_id_seq', 26, true);


--
-- Data for Name: chatou_auto_lieu; Type: TABLE DATA; Schema: public; Owner: lionhart
--

COPY public.chatou_auto_lieu ("Lieu_id", "Page_id", "Lieu_Description") FROM stdin;
2	9	<p><strong>Mus&eacute;e Fournaise</strong></p>\r\n\r\n<p>3 rue du Bac<br />\r\nIle des Impressionnistes<br />\r\n78400 Chatou<br />\r\nT&eacute;l : +33 (0)1 34 80 63 22</p>\r\n\r\n<p>Site web: <a href="https://www.musee-fournaise.com/">Mus&eacute;e Fournaise</a></p>
3	34	<p><strong>Adresse</strong></p>\r\n\r\n<p>3 rue du Bac - Hameau Fournaise<br />\r\nIl des Impressionnistes, Chatou</p>\r\n\r\n<p>T&eacute;l&nbsp;: 06 75 62 83 33</p>\r\n\r\n<p><strong>Site Web</strong></p>\r\n\r\n<p><span style="color:#0563c1"><u><a href="http://www.bessieres-art-contemporain.com" style="color:#0563c1; text-decoration:underline">www.bessieres-art-contemporain.com</a></u></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>
4	35	<p><strong>Adresse</strong></p>\r\n\r\n<p>4 Place Sainte-Marie<br />\r\n78400 Chatou</p>\r\n\r\n<p>T&eacute;l.&nbsp;: 01 39 52 17 86</p>\r\n\r\n<p>Site web: http://paroisse-chatou.com/</p>
5	36	<p><em>Le ch&acirc;teau a &eacute;t&eacute; d&eacute;moli en 1910, dans le cadre du lotissement du Parc de Chatou. Son emplacement originaire &eacute;tait situ&eacute; &agrave; proximit&eacute; de l&rsquo;Avenue de la Grotte entre l&rsquo;avenue Moisant et l&rsquo;avenue du Ch&acirc;teau de Bertin.</em></p>
7	38	<p><strong>Adresse </strong></p>\r\n\r\n<p>Rue Fran&ccedil;ois Laubeauf / Avenue des 27 Martyrs<br />\r\n74800 Chatou</p>\r\n\r\n<p>Se trouvant dans un domaine priv&eacute;, ,ni le Parc de la Pi&egrave;ce d&rsquo;Eau, ni le ch&acirc;teau de la Villa Lambert sont ouverts au public.</p>
6	37	<p><strong>Adresse</strong></p>\r\n\r\n<p>Avenue du Ch&acirc;teau de Bertin<br />\r\nParc de Chatou<br />\r\n78400 Chatou</p>\r\n\r\n<p>Le Nymph&eacute;e se trouve dans une propri&eacute;t&eacute; priv&eacute;e et normalement ne peut pas &ecirc;tre visit&eacute;. Il le sera probablement dans le futur &agrave; l&rsquo;occasion des journ&eacute;es du patrimoine en septembre. Renseignements&nbsp;: sur le site de la Marie de Chatou (<a href="http://www.chatou.fr" target="_blank"><span style="color:#0563c1"><u>www.chatou.fr</u></span></a>) ou sur celui du Minist&egrave;re de la Culture</p>
8	11	<p>Avec ce parcours nous proposons de d&eacute;couvrir la ville de Chatou de jadis. Les images d&#39;aujourd&#39;hui sont superpos&eacute;es &agrave; des images des cartes postales anciennes. Il suffit de cliquer sur l&#39;image pour d&eacute;voiler la vue de la carte postale. Bonne promenade!</p>
\.


--
-- Name: chatou_auto_lieu_Lieu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lionhart
--

SELECT pg_catalog.setval('public."chatou_auto_lieu_Lieu_id_seq"', 8, true);


--
-- Data for Name: chatou_auto_map; Type: TABLE DATA; Schema: public; Owner: lionhart
--

COPY public.chatou_auto_map (page_id, lat, longt, "Page_id", itinerary_id, map_images_id) FROM stdin;
24	48.891271	2.150220	30	22	27
28	48.889679	2.157099	33	22	30
25	48.889876	2.156498	31	22	28
23	48.891063	2.150156	29	22	26
22	48.894593	2.146874	28	22	25
20	48.894144	2.157206	26	22	23
19	48.891479	2.154665	25	22	22
18	48.893189	2.155737	24	22	21
17	48.892084	2.157824	23	22	20
16	48.891824	2.158674	22	22	19
14	48.891630	2.160525	20	22	17
13	48.890320	2.159841	19	22	16
12	48.889228	2.159514	18	22	15
11	48.889082	2.159527	17	22	14
9	48.888424	2.159895	15	22	12
8	48.887143	2.155725	14	22	11
7	48.886800	2.156081	13	22	10
6	48.884195	2.157301	12	22	9
5	48.885398	2.155129	10	22	8
36	48.889714	2.157410	41	21	54
35	48.894848	2.151887	40	21	52
33	48.893382	2.154504	38	21	46
31	48.891179	2.160159	36	21	39
30	48.889091	2.159590	35	21	37
29	48.889957	2.163316	34	21	34
15	48.891571	2.159220	21	22	18
21	48.897474	2.155889	27	22	24
10	48.889272	2.160704	16	22	13
26	48.889733	2.156990	32	22	114
39	48.895091	2.163381	48	21	133
32	48.892315	2.161312	37	21	136
4	48.889756	2.163500	9	21	137
37	48.886729	2.155448	42	21	139
34	48.891244	2.150216	39	21	140
38	48.885364	2.156045	43	21	141
40	48.889752	2.163633	49	22	146
\.


--
-- Data for Name: chatou_auto_map_controls; Type: TABLE DATA; Schema: public; Owner: lionhart
--

COPY public.chatou_auto_map_controls ("MC_id", zoom_for_home, pin_zoom) FROM stdin;
1	15.0	18.0
\.


--
-- Name: chatou_auto_map_controls_MC_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lionhart
--

SELECT pg_catalog.setval('public."chatou_auto_map_controls_MC_id_seq"', 1, true);


--
-- Name: chatou_auto_map_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lionhart
--

SELECT pg_catalog.setval('public.chatou_auto_map_page_id_seq', 40, true);


--
-- Data for Name: chatou_auto_menu; Type: TABLE DATA; Schema: public; Owner: lionhart
--

COPY public.chatou_auto_menu (menu_id, menu_title, menu_link, menu_type, itinerary_id, menu_images_id) FROM stdin;
56	Un peu d’histoire	un-peu-dhistoire	Burger	23	\N
55	Un peu d’histoire	un-peu-dhistoire	Main	23	\N
43	Le Café de l’Hôtel de Ville	chatou-d-antan/le-cafe-de-lhotel-de-ville	Step	22	114
44	Le tramway à l'Hotel de Ville	chatou-d-antan/le-tramway	Step	22	30
68	Le Restaurant Fournaise	chatou-d-antan/le-restaurant-fournaise	Step	22	146
28	Église et ancien presbytère	chatou-d-antan/eglise-et-ancien-presbytere	Step	22	14
15	Itinéraire d’art et d'histoire	itineraire-dart-et-histoire	Main	21	3
63	À Propos	a-propos/a-propos	Step	25	\N
62	À Propos	a-propos	Burger	25	\N
60	À la source de l’impressionnisme	a-la-source-de-limpressionnisme/a-la-source-de-limpressionnisme	Step	24	\N
59	À la source de l’impressionnisme	a-la-source-de-limpressionnisme	Burger	24	\N
58	À la source de l’impressionnisme	a-la-source-de-limpressionnisme	Main	24	\N
57	Un peu d’histoire	un-peu-dhistoire/un-peu-dhistoire	Step	23	\N
27	Quai Amiral Mouchez	chatou-d-antan/quai-amiral-mouchez	Step	22	13
52	L'Hôtel de Ville	itineraire-dart-et-d-histoire/l-hotel-de-ville	Step	21	54
29	Rue de la Paroisse	chatou-d-antan/rue-de-la-paroisse	Step	22	15
47	Le château Bertin	itineraire-dart-et-d-histoire/le-chateau-bertin	Step	21	39
30	Rue du Port	chatou-d-antan/rue-du-port	Step	22	16
45	La maison Levanneur	itineraire-dart-et-d-histoire/la-maison-levanneur	Step	21	34
31	Le Parc de Chatou	chatou-d-antan/le-parc-de-chatou	Step	22	17
49	Le château de la Pièce d'Eau	itineraire-dart-et-d-histoire/la-villa-lambert	Step	21	46
32	Rue du Docteur Rochefort	chatou-d-antan/rue-du-docteur-rochefort	Step	22	18
16	Itinéraire d’art et d'histoire	itineraire-dart-et-histoire	Burger	21	\N
33	L'école maternelle	chatou-d-antan/l-ecole-maternelle	Step	22	118
19	Chatou d'antan	chatou-d-antan	Main	22	31
20	Chatou d'antan	chatou-d-antan	Burger	22	\N
21	Gare de Chatou	chatou-d-antan/gare-de-chatou	Step	22	8
23	Avenue des Tilleuls	chatou-d-antan/avenue-des-tilleuls	Step	22	9
24	Rue du Général Colin	chatou-d-antan/rue-du-general-colin	Step	22	10
25	Avenue d'Aligre	chatou-d-antan/avenue-d-aligre	Step	22	11
26	Square Réalier-Dumas	chatou-d-antan/square-realier-dumas	Step	22	12
34	Avenue des 27 Martyrs	chatou-d-antan/avenue-des-27-martyrs	Step	22	20
35	L’entrée de la Villa Lambert	chatou-d-antan/lentree-de-la-villa-lambert	Step	22	21
36	Le chalet Laubeuf	chatou-d-antan/le-chalet-laubeuf	Step	22	22
65	Mentions légales	mentions-legales	Burger	26	\N
48	Le Nymphée de Soufflot	itineraire-dart-et-d-histoire/le-nymphee-de-soufflot	Step	21	136
18	La maison Fournaise	itineraire-dart-et-histoire/la-maison-fournaise	Step	21	137
53	La place Berteaux	itineraire-dart-et-d-histoire/la-place-bertaux	Step	21	139
46	L'Église de Notre-Dame de l'Assomption	itineraire-dart-et-d-histoire/l-eglise-de-notre-dame-de-l-assomption	Step	21	37
51	Les usines Pathé	itineraire-dart-et-d-histoire/les-usines-pathe	Step	21	52
50	Le château de la Faisanderie	itineraire-dart-et-d-histoire/le-boulevard-de-la-republique	Step	21	140
54	La gare de Chatou-Croissy	itineraire-dart-et-d-histoire/la-gare-de-chatou-croissy	Step	21	141
67	Le barrage de Chatou	itineraire-dart-et-d-histoire/le-barrage-de-chatou	Step	21	133
37	Le Châtelet	chatou-d-antan/le-chatelet	Step	22	23
38	La Route de Maisons	chatou-d-antan/la-route-des-maisons	Step	22	24
39	Rue des Landes	chatou-d-antan/rue-des-landes	Step	22	25
40	Boulevard de la République	chatou-d-antan/le-boulevard-de-la-republique	Step	22	26
41	La Faisanderie	chatou-d-antan/chateau-de-la-faisanderie	Step	22	27
42	L'ancienne poste	chatou-d-antan/l-ancienne-poste	Step	22	28
\.


--
-- Name: chatou_auto_menu_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lionhart
--

SELECT pg_catalog.setval('public.chatou_auto_menu_menu_id_seq', 68, true);


--
-- Data for Name: chatou_auto_opening_hours; Type: TABLE DATA; Schema: public; Owner: lionhart
--

COPY public.chatou_auto_opening_hours (oh_id, "Page_id", "oh_Description") FROM stdin;
1	9	<p>Mercredi, jeudi, vendredi : 10h - 12h30 et 14h - 18h<br />\r\nSamedi &ndash; dimanche : 10h30 - 13h30 et 14h - 18h<br />\r\n<br />\r\nDernier d&eacute;part 1h avant la fermeture. R&eacute;servation conseill&eacute;e.<br />\r\nSe pr&eacute;senter 15 &agrave; 20 mn &agrave; l&#39;avance.</p>
2	8	<p><strong>Quand y aller?</strong></p>\r\n\r\n<p>S&rsquo;agissant d&rsquo;une promenade en ville, il est pr&eacute;f&eacute;rable de vous y rendre durant la journ&eacute;e. Pr&eacute;voyez environ deux heures pour la promenade. Si vous d&eacute;sirez visiter la maison Fournaise v&eacute;rifiez les horaires de celle-ci dans le chapitre qui lui est d&eacute;di&eacute;.</p>
3	34	<p><strong>Horaires</strong></p>\r\n\r\n<p>Jeudi 14h &agrave; 18h<br />\r\nVendredi et samedi de 14h &agrave; 19h<br />\r\nDimanche de 15h30 &agrave; 19h</p>
\.


--
-- Name: chatou_auto_opening_hours_oh_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lionhart
--

SELECT pg_catalog.setval('public.chatou_auto_opening_hours_oh_id_seq', 3, true);


--
-- Data for Name: chatou_auto_page; Type: TABLE DATA; Schema: public; Owner: lionhart
--

COPY public.chatou_auto_page (page_id, page_title, page_type, page_order, itinerary_id, "page_Summary") FROM stdin;
8	Itinéraire d’art et d’histoire	step_introduction	\N	21	NA
9	La maison Fournaise	step	1	21	NA
10	Gare de Chatou	step	1	22	NA
11	Chatou d'antan	step_introduction	\N	22	NA
12	Avenue des Tilleuls	step	2	22	NA
13	Rue du Général Colin	step	3	22	NA
14	Avenue d'Aligre	step	4	22	NA
15	Square Réalier-Dumas	step	5	22	NA
34	La maison Levanneur	step	2	21	NA
36	Le château Bertin	step	4	21	NA
37	Le Nymphée de Soufflot	step	5	21	NA
25	Le chalet Laubeuf	step	16	22	NA
46	À Propos	Introduction	\N	25	NA
26	Le Châtelet	step	17	22	NA
27	La Route de Maisons	step	18	22	NA
28	Rue des Landes	step	19	22	NA
29	Boulevard de la République	step	20	22	NA
30	La Faisanderie	step	21	22	NA
31	L'ancienne poste	step	22	22	NA
32	Le Café de l’Hôtel de Ville	step	23	22	NA
33	Le tramway à l'Hotel de Ville	step	24	22	NA
38	Le château de la Pièce d'Eau	step	7	21	NA
44	Un peu d’histoire	introduction	1	23	Parcourons brièvement l’histoire de Chatou, ville fluviale, marquée par sa position stratégique aux portes de Paris et sur le chemin vers la ville royale de Saint-Germain-en-Laye. Traversée par les gaulois, romains, francs et vikings, détruite plusieurs fois par les armées de passage, Chatou connais son épanouissement à partir du XIXe siècle quand elle mue en ville-villégiature, puis industrielle et artistique...
45	À la source de l’impressionnisme	Introduction	2	24	Au XIXe siècle Chatou et les autres petites bourgades de la boucle de Seine, avec leurs restaurants, guinguettes et la fraîcheur du fleuve sont très appréciés des peintres : les pinceaux impressionnistes, à commencer par Renoir, s’attardent sur les berges de Seine et les fêtes où le beau monde parisien se mélange aux jeunes ouvriers et bourgeois des environs. Derain et Vlaminck reprennent le flambeau artistique de Chatou en lançant le mouvement fauve...
47	Mentions légales	Introduction	\N	26	NA
35	L'Église de Notre-Dame de l'Assomption	step	3	21	NA
40	Les usines Pathé	step	8	21	NA
39	Le château de la Faisanderie	step	9	21	NA
41	L'Hôtel de Ville	step	10	21	NA
42	La place Berteaux	step	11	21	NA
43	La gare de Chatou-Croissy	step	12	21	NA
48	Le barrage de Chatou	step	6	21	NA
49	Le Restaurant Fournaise	Step	6	22	NA
17	Église et ancien presbytère	step	8	22	NA
16	Quai Amiral Mouchez	step	7	22	NA
18	Rue de la Paroisse	step	9	22	NA
19	Rue du Port	step	10	22	NA
20	Le Parc de Chatou	step	11	22	NA
21	Rue du Docteur Rochefort	step	12	22	NA
22	L'école maternelle	step	13	22	NA
23	Avenue des 27 Martyrs	step	14	22	NA
24	L’entrée de la Villa Lambert	step	15	22	NA
\.


--
-- Data for Name: chatou_auto_page_before_after_image_order; Type: TABLE DATA; Schema: public; Owner: lionhart
--

COPY public.chatou_auto_page_before_after_image_order ("PD_id", is_page_in_present, appearnce_order_in_page, page_description_id, page_image_after_id, page_image_before_id) FROM stdin;
2	t	1	24	65	63
3	t	1	8	66	67
4	t	2	8	68	69
5	t	1	10	71	70
6	t	1	12	74	75
8	t	1	14	78	79
9	t	1	15	80	81
10	t	1	16	84	83
11	t	1	17	85	86
12	t	1	11	72	73
13	t	1	18	88	87
15	t	1	19	91	92
16	t	1	20	93	94
17	t	1	21	95	96
18	t	1	22	97	98
19	t	1	23	99	100
21	t	1	27	103	104
22	t	1	42	105	106
23	t	1	29	107	108
24	t	1	30	109	110
25	t	1	31	111	112
20	t	1	26	101	102
14	t	2	17	113	90
7	t	1	13	76	77
26	t	1	25	115	116
27	t	2	31	144	145
28	t	1	48	148	143
\.


--
-- Name: chatou_auto_page_before_after_image_order_PD_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lionhart
--

SELECT pg_catalog.setval('public."chatou_auto_page_before_after_image_order_PD_id_seq"', 28, true);


--
-- Data for Name: chatou_auto_page_description; Type: TABLE DATA; Schema: public; Owner: lionhart
--

COPY public.chatou_auto_page_description ("PD_id", "page_Text", page_id, page_map_id, page_title_image_id) FROM stdin;
9	<p>NA</p>	11	\N	31
14	<p>Le quai est d&eacute;di&eacute; &agrave; l&rsquo;Amiral Ernest Am&eacute;d&eacute;e Barth&eacute;l&eacute;my Mouchez (1821-1892), qui avait des liens importants avec Chatou&nbsp;: il passa une partie de son enfance au num&eacute;ro 8 du quai Bourbon (l&rsquo;ancien nom du quai Mouchez), &eacute;pousa Carlotta &agrave; l&rsquo;&Eacute;glise Notre-Dame de l&rsquo;Assomption et fut inhum&eacute; au cimeti&egrave;re de la Ville. Ing&eacute;nieur et officier de la marine du Second Empire, en 1852 Napol&eacute;on III le d&eacute;cora du titre de Chevalier de la L&eacute;gion d&rsquo; Honneur. En 1870, le capitaine de vaisseau fut nomm&eacute; par le gouvernement r&eacute;publicain Commandant sup&eacute;rieur des forces de terre et de mer de la ville du Havre, dont il organisa avec succ&egrave;s la d&eacute;fense face aux forces ennemies. En 1873, Mouchez devint membre du Bureau des Longitudes et sugg&eacute;ra la cr&eacute;ation d&rsquo;un observatoire charg&eacute; de compl&eacute;ter les connaissances astronomiques des officiers de l&rsquo;&Eacute;cole Navale. Pour ses m&eacute;rites dans la recherche astronomique, en 1875, il entra dans l&rsquo;Acad&eacute;mie des Sciences. D&egrave;s 1878, il fut nomm&eacute; directeur de l&rsquo;Observatoire de Paris, o&ugrave; il se distingua en promouvant la cr&eacute;ation de la premi&egrave;re carte photographique du ciel en 1887.</p>\r\n\r\n<p>&lt;ba1&gt;</p>\r\n\r\n<p>Un autre personnage connu li&eacute; au Quai Mouchez &eacute;tait Catulle Mend&egrave;s, po&egrave;te, romancier et auteur dramatique, critique de th&eacute;&acirc;tre et de musique, mort en 1909 dans un accident sur la ligne de train Paris - Saint-Germain. Il habitait au num&eacute;ro 6 du Quai Mouchez.</p>\r\n\r\n<p>&nbsp;</p>	16	10	13
15	<p>Le plus ancien b&acirc;timent de Chatou, l&rsquo;&Eacute;glise Notre-Dame de l&rsquo;Assomption remonte au XIIIe si&egrave;cle, mais a &eacute;t&eacute; remani&eacute;e &agrave; plusieurs reprises avec le temps. La derni&egrave;re r&eacute;novation est de 1871&nbsp;: l&rsquo;&Eacute;glise &eacute;tait gravement endommag&eacute;e apr&egrave;s les bombardements du Mont Val&eacute;rien de la guerre franco-prussienne de 1870. Le maire de l&rsquo;&eacute;poque, Charles Lambert, l&rsquo;avait confi&eacute;e &agrave; l&rsquo;architecte catovien Paul Abadie qui &eacute;tait l&rsquo;un des principaux r&eacute;novateurs d&rsquo;&eacute;glises gothiques. Mais en r&eacute;alit&eacute;, l&rsquo;&Eacute;glise originale &eacute;tait plut&ocirc;t de style roman, sauf pour sa fl&egrave;che d&rsquo;inspiration gothique. &Agrave; c&ocirc;t&eacute; de l&rsquo;&Eacute;glise s&rsquo;&eacute;rigeait l&rsquo;ancien presbyt&egrave;re, transform&eacute; en mairie en 1829 et, apr&egrave;s le transfert de celle-ci vers la villa Casimir P&eacute;rier, mis &agrave; disposition des Dames de Chatou en 1907 qui en firent un centre d&rsquo;aide sociale et cr&egrave;che pour des enfants n&eacute;cessiteux.</p>\r\n\r\n<p>&lt;ba1&gt;</p>\r\n\r\n<p>&nbsp;</p>	17	11	14
11	<p>Anciennement appel&eacute;e rue de Croissy, la voie a pris le nom du G&eacute;n&eacute;ral Jean-Alphonse Colin (1864-1917), qui habitait au num&eacute;ro 14 de l&rsquo;avenue dans une maison qui n&rsquo;existe plus. Colin &eacute;tait un historien militaire, auteur de nombreux ouvrages, notamment sur les campagnes de Napol&eacute;on. Durant la premi&egrave;re guerre mondiale il fut nomm&eacute;, en 1917, G&eacute;n&eacute;ral de brigade en Mac&eacute;doine o&ugrave; il commanda la 30e division d&#39;infanterie, mais fut mortellement bless&eacute; par un &eacute;clat d&#39;obus le 29 d&eacute;cembre de la m&ecirc;me ann&eacute;e.</p>\r\n\r\n<p>&lt;ba1&gt;</p>\r\n\r\n<p>&nbsp;</p>	13	7	10
21	<p>Anciennement appel&eacute;e avenue de la Pi&egrave;ce d&rsquo;Eau, cette voie arbor&eacute;e, flanqu&eacute;e de belles maisons, menait jadis vers le bassin d&rsquo;eau, la &laquo;&nbsp;pi&egrave;ce d&rsquo;eau&nbsp;&raquo;, qui alimentait le parc et potager du domaine du seigneur de Chatou. Le nom actuel des &laquo;&nbsp;27 Martyrs&nbsp;&raquo; lui a &eacute;t&eacute; donn&eacute; apr&egrave;s la deuxi&egrave;me guerre mondiale, en souvenir des r&eacute;sistants locaux qui, vers la fin du conflit, occup&egrave;rent la Villa Lambert. Identifi&eacute;s par des collaborateurs, ils furent massacr&eacute;s par les troupes allemandes. Leur sacrifice est &eacute;voqu&eacute; dans une plaque au d&eacute;but de l&rsquo;avenue.</p>\r\n\r\n<p>&lt;ba1&gt;</p>\r\n\r\n<p>&nbsp;</p>	23	17	20
22	<p>Cette entr&eacute;e est rest&eacute;e inchang&eacute;e depuis la fin du XIXe si&egrave;cle&nbsp;! C&rsquo;est par ici qu&rsquo;on acc&egrave;de &agrave; la Villa Lambert, au ch&acirc;teau de la Pi&egrave;ce d&rsquo;Eau ainsi qu&rsquo;&agrave; un certain nombre de belles villas. La Pi&egrave;ce d&rsquo;Eau &eacute;tait le r&eacute;servoir qui alimentait les jardins du domaine de la seigneurie de Bertin. Le terrain fut l&rsquo;un des premiers de l&rsquo;ancien domaine de Bertin &agrave; avoir &eacute;t&eacute; morcel&eacute; pour &ecirc;tre lotis&nbsp;: en 1873 la Pi&egrave;ce d&rsquo;Eau et le bois qui l&rsquo;entouraient furent vendus par la famille Lacroix-Moisant &agrave; Louis-Etienne Lambert, qui fit construire les villas qu&rsquo;on voit aujourd&rsquo;hui. Dans une de celles-ci, au num&eacute;ro 10, habitait de 1907 jusqu&rsquo;&agrave; la fin de sa vie la m&egrave;re de Guillaume Apollinaire, Angelina Kostrowitzky. Son fils, grand ami d&rsquo;Andr&eacute; D&eacute;rain et de Maurice de Vlaminck, venait souvent &agrave; Chatou pour lui rendre visite. Arriv&eacute;e &agrave; Paris depuis Rome en 1899, o&ugrave; Guillaume &eacute;tait n&eacute;, elle s&rsquo;installa d&rsquo;abord &agrave; Paris et puis de 1904 &agrave; 1907 au V&eacute;sinet, au 8 du boulevard Carnot, qui devint aussi la demeure de Guillaume.</p>\r\n\r\n<p>&lt;ba1&gt;</p>\r\n\r\n<p>&nbsp;</p>	24	18	21
17	<p>Il est difficile, aujourd&rsquo;hui, d&rsquo;imaginer qu&rsquo;&agrave; cet endroit se dressait l&rsquo;ancien pont routier de Chatou. La rue du Pont partait de la rue de la Paroisse, pour bifurquer &agrave; droite juste avant le pont et descendre vers la Seine dans la rue du Port, qui a chang&eacute; d&rsquo;apparence mais pas de nom. Dans la carte postale, on entrevoit au loin le restaurant Levanneur qui avait une entr&eacute;e au niveau du pont. Dans l&rsquo;image suivante, vous verrez au coin de la rue de la Paroisse le magasin de couleurs et papiers du P&egrave;re Jarry o&ugrave; Andr&eacute; D&eacute;rain et Maurice de Vlaminck achetaient, parfois &agrave; cr&eacute;dit, leurs couleurs et d&rsquo;autres outils de peinture.</p>\r\n\r\n<p>&lt;ba1&gt;</p>\r\n\r\n<p>&lt;ba2&gt;</p>	19	13	16
19	<p>La rue du Ch&acirc;teau, actuellement rue du Docteur Rochefort, &eacute;tait la continuation de la rue de la Paroisse en direction du domaine de la seigneurie de Chatou. Au XIXe si&egrave;cle l&rsquo;entr&eacute;e au ch&acirc;teau, originairement situ&eacute;e dans le tournant de la rue du Ch&acirc;teau, fut d&eacute;plac&eacute;e en face de la rue de la Libert&eacute; (anciennement rue de la Procession). Les statues de lions qui l&rsquo;ornaient sont visibles dans la cour de l&rsquo;immeuble de baillage au num&eacute;ro 12 de la rue du Docteur Rochefort. Dans l&rsquo;image du d&eacute;but du XXe si&egrave;cle on peut encore voir la superbe grange au toit de chaume du ch&acirc;teau.</p>\r\n\r\n<p>C&rsquo;est en 1925 que la mairie d&eacute;cida d&rsquo;honorer le Docteur Rochefort, Chevalier de la L&eacute;gion d&rsquo;Honneur, maire de Chatou de 1911 &agrave; 1919 et m&eacute;decin catovien depuis 1888, en donnant son nom &agrave; la rue du Ch&acirc;teau. D&eacute;vou&eacute; au bien&ecirc;tre des habitants de Chatou, le docteur Rochefort faisait aussi une pratique b&eacute;n&eacute;vole et durant la Grande Guerre, en d&eacute;pit de son &acirc;ge avanc&eacute;, il avait fait cr&eacute;er un h&ocirc;pital provisoire dans le ch&acirc;teau de la Faisanderie.</p>\r\n\r\n<p>&lt;ba1&gt;</p>\r\n\r\n<p>&nbsp;</p>	21	15	18
20	<p>L&rsquo;&eacute;cole maternelle au coin de la Rue du Docteur Rochefort (ancienne rue du Ch&acirc;teau) et de la rue Ernest Bousson (rue de l&rsquo;H&ocirc;tel de Ville) n&rsquo;a presque pas chang&eacute; depuis le d&eacute;but du XXe si&egrave;cle.</p>\r\n\r\n<p>&lt;ba1&gt;</p>	22	16	118
26	<p>La rue des Landes avait un aspect assez rural &agrave; l&rsquo;&eacute;poque. Au croisement avec l&rsquo;avenue du Cimeti&egrave;re il y avait tout de m&ecirc;me deux &eacute;tablissements&nbsp;: l&rsquo;un, la <em>maison Cholat</em>, &eacute;tait une &eacute;picerie, mercerie et restaurant, aujourd&rsquo;hui disparue. L&rsquo;autre, le <em>Petit Bleu</em>, &eacute;tait un petit restaurant et h&ocirc;tel, puis aussi tabac avec salle de billard, qui a r&eacute;sist&eacute; dans le temps et s&rsquo;appelle aujourd&rsquo;hui Caf&eacute;-Restaurant <em>Le Panach&eacute;</em>.</p>\r\n\r\n<p>&lt;ba1&gt;</p>\r\n\r\n<p>&nbsp;</p>	28	22	25
29	<p>En 1869, sous l&rsquo;impulsion du maire Pierre Dumas, on inaugura un premier bureau postal pr&egrave;s de la gare de Chatou. Le local &eacute;tant trop exigu pour les besoins de la poste, le bureau fut trans&eacute;r&eacute; en 1877 dans un b&acirc;timent, 2 avenue du Chemin de Fer (aujourd&rsquo;hui avenue du G&eacute;n&eacute;ral Sarrail), &agrave; l&rsquo;angle avec la rue de Saint-Germain (actuellement avenue du Mar&eacute;chal Foch). Mais, comme le constata le maire de l&rsquo;&eacute;poque, Ernest Bousson, les nouveaux locaux &eacute;taient inadapt&eacute;s au tri postal, et le public se plaignait du manque d&rsquo;espace. On d&eacute;cida finalement de d&eacute;placer la poste dans le b&acirc;timent de l&rsquo;autre c&ocirc;t&eacute; du carrefour, o&ugrave; elle resta jusque dans les ann&eacute;es 1960. Le b&acirc;timent est toujours en place et les anciens locaux du bureau postal sont occup&eacute;s par un fleuriste.</p>\r\n\r\n<p>&lt;ba1&gt;</p>\r\n\r\n<p>&nbsp;</p>	31	25	28
30	<p>Contrairement aux &icirc;lots situ&eacute;s &agrave; droite de l&rsquo;H&ocirc;tel de ville qui ont &eacute;t&eacute; ras&eacute;s lors de la &laquo;&nbsp;r&eacute;novation&nbsp;&raquo;, ceux de la gauche, construits au XIXe si&egrave;cle, apr&egrave;s le morcellement des terres de la villa de Camille Perier, ont &eacute;t&eacute; pr&eacute;serv&eacute;s&nbsp;: m&ecirc;me le caf&eacute; de l&rsquo;H&ocirc;tel de Ville est toujours l&agrave; pour servir des caf&eacute;s et des repas.</p>\r\n\r\n<p>&lt;ba1&gt;</p>\r\n\r\n<p>&nbsp;</p>	32	26	114
28	<p>Pourquoi une faisanderie&nbsp;? Il fut un temps o&ugrave; ce quartier et tout le V&eacute;sinet avoisinant formaient un bois r&eacute;serv&eacute; &agrave; la chasse royale. Donc, pas de surprise, on y &eacute;levait effectivement des faisans pour le plaisir de ces illustres chasseurs, dont l&rsquo;un des plus fervents &eacute;tant le roi Henri IV. Le dernier membre de la famille royale, le comte d&rsquo;Artois, futur Charles X, qui en fut propri&eacute;taire, y fit &eacute;riger en 1783, par l&rsquo;architecte Berlanger, un beau pavillon de chasse. Apr&egrave;s la R&eacute;volution le domaine fut acquis par Antoine Ruinard de Brimont. En 1862, ses h&eacute;ritiers firent raser le pavillon pour construire le ch&acirc;teau qui garde encore dans son nom et dans les deux pavillons de l&rsquo;entr&eacute;e le souvenir du temps pass&eacute;.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>	11	24	27
31	<p>Depuis 1874, une ligne de tramway op&eacute;r&eacute;e par la Compagnie du Tramway &agrave; Vapeur reliait Rueil &agrave; Marly-le-Roi via Bougival et Port-Marly. Elle fut ensuite prolong&eacute;e en 1890 vers Courbevoie et Saint-Germain en Laye, mais ne desservait pas Chatou. Les mairies de la Boucle de Seine &oelig;uvr&egrave;rent pour qu&rsquo;une ligne desservant leurs communes soit ouverte. Finalement, en 1900, le maire Maurice Berteaux annon&ccedil;a que le gouvernement avait donn&eacute; son feu vert &agrave; la r&eacute;alisation d&rsquo;un &laquo;&nbsp;omnibus sur rail&nbsp;&raquo; reliant Courbevoie au Pecq via Nanterre, Rueil, Chatou, et Le V&eacute;sinet. La ligne fut effectivement inaugur&eacute;e le 1er mars 1904. &Agrave; partir du 26 novembre 1912, la ligne &agrave; vapeur fut substitu&eacute;e par une ligne &eacute;lectrifi&eacute;e, qui fut arr&ecirc;t&eacute;e en 1928 et remplac&eacute;e par lignes d&rsquo;autobus.</p>\r\n\r\n<p>&lt;ba1&gt;</p>\r\n\r\n<p>&lt;ba2&gt;</p>\r\n\r\n<p>&nbsp;</p>	33	28	30
33	<p><span style="color:black">En voyant surgir l&rsquo;&Eacute;glise Notre-Dame de l&rsquo;Assomption &agrave; c&ocirc;t&eacute; du pont de Chatou en plein milieu des constructions modernes, fr&ocirc;l&eacute;e par la route &agrave; quatre voies qui relie Rueil-Malmaison au V&eacute;sinet, puis &agrave; Saint-Germain-en-Laye, il n&rsquo;y a aucun doute, elle a </span>surv&eacute;cu aux <span style="color:black">tourments historiques </span>depuis le <strong>XII&egrave;me</strong> si&egrave;cle jusqu&#39;&agrave; la R&eacute;novation de 1966 qui fit table rase de tout le quartier.</p>\r\n\r\n<p><span style="color:black">L&rsquo;&eacute;difice de Chatou en pierre calcaire, fut d&rsquo;abord construit sur les fondements d&rsquo;une &eacute;glise en bois &eacute;rig&eacute;e au <strong>XI</strong></span><strong>&egrave;me</strong><span style="color:black"> si&egrave;cle. </span></p>\r\n\r\n<p><span style="color:black">Le clocher, t&eacute;moignage</span> le plus ancien, fut <span style="color:black">construit au <strong>XII</strong></span><strong>&egrave;me</strong><span style="color:black"> si&egrave;cle dans un pur style roman, un premier ch&oelig;ur a</span>yant&nbsp; &eacute;t&eacute; <span style="color:black">construit au <strong>XIII</strong></span><strong>&egrave;me</strong><span style="color:black"> si&egrave;cle.&nbsp;</span></p>\r\n\r\n<p><strong><span style="color:black">Vers 1622</span></strong><span style="color:black">, la nef </span>fut<span style="color:black"> reconstruite avec une vo&ucirc;te en vaisseau et la fa&ccedil;ade principale a une apparence classique. </span></p>\r\n\r\n<p>Lors de la guerre franco-prussienne, les<span style="color:black"> bombardements de l&#39;arm&eacute;e fran&ccedil;aise, cantonn&eacute;e au Mont Val&eacute;rien</span>, endommag&egrave;rent<span style="color:black"> l&rsquo;</span>&eacute;glise.</p>\r\n\r\n<p><strong><span style="color:black">Paul Abadie</span></strong><span style="color:black"> (1812-1884), </span>futur a<span style="color:black">rchitecte de l</span>a basilique <span style="color:black">du Sacr&eacute; C&oelig;ur de Paris, </span>fut charg&eacute; de<span style="color:black"> sa restauration</span> qu&#39;il r&eacute;alisa en <strong>1871-1872</strong>. Il<span style="color:black"> ajouta</span> notamment <span style="color:black">une fl&egrave;che au clocher et r&eacute;am&eacute;nage</span>a l&#39;int&eacute;rieur tout<span style="color:black"> en conservant </span>l<span style="color:black">a fa&ccedil;ade romane</span> de l&#39;&eacute;difice. <strong>Paul Abadie</strong> habitait Chatou o&ugrave; il fut conseiller municipal de <strong>1870 &agrave; 1875</strong>.</p>\r\n\r\n<p><strong>En 1880</strong>, la municipalit&eacute; de <strong>Monsieur Bousson</strong> d&eacute;cida une nouvelle campagne de restauration en pr&eacute;voyant cette&nbsp; cette fois d&#39;agrandir l&#39;&eacute;glise. Les travaux furent confi&eacute;s &agrave; l&#39;architecte catovien <strong>Fran&ccedil;ois Eug&egrave;ne Bardon </strong>(1843-1901). Celui-ci s&#39;inspira des mod&egrave;les gothiques parisiens pour reconstruire la fa&ccedil;ade que nous connaissons aujourd&#39;hui.</p>\r\n\r\n<p><span style="color:black">Les vitraux datent de la fin du <strong>XIX</strong></span><strong>&egrave;me</strong><span style="color:black"> si&egrave;cle &agrave; l&rsquo;exception des vitraux de la fa&ccedil;ade sud &ndash; d&eacute;molis lors des bombardements de la deuxi&egrave;me guerre mondiale - qui ont &eacute;t&eacute; remplac&eacute;s par des vitraux abstraits command&eacute;s au ma&icirc;tre-verrier <strong>Emile Chauche</strong></span>.</p>\r\n\r\n<p><span style="color:black">En <strong>1961</strong>, la nef centrale </span>fut<span style="color:black"> allong&eacute;e gr&acirc;ce &agrave; une souscription publique.</span></p>\r\n\r\n<p>A l&#39;entr&eacute;e du pont, l&#39;&eacute;glise est le signe de reconnaissance de l&#39;histoire de Chatou</p>\r\n\r\n<p><img alt="" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAACxEAAAsRAX9kX5EAAAD+SURBVEhLYxgFAw4YoTRBoDvlkhqQioTwGJZfztG7BWXjBUxQmiD48+1jPpBqgGKYRQQB0Rb8/fpRB8pk+PfrBxeUSRAQbQEaIDpoybWAaEBzCzC8Ckst0HCGy///8zuSmYtXBsT+9+v7VqDUNbAEBPxnYuP4BqQxUhc2C+qBFCilkAMagBY0QtlgMDBBBErzyMmShVtAlpmLTxHKZfj77fOTP1/f34NywYCZm/8KCxf/RIJBhA2ALP377dMOmCXA+Om+WmRWBpYkAIgKIpCr/nz98BjKJQkM2nzwH0oTBERbAIpEKJMBmuaJAkRbAEohQApWmi4HiY2CoQAYGABQ7VEn93e8iAAAAABJRU5ErkJggg==" style="height:18px; width:18px" /><em>&Eacute;coutez l&#39;audio pour en savoir plus</em></p>\r\n\r\n<p>&nbsp;</p>	35	30	37
24	<p>Au lieu-dit Ch&acirc;telet se s&eacute;parent les anciennes routes de Carri&egrave;res et de Montesson que les paysans empruntaient pour rejoindre leurs terrains mara&icirc;chers. Les premi&egrave;res maisons et rues datent de la fin du XIXe si&egrave;cle, mais le quartier tel qu&rsquo;on le voit aujourd&rsquo;hui se d&eacute;veloppe &agrave; partir de la premi&egrave;re guerre mondiale.</p>\r\n\r\n<p>&lt;ba1&gt;</p>	26	20	23
35	<p><span style="color:black">Le Nymph&eacute;e a depuis toujours inspir&eacute; les po&egrave;tes et les artistes, car il incarne une fontaine sacr&eacute;e, lieu d&rsquo;habitation et d&rsquo;union des nymphes, divinit&eacute;s des eaux, de la for&ecirc;t et des montagnes qui jouent ou dansent en toute innocence dans ces palais aquatiques, abrit&eacute;s et invisibles aux yeux du monde. La fra&icirc;cheur de ces eaux leur offre la jeunesse &eacute;ternelle. </span></p>\r\n\r\n<p><span style="color:black">Le Nymph&eacute;e</span> de Chatou fut une commande du <span style="color:black">dernier Seigneur de Chatou, <strong>Henri-L&eacute;onard-Jean-Baptiste Bertin</strong> (1720-1792), ministre de 1759 &agrave; 1780, qui souhait</span>a<span style="color:black"> doter son jardin d&rsquo;une &oelig;uvre originale et p&eacute;renne. </span></p>\r\n\r\n<p><span style="color:black">Il v</span>oulut<span style="color:black"> un ouvrage ing&eacute;nieux et de bel agr&eacute;ment dans le style des parcs de la Renaissance</span>. En particulier, il organisa l&#39;arriv&eacute;e dans le Nymph&eacute;e des<span style="color:black"> eaux de ruissellement issues de sa pi&egrave;ce d&rsquo;eau situ&eacute;e aujourd&#39;</span>hui <span style="color:black">la Villa Lambert. </span></p>\r\n\r\n<p><span style="color:black">Il s&rsquo;adress</span>a<span style="color:black"> alors &agrave; <strong>l&rsquo;architecte fran&ccedil;ais Jacques-Germain Soufflot</strong> (1713-1780) qu&rsquo;il connut &agrave; Lyon lorsqu&rsquo;il exer&ccedil;ait la charge d&rsquo;Intendant de cette ville. </span></p>\r\n\r\n<p><span style="color:black">Pour la construction de l&rsquo;ouvrage, l&rsquo;architecte Soufflot trouv</span>a<span style="color:black"> son inspiration dans ses souvenirs et dans l&rsquo;&eacute;vocation des Nymphes. Il&nbsp; imagin</span>a<span style="color:black"> une grotte d&eacute;di&eacute;e &agrave; une Nymphe autour de deux &eacute;l&eacute;ments audacieux : une longue vo&ucirc;te en forme de coquille adoss&eacute;e &agrave; un talus et un d&eacute;cor avec des incrustations de min&eacute;raux, de pierres meuli&egrave;res, de coquillages, de scories et de r&eacute;sidus de fonderie que le ministre Bertin, soucieux</span> d&#39;&eacute;conomie, <span style="color:black">avait &agrave; sa disposition. Cette conception originale, support&eacute;e par 18 colonnes dispos&eacute;es en demi-cercle, donne un &eacute;clat particulier au Nymph&eacute;e de Chatou.</span></p>\r\n\r\n<p>Lorsqu&#39;il recevait ses invit&eacute;s de marque, <span style="color:black">Bertin </span>fut<span style="color:black"> fier de leur proposer une visite guid&eacute;e &agrave; travers ses jardins en perspective et ses c&eacute;l&egrave;bres plantations de pommes de terre&nbsp;; mais l&rsquo;apog&eacute;e de ce parcours somptueux reste le Nymph&eacute;e. </span></p>\r\n\r\n<p><span style="color:black">Cette folie servit non seulement de </span>d&eacute;cor pour les invit&eacute;s du ministre<span style="color:black">, mais elle permit aussi d&rsquo;y trouver un refuge de fra&icirc;cheur en &eacute;t&eacute;, lorsque le soleil frapp</span>ait <span style="color:black">trop fort&nbsp;; et n&rsquo;oublions pas la premi&egrave;re id&eacute;e tout &agrave; fait fonctionnelle de <strong>Henri-L&eacute;onard-Jean-Baptiste Bertin</strong> de d&eacute;vier les eaux usag&eacute;es de son jardin potager vers une fontaine d&eacute;corative. C&rsquo;est ainsi qu&rsquo;elle est con&ccedil;ue par paliers, lesquels permettent de nourrir le bassin de ses eaux. </span></p>\r\n\r\n<p><span style="color:black">Le Nymph&eacute;e </span>a &eacute;t&eacute; <span style="color:black">class&eacute; monument historique le 4 juin <strong>1952</strong>. C&rsquo;est l&#39;un des rares Nymph&eacute;es encore existants en France</span> sans doute le plus important.</p>\r\n\r\n<p><span style="color:black">Gr&acirc;ce &agrave; son emplacement retir&eacute; et prot&eacute;g&eacute; et gr&acirc;ce aux proc&eacute;d&eacute;s novateurs utilis&eacute;s par l&rsquo;architecte, le Nymph&eacute;e avait r&eacute;sist&eacute; au temps</span>. Mais en 2002 puis en 2015, il fut d&eacute;clar&eacute; en p&eacute;ril par les services de l&#39;&Eacute;tat.</p>\r\n\r\n<p><span style="color:black">L&#39;architecte consult&eacute; en 2019 par la ville sp&eacute;cialis</span>&eacute; <span style="color:black">dans la r&eacute;novation de b&acirc;timents historiques pense que le Nymph&eacute;e peut subir de graves dommages &agrave; tout moment et que les travaux de restauration &ndash; qu&rsquo;il estime &agrave; 2 ans minimum &ndash; sont urgents. Car outre la d&eacute;gradation visible des colonnes, il faut aussi restaurer tout le syst&egrave;me interne de r&eacute;cup&eacute;ration des eaux pour remettre le bassin en </span>eau.</p>\r\n\r\n<p>&lt;1&gt;</p>\r\n\r\n<p>&lt;2&gt;</p>\r\n\r\n<p>&lt;3&gt;</p>\r\n\r\n<p><em><span style="color:black">Un nymph&eacute;e est la maison d&rsquo;une nymphe.</span></em></p>\r\n\r\n<p><em><span style="color:black">Les Nymphes &ndash; dont le mot en grec se traduit par jeunes filles ou fianc&eacute;es &ndash;, sont de gracieuses d&eacute;esses que les Grecs croyaient rencontrer dans les montagnes, pr&egrave;s des&nbsp;rivi&egrave;res et des sources. Elles r&eacute;pandaient l&rsquo;eau salutaire au moment du renouveau et habitaient dans des grottes. L&#39;une d&#39;elles, poursuivie par le Dieu Pan, lui &eacute;chappa en se r&eacute;fugiant dans une grotte et en se transformant en source. C&rsquo;est ainsi que les grottes naturelles ou artificielles avec de l&rsquo;eau sont devenues des sanctuaires consacr&eacute;s aux Nymphes et ont pris le nom de &laquo; Nymph&eacute;e &raquo;. On pr&ecirc;tait d&rsquo;ailleurs aux eaux qui en jaillissaient un effet curatif.</span></em></p>\r\n\r\n<p><img alt="" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAACxEAAAsRAX9kX5EAAAD+SURBVEhLYxgFAw4YoTRBoDvlkhqQioTwGJZfztG7BWXjBUxQmiD48+1jPpBqgGKYRQQB0Rb8/fpRB8pk+PfrBxeUSRAQbQEaIDpoybWAaEBzCzC8Ckst0HCGy///8zuSmYtXBsT+9+v7VqDUNbAEBPxnYuP4BqQxUhc2C+qBFCilkAMagBY0QtlgMDBBBErzyMmShVtAlpmLTxHKZfj77fOTP1/f34NywYCZm/8KCxf/RIJBhA2ALP377dMOmCXA+Om+WmRWBpYkAIgKIpCr/nz98BjKJQkM2nzwH0oTBERbAIpEKJMBmuaJAkRbAEohQApWmi4HiY2CoQAYGABQ7VEn93e8iAAAAABJRU5ErkJggg==" style="height:18px; width:18px" /><em>&Eacute;coutez l&#39;audio pour en savoir plus</em></p>\r\n\r\n<p>&nbsp;</p>	37	32	136
32	<p>La maison Levanneur, b&acirc;tisse historique, a &eacute;t&eacute; transform&eacute;e d&rsquo;une simple maison de p&ecirc;cheur, jadis propri&eacute;t&eacute; de Pierre-&Eacute;tienne Levanneur, &agrave; ce qu&#39;elle est aujourd&#39;hui par Henri-L&eacute;onard-Jean-Baptiste Bertin, contr&ocirc;leur g&eacute;n&eacute;ral des finances de Louis XV, qui a son Ch&acirc;teau non loin sur les berges de la Seine c&ocirc;t&eacute; Chatou. En 1775, il l&rsquo;ach&egrave;te et commande son agrandissement.</p>\r\n\r\n<p>Avant m&ecirc;me le restaurant Fournaise, la maison Levanneur devient donc restaurant en 1830 et le restera jusqu&rsquo;au d&eacute;but du XXe si&egrave;cle, sans jamais atteindre ou chercher la m&ecirc;me c&eacute;l&eacute;brit&eacute; que son voisin, probablement parce qu&rsquo;elle n&rsquo;avait pas la belle vue sur la Seine et donc l&rsquo;acc&egrave;s direct &agrave; l&rsquo;eau. Cependant, le restaurant Levanneur fut investi par des artistes qui chang&egrave;rent profond&eacute;ment le cours de l&rsquo;histoire de l&rsquo;art au d&eacute;but du XXe si&egrave;cle. &Agrave; l&rsquo;&eacute;poque, il est fr&eacute;quent&eacute; par une nouvelle g&eacute;n&eacute;ration d&rsquo;artistes comme Henri Matisse qui vient tenir compagnie &agrave; Andr&eacute; Derain, Maurice De Vlaminck et Guillaume Apollinaire. Si les trois premiers lancent le mouvement du Fauvisme en 1905, le po&egrave;te proche de Picasso et Braque adh&egrave;re plut&ocirc;t au cubisme, mais ils partagent la m&ecirc;me passion pour l&rsquo;art africain qui inspira leurs &oelig;uvres respectives.</p>\r\n\r\n<p>&lt;1&gt;</p>\r\n\r\n<p>Si la maison Levanneur est inscrite dans les guides d&rsquo;aujourd&rsquo;hui, c&rsquo;est aussi gr&acirc;ce aux peintres <strong>Maurice De Vlaminck</strong> et <strong>Andr&eacute; Derain</strong>. En 1900, les deux artistes, l&rsquo;un originaire du V&eacute;sinet, l&rsquo;autre de Chatou, se rencontrent dans le train faisant la liaison entre Paris Saint-Lazare et le V&eacute;sinet, lors d&rsquo;une permission de <strong>Vlaminck </strong>(1876-1958), qui d&eacute;bute son service militaire. Selon la l&eacute;gende il y aurait eu un d&eacute;raillement du train et suite &agrave; cette exp&eacute;rience les deux artistes auraient fait chemin commun. Rapidement, ils deviennent ins&eacute;parables et d&eacute;cident de partager un atelier dans le restaurant Levanneur. Vlaminck, un grand homme fort, d&rsquo;imposante apparence et d&eacute;j&agrave; jeune p&egrave;re de famille, gagne trop peu d&rsquo;argent pour nourrir sa femme et ses jeunes enfants&nbsp;; ainsi, il multiplie les t&acirc;ches. Ayant appris le violon par son p&egrave;re, il joue dans les restaurant des bords de Seine qui ne manquent point dans la r&eacute;gion&nbsp;; ou bien, il participe &agrave; des comp&eacute;titions de cyclistes. Mais, encore plus original, une partie de ses revenues lui vient de ses &eacute;crits. Il r&eacute;dige des romans &eacute;rotiques avec un ami, qui lui rapportent probablement le plus d&rsquo;argent.</p>\r\n\r\n<p>Contrairement &agrave; Vlaminck<strong>, Andr&eacute; Derain</strong> (1880-1954) n&eacute; &agrave; Chatou, restera profond&eacute;ment li&eacute; &agrave; cette ville. Ses parents tiennent une cr&eacute;merie, tout pr&egrave;s de l&rsquo;ancien pont, r&eacute;put&eacute;e pour avoir la meilleure glace de la r&eacute;gion. La maison que Derain habite d&egrave;s son retour du service militaire, en 1904, est une tr&egrave;s belle villa, un m&eacute;lange de style n&eacute;o-gothique et d&rsquo;art nouveau, situ&eacute;e juste &agrave; c&ocirc;t&eacute; de la mairie, au num&eacute;ro 7 de la place de l&rsquo;H&ocirc;tel de Ville.&nbsp;</p>\r\n\r\n<p>Le p&egrave;re du jeune Andr&eacute; vise grand et d&eacute;cide de le placer &agrave; l&rsquo;&eacute;cole polytechnique, mais Derain n&rsquo;a d&eacute;j&agrave; des yeux que pour la peinture et c&rsquo;est ainsi qu&rsquo;on le voit fl&acirc;ner au Louvre, o&ugrave; il rencontre un ancien ami du lyc&eacute;e dont le p&egrave;re, Alfred Jacomin, est peintre et habitant de Chatou. De fil en aiguille, le jeune Derain d&eacute;bute son premier enseignement artistique. Ses parents ne s&rsquo;opposent pas &agrave; son d&eacute;sir et c&rsquo;est ainsi qu&rsquo;on le voit passer des journ&eacute;es enti&egrave;res &agrave; esquisser et &agrave; peindre en plein air, souvent en compagnie de Vlaminck. S&rsquo;il n&rsquo;a pas assez d&rsquo;argent pour se payer son billet de train, il fait le chemin &agrave; pied de Paris jusqu&rsquo;&agrave; Chatou et inversement. Certains jours, cette balade donne occasion &agrave; de longues conversations, lorsqu&rsquo;il marche avec Guillaume Apollinaire qui se rend au V&eacute;sinet.</p>\r\n\r\n<p>&lt;2&gt;</p>\r\n\r\n<p>La location de l&rsquo;atelier du Pont de Chatou sera de courte dur&eacute;e, car Derain doit partir &agrave; son tour pour le service militaire, Vlaminck ne pouvant assumer les frais tout seul. Pourtant malgr&eacute; toutes les difficult&eacute;s qu&rsquo;ils traversent, ou peut-&ecirc;tre justement &agrave; cause d&rsquo;elles, les deux artistes gardent un lien intense.</p>\r\n\r\n<p>&Agrave; leur arriv&eacute;e en 1900, le restaurant &eacute;tait tr&egrave;s d&eacute;grad&eacute;, et la l&eacute;gende veut que Derain et Vlaminck se soient servis des vieilles chaises en bois pour chauffer l&rsquo;atelier.</p>\r\n\r\n<p>Pendant leur absence respective Vlaminck et Derain commencent une longue correspondance artistique d&rsquo;une profonde sinc&eacute;rit&eacute;, qui m&egrave;nera &agrave; une collaboration v&eacute;ritable d&egrave;s 1904. D&eacute;sormais, ils peignent en plein air, inspir&eacute;s par les impressionnistes, qui les ont pr&eacute;c&eacute;d&eacute;s sur ces lieux. Mais plus audacieux encore, leurs couleurs sont appliqu&eacute;es pures, telles qu&rsquo;elles sortent du tube, elles sont violentes et acides et semblent agresser l&rsquo;&oelig;il du spectateur. Leurs gestes spontan&eacute;s et sauvages vont rapidement esquisser le paysage au lieu de le d&eacute;crire, comme si la perception passait moins par la vue, que par le ressenti. C&rsquo;est la le&ccedil;on qu&rsquo;ils retiennent des &oelig;uvres de Van Gogh, alors que les peintures de Gauguin les m&egrave;nent &agrave; appliquer la peinture en grosses couches plates, adaptant un style presque primitif.</p>\r\n\r\n<p>Cette amiti&eacute; nou&eacute;e sur les bords de Seine fera na&icirc;tre le mouvement fauve.</p>\r\n\r\n<p>Henri Matisse, le premier artiste &agrave; adopter cette nouvelle technique de la peinture pure, aura une grande influence sur eux. Il les accompagne souvent lors de leurs promenades sur les bords de Seine et aux restaurants Fournaise ou Levanneur. Quelques fois, le po&egrave;te Guillaume Apollinaire se joint &agrave; eux. Gr&acirc;ce &agrave; ces liens amicaux, le marchand d&rsquo;art Ambroise Vollard qui avait d&eacute;j&agrave; achet&eacute; l&rsquo;int&eacute;gralit&eacute; de l&rsquo;atelier de Derain en 1905, d&eacute;cide d&rsquo;acqu&eacute;rir la quasi-totalit&eacute; de la production de Vlaminck pour sa galerie, pas moins de quarante-huit tableaux d&rsquo;un coup&nbsp;! Pour Vlaminck, c&rsquo;est une chance inou&iuml;e, lui qui vivait dans la plus grande pauvret&eacute; avec sa femme et ses enfants et qui avait tout sacrifi&eacute; &agrave; la peinture. Ambroise Vollard est alors un marchand visionnaire, car en 1905, au Salon d&rsquo;Automne, le groupe des artistes est d&eacute;cri&eacute; dans un article incendiaire, publi&eacute; le 17 octobre dans <em>Gil Bas</em>, par le critique Louis Vauxelles. Un beau buste en marbre sculpt&eacute; par Albert Marquet est plac&eacute; au milieu des peintures de Matisse, Derain, Vlaminck et Van Dongen, le critique d&rsquo;art s&rsquo;&eacute;crie alors&nbsp;: <em>&laquo;&nbsp;Mais c&rsquo;est Donatello parmi les fauves&nbsp;!&nbsp;&raquo;</em></p>\r\n\r\n<p>La maison Levanneur est depuis 2018 occup&eacute;e par la Galerie Bessi&egrave;re, la premi&egrave;re Galerie d&rsquo;Art contemporain au pays des impressionnistes, alors qu&rsquo;elle fut durant des ann&eacute;es le Centre National d&rsquo;Art Contemporain consacr&eacute; &agrave; l&rsquo;&eacute;dition et aux arts imprim&eacute;s, en hommage &agrave; Derain.</p>\r\n\r\n<p><img alt="" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAACxEAAAsRAX9kX5EAAAD+SURBVEhLYxgFAw4YoTRBoDvlkhqQioTwGJZfztG7BWXjBUxQmiD48+1jPpBqgGKYRQQB0Rb8/fpRB8pk+PfrBxeUSRAQbQEaIDpoybWAaEBzCzC8Ckst0HCGy///8zuSmYtXBsT+9+v7VqDUNbAEBPxnYuP4BqQxUhc2C+qBFCilkAMagBY0QtlgMDBBBErzyMmShVtAlpmLTxHKZfj77fOTP1/f34NywYCZm/8KCxf/RIJBhA2ALP377dMOmCXA+Om+WmRWBpYkAIgKIpCr/nz98BjKJQkM2nzwH0oTBERbAIpEKJMBmuaJAkRbAEohQApWmi4HiY2CoQAYGABQ7VEn93e8iAAAAABJRU5ErkJggg==" style="height:18px; width:18px" /><em>&Eacute;coutez l&#39;audio pour en savoir plus</em></p>\r\n\r\n<p>&nbsp;</p>	34	29	34
7	<p><strong>Alphonse Fournaise (1823-1905),</strong> d&eacute;clar&eacute; &laquo;&nbsp;constructeur de bateaux&nbsp;&raquo; d&egrave;s 1853, installe son atelier sur l&rsquo;&Icirc;le du Chiard (&Icirc;le de Chatou) <strong>vers 1857</strong>. Il s&#39;occupe de la construction des canots, de l&#39;organisation, des f&ecirc;tes nautiques et de l&#39;intendance. Son fils, <strong>Alphonse Hippolyte Fournaise (1848-1910)</strong>, g&egrave;re la vente, la location et l&#39;entretien des bateaux.</p>\r\n\r\n<p><strong>Vers 1860</strong>, avec sa femme, ils deviennent propri&eacute;taires d&rsquo;un restaurant puis proc&egrave;dent &agrave; plusieurs constructions et agrandissement <strong>jusqu&#39;en 1877</strong>, date &agrave; laquelle est &eacute;difi&eacute; le large balcon qui va devenir c&eacute;l&egrave;bre, ainsi que la terrasse le prolongeant. Madame Fournaise veille &agrave; la perfection de la cuisine.</p>\r\n\r\n<p><strong>Alphonsine</strong>, leur fille, est l&#39;attrait de la maison. Elle est remarqu&eacute;e par la gr&acirc;ce de son accueil, sa beaut&eacute; et son charme, elle est choy&eacute;e par les peintres parmi lesquels <strong>Auguste Renoir (1841-1919). </strong>Celui-ci fr&eacute;quente en effet assid&ucirc;ment le Restaurant Fournaise <strong>de 1868 &agrave; 1884</strong>.&nbsp;&laquo;&nbsp;<em>&nbsp;J&#39;&eacute;tais toujours fourr&eacute; chez Fournaise, j&#39;y trouvais autant de superbes filles &agrave; peindre que je pouvais en d&eacute;sirer&nbsp;&raquo;</em>. De nombreuses toiles de Renoir montrent la Seine &agrave; Chatou et ses ponts, les canotiers ; l&#39;un de ses plus c&eacute;l&egrave;bres tableaux r&eacute;alis&eacute; en 1881 fut celui o&ugrave; il fait poser ses amis sur le balcon du restaurant et qui est intitul&eacute;&nbsp;<strong><em>Le D&eacute;jeuner des Canotiers</em></strong>&nbsp;<em>(Phillips Collection, Washington)</em>. On y reconna&icirc;t entre autres, Alphonse Fournaise fils et sa s&oelig;ur Alphonsine.</p>\r\n\r\n<p>&lt;2&gt;</p>\r\n\r\n<p><strong>Maurice R&eacute;alier-Dumas (1860-1928)</strong> est un jeune peintre qui habite &agrave; Chatou. Il vient retrouver les artistes et une idylle le lie &agrave; Alphonsine, celle-ci dure pendant 50 ans. Il peint quatre compositions sur les murs ext&eacute;rieurs du restaurant,&nbsp;<em>Les quatre &acirc;ges de la vie</em>, fresques restaur&eacute;es &agrave; ce jour. Beaucoup d&#39;artistes s&#39;amusent &agrave; d&eacute;corer les portes, les murs du porche ou de la terrasse et y &eacute;crivent des vers.</p>\r\n\r\n<p>&lt;1&gt;</p>\r\n\r\n<p>A l&#39;angle du balcon de la maison Fournaise o&ugrave; a &eacute;t&eacute; peint le tableau &quot;D&eacute;jeuner des canotiers&quot; de Pierre Auguste Renoir, est forg&eacute; le chiffre qui repr&eacute;sente l&rsquo;entrelacement des initiales d&rsquo;Alphonse Fournaise de m&ecirc;me que sur les portes du restaurant.</p>\r\n\r\n<p><strong>Guy de Maupassant (1850-1893)</strong> est un passionn&eacute; de canotage &agrave; Chatou et <strong>entre 1873 et 1890</strong>, il prend souvent pension chez Fournaise qu&#39;il appelle&nbsp;<em>le restaurant Grillon&nbsp;</em>&nbsp; dans son roman &laquo;&nbsp;La Femme de Paul&nbsp;&raquo;. <span style="background-color:whitesmoke">Il</span> immortalise l&rsquo;ambiance festive de la Maison Fournaise et le canotage dans plusieurs nouvelles publi&eacute;es en 1880 dans le recueil intitul&eacute; &laquo;&nbsp;La Maison Tellier&nbsp;&raquo;<span style="background-color:whitesmoke"> : </span>&laquo; La femme<span style="background-color:whitesmoke"> de Paul&nbsp;&raquo;, &laquo;&nbsp;</span>Mouche&nbsp;&raquo;, &laquo;&nbsp;Sur l&rsquo;eau&nbsp;&raquo;, &laquo;&nbsp;Yvette&nbsp;&raquo;...&raquo;. Il laisse un po&egrave;me &agrave; l&rsquo;int&eacute;rieur du restaurant Fournaise, illustr&eacute; par un chien dessin&eacute; par le Comte Lepic.</p>\r\n\r\n<p><strong>En 1900</strong>, <strong>Maurice de Vlaminck (1876-1958) et Andr&eacute; Derain (1880-1954), </strong>qui habitent Chatou, s&#39;installent dans une salle d&eacute;labr&eacute;e du Restaurant Levanneur, pass&eacute; de mode, pr&egrave;s de la Maison Fournaise. Ils deviennent les cr&eacute;ateurs de l&#39;Ecole de Chatou et du Fauvisme. Henri Matisse et Guillaume Apollinaire les fr&eacute;quentent.</p>\r\n\r\n<p><strong>Paul Poiret (1879-1944)</strong>, le grand couturier qui a lib&eacute;r&eacute; la femme du corset, les rencontre r&eacute;guli&egrave;rement. Il devient l&rsquo;un des piliers du Cercle Nautique de Chatou (C.N.C.) fond&eacute; <strong>en 1902, </strong>l&rsquo;un des plus grands clubs nautiques de la Seine, dont les monotypes seront amarr&eacute;s au bas de la Maison Fournaise. Tout en conservant son nom, le C.N.C. quittera le rivage de la Maison Fournaise pour Les Mureaux en 1929.</p>\r\n\r\n<p>Alphonse Fournaise disparu, Alphonsine ferme le restaurant <strong>vers 1906</strong> et s&#39;&eacute;teint <strong>en 1937</strong>, &acirc;g&eacute;e de 91 ans. Elle l&egrave;gue sa maison &agrave; des cousines qui tiennent un autre Restaurant Fournaise &agrave; Rueil-Malmaison. <strong>En 1953,</strong> la maison Fournaise est vendue &agrave; un particulier qui y cr&eacute;e treize logements pr&eacute;caires.</p>\r\n\r\n<p><strong>En 1979</strong>, la Ville de Chatou d&eacute;cide de proc&eacute;der &agrave; l&rsquo;acquisition la maison Fournaise qui menace ruine. Puis en 1982, elle obtient l&#39;inscription du restaurant Fournaise &agrave; l&#39;inventaire des Monuments Historiques. La maison est restaur&eacute;e par la Municipalit&eacute; avec des aides de l&rsquo;Etat, de la R&eacute;gion, du D&eacute;partement et le soutien de deux associations, les Amis de la Maison Fournaise et Friends of French Art.</p>\r\n\r\n<p><strong>En 1991,</strong> le restaurant dont les salles sont d&eacute;cor&eacute;es de peintures murales r&eacute;alis&eacute;es par de f&eacute;roces caricaturistes de l&rsquo;&eacute;poque, est inaugur&eacute;. Suit le Mus&eacute;e Fournaise <strong>en 1992</strong> puis <strong>en 1999</strong> l&rsquo;ouverture d&rsquo;une gare d&rsquo;eau qui abrite un restaurant et un atelier de restauration de bateaux (Sequana), enfin une r&eacute;habilitation du hameau Fournaise est r&eacute;alis&eacute;e <strong>en 2003</strong>. Aujourd&rsquo;hui encore, les projets se poursuivent pour mettre en valeur le site.</p>\r\n\r\n<p><img alt="" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAACxEAAAsRAX9kX5EAAAD+SURBVEhLYxgFAw4YoTRBoDvlkhqQioTwGJZfztG7BWXjBUxQmiD48+1jPpBqgGKYRQQB0Rb8/fpRB8pk+PfrBxeUSRAQbQEaIDpoybWAaEBzCzC8Ckst0HCGy///8zuSmYtXBsT+9+v7VqDUNbAEBPxnYuP4BqQxUhc2C+qBFCilkAMagBY0QtlgMDBBBErzyMmShVtAlpmLTxHKZfj77fOTP1/f34NywYCZm/8KCxf/RIJBhA2ALP377dMOmCXA+Om+WmRWBpYkAIgKIpCr/nz98BjKJQkM2nzwH0oTBERbAIpEKJMBmuaJAkRbAEohQApWmi4HiY2CoQAYGABQ7VEn93e8iAAAAABJRU5ErkJggg==" style="height:18px; width:18px" /><em>&Eacute;coutez l&#39;audio pour en savoir plus</em></p>\r\n\r\n<p>&lt;3&gt;</p>	9	4	137
25	<p>L&rsquo;ancien chemin des Cures, aujourd&rsquo;hui route de Maisons, traversait les terrains mara&icirc;chers de Chatou et Montesson et offrait aux voyageurs un paysage parfaitement bucolique.</p>\r\n\r\n<p>&lt;ba1&gt;</p>	27	21	24
34	<p><a href="https://fr.wikipedia.org/wiki/Henri_Bertin">Henri-L&eacute;onard-Jean-Baptiste Bertin</a>, ministre sous le Roi Louis XV et &agrave; nouveau sous Louis XVI, a acquis le domaine de Chatou et Montesson, cinquante-cinq hectares de terres et de bois, comprenant le parc et le &laquo;&nbsp;vieux&nbsp;&raquo; ch&acirc;teau qui est r&eacute;nov&eacute; avant <strong>1750</strong> par son ancien propri&eacute;taire Marc-Antoine Allard. De l&rsquo;ancien ch&acirc;teau, sont conserv&eacute;s - et visibles au num&eacute;ro 12 de la rue du docteur Rochefort-, le b&acirc;timent qui servait de communs de l&rsquo;ancien ch&acirc;teau ainsi que les &eacute;tables &agrave; colombage qui donnent sur la m&ecirc;me cour.</p>\r\n\r\n<p>Datant du <strong>XVIe si&egrave;cle</strong>, il est situ&eacute; dans la continuit&eacute; du baillage, &agrave; l&rsquo;emplacement du ch&acirc;teau construit par l&rsquo;architecte Chatelet en <strong>1857</strong> et auquel on acc&egrave;de apr&egrave;s avoir d&eacute;pass&eacute; la grille du parc.</p>\r\n\r\n<p>Le <em>ch&acirc;teau Vieux</em>, telle est son appellation &agrave; l&rsquo;&eacute;poque, et les communs sont r&eacute;utilis&eacute;s par Bertin pour son personnel nombreux. Les lions devant la fa&ccedil;ade du baillage&nbsp;proviennent du portail &agrave; grillage de l&rsquo;entr&eacute;e du domaine du ch&acirc;teau de Bertin.</p>\r\n\r\n<p>&lt;1&gt;</p>\r\n\r\n<p>Bertin se fait b&acirc;tir une r&eacute;sidence digne d&rsquo;un ministre d&rsquo;Etat et demande &agrave; la grande star de l&rsquo;&eacute;poque, <span style="color:blue"><u><a href="https://fr.wikipedia.org/wiki/Jacques-Germain_Soufflot" style="color:blue; text-decoration:underline">Jacques-Germain Soufflot</a></u></span>, qui a r&eacute;alis&eacute; le Nymph&eacute;e, d&rsquo;&eacute;difier son nouveau logis. Soufflot meurt en 1780 et le nouveau ch&acirc;teau est achev&eacute; par son assistant, <span style="color:blue"><u><a href="https://fr.wikipedia.org/wiki/Jean-Jacques_Lequeu" style="color:blue; text-decoration:underline">Jean-Jacques Lequeu</a></u></span>.</p>\r\n\r\n<p>Bertin ferme la grande rue au-del&agrave; du baillage, repousse beaucoup plus &agrave; l&rsquo;ouest les chemins de Carri&egrave;res et de Montesson -remplac&eacute;s par la nouvelle rue de Carri&egrave;res, l&rsquo;actuel boulevard de la R&eacute;publique- supprime la grande avenue faisant face au ch&acirc;teau, ainsi que les places publiques et fait b&acirc;tir le &laquo;&nbsp;ch&acirc;teau neuf&nbsp;&raquo; sur le sommet de la falaise. La fa&ccedil;ade principale donne sur Chatou, et au levant, la vue domine la Seine, les &Icirc;les, la plaine de Nanterre et les cr&ecirc;tes bois&eacute;es du Mont Val&eacute;rien.</p>\r\n\r\n<p>Le ch&acirc;teau de Bertin est vaste&nbsp;: on compte environ cinquante pi&egrave;ces, dont trente-deux chambres, pour une r&eacute;sidence qui a la vocation d&rsquo;accueillir d&rsquo;illustres h&ocirc;tes.</p>\r\n\r\n<p>Le parc compte un grand nombre de statues et d&eacute;corations, dont six en provenance du ch&acirc;teau de Versailles -donations du Roi Louis XV-, des chinoiseries et un nymph&eacute;e, construit par Soufflot, qui re&ccedil;oit l&rsquo;eau des &eacute;tangs du domaine seigneurial.</p>\r\n\r\n<p>Bertin, grand estimateur de Chine, dont il conserve dans son h&ocirc;tel particulier de Paris une vaste collection d&rsquo;objets, opte pour un jardin &agrave; la chinoise agr&eacute;ment&eacute; d&rsquo;un pavillon chinois et d&rsquo;un jeu de bague. Le pavillon et les ornements du jardin sont confi&eacute;s par Soufflot &agrave; Lequeu, grand sp&eacute;cialiste en la mati&egrave;re.</p>\r\n\r\n<p>&lt;2&gt;</p>\r\n\r\n<p><span style="background-color:white">Bertin demeure dans son ch&acirc;teau jusqu&rsquo;au d&eacute;but de la R&eacute;volution fran&ccedil;aise, puis en <strong>1791</strong> vend la seigneurie &agrave; Anne-Th&eacute;r&egrave;se de Pelser-Berensberg -&eacute;pouse du marquis de Feuqui&egrave;res- et se retira &agrave; Spa en Belgique, o&ugrave; il meurt le 16 septembre <strong>1792</strong>. </span></p>\r\n\r\n<p><span style="background-color:white">Les nouveaux seigneurs de Chatou, ainsi que d&rsquo;autres familles aristocrates qui sont install&eacute;es &agrave; Chatou et les villages avoisinants, sont victimes de la Terreur. Apr&egrave;s la R&eacute;volution le ch&acirc;teau est acquis par le maire de Chatou, Charles-Alexis Travault et puis en <strong>1824</strong> par Antoine Lacroix, lui-m&ecirc;me maire de Chatou <strong>de</strong> <strong>1829 &agrave; 1832</strong>. Ce sont les h&eacute;ritiers de celui-ci et leur descendants, la famille Moisant, qui &agrave; partir de <strong>1867</strong> commencent &agrave; d&eacute;manteler le domaine de M. Bertin. La villa est d&eacute;truite en <strong>1910</strong> et l&rsquo;&oelig;uvre de lotissement fut compl&eacute;t&eacute;e entre les deux guerres.</span></p>\r\n\r\n<p>&nbsp;</p>	36	31	39
38	<p>Avec l&rsquo;implantation des usines Path&eacute; <strong>en 1898</strong> par les fr&egrave;res Charles et Emile Path&eacute;, Chatou ajouta &agrave; son statut de ville r&eacute;sidentielle celui de p&ocirc;le industriel de premier plan, la commune devenant le berceau de l&#39;industrie phonographique fran&ccedil;aise. On produisait alors sur le site cylindres et phonographes.</p>\r\n\r\n<p>&lt;1&gt;</p>\r\n\r\n<p>&lt;2&gt;</p>\r\n\r\n<p><strong>En 1906</strong>,&nbsp; les usines commenc&egrave;rent la production de disques, lesquels se substitu&egrave;rent compl&egrave;tement aux cylindres en 1927.</p>\r\n\r\n<p>En 1919, les fr&egrave;res Path&eacute; s&eacute;par&egrave;rent leur activit&eacute; et le site de Chatou fut d&eacute;sormais le lieu de production de la nouvelle &quot;Compagnie des Machines Parlantes&quot; d&#39;&Eacute;mile Path&eacute;. La production nouvelle des appareils radio &agrave; partir de 1923 porta le chiffre d&#39;affaires de l&#39;entre-deux-guerres.</p>\r\n\r\n<p><strong>En 1929</strong>, pour faire face &agrave; l&rsquo;expansion de la production du groupe, dont la branche phonographique venait d&rsquo;&ecirc;tre rachet&eacute;e par la soci&eacute;t&eacute; Columbia britannique &eacute;galement propri&eacute;taire de His Master&#39;s Voice, la Compagnie obtint le permis de construire d&rsquo;une nouvelle usine, dont la r&eacute;alisation en style Art d&eacute;co fut confi&eacute;e au cabinet d&rsquo;architectes londonien Wallis, Gilbert &amp; Partners <strong>de 1929 &agrave; 1931, entr&eacute; depuis dans la post&eacute;rit&eacute; pour ses b&acirc;timents industriels Art Deco</strong>.</p>\r\n\r\n<p>&lt;3&gt;</p>\r\n\r\n<p><strong>En 1936</strong>, le consortium franco-britannique des marques Columbia,&nbsp; La Voix de Son Ma&icirc;tre et Path&eacute; fut r&eacute;uni sous le nom des Industries Musicales et &Eacute;lectriques Path&eacute;-Marconi.</p>\r\n\r\n<p>La production du site, entam&eacute;e par la Grande Guerre puis la crise de 1929, fut port&eacute;e dans l&#39;entre-deux-guerres par celle des appareils de TSF dont Emile Path&eacute; avait fait un axe de d&eacute;veloppement &agrave; partir de 1923.</p>\r\n\r\n<p>Apr&egrave;s-guerre, la production s&#39;accrut et le catalogue de disques&nbsp; Path&eacute;-Marconi fut enrichi par la production des labels Cetrasoria, Path&eacute;-Vox, Capitol et Metro-Goldwyn-Mayer.</p>\r\n\r\n<p>Au milieu des ann&eacute;es cinquante, Path&eacute;-Marconi put se vanter de proposer&nbsp; &quot;le r&eacute;pertoire le plus prestigieux du monde&quot; dont le pr&eacute;sident embl&eacute;matique de 1949 &agrave; 1959, Pierre Bourgeois, assura avec ferveur la promotion.</p>\r\n\r\n<p>Parmi les artistes produits, mentionnons Edith Piaf, Franck Sinatra, Charles Trenet, Yves Montand, Tino Rossi, Maurice Chevalier, Jos&eacute;phine Baker, Luis Mariano, Annie Cordy, les Compagnons de la Chanson, Gilbert B&eacute;caud, Bourvil, Yvette Horner, Georges Gu&eacute;tary, Nat King Cole, Line Renaud, Jean Sablon, les Beatles, Charles Aznavour, Maria Callas, Enrico Caruso, Arturo Toscanini, Arthur Rubinstein, Herbert Von Karajan, Otto Klemperer, les orchestres de Ray Ventura, Jacques Helian, Aim&eacute; Barelli,&nbsp; Benny Goldmann, Cab Calloway, Duke Ellington, Count Basie, Artie Shaw, Louis Armstrong, Ray Anthony ...La liste semble in&eacute;puisable.</p>\r\n\r\n<p>Dans les ann&eacute;es cinquante le groupe Path&eacute;-Marconi employait pr&egrave;s de 3000 ouvriers sur son site de Chatou de 40.000 m2, celui-ci restant actif <strong>jusqu&rsquo;en 1992</strong>, employant de nombreuses familles de Chatou et des environs.</p>\r\n\r\n<p>Dans l&#39;usine Path&eacute;-Marconi fut fabriqu&eacute; en 1951 le premier disque microsillon en Europe continentale.</p>\r\n\r\n<p>De <strong>1946 &agrave; 1959</strong>, le site produisit en s&eacute;rie les premiers appareils de t&eacute;l&eacute;vision &quot;La Voix de Son Ma&icirc;tre.&quot;</p>\r\n\r\n<p><strong>Mais en 1990</strong>, &agrave; la suite de la crise &eacute;conomique, d&rsquo;une concurrence devenue mondiale et de diff&eacute;rents choix strat&eacute;giques contestables, la soci&eacute;t&eacute; EMI propri&eacute;taire de l&#39;usine d&eacute;localisa la production de ses disques en Allemagne puis en Hollande.</p>\r\n\r\n<p>L&rsquo;usine Art d&eacute;co de Chatou, dernier b&acirc;timent survivant de cette grande &eacute;poque, ferma d&eacute;finitivement ses portes en <strong>1992</strong> pour &ecirc;tre ras&eacute;e en <strong>2004</strong>&hellip; au b&eacute;n&eacute;fice d&#39;une Zone d&#39;Am&eacute;nagement Concert&eacute;e de la municipalit&eacute; pr&eacute;voyant sa destruction.</p>\r\n\r\n<p>Celle-ci eut lieu malgr&eacute; l&#39;alerte lanc&eacute;e par une association de Chatou, Chatou Notre Ville,&nbsp; qui recueillit de nombreuses p&eacute;titions y compris d&#39;artistes, d&#39;&eacute;lus r&eacute;gionaux ou de l&#39;Assembl&eacute;e Nationale et la proposition de Path&eacute;, branche cin&eacute;ma s&eacute;par&eacute;e de l&#39;industrie phonographique depuis 1919, d&#39;apporter ses collections &agrave; la cr&eacute;ation d&#39;un lieu de m&eacute;moire dans l&#39;usine.</p>\r\n\r\n<p>Le choc provoqu&eacute; par l&#39;annonce de la d&eacute;molition suscita des articles de presse dans Le Monde, Le Figaro, Le Moniteur des Travaux Publics ainsi qu&#39;un&nbsp; reportage de Claire Chazal sur TF1. Cette affaire a ouvert une plaie qui n&#39;est pas encore aujourd&#39;hui referm&eacute;e.</p>\r\n\r\n<p>Si Path&eacute; fut l&#39;activit&eacute; la plus connue de Chatou, il faut &eacute;galement&nbsp; noter l&#39;installation <strong>entre 1921 et 1929</strong> du constructeur d&rsquo;automobiles sportives George Irat lequel produisit un millier de voitures au 37 boulevard de la R&eacute;publique &agrave; l&#39;emplacement de l&#39;actuel site Thales.</p>\r\n\r\n<p>Seuls Chatou et Poissy peuvent s&#39;enorgueillir d&#39;avoir un pass&eacute; automobile dans le d&eacute;partement des Yvelines.</p>\r\n\r\n<p><img alt="" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAACxEAAAsRAX9kX5EAAAD+SURBVEhLYxgFAw4YoTRBoDvlkhqQioTwGJZfztG7BWXjBUxQmiD48+1jPpBqgGKYRQQB0Rb8/fpRB8pk+PfrBxeUSRAQbQEaIDpoybWAaEBzCzC8Ckst0HCGy///8zuSmYtXBsT+9+v7VqDUNbAEBPxnYuP4BqQxUhc2C+qBFCilkAMagBY0QtlgMDBBBErzyMmShVtAlpmLTxHKZfj77fOTP1/f34NywYCZm/8KCxf/RIJBhA2ALP377dMOmCXA+Om+WmRWBpYkAIgKIpCr/nz98BjKJQkM2nzwH0oTBERbAIpEKJMBmuaJAkRbAEohQApWmi4HiY2CoQAYGABQ7VEn93e8iAAAAABJRU5ErkJggg==" style="height:18px; width:18px" /><em>&Eacute;coutez l&#39;audio pour en savoir plus</em></p>\r\n\r\n<p>&nbsp;</p>	40	35	52
39	<p><span style="color:black">L&rsquo;H&ocirc;tel de Ville de Chatou </span>fut<span style="color:black"> construit </span><strong>en<span style="color:black"> 1730</span></strong> &agrave;<span style="color:black"> l&rsquo;emplacement d&rsquo;une maison de campagne <span style="background-color:white">qui, apr&egrave;s avoir appartenu &agrave; l&rsquo;ancien valet de chambre de Maria de M&eacute;dicis, Jean Berger, </span></span><span style="background-color:white">devint <span style="color:black">la propri&eacute;t&eacute; de </span>s<span style="color:black">a fille, Marie, femme de Jean Dubuisson, conseiller et secr&eacute;taire du Roi.</span></span></p>\r\n\r\n<p><span style="color:black">La maison conn</span>u<span style="color:black">t plusieurs propri&eacute;taires dont </span><strong>de<span style="color:black"> 1</span>769 &agrave; 1772</strong><span style="background-color:whitesmoke"><span style="color:black"> le </span></span><span style="color:black">c&eacute;l&egrave;bre danseur franco-italien Ga&euml;tan Vestris (1729-1808), danseur seul de l&rsquo;Op&eacute;ra</span> dont il fut le ma&icirc;tre de ballet de 1770 &agrave; 1775.</p>\r\n\r\n<p><strong><span style="color:black">En 1829</span></strong><span style="color:black">, elle </span>fut<span style="color:black"> acquise par Camille P&eacute;rier (1781-1844), polytechnicien</span>, <span style="color:black">pr&eacute;fet de Corr&egrave;ze et de la Meuse sous l&#39;Empire</span>. Embrassant une carri&egrave;re politique, il fut <span style="color:black">d&eacute;put&eacute; </span>de la Sarthe puis de la Corr&egrave;ze<span style="color:black">, pair de France &agrave; partir de 1837</span> <span style="color:black">et&nbsp; maire de Chatou entre 1832 </span>&agrave; sa mort en <span style="color:black">1844. Camille P&eacute;rier </span>&eacute;tait <span style="color:black">le fr&egrave;re de Casimir-Pierre P&eacute;rier, pr&eacute;sident du Conseil sous la monarchie de Juillet</span> emport&eacute; par le chol&eacute;ra en 1832.</p>\r\n\r\n<p><strong><span style="color:black">En 1878</span></strong><span style="color:black">, en plein </span>essor de la vill&eacute;giature, le nouveau maire Ernest Bousson organisa une soci&eacute;t&eacute; civile de 17 bienfaiteurs pour acheter la propri&eacute;t&eacute; et en faire l&#39;H&ocirc;tel de Ville. Apr&egrave;s deux ans de travaux r&eacute;alis&eacute;s par l&#39;architecte catovien Eug&egrave;ne Bardon (1843-1901), l&#39;H&ocirc;tel de Ville de Chatou dev&icirc;nt l&#39;un des plus beaux b&acirc;timents de la ville.</p>\r\n\r\n<p>Son environnement loti par les Dix-Sept bienfaiteurs permit d&#39;&eacute;riger un quartier d&#39;h&ocirc;tels particuliers et de villas embl&eacute;matiques du patrimoine de la ville.*</p>\r\n\r\n<p>En <strong>1964</strong>, le d&eacute;cor de fa&ccedil;ade de l&#39;H&ocirc;tel de Ville - tr&egrave;s ab&icirc;m&eacute; - fut supprim&eacute; par l&#39;architecte de la &quot;R&eacute;novation&quot; et un ravalement peu qualitatif r&eacute;alis&eacute;.</p>\r\n\r\n<p><span style="color:black">Dans une volont&eacute; de mise en coh&eacute;rence des &eacute;l&eacute;ments patrimoniaux de Chatou, la Ville souhaite</span> aujourd&#39;hui <a href="https://www.chatou.fr/Grands-Projets/Rehabilitation-et-restauration-du-patrimoine-Catovien">r&eacute;habiliter l&#39;H&ocirc;tel de Ville</a> <span style="color:black">afin qu&rsquo;il retrouve sa splendeur <strong>de 1880</strong></span>.</p>\r\n\r\n<p>&lt;1&gt;</p>\r\n\r\n<p><span style="color:black">C&rsquo;est d&rsquo;autant plus important que ce b&acirc;timent va prendre de plus en plus d&rsquo;envergure dans la vie des Catoviens.&nbsp;</span></p>\r\n\r\n<p><span style="color:black">En effet, depuis le d&eacute;m&eacute;nagement des services municipaux le 4 novembre <strong>2019</strong></span> dans un centre administratif adapt&eacute; aux besoins du public et des agents rue des Beaunes<span style="color:black">, le devenir de l&rsquo;H&ocirc;tel de Ville va </span>&ecirc;tre repens&eacute;.</p>\r\n\r\n<p><span style="background-color:white"><em>*<span style="color:black">Au num&eacute;ro 7 de la Place G&eacute;n&eacute;ral de Gaulle vivait jadis la famille de Louis-Charlemagne Derain, cr&eacute;mier-glacier au num&eacute;ro 87 de la rue de Saint-Germain (aujourd&rsquo;hui avenue Foch). Le fils Andr&eacute;, qui naquit &agrave; Chatou m&ecirc;me, devint avec son ami Maurice de Vlaminck, l&rsquo;inventeur du fauvisme.</span></em></span></p>\r\n\r\n<p><img alt="" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAACxEAAAsRAX9kX5EAAAD+SURBVEhLYxgFAw4YoTRBoDvlkhqQioTwGJZfztG7BWXjBUxQmiD48+1jPpBqgGKYRQQB0Rb8/fpRB8pk+PfrBxeUSRAQbQEaIDpoybWAaEBzCzC8Ckst0HCGy///8zuSmYtXBsT+9+v7VqDUNbAEBPxnYuP4BqQxUhc2C+qBFCilkAMagBY0QtlgMDBBBErzyMmShVtAlpmLTxHKZfj77fOTP1/f34NywYCZm/8KCxf/RIJBhA2ALP377dMOmCXA+Om+WmRWBpYkAIgKIpCr/nz98BjKJQkM2nzwH0oTBERbAIpEKJMBmuaJAkRbAEohQApWmi4HiY2CoQAYGABQ7VEn93e8iAAAAABJRU5ErkJggg==" style="height:18px; width:18px" /><em>&Eacute;coutez l&#39;audio pour en savoir plus</em></p>\r\n\r\n<p>&nbsp;</p>	41	36	54
40	<p>La place Berteaux ainsi que la zone sur laquelle appara&icirc;t plus tard la gare de Chatou, est essentiellement des terrains agricoles ou des parcs de r&eacute;sidences d&rsquo;aristocrates ou bourgeois qui ont b&acirc;ti leurs r&eacute;sidences tout au long du <strong>XVIII<span style="background-color:white">e</span> </strong>et au d&eacute;but du <strong>XIX<span style="background-color:white">e</span> </strong>si&egrave;cle. L&rsquo;arriv&eacute;e du chemin de fer dans les ann&eacute;es <strong>1830</strong> bouleverse le paysage&nbsp;: les propri&eacute;t&eacute;s sont morcel&eacute;es et vendues.</p>\r\n\r\n<p>De nouvelles voiries apparaissent, dont l&rsquo;avenue Aligre qui prend le nom du marquis d&rsquo;Aligre - l&rsquo;une des plus grandes fortunes de France - qui c&egrave;de l&#39;avenue &agrave; titre gratuit &agrave; la Ville. Peu &agrave; peu le centre d&rsquo;activit&eacute; de la Ville se transfert vers la nouvelle place.</p>\r\n\r\n<p>Des maisons sont b&acirc;ties aux alentours de la gare. Elev&eacute;es sur 2 &eacute;tages elles allient souvent briques et pierres sous une toiture &agrave; la Mansart. Balcons, auvents, avanc&eacute;es et grilles en fer forg&eacute; conf&egrave;rent un air champ&ecirc;tre &agrave; ces maisons. De nouvelles rues sont perc&eacute;es comme les avenues d&rsquo;Aligre, du G&eacute;n&eacute;ral Sarrail et des Vaucelles (actuelle avenue Paul Doumer)&hellip;</p>\r\n\r\n<p>Si les parisiens ont contribu&eacute; aux pr&eacute;misses du d&eacute;veloppement de ce quartier, c&rsquo;est la municipalit&eacute; qui poursuit cette dynamique. Elle commence par acc&eacute;der &agrave; la demande des catoviens en installant un march&eacute;, <strong>en 1860</strong>. Le march&eacute; est ouvert au d&eacute;but sur la route de Saint-Germain, devant l&rsquo;&Eacute;glise, mais celui-ci d&eacute;range la circulation sur cette voie importante. Il est ensuite d&eacute;plac&eacute; sur l&rsquo;avenue d&rsquo;Aligre, mais face &agrave; des plaintes pour des mauvaises odeurs de la part d&rsquo;habitants, le march&eacute; est d&eacute;plac&eacute; sur la place Berteaux o&ugrave; il se trouve encore aujourd&rsquo;hui.</p>\r\n\r\n<p>&lt;1&gt;</p>\r\n\r\n<p>L&rsquo;avenue d&rsquo;Aligre est alors interdite &agrave; la circulation. Un square et un kiosque permettent de se rafra&icirc;chir et de louer des chaises.</p>\r\n\r\n<p>Sous l&rsquo;impulsion de l&rsquo;homme politique Maurice Berteaux qui finance <span style="background-color:white">avec d&rsquo;autres actionnaires pro&eacute;minents de la Ville</span>, une salle des f&ecirc;tes voit &eacute;galement le jour <strong>en 1894</strong> (elle dispara&icirc;tra <strong>en 1973</strong>). Celle-ci<span style="background-color:white"> donne d&rsquo;un cot&eacute; sur la place du march&eacute; &agrave; l&rsquo;angle de la rue du G&eacute;n&eacute;ral Colin</span>, <span style="background-color:white">correspondant &agrave; peu pr&egrave;s avec la place occup&eacute;e par le cin&eacute;ma Jouvet aujourd&rsquo;hui. </span>Elle servait aux banquets, aux rencontres sportives, aux spectacles, aux remises de m&eacute;dailles&hellip;</p>\r\n\r\n<p>&lt;2&gt;</p>\r\n\r\n<p><span style="background-color:white">La place Berteaux doit son nom &agrave; Maurice Berteaux, n&eacute; <strong>en 1852</strong> &agrave; Saint-Maur-des-Foss&eacute;s, agent de change et maire de Chatou de 1891 &agrave; 1911, d&eacute;put&eacute; depuis 1893 et ministre de guerre entre 1904 et 1905 et &agrave; nouveau en 1911. Mari&eacute; &agrave; la fille de l&rsquo;ancien maire Charles-Joseph Lambert, il s&rsquo;est install&eacute; &agrave; Chatou <strong>en 1891</strong> et habite dans une villa, de l&rsquo;actuelle rue Labelonye, aujourd&rsquo;hui disparue. Berteaux, tr&egrave;s populaire chez les catoviens, succombe dans un accident d&rsquo;avions lors de la manifestation du d&eacute;part le <strong>21 mai 1911</strong> de la course a&eacute;ronautique Paris-Madrid. Un des concurrents en difficult&eacute; doit revenir vers le champ d&rsquo;avion alors que le cort&egrave;ge des autorit&eacute;s, comprenant le Pr&eacute;sident du Conseil Monis et le Ministre de Guerre Berteaux, le traverse. Le pilote n&rsquo;a pas pu &eacute;viter le groupe de personnalit&eacute;s et trois d&rsquo;entre elles, dont Berteaux, p&eacute;rirent dans l&rsquo;accident. Le gouvernement proclame des fun&eacute;railles nationales en son honneur : un cort&egrave;ge accompagne la d&eacute;pouille de Berteaux depuis le Minist&egrave;re de Guerre jusqu&rsquo;&agrave; la gare de la Porte Dauphine o&ugrave; elle est embarqu&eacute;e sur un train pour Chatou. &Agrave; Chatou un autre cort&egrave;ge accompagne le cercueil jusqu&rsquo;&agrave; la mairie drap&eacute;e en noir pour l&rsquo;occasion. Apr&egrave;s la c&eacute;r&eacute;monie, il est inhum&eacute; dans le cimeti&egrave;re de Chatou. <strong>En 1922,</strong> un monument est install&eacute; en face de la salle de f&ecirc;te&nbsp;: il y reste <strong>jusqu&rsquo;en 1939</strong> lorsque la statue en bronze de Berteaux est arrach&eacute;e sous Vichy pour en r&eacute;utiliser le m&eacute;tal. &Agrave; sa place, un buste est &eacute;rig&eacute; apr&egrave;s la deuxi&egrave;me guerre mondiale qui y est toujours.</span></p>\r\n\r\n<p>&lt;3&gt;</p>\r\n\r\n<p>&lt;4&gt;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>	42	37	139
47	<p>Aboutissement des &eacute;tudes cons&eacute;cutives aux inondations de 1910, le premier barrage de Chatou fut c<span style="color:black">onstruit en <strong>1927</strong> et </span>inaugur&eacute;<span style="color:black"> en <strong>193</strong></span><strong>2 </strong>en remplacement&nbsp; du vieux barrage de Bezons construit sous Louis-Philippe.</p>\r\n\r\n<p>Sa<span style="color:black"> mission &eacute;tai</span>t notamment <span style="color:black">de maintenir le niveau d&rsquo;eau constant jusqu&rsquo;</span>au barrage de <span style="color:black">Suresnes pour la navigation fluviale. </span></p>\r\n\r\n<p>&lt;1&gt;</p>\r\n\r\n<p>80 ans plus tard, le<span style="color:black"> vieillissement du b&eacute;ton, l&rsquo;&eacute;rosion des fonds et l&rsquo;usure des pi&egrave;ces m&eacute;caniques </span>conduisirent <span style="color:black">Voies navigables de France (VNF) </span>&agrave;&nbsp; le remplacer.</p>\r\n\r\n<p><span style="color:black">Dessin&eacute; par l&rsquo;architecte <strong>Luc Weizmann</strong>,</span> le nouveau barrage fut mis en service<span style="color:black"> en <strong>2014</strong>. Cofinanc&eacute; par l&rsquo;&Eacute;tat, VNF, le Conseil r&eacute;gional d&rsquo;&Icirc;le-de-France, l&rsquo;agence de l&rsquo;eau Seine-Normandie et l&rsquo;Union europ&eacute;enne,</span> il a &eacute;t&eacute; <span style="color:black">&eacute;quip&eacute; d&rsquo;un syst&egrave;me de vannes clapets, permettant un ouvrage plus discret,<strong> </strong>plus esth&eacute;tique et mieux int&eacute;gr&eacute; dans l&rsquo;environnement, et d&rsquo;une passe &agrave; poissons </span>afin de<span style="color:black"> participer au r&eacute;tablissement de la continuit&eacute; &eacute;cologique.</span></p>\r\n\r\n<p>&nbsp;</p>	48	39	133
27	<p>L&rsquo;ancien pavillon de la Faisanderie, construit en 1783 pour le comte d&rsquo;Artois, donnait sur la route de Chatou &agrave; Carri&egrave;res Saint Denis, ancien nom du boulevard de la R&eacute;publique. Mais la vue sur l&rsquo;avenue devant le ch&acirc;teau n&rsquo;&eacute;tait pas du go&ucirc;t de son propri&eacute;taire, M. Ruinard de Brimont, ancien consul de France en Russie&nbsp;: la route&nbsp;&eacute;tait en mauvaise &eacute;tat et des pierres de carri&egrave;res &eacute;taient entrepos&eacute;es sur l&rsquo;un des c&ocirc;t&eacute;s. En 1846 Brimont obtint le permis de la mairie de r&eacute;am&eacute;nager &agrave; ses frais l&rsquo;avenue (entre temps devenue route de Flandre) et de l&rsquo;agr&eacute;menter avec des arbres et des bancs.</p>\r\n\r\n<p>&lt;ba1&gt;</p>\r\n\r\n<p>&nbsp;</p>	29	23	26
6	<p><em>Parcourons bri&egrave;vement l&rsquo;histoire de Chatou, ville fluviale, marqu&eacute;e par sa position strat&eacute;gique aux portes de Paris et sur le chemin vers la ville royale de Saint-Germain-en-Laye. Travers&eacute;e par les gaulois, romains, francs et vikings, d&eacute;truite plusieurs fois par les arm&eacute;es de passage, Chatou connais son &eacute;panouissement &agrave; partir du XIXe si&egrave;cle quand elle mue en ville-vill&eacute;giature, puis industrielle et artistique. </em></p>	8	\N	3
8	<p>L&rsquo;ancienne gare de Chatou-Croissy, &eacute;rig&eacute;e en 1867, avait le charme typique des gares de province. La nouvelle, celle que nous voyons encore aujourd&rsquo;hui, fut construite en 1974 lors de la transformation de la ligne de chemin de fer Paris - Saint-Germain en RER A.</p>\r\n\r\n<p>&lt;ba1&gt;</p>\r\n\r\n<p>De l&rsquo;autre c&ocirc;t&eacute; de la gare, vers Croissy, on retrouve un paysage urbain presqu&rsquo;inchang&eacute;.</p>\r\n\r\n<p>&lt;ba2&gt;</p>\r\n\r\n<p>&nbsp;</p>	10	5	8
18	<p>Nous voici dans l&rsquo;ancien domaine de la seigneurie de Chatou, dont le ministre d&rsquo;&Eacute;tat Henri-L&eacute;onard Jean-Baptiste Bertin fut l&rsquo;un des derniers propri&eacute;taires&nbsp;: il r&eacute;am&eacute;nagea les jardins et potagers et, bien s&ucirc;r, construit une demeure digne d&rsquo;un ministre du roi (il le fut sous Louis XV et encore sous Louis XVI). En 1824, l&rsquo;ancien domaine de Bertin, qui comprenait aussi la parcelle de la Pi&egrave;ce d&rsquo;Eau, est acquis par Antoine Lacroix, futur maire de Chatou (1829-1832). L&rsquo;ancien ch&acirc;teau, le <em>ch&acirc;teau vieux</em>, que Bertin avait destin&eacute; &agrave; son personnel, est ainsi remplac&eacute; en 1857 par une villa construite par l&rsquo;architecte Ch&acirc;telet&nbsp;: c&rsquo;est la premi&egrave;re villa &agrave; droite quand on acc&egrave;de au parc par l&rsquo;entr&eacute;e pi&eacute;tonni&egrave;re de la rue du Docteur Rochefort.</p>\r\n\r\n<p>Ce sont les h&eacute;ritiers des Lacroix, la famille Moisant et successeurs, qui ont, peu &agrave; peu, ali&eacute;n&eacute; l&rsquo;ancienne propri&eacute;t&eacute; de Bertin&nbsp;: le domaine de la Pi&egrave;ce d&rsquo;Eau est vendu en 1873 &agrave; Charles-Ernest Lambert qui le morc&egrave;le et fait construire des belles villas en style n&eacute;ogothique. En 1910, faute de maintenance, le ch&acirc;teau de Bertin est ras&eacute; pour diviser le domaine en lotissements (encore pr&eacute;sents aujourd&rsquo;hui) mis sur le march&eacute; de l&rsquo;immobilier dans les ann&eacute;es 1920.</p>\r\n\r\n<p>&lt;ba1&gt;</p>	20	14	17
13	<p>Le square R&eacute;alier-Dumas, juste &agrave; c&ocirc;t&eacute; de l&rsquo;embouchure du pont de Chatou, &eacute;tait jadis l&rsquo;emplacement de la villa de la famille de Pierre R&eacute;alier-Dumas, qui s&rsquo;y installa en 1870. R&eacute;alier-Dumas avait fait carri&egrave;re dans l&rsquo;administration publique et avait &eacute;t&eacute; d&eacute;cor&eacute; Chevalier de la L&eacute;gion d&rsquo;Honneur par Napol&eacute;on III en 1865. La villa, situ&eacute;e au num&eacute;ro 1 de la rue d&rsquo;Epr&eacute;mesnil, avait &eacute;t&eacute; h&eacute;rit&eacute;e par sa femme, Jeanne Th&eacute;r&egrave;se Goubie, fille de l&rsquo;agent de change parisien Joseph Goubie, qui l&rsquo;avait rachet&eacute;e en 1851. Si son nom de famille vous est familier, c&rsquo;est parce que Pierre R&eacute;alier-Dumas &eacute;tait le p&egrave;re du peintre et dessinateur d&rsquo;Art Nouveau Maurice R&eacute;alier-Dumas. N&eacute; en 1860, Maurice R&eacute;alier-Dumas fr&eacute;quentait les artistes impressionnistes en visite au restaurant Fournaise, et &eacute;tait l&rsquo;amant pr&eacute;sum&eacute; d&rsquo;Alphonsine Fournaise Papillon, dont il r&eacute;alisa un portrait. Sur les murs ext&eacute;rieurs du restaurant Fournaise, on peut encore voir une s&eacute;rie de fresques peintes par lui-m&ecirc;me et intitul&eacute;e &laquo;&nbsp;Les Quatre &Acirc;ges de la vie&nbsp;&raquo;. &Agrave; la mort du peintre en 1928, ce fut Alphonsine qui, nomm&eacute;e ex&eacute;cutrice testamentaire, d&eacute;cida de vendre la villa qui fut ensuite d&eacute;truite.</p>\r\n\r\n<p>&lt;ba1&gt;</p>\r\n\r\n<p>&nbsp;</p>	15	9	12
16	<p>La rue de la Paroisse, anciennement appel&eacute;e Grande rue, &eacute;tait jadis le centre de la Ville, ou plut&ocirc;t du village. Tout y &eacute;tait&nbsp;: l&rsquo;&Eacute;glise, la mairie, le presbyt&egrave;re, les magasins. Au XVIIIe si&egrave;cle, avant l&rsquo;arriv&eacute;e du train, Chatou n&rsquo;&eacute;tait qu&rsquo;un petit village, occupant un territoire d&eacute;limit&eacute; par la Seine, l&rsquo;H&ocirc;tel de Ville, le ch&acirc;teau de la seigneurie et la rue de Saint-Germain, avec une bonne centaine de propri&eacute;t&eacute;s. La construction du chemin de fer et l&rsquo;expansion de la Ville n&rsquo;&ocirc;t&egrave;rent cependant pas son charme et son activit&eacute; commerciale au centre historique de Chatou, qui les conserva jusqu&rsquo;&agrave; sa d&eacute;molition dans les ann&eacute;es 1960, lors de la construction du complexe r&eacute;sidentiel et du d&eacute;placement du pont de Chatou.</p>\r\n\r\n<p>&lt;ba1&gt;</p>\r\n\r\n<p>&nbsp;</p>	18	12	15
37	<p><span style="color:black">Le domaine de la Faisanderie fait partie des rares</span> vestiges de l&#39;Ancien R&eacute;gime de Chatou.</p>\r\n\r\n<p><strong><span style="color:black">En 1776,</span></strong><span style="color:black"> le comte d&rsquo;Artois re&ccedil;</span>u<span style="color:black">t en apanage la for&ecirc;t du V&eacute;sinet, propri&eacute;t&eacute; de la Couronne depuis Henri IV. </span>Il<span style="color:black"> y fit construire en 1783 un pavillon de chasse et deux d&eacute;pendances (pour le jardinier et le gardien) par Fran&ccedil;ois B&eacute;langer, son architecte des Menus Plaisirs,&nbsp; architecte de Bagatelle</span>.</p>\r\n\r\n<p><span style="color:black">La Faisanderie s&rsquo;&eacute;tendait alors </span>sur dix hectares. L<span style="color:black">a R&eacute;volution fran&ccedil;aise</span> six ans plus tard entra&icirc;na la vente <span style="color:black">aux ench&egrave;res d</span>u domaine <span style="color:black">comme bien national. Le comte d&#39;Art</span>ois se rendit-il jamais &agrave; Chatou. Il est probable que non.</p>\r\n\r\n<p><span style="color:black">Exploit&eacute; </span>en terre<span style="color:black"> agricole pendant des ann&eacute;es, </span>le domaine fu<span style="color:black">t adjug&eacute; <strong>en</strong> <strong>1843</strong> &agrave; Madame Ruinart de Brimont qui proc&eacute;da, avec son &eacute;poux (ancien consul de France en Russie et futur maire de Chatou), &agrave; un </span>lotissement<span style="color:black"> du domaine. </span></p>\r\n\r\n<p>C&#39;est ainsi que l&#39;avenue de Brimont fut ouverte en 1853 et demeura une voie priv&eacute;e pendant un si&egrave;cle.</p>\r\n\r\n<p><span style="color:black">Monsieur Husson acquit le pavillon de chasse <strong>en 1860</strong> qu&rsquo;il d&eacute;trui</span>sit<span style="color:black"> et </span>rempla&ccedil;a<span style="color:black"> par un nouveau b&acirc;timent -l<span style="background-color:white">e ch&acirc;teau de la Faisanderie- construit par l&#39;architecte Bourlier <strong>en 1862</strong>.</span>&nbsp;&nbsp; </span></p>\r\n\r\n<p>L<span style="color:black">es </span>deux<span style="color:black"> pavillons d</span>&#39;entr&eacute;e de 1783 furent quant &agrave; eux <span style="color:black">conserv&eacute;s </span>et <span style="color:black">inscrits &agrave; l&rsquo;inventaire suppl&eacute;mentaire</span> <span style="color:black">des monuments historiques </span><strong>en</strong><span style="color:black"> <strong>1977</strong></span>.</p>\r\n\r\n<p><img alt="" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAACxEAAAsRAX9kX5EAAAD+SURBVEhLYxgFAw4YoTRBoDvlkhqQioTwGJZfztG7BWXjBUxQmiD48+1jPpBqgGKYRQQB0Rb8/fpRB8pk+PfrBxeUSRAQbQEaIDpoybWAaEBzCzC8Ckst0HCGy///8zuSmYtXBsT+9+v7VqDUNbAEBPxnYuP4BqQxUhc2C+qBFCilkAMagBY0QtlgMDBBBErzyMmShVtAlpmLTxHKZfj77fOTP1/f34NywYCZm/8KCxf/RIJBhA2ALP377dMOmCXA+Om+WmRWBpYkAIgKIpCr/nz98BjKJQkM2nzwH0oTBERbAIpEKJMBmuaJAkRbAEohQApWmi4HiY2CoQAYGABQ7VEn93e8iAAAAABJRU5ErkJggg==" style="height:18px; width:18px" /><em>&Eacute;coutez l&#39;audio pour en savoir plus</em></p>\r\n\r\n<p>&nbsp;</p>	39	34	140
23	<p>Fran&ccedil;ois Laubeuf &eacute;tait un entrepreneur de travaux publics qui s&rsquo;&eacute;tablit en 1836 &agrave; Chatou au num&eacute;ro 15 de la rue Casimir Perrier et plus tard au num&eacute;ro 15 de l&rsquo;ancienne Rue Sous-Bois, aujourd&rsquo;hui Rue Fran&ccedil;ois Laubeuf. Sous le deuxi&egrave;me empire, il travailla pour les chemins de fer de l&rsquo;Ouest, ainsi qu&rsquo;&agrave; la construction de l&rsquo;asile imp&eacute;rial du V&eacute;sinet. Laubeuf fut aussi bri&egrave;vement maire de Chatou durant la guerre franco-prussienne&nbsp;: emprisonn&eacute; par les troupes prussiennes qui avaient d&eacute;couvert un d&eacute;p&ocirc;t d&rsquo;armes dans l&rsquo;&Eacute;glise, il fut &eacute;pargn&eacute; gr&acirc;ce &agrave; l&rsquo;intervention du cur&eacute; de Carri&egrave;res-sur-Seine. Apr&egrave;s la guerre il &oelig;uvra &agrave; la r&eacute;novation de l&rsquo;&Eacute;glise de Notre-Dame de Chatou.</p>\r\n\r\n<p>&lt;ba1&gt;</p>\r\n\r\n<p>Il semble que les claquements provenant des ateliers de Laubeuf aient marqu&eacute; Maurice Ravel qui empruntait souvent la Rue de Saint-Germain (aujourd&rsquo;hui boulevard Foch) pour se rendre au V&eacute;sinet.</p>\r\n\r\n<p>&laquo; <em>[L&rsquo;usine] est l&agrave; pour souligner le c&ocirc;t&eacute; m&eacute;canique de la construction de la musique faite des cha&icirc;nons des motifs alternativement en ton majeur et en ton mineur, inlassablement r&eacute;p&eacute;t&eacute;s et reli&eacute;s entre eux par toujours le m&ecirc;me motif d&#39;introduction. L&#39;usine qui nous a servi de type se trouve sur la route du V&eacute;sinet, quand on d&eacute;bouche du pont de Rueil. Ravel, quand nous passions par l&agrave; en voiture, la d&eacute;signait de son index dans un geste qui lui &eacute;tait familier et disait &laquo; L&#39;usine de &laquo; Bol&eacute;ro &raquo;, la plus espagnole et la plus arabe des usines du monde. &raquo; Ce c&ocirc;t&eacute; m&eacute;canique ainsi pressenti dans le d&eacute;cor s&#39;affirmera r&eacute;gler sur la musique m&ecirc;me dans la danse &agrave; mouvement de cha&icirc;ne indiqu&eacute;e dans le livret</em>. &raquo; (Le Bol&eacute;ro de Ravel est entr&eacute; &agrave; l&rsquo;Op&eacute;ra, Le Figaro, 12 janvier 1942.)</p>\r\n\r\n<p>&nbsp;</p>	25	19	22
42	<p>Pourquoi une faisanderie&nbsp;? Il fut un temps o&ugrave; ce quartier et tout le V&eacute;sinet avoisinant formaient un bois r&eacute;serv&eacute; &agrave; la chasse royale. Donc, pas de surprise, on y &eacute;levait effectivement des faisans pour le plaisir de ces illustres chasseurs, dont l&rsquo;un des plus fervents &eacute;tant le roi Henri IV. Le dernier membre de la famille royale, le comte d&rsquo;Artois, futur Charles X, qui en fut propri&eacute;taire, y fit &eacute;riger en 1783, par l&rsquo;architecte Berlanger, un beau pavillon de chasse. Apr&egrave;s la R&eacute;volution le domaine fut acquis par Antoine Ruinard de Brimont. En 1862, ses h&eacute;ritiers firent raser le pavillon pour construire le ch&acirc;teau qui garde encore dans son nom et dans les deux pavillons de l&rsquo;entr&eacute;e le souvenir du temps pass&eacute;.</p>\r\n\r\n<p>&lt;ba1&gt;</p>\r\n\r\n<p>&nbsp;</p>	30	24	27
43	<p>Connu pour ses fastes au XIX si&egrave;cle, gr&acirc;ce &agrave; la fr&eacute;quentation d&rsquo;artistes et &eacute;crivains d&eacute;j&agrave; affirm&eacute;s comme Renoir, Monet et Maupassant, suivis plus tard par les fauves Andr&eacute; Derain et Maurice de Vlaminck qui s&rsquo;y &eacute;taient install&eacute;s, Chatou a sa part d&rsquo;histoires passionnantes &agrave; raconter, avec de grands jours et de brusques retournements. Ce qui n&rsquo;&eacute;tait au d&eacute;part qu&rsquo;un petit village aux portes de Paris s&rsquo;est transform&eacute; peu &agrave; peu en une ville &agrave; part enti&egrave;re, satellite oui, mais avec son propre caract&egrave;re.</p>\r\n\r\n<p>Au Quaternaire, avant l&rsquo;arriv&eacute;e de l&rsquo;homme, le bassin parisien, dont fait partie la boucle de Seine, est m&eacute;connaissable&nbsp;: la mer occupe une partie de l&rsquo;&Icirc;le-de-France et le niveau de l&rsquo;eau du fleuve est sup&eacute;rieur d&rsquo;au moins 37m &agrave; celui d&rsquo;aujourd&rsquo;hui ! La faune qui habite la r&eacute;gion est surprenante&nbsp;: on a retrouv&eacute; des fossiles d&rsquo;&eacute;l&eacute;phants, de rhinoc&eacute;ros et d&rsquo;autres esp&egrave;ces exotiques presque toutes disparues.</p>\r\n\r\n<p>Des peuples ou tribus pr&eacute;celtiques s&rsquo;y installent&nbsp;: on a retrouv&eacute; dans la boucle de Seine des haches en silex (une pierre tr&egrave;s dure utilis&eacute;e pour fabriquer des armes et des outils) qui datent du n&eacute;olithique, probablement avant le IXe mill&eacute;naire av. J.-C. Les Celtes arrivent en France autour de 450 av. J.-C. et &eacute;tablissent des villages le long de la Seine&nbsp;: l&rsquo;eau poissonneuse et le gibier des for&ecirc;ts sont amplement suffisants pour leur subsistance. Cette civilisation va &ecirc;tre bouscul&eacute;e&nbsp;: entre 58 et 51 av. J.-C. Jules C&eacute;sar conquiert la Gaule (pour les Romains les celtes de France sont des &laquo;&nbsp;Gaulois&nbsp;&raquo;, nom qui d&eacute;rive des combats de coqs pour lesquels ils &eacute;taient connus). La Seine, anciennement appel&eacute;e &laquo; Sequana &raquo;, d&eacute;marque la province romaine de la Gaule de celle de la Belgique : c&rsquo;est &agrave; cette derni&egrave;re qu&rsquo;appartiennent donc les territoires sur la rive droite de la Seine, y compris Chatou. Sous la <em>pax romana</em>, la r&eacute;gion connait une longue p&eacute;riode de stabilit&eacute; et de prosp&eacute;rit&eacute;. C&rsquo;est de cette &eacute;poque, en particulier du nom d&rsquo;un riche poss&eacute;dant gallo-romain, Cattus, que selon certains auteurs, d&eacute;rive le nom de la ville de Chatou, qui s&rsquo;appelait &agrave; l&rsquo;&eacute;poque <em>Catullaco</em> ou <em>Captunacum</em>.</p>\r\n\r\n<p>Avec les grandes invasions du Ve si&egrave;cle, sous lesquelles s&rsquo;effondre l&rsquo;empire romain d&rsquo;occident, on voit d&eacute;filer dans la r&eacute;gion Wisigoths, Vandales, Huns et les tribus germaniques des Francs. Certains n&rsquo;envahissent que pour passer, d&rsquo;autres, comme les Francs, s&rsquo;installent en Gaule. C&rsquo;est sous ces derniers que na&icirc;t la dynastie des m&eacute;rovingiens, premiers rois de France, dont le royaume s&rsquo;&eacute;tend peu &agrave; peu sur tout le territoire fran&ccedil;ais.</p>\r\n\r\n<p>Les rois m&eacute;rovingiens, qui r&egrave;gnent du Ve au milieu du VIIIe si&egrave;cle, b&acirc;tissent &agrave; Chatou une villa &ndash; une demeure contourn&eacute;e d&rsquo;un ensemble de fermes agricoles et ateliers, situ&eacute;e probablement entre les lieux-dits le Chatelet et les Cures, pour profiter du gibier abondant de la for&ecirc;t du V&eacute;sinet et du vin produit dans le territoire catovien. Avec Rueil, Saint-Germain et Saint-Denis, Chatou est l&rsquo;un des centres privil&eacute;gi&eacute;s du roi Childebert (497-558) et de ses successeurs. Cette &eacute;poque de paix se termine avec l&rsquo;invasion et l&rsquo;occupation de la r&eacute;gion par les Vikings (les Normands) au milieu du IXe si&egrave;cle, vers 845-856 : lors des si&egrave;ges de Paris, Chatou et les villes limitrophes sont occup&eacute;s et ras&eacute;s, les populations d&eacute;cim&eacute;es ou enfuies.</p>\r\n\r\n<p>En 870, pour compenser les pertes que les Normands ont caus&eacute;es &agrave; l&rsquo;abbaye de Saint-Denis, Charles-le-Chauve c&egrave;de &agrave; celle-ci une partie importante du territoire de Chatou&nbsp;: l&rsquo;abbaye restera propri&eacute;taire de ces terrains pour neuf cents ans, jusqu&rsquo;&agrave; la R&eacute;volution&nbsp;! Au Xe si&egrave;cle Chatou fait partie du domaine des Montmorency - les premiers d&rsquo;une longue s&eacute;rie de familles seigneuriales - qui l&egrave;guent une partie du territoire et des droits sur le bac de la Seine &agrave; l&rsquo;abbaye des B&eacute;n&eacute;dictines de Malnoue en Brie (connue aussi sous le nom de Notre-Dame-des Bois). Au XIVe si&egrave;cle, la peste noire (1347-1352) et la guerre de cent ans (1337-1453) font des ravages&nbsp;: la Ville est brul&eacute;e en 1346 par les anglais et la population d&eacute;cim&eacute;e, au point qu&rsquo;elle ne comptera qu&rsquo;une trentaine d&rsquo;habitants en 1470. En 1374, Gilles Mallet, garde de la librairie de Charles V au Louvre et &eacute;cuyer du Roi, devient seigneur du domaine de Chatou jusqu&rsquo;&agrave; sa mort en 1410. C&rsquo;est gr&acirc;ce &agrave; sa donation qu&rsquo;on restaurera l&rsquo;&Eacute;glise de Notre-Dame vers la fin du si&egrave;cle. Au XVIe si&egrave;cle, Thomas Le Pileur, successeur des Mallet &agrave; la seigneurie de Chatou, fait construire une enceinte autour de l&rsquo;&eacute;glise et du ch&acirc;teau pour prot&eacute;ger la ville des incursions de troupes mercenaires. Il racheta aussi aux religieuses de Malnoue les droits sur le bac ainsi que des autres biens qu&rsquo;elles poss&egrave;dent &agrave; Chatou.</p>\r\n\r\n<p>De par sa position entre Paris et la r&eacute;sidence royale de Saint-Germain-en-Laye, Chatou est un point de passage privil&eacute;gi&eacute; du Roi et de sa cour.&nbsp;Au d&eacute;but du XVIIe si&egrave;cle, Henri IV, s&eacute;journe souvent dans son nouveau ch&acirc;teau de Saint-Germain achev&eacute; en 1599 et aime surtout chasser dans le bois du V&eacute;sinet qu&rsquo;il vient d&rsquo;acqu&eacute;rir peu avant, en 1595, &agrave; Albert de Gondi, comte de Retz. Mais la route de Saint-Germain n&rsquo;est pas des plus ais&eacute;es&nbsp;: le cort&egrave;ge royal doit choisir entre la route de Chatou, qui pr&eacute;voit un passage par batelier bien p&eacute;rilleux pour le cort&egrave;ge royal, et celle via Bougival qui non seulement &eacute;tait plus longue mais aussi souvent inond&eacute;e par la Seine. On d&eacute;cide donc de faire construire un pont &agrave; Chatou&nbsp;: c&rsquo;est la fille de Thomas le Pileur, Justine, qui obtient la concession et construit un pont en bois, dot&eacute; de boutiques et de deux moulins.</p>\r\n\r\n<p>D&rsquo;autres seigneurs se succ&egrave;dent &agrave; Chatou, tels que des membres de la famille des Portail, descendants de Justine Le Pileur et de Paul Portail, seigneur de Montesson, suivis au XVIIIe si&egrave;cle par Marc-Antoine Laurent d&rsquo;Allard, &eacute;cuyer du Roi, et finalement, par l&rsquo;inspecteur des finances Henri-L&eacute;onard-Jean-Baptiste Bertin, futur ministre sous Louis XV et Louis XVI.</p>\r\n\r\n<p>&lt;1&gt;</p>\r\n\r\n<p>Le nouveau seigneur, Henri-L&eacute;onard Jean-Baptiste Bertin, est un personnage important de la deuxi&egrave;me moiti&eacute; du XVIIIe si&egrave;cle : descendant d&rsquo;une famille bourgeoise du P&eacute;rigord qui s&rsquo;&eacute;tait hiss&eacute;e peu &agrave; peu dans la soci&eacute;t&eacute; fran&ccedil;aise et avait accumul&eacute; des richesses importantes, il aura une carri&egrave;re notable dans le gouvernement royal &eacute;tant aussi nomm&eacute; ministre &agrave; deux reprises. Il a des int&eacute;r&ecirc;ts tr&egrave;s divers, allant de l&rsquo;&eacute;tude de l&rsquo;histoire &agrave; l&rsquo;agriculture, pour laquelle il cultive une vraie passion. Contr&ocirc;leur g&eacute;n&eacute;ral des Finances, il fait rattacher l&rsquo;agriculture &agrave; ses services et la conserve quand il est nomm&eacute; ministre d&rsquo;&Eacute;tat en 1762. En tant que ministre, Bertin s&rsquo;emploie &agrave; innover dans la production agricole en cherchant la coop&eacute;ration &eacute;troite avec les agriculteurs et en instaurant des &eacute;coles d&rsquo;agriculture. Il est aussi &agrave; l&rsquo;origine de la fondation de l&rsquo;&Eacute;cole des Mines.</p>\r\n\r\n<p>Pour se rapprocher des r&eacute;sidences royales de Versailles, de Saint-Germain et de la capitale, Bertin rach&egrave;te en 1766 les domaines de Chatou et de Montesson, recouvrant une superficie de 55 hectares. L&rsquo;ancien ch&acirc;teau est v&eacute;tuste et modeste, Bertin veut se doter d&rsquo;une nouvelle r&eacute;sidence digne d&rsquo;un ministre du gouvernement. Il refuse un don du Roi de 100.000 livres (1,2 millions d&rsquo;euros d&rsquo;aujourd&rsquo;hui) pour r&eacute;nover l&rsquo;ancien ch&acirc;teau&nbsp;: il a suffisamment de revenus et de richesse pour en b&acirc;tir un &agrave; son compte. Il demande &agrave; l&rsquo;un des plus grands architectes de France, Jacques-Germain Soufflot, de lui dessiner un nouveau ch&acirc;teau avec des annexes somptueuses, dont le fameux Nymph&eacute;e qu&rsquo;on peut encore admirer aujourd&rsquo;hui.</p>\r\n\r\n<p>Les vastes terrains en sa possession lui permettent d&rsquo;y conduire ses exp&eacute;rimentations agricoles&nbsp;: il cr&eacute;e un potager de 6 hectares dans lequel il cultive diff&eacute;rents types d&rsquo;arbres fruitiers, dont des cerisiers d&rsquo;une qualit&eacute; gustative bien appr&eacute;ci&eacute;e &agrave; l&rsquo;&eacute;poque, des abricotiers et, surtout, des pommes de terre, qui &eacute;taient peu connues en France et dont Bertin devient l&rsquo;un des plus fervents propagateurs pour leurs propri&eacute;t&eacute;s nutritionnelles.</p>\r\n\r\n<p>L&rsquo;un des moments forts de l&rsquo;histoire de Chatou se d&eacute;roule justement sous la seigneurie de Bertin&nbsp;: en mai 1789 la population de Chatou se rebelle contre la d&eacute;cision du seigneur de fermer la route de Carri&egrave;re et de Montesson, que les paysans du village empruntent pour aller labourer leurs champs. En englobant le chemin dans son domaine, cent d&#39;un mur qu&rsquo;il a fait &eacute;riger, le seigneur a fait ouvrir une nouvelle route sur le trac&eacute; de l&rsquo;actuel boulevard de la R&eacute;publique. Les catoviens se sont oppos&eacute;s depuis longtemps &agrave; ce projet qui prolonge leur itin&eacute;raire quotidien, et ont obtenu une suspension temporaire en 1788. Apr&egrave;s le rejet de leur recours, les travaux commencent au printemps suivant. Les habitants, sous l&rsquo;impulsion du maire, croient bon d&rsquo;en faire dol&eacute;ance en vue des &Eacute;tats g&eacute;n&eacute;raux, mais leur plainte n&rsquo;est pas retenue. Exc&eacute;d&eacute;s par ce qu&rsquo;ils consid&egrave;rent un abus, les habitants se r&eacute;voltent&nbsp;: des actes de vandalisme sont commis contre les propri&eacute;t&eacute;s de Bertin, suivis d&rsquo;un v&eacute;ritable tumulte le 9 mai 1789 durant lequel la population abat le mur et occupe les terrains du seigneur. Un avant-go&ucirc;t de la r&eacute;volte contre l&rsquo;aristocratie sous la R&eacute;volution... Ayant compris que son futur de seigneur de Chatou &eacute;tait en danger, Bertin vend son domaine en 1791 et se retire &agrave; Spa (Belgique) o&ugrave; il meurt l&rsquo;ann&eacute;e suivante.</p>\r\n\r\n<p>&lt;2&gt;</p>\r\n\r\n<p>Le XIXe si&egrave;cle est plein d&rsquo;&eacute;v&eacute;nements et de changements radicaux. Le plus important a &eacute;t&eacute; sans doute la construction en 1835 de la premi&egrave;re ligne ferroviaire pour voyageurs qui lie Paris &agrave; Saint-Germain (au Pecq, le dernier tron&ccedil;on sera ajout&eacute; plus tard) s&rsquo;arr&ecirc;tant &agrave; Chatou. Le chemin de fer change compl&egrave;tement la vocation et la physionomie de la bourgade agricole. Les villes servies par la ligne, avec leur nature florissante et la fraicheur de la Seine, deviennent une destination de sorties des parisiens et de lieux privil&eacute;gi&eacute;s pour y faire b&acirc;tir leurs maisons de vill&eacute;giature. Les insurrections de 1830 et 1848, ainsi que la guerre franco-prussienne et la Commune de Paris ne manquent pas d&rsquo;affecter la ville, avec leurs tributs de morts et de h&eacute;ros. En 1875 le V&eacute;sinet, un vaste bois de chasse avec une petite bourgade qui jusqu&rsquo;alors &eacute;tait partag&eacute; entre Croissy, Montesson et surtout Chatou, obtient le statut de commune &agrave; part enti&egrave;re coupl&eacute; par un grand projet de lotissement par le promoteur et futur premier maire de la commune Alphonse Pallu.</p>\r\n\r\n<p>&lt;3&gt;</p>\r\n\r\n<p>Le dernier quart du si&egrave;cle voit l&rsquo;essor &eacute;conomique de Chatou&nbsp;: en plus d&rsquo;&ecirc;tre devenue un lieu de plaisance pour les artistes et bourgeois parisiens, la Ville vit la naissance d&rsquo;un p&ocirc;le industriel dont les usines Path&eacute; seront le fleuron principal. &Agrave; la m&ecirc;me &eacute;poque on inaugure aussi le tramway &agrave; vapeur qui relie Nanterre, Rueil, et le Pecq, en passant par Chatou devant l&rsquo;&eacute;glise et la mairie sur l&rsquo;actuel avenue du Mar&eacute;chal Foch.</p>\r\n\r\n<p>Au XXe si&egrave;cle se confirment la vocation &agrave; la fois r&eacute;sidentielle et industrielle de Chatou&nbsp;: l&rsquo;ancien domaine de Bertin, qui avait &eacute;t&eacute; rachet&eacute; en 1829 par l&rsquo;un des premiers maires de Chatou, Antoine Lacroix, est progressivement morcel&eacute; et loti entre 1873 et 1929 par les h&eacute;ritiers de la branche de Louis-Adrien Moisant, donnant lieu &agrave; la naissance du&nbsp;<em>Parc de Chatou</em>. Path&eacute;, qui aura fusionn&eacute; avec le groupe EMI, continue sa croissance et emploie dans les ann&eacute;es 1950 plus de 3.000 ouvriers. Des deux guerres mondiales, c&rsquo;est surtout la deuxi&egrave;me qui marque l&rsquo;histoire de Chatou&nbsp;: avec le d&eacute;barquement des alli&eacute;s sur la c&ocirc;te normande et leur avance sur Paris, des r&eacute;sistants de Chatou, install&eacute;s au Ch&acirc;teau de la Pi&egrave;ce d&rsquo;Eau &ndash; Villa Lambert &ndash; prennent le contr&ocirc;le de la Ville et appr&eacute;hend&egrave;rent vingt-trois soldats allemands. Leur conqu&ecirc;te sera br&egrave;ve&nbsp;: les troupes allemandes reprennent Chatou et fusillent vingt-sept r&eacute;sistants catoviens avant de se replier vers l&rsquo;Allemagne sous la pression des troupes alli&eacute;es.</p>\r\n\r\n<p>Apr&egrave;s la deuxi&egrave;me guerre mondiale, la Ville continue son expansion avec en particulier un grand projet de requalification urbaine qui bouleversera compl&egrave;tement l&rsquo;ancien centre villageois pour y substituer des immeubles sans gr&acirc;ce qui ont d&eacute;finitivement d&eacute;vast&eacute; le paysage urbain. Le tout-voiture qui caract&eacute;rise l&rsquo;urbanisme des derniers cinquante ans a &eacute;t&eacute; &agrave; l&rsquo;origine du d&eacute;placement du pont de Chatou et de l&rsquo;ouverture d&rsquo;art&egrave;res de circulation pour le trafic automobile qui ont coup&eacute; en deux la ville.</p>\r\n\r\n<p>&nbsp;</p>	44	\N	119
44	<p>Le promeneur s&rsquo;en aper&ccedil;oit tout de suite, il est au pays des impressionnistes. En arrivant par le pont de Chatou, en train ou en voiture, il suffit de jeter un coup d&rsquo;&oelig;il sur la Seine et ses berges pour ressentir le d&eacute;paysement. Tout l&rsquo;environnement baigne dans des teints bleu-vert profonds : l&rsquo;eau de la rivi&egrave;re, les arbres, les buissons qui la longent et le ciel, certains jours favorables. Une telle vue ne peut qu&rsquo;annoncer l&rsquo;&eacute;closion d&rsquo;une peinture en plein air&nbsp;: l&rsquo;impressionnisme. Une des raisons essentielles de l&rsquo;engouement des artistes et des promeneurs pour les bords de Seine, est la construction, en 1837, du premier chemin de fer pour voyageurs reliant Paris Saint-Lazare au Pecq. Les peintres, les po&egrave;tes et avec eux toute la boh&egrave;me parisienne, affluent dans cette r&eacute;gion, aujourd&rsquo;hui, appel&eacute;e <em>pays des impressionnistes</em>. Les uns cherchent l&rsquo;inspiration dans le paysage, les autres, tout simplement le divertissement ou l&rsquo;&eacute;chappatoire &agrave; la pollution de la grande ville en plein essor industriel.</p>\r\n\r\n<p>Autour de 1872, Chatou et les abords de l&rsquo;&Icirc;le deviennent bel et bien le lieu de naissance de l&rsquo;impressionnisme. &Agrave; cette &eacute;poque, l&rsquo;&Icirc;le porte encore son ancien nom &laquo;&nbsp;&Icirc;le du Chiard&nbsp;&raquo; chang&eacute; en &laquo;&nbsp;&Icirc;le des Impressionnistes&nbsp;&raquo; seulement cent ans plus tard. Renoir, Manet, Monet et Caillebotte viennent s&rsquo;impr&eacute;gner de l&rsquo;atmosph&egrave;re toujours changeante de la nature et de l&rsquo;&eacute;clat de ses couleurs qui varient &agrave; chaque saison. Le paysage aquatique aux reflets lumineux, auquel s&rsquo;ajoutent sc&egrave;nes de canotage, de p&ecirc;che et de baignade, leur offre des visions splendides. Les guinguettes le long des berges entre Chatou et Croissy, notamment &agrave; la Grenouill&egrave;re, r&eacute;veillent la joie de vivre et rendent une l&eacute;g&egrave;ret&eacute; du corps et de l&rsquo;esprit aux visiteurs apr&egrave;s la dure guerre franco-prussienne. Sur cette &icirc;le vivaient jadis deux familles, la famille Fournaise et la famille Levanneur, dont les r&eacute;sidences furent am&eacute;nag&eacute;es en restaurants au milieu du XIXe si&egrave;cle.</p>\r\n\r\n<p>Les peintres entra&icirc;nent les po&egrave;tes et les &eacute;crivains tels Guy de Maupassant, canotier &agrave; ses heures et un des habitu&eacute;s du c&eacute;l&egrave;bre restaurant Fournaise. Cette auberge plein de charme, situ&eacute;e sur l&rsquo;&Icirc;le des impressionnistes, est le point de rencontre du Paris de la boh&egrave;me, lui permettant de fuir la capitale. Les dimanches apr&egrave;s-midi, bourgeois, artistes, po&egrave;tes et jeunes badauds y d&eacute;gustent des bons plats, bavardent, canotent et surtout font la f&ecirc;te. Le t&eacute;moignage le plus connu de ces sc&egrave;nes de bonheur est celui d&rsquo;Auguste Renoir avec son c&eacute;l&egrave;bre tableau <em>Le D&eacute;jeuner des Canotiers. </em></p>\r\n\r\n<p>Aux alentours de 1902, une nouvelle g&eacute;n&eacute;ration de peintres va profiter de l&rsquo;influence de leurs pr&eacute;d&eacute;cesseurs pour reprendre leurs sujets de plein air, peu importe le temps ou la saison. Andr&eacute; Derain, n&eacute; &agrave; Chatou et Maurice de Vlaminck, originaire du V&eacute;sinet, donnent d&eacute;sormais naissance au fauvisme. Comme l&rsquo;indique son nom, il s&rsquo;agit d&rsquo;une peinture instinctive au coup de pinceaux spontan&eacute;s, qui rompent avec les dogmes de la peinture acad&eacute;mique. Les artistes font revivre un environnement familier avec des couleurs tr&egrave;s franches, &eacute;clatantes et sauvages, et des gestes encore plus insolites que les impressionnistes, &agrave; croire que ce lieu a un pouvoir magique sur les artistes.</p>\r\n\r\n<p>Si la nature &eacute;tait abondante &agrave; Chatou jusqu&rsquo;au d&eacute;but du XXe si&egrave;cle, elle l&rsquo;est certes beaucoup moins aujourd&rsquo;hui, suite &agrave; une transformation de l&rsquo;urbanisme qui n&rsquo;a pas toujours respect&eacute; les valeurs historiques ou &eacute;cologiques. C&rsquo;est ainsi que l&rsquo;image architecturale de la Ville va radicalement changer juste avant la deuxi&egrave;me guerre mondiale. En 1937, les promoteurs n&rsquo;ont pas h&eacute;sit&eacute; &agrave; raser des villas somptueuses, comme celle de Maurice Berteaux maire de Chatou et ministre de la guerre sous la IIIe R&eacute;publique. Depuis les ann&eacute;es 1950, les vastes r&eacute;sidences log&eacute;es au milieu des parcs sublimes sont divis&eacute;es en parcelles pour laisser place &agrave; de nouveaux terrains et &agrave; la construction d&rsquo;immeubles collectifs ou de pavillons individuels.</p>\r\n\r\n<p>En effet, d&egrave;s l&rsquo;entr&eacute;e dans la Ville par le pont de Chatou, le regard est heurt&eacute; par tant de contraste, l&rsquo;&Eacute;glise Notre-Dame du XIIe si&egrave;cle, brille comme un bijou pr&eacute;cieux au milieu d&rsquo;un &eacute;talage architectural assez fade. Le premier aper&ccedil;u que nous offre la Ville, est marqu&eacute; par des immeubles modernes loin d&rsquo;&ecirc;tre s&eacute;duisants. Et pourtant, ce premier regard est trompeur, la Ville cache des merveilles incroyables pas toujours visibles au promeneur distrait. L&rsquo;&Eacute;glise Notre-Dame n&rsquo;est heureusement pas l&rsquo;unique tr&eacute;sor architectural qui a pu &ecirc;tre pr&eacute;serv&eacute;, notamment gr&acirc;ce aux associations tel que &laquo;&nbsp;Les Amis de la Maison Fournaise&nbsp;&raquo; et &laquo;&nbsp;Chatou Notre Ville&nbsp;&raquo;. Le restaurant Fournaise, d&eacute;j&agrave; cit&eacute;, en est un, &agrave; la fois pour la beaut&eacute; de son architecture et de son d&eacute;cor peint dans le style du XIXe si&egrave;cle et pour sa fr&eacute;quentation par les artistes c&eacute;l&egrave;bres.&nbsp; Il n&rsquo;a non seulement servi comme restaurant, mais aussi comme garage &agrave; canots et location de yoles aux promeneurs en recherche de rendez-vous galants.</p>\r\n\r\n<p>Juste derri&egrave;re le restaurant Fournaise, se situe la maison Levanneur, un b&acirc;timent construit en 1775 par le seigneur Henri-L&eacute;onard-Jean-Baptiste Bertin, transform&eacute; en restaurant en 1830, avant d&rsquo;&ecirc;tre converti en atelier d&rsquo;artistes. Si, la maison Fournaise est &agrave; nouveau exploit&eacute;e comme restaurant, la maison Levanneur a &eacute;t&eacute; am&eacute;nag&eacute;e en galerie d&rsquo;art contemporain en 2018.</p>\r\n\r\n<p>&nbsp;</p>	45	\N	123
41	<p><span style="color:black">Au d&eacute;but du <strong>XIXe&nbsp;si&egrave;cle</strong>, le &laquo;&nbsp;quartier de la gare&nbsp;&raquo; </span>&eacute;tait <span style="color:black">encore synonyme de campagne. Quelques grandes propri&eacute;t&eacute;s &ndash; comme celle du marquis d&rsquo;Aligre &ndash; cohabitent avec des parcelles d&eacute;di&eacute;es aux cultures (c&eacute;r&eacute;ales, haricots, arbres fruitiers&hellip;).</span></p>\r\n\r\n<p><span style="color:black">L&rsquo;arriv&eacute;e du chemin de fer, <strong>en 1837</strong>,&nbsp; boulevers</span>a<span style="color:black"> ce quartier. Alors que l&rsquo;on mettait jusqu&rsquo;&agrave; deux heures pour aller en voiture &agrave; cheval -pouvant accueillir jusqu&rsquo;&agrave; vingt-cinq voyageurs- de Paris au Pecq, le train permet de faire ce trajet en une demi-heure. Les trains disposaient</span> <span style="color:black">de dix voitures divis&eacute;es en trois classes, &laquo; berlines &raquo;, &laquo; diligences &raquo;, et &laquo; wagons non garnis &raquo;. </span></p>\r\n\r\n<p><span style="color:black">Chatou </span>&eacute;tait <span style="color:black">dor&eacute;navant aux portes de Paris et une premi&egrave;re gare </span>&eacute;tait <span style="color:black">construite en octobre <strong>1837</strong>.&nbsp;S&rsquo;ensuivit la construction d&rsquo;une nouvelle gare en pierre en 1867 et d&rsquo;une passerelle pour pi&eacute;ton en <strong>1900</strong>.</span></p>\r\n\r\n<p><span style="color:black">La ligne de chemin de fer SNCF c&egrave;de peu &agrave; peu du terrain au RER (R&eacute;seau Express R&eacute;gional).&nbsp;</span></p>\r\n\r\n<p><span style="color:black">L&#39;ancienne gare en pierre de <strong>1867</strong> </span>fut<span style="color:black"> d&eacute;truite lors de l&#39;am&eacute;nagement de la gare RER et la conversion de la ligne SNCF en RER fut totale <strong>en 1972</strong>.&nbsp;</span></p>\r\n\r\n<p><span style="color:black">Aujourd&#39;hui, la ligne RER A est un point central de Chatou vers lequel des milliers de Catoviennes et Catoviens convergent chaque jour.&nbsp;</span></p>\r\n\r\n<p>Une exposition unique sur la ligne sur le chemin de fer Paris-Saint-Germain est venue rappeler l&#39;histoire du train &agrave; Chatou.</p>\r\n\r\n<p>R&eacute;alis&eacute;e en 2008 &agrave; l&#39;initiative de l&#39;association Chatou Notre Ville en collaboration avec les services de la ville, la RATP et l&#39;association Philat&eacute;lique de Chatou et des environs, celle-ci maintient sur le quai de la gare en direction de Paris le souvenir de cette aventure qui permit la vill&eacute;giature et le pass&eacute; artistique de Chatou.</p>	43	38	141
36	<p>La villa Lambert est une all&eacute;e romantique bord&eacute;e de vastes jardins au milieu desquels sont log&eacute;es de belles maisons, aujourd&rsquo;hui privatis&eacute;e.</p>\r\n\r\n<p>En <strong>1873</strong>, Louis-&Eacute;tienne Lambert, descendant d&rsquo;une famille d&rsquo;architecte, ach&egrave;te le parc de la Pi&egrave;ce d&rsquo;eau lors du morcellement, par la famille Lacroix, du domaine seigneurial de Bertin. Il y fait construire son ch&acirc;teau (1883) ainsi qu&rsquo;un petit lotissement. Une voie priv&eacute;e bord&eacute;e de murs de cl&ocirc;ture est &eacute;galement am&eacute;nag&eacute;e. Ainsi na&icirc;t la Villa Lambert, du nom de son promoteur.</p>\r\n\r\n<p>Sur la droite de l&rsquo;all&eacute;e, neuf villas historiques con&ccedil;ues par Alfred Gaultier de style n&eacute;o-gothique s&rsquo;alignent les unes apr&egrave;s les autres. Il se r&eacute;serve le num&eacute;ro 18 comme habitation personnelle. Au num&eacute;ro 16, v&eacute;cu Olga, de son vrai nom Angelika Kostrowicka, originaire de la noblesse polonaise, connue dans les fichiers de la police comme &laquo;&nbsp;femme galante&nbsp;&raquo;, et avant tout m&egrave;re du po&egrave;te Guillaume Apollinaire. Il lui rend r&eacute;guli&egrave;rement visite &agrave; sa fin de vie.</p>\r\n\r\n<p>Deux de ces villas sont d&eacute;truites &agrave; la fin de la deuxi&egrave;me guerre mondiale et remplac&eacute;es par des constructions plus modernes. L&rsquo;ensemble fait partie de l&rsquo;investissement immobilier de Louis-Etienne Lambert.</p>\r\n\r\n<p>&lt;1&gt;</p>\r\n\r\n<p>Le ch&acirc;teau de la Pi&egrave;ce d&rsquo;Eau entre dans l&rsquo;histoire le <strong>25 Ao&ucirc;t 1944</strong>, lorsqu&rsquo;il devient le refuge d&rsquo;un groupe de r&eacute;sistants sous le lieutenant Torset qui se bat courageusement contre les troupes allemandes, install&eacute;es dans la commune de Chatou. Suite &agrave;<strong> </strong>l&rsquo;emprisonnement de soldats allemands par la R&eacute;sistance fran&ccedil;aise, des blind&eacute;s allemands roulent sur Chatou le <strong>25 ao&ucirc;t 1944</strong>. Malgr&eacute; la lib&eacute;ration des prisonniers allemands ordonn&eacute;e par le lieutenant Torset pour &eacute;viter un massacre, 27 r&eacute;sistants sont mutil&eacute;s et assassin&eacute;s par les soldats allemands. Le lendemain, la Ville est lib&eacute;r&eacute;e par le G&eacute;n&eacute;ral Leclerc. Et le <strong>28 ao&ucirc;t</strong>, les corps des r&eacute;sistants enterr&eacute;s devant le ch&acirc;teau sont inhum&eacute;s au cimeti&egrave;re des Landes. Chatou honore toujours ces 27 martyrs et une rue porte ce nom.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>	38	33	46
48	<p>Le Restaurant Fournaise, dont vous pouvez retrouver une description d&eacute;taill&eacute;e dans le premier parcours, doit sa renomm&eacute;e au public qui l&#39;a fr&eacute;quent&eacute;: de Renoir &agrave; Maupassant, en passant par Monet, Sisley, Morisot, Manet, Pissarro et Degas, ainsi que les artistes du d&eacute;but du si&egrave;cle, Matisse, Derain, de Vlaminck et Apollinaire, tous sont venus retrouver leurs esprits et l&#39;inspiration dans ce hameau id&eacute;alement plac&eacute; sur les rives de la Seine. C&#39;est gr&acirc;ce &agrave; ses souvenirs que le restaurant a pu rena&icirc;tre au d&eacute;but des ann&eacute;es 1990.</p>\r\n\r\n<p>&lt;ba1&gt;</p>	49	40	146
45	<p><a href="https://www.chatou.fr" target="_blank"><img alt="Logo Ville de Chatou" src="/media/media/chatou_auto/ville-de-chatou_200.jpg" style="float:left; height:133px; margin:5px 20px; width:200px" /></a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ce guide est r&eacute;alis&eacute; pour le compte de la Ville de Chatou&nbsp;dans le cadre de l&#39;appel &agrave; projets pour le budget participatif de 2019.</p>\r\n\r\n<p>Suivez les actualit&eacute;s culturelles et de loisirs de Chatou&nbsp;<a href="https://www.chatou.fr/Mes-loisirs" target="_blank">sur cette page</a>.</p>\r\n\r\n<p><a href="https://www.facebook.com/VilledeChatou/" target="_blank"><img alt="La Ville de Chatou sur Facebook" src="/media/media/chatou_auto/48x48facebook3.png" style="height:24px; width:24px" /></a>&nbsp;&nbsp;<a href="https://twitter.com/villedechatou" target="_blank"><img alt="la Ville de Chatou sur Twitter" src="/media/media/chatou_auto/48x48twitter.png" style="height:24px; margin-bottom:0px; margin-top:0px; width:24px" /></a></p>\r\n\r\n<hr />\r\n<p><strong>Textes&nbsp;</strong></p>\r\n\r\n<p>Ulrike Kaspers et Antonio Ca&#39; Zorzi</p>\r\n\r\n<p><strong>Voix</strong></p>\r\n\r\n<p>Eric Aubrahn et Aurelia Ca&#39; Zorzi</p>\r\n\r\n<p><strong>Photographies</strong></p>\r\n\r\n<p>En absence d&#39;autres cr&eacute;dits photographiques :&nbsp;Antonio Ca&#39; Zorzi</p>\r\n\r\n<p><em><strong>Sources et remerciements&nbsp;</strong>: Les informations de ce guide sont essentiellement tir&eacute;es des textes fournis par les Amis de la Maison Fournaise, dont les auteurs sont Suzanne et Jean Guy Bertauld, et Paulette Blampin, ainsi que des ouvrages suivants&nbsp;: &laquo; Les Ch&acirc;teaux de Chatou et le Nymph&eacute;e de Soufflot&nbsp;&raquo; de Jacques Catinat, &laquo;&nbsp;Histoire de Chatou et des environs&nbsp;&raquo; de Paul Bisson de Barth&eacute;lemy, &laquo;&nbsp;Histoire de Chatou&nbsp;&raquo; d&#39;Albert Curmer, &laquo;&nbsp;Chatou, M&eacute;moire en Images&nbsp;&raquo; de Pierre Arrivetz et &laquo;&nbsp;Path&eacute; Marconi &agrave; Chatou&nbsp;&raquo; de Jean-Luc Rigaud. Nous remercions &eacute;galement le service des archives de la Ville de Chatou pour l&rsquo;acc&egrave;s aux fonds communaux.</em></p>\r\n\r\n<hr />\r\n<p><a href="http://www.bluelionguides.com" target="_blank"><img alt="" src="/media/media/chatou_auto/BL_Apps_Logos_Res_150.jpg" style="float:left; height:108px; margin:5px 10px; width:150px" /></a>Blue Lion Apps</p>\r\n\r\n<p>Cr&eacute;ateur et d&eacute;veloppeur de guides touristiques et culturels&nbsp;</p>\r\n\r\n<p>Route de Carri&egrave;res-sur-Seine, F-78400 Chatou</p>\r\n\r\n<p>Visitez nous :&nbsp;<a href="http://www.bluelionguides.com">www.bluelionguides.com</a></p>	46	\N	124
46	<p>Merci de lire attentivement les pr&eacute;sentes modalit&eacute;s d&#39;utilisation du pr&eacute;sent site avant de le parcourir. En vous connectant sur ce site, vous acceptez sans r&eacute;serve les pr&eacute;sentes modalit&eacute;s.</p>\r\n\r\n<p><strong>Editeur du site</strong><br />\r\nMobile Itineraries SARL<br />\r\n15 Route de Carri&egrave;res - 78400 Chatou<br />\r\n&nbsp;</p>\r\n\r\n<p><strong>Conditions d&#39;utilisation</strong><br />\r\nCe site est exploit&eacute; dans le respect de la l&eacute;gislation fran&ccedil;aise. L&#39;utilisation de ce site est r&eacute;gie par les pr&eacute;sentes conditions g&eacute;n&eacute;rales. En utilisant le site, vous reconnaissez avoir pris connaissance de ces conditions et les avoir accept&eacute;es. Celles-ci pourront &ecirc;tres modifi&eacute;es &agrave; tout moment et sans pr&eacute;avis. L&#39;&eacute;diteur ne saurait &ecirc;tre tenu pour responsable en aucune mani&egrave;re d&rsquo;une mauvaise utilisation du service.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Limitation de responsabilit&eacute;</strong><br />\r\nLes informations contenues sur ce site sont aussi pr&eacute;cises que possibles et le site est p&eacute;riodiquement remis &agrave; jour, mais peut toutefois contenir des inexactitudes, des omissions ou des lacunes. Si vous constatez une lacune, erreur ou ce qui parait &ecirc;tre un dysfonctionnement, merci de bien vouloir le signaler par courriel en d&eacute;crivant le probl&egrave;me de la mani&egrave;re la plus pr&eacute;cise possible (page posant probl&egrave;me, action effectu&eacute;e, type d&rsquo;ordinateur et de navigateur utilis&eacute;, &hellip;).</p>\r\n\r\n<p>Tout contenu t&eacute;l&eacute;charg&eacute; se fait aux risques et p&eacute;rils de l&#39;utilisateur et sous sa seule responsabilit&eacute;. En cons&eacute;quence, ne saurait &ecirc;tre tenu responsable d&#39;un quelconque dommage subi par l&#39;ordinateur de l&#39;utilisateur ou d&#39;une quelconque perte de donn&eacute;es cons&eacute;cutives au t&eacute;l&eacute;chargement.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Les photos sont non contractuelles</strong><br />\r\nLes liens hypertextes mis en place dans le cadre du pr&eacute;sent site internet en direction d&#39;autres ressources pr&eacute;sentes sur le r&eacute;seau Internet ne sauraient engager la responsabilit&eacute; de l&#39;&eacute;diteur du site.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Droit d&#39;acc&egrave;s</strong><br />\r\nEn application de cette loi, les internautes disposent d&rsquo;un droit d&rsquo;acc&egrave;s, de rectification, de modification et de suppression concernant les donn&eacute;es qui les concernent personnellement. Ce droit peut &ecirc;tre exerc&eacute; par voie postale aupr&egrave;s de Mobile Itineraries SARL &ndash; 15 Route de Carri&egrave;res - 78400 Chatou ou par voie &eacute;lectronique &agrave; l&rsquo;adresse courriel suivante : acazorzi@gmail.com.</p>\r\n\r\n<p>Les informations personnelles collect&eacute;es ne sont en aucun cas confi&eacute;es &agrave; des tiers hormis pour l&rsquo;&eacute;ventuelle bonne ex&eacute;cution de la prestation command&eacute;e par l&rsquo;internaute.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Confidentialit&eacute;</strong><br />\r\nVos donn&eacute;es personnelles sont confidentielles et ne seront en aucun cas communiqu&eacute;es &agrave; des tiers hormis pour la bonne ex&eacute;cution de la prestation.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Propri&eacute;t&eacute; intellectuelle</strong><br />\r\nTout le contenu du pr&eacute;sent site, incluant, de fa&ccedil;on non limitative, les graphismes, images, textes, vid&eacute;os, animations, sons, logos, gifs et ic&ocirc;nes ainsi que leur mise en forme sont la propri&eacute;t&eacute; exclusive de l&#39;&eacute;diteur du site &agrave; l&#39;exception des marques, logos ou contenus appartenant &agrave; d&#39;autres soci&eacute;t&eacute;s partenaires ou auteurs.</p>\r\n\r\n<p>Toute reproduction, distribution, modification, adaptation, retransmission ou publication, m&ecirc;me partielle, de ces diff&eacute;rents &eacute;l&eacute;ments est strictement interdite sans l&#39;accord expr&egrave;s par &eacute;crit de l&#39;&eacute;diteur du site. Cette repr&eacute;sentation ou reproduction, par quelque proc&eacute;d&eacute; que ce soit, constitue une contrefa&ccedil;on sanctionn&eacute;e par les articles L.3335-2 et suivants du Code de la propri&eacute;t&eacute; intellectuelle. Le non-respect de cette interdiction constitue une contrefa&ccedil;on pouvant engager la responsabilit&eacute; civile et p&eacute;nale du contrefacteur. En outre, les propri&eacute;taires des Contenus copi&eacute;s pourraient intenter une action en justice &agrave; votre encontre.</p>\r\n\r\n<p>Les utilisateurs et visiteurs du site internet peuvent mettre en place un hyperlien en direction de ce site, &agrave; condition que ce lien s&rsquo;ouvre dans une nouvelle fen&ecirc;tre. En particulier, l&rsquo;ouverture du pr&eacute;sent site au sein d&rsquo;un cadre (&laquo; framing &raquo;), sauf l&#39;autorisation expresse et pr&eacute;alable de l&#39;&eacute;diteur du site.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>H&eacute;bergeur</strong><br />\r\nAlibaba-Cloud.com (Europe) Limited<br />\r\n3rd Floor, Davidson Building<br />\r\n5 Southampton Street<br />\r\nLondon, England, WC2E 7HA<br />\r\nUnited Kingdom.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Informations et exclusion</strong><br />\r\nL&#39;&eacute;diteur met en &oelig;uvre tous les moyens dont elle dispose, pour assurer une information fiable et une mise &agrave; jour fiable de ses sites internet. Toutefois, des erreurs ou omissions peuvent survenir. L&#39;internaute devra donc s&#39;assurer de l&#39;exactitude des informations aupr&egrave;s du responsable &eacute;ditorial, et signaler toutes modifications du site qu&#39;il jugerait utile. Le responsable &eacute;ditorial n&#39;est en aucun cas responsable de l&#39;utilisation faite de ces informations, et de tout pr&eacute;judice direct ou indirect pouvant en d&eacute;couler.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Liens hypertextes</strong><br />\r\nLes sites internet de peuvent offrir des liens vers d&rsquo;autres sites internet ou d&rsquo;autres ressources disponibles sur Internet.</p>\r\n\r\n<p>Le responsable &eacute;ditorial ne dispose d&#39;aucun moyen pour contr&ocirc;ler les sites en connexion avec ses sites internet, ne r&eacute;pond pas de la disponibilit&eacute; de tels sites et sources externes, ni ne la garantit. Il ne peut &ecirc;tre tenu pour responsable de tout dommage, de quelque nature que ce soit, r&eacute;sultant du contenu de ces sites ou sources externes, et notamment des informations, produits ou services qu&rsquo;ils proposent, ou de tout usage qui peut &ecirc;tre fait de ces &eacute;l&eacute;ments. Les risques li&eacute;s &agrave; cette utilisation incombent pleinement &agrave; l&#39;internaute, qui doit se conformer &agrave; leurs conditions d&#39;utilisation.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Cookies</strong><br />\r\nCookies et technologies similaires : la plupart des navigateurs Web sont configur&eacute;s pour accepter les cookies par d&eacute;faut. Si vous pr&eacute;f&eacute;rez, vous pouvez g&eacute;n&eacute;ralement choisir de configurer votre navigateur pour supprimer les cookies et refuser les cookies. Si vous choisissez de supprimer les cookies ou de rejeter les cookies, cela pourrait affecter certaines fonctionnalit&eacute;s ou services de notre application web.</p>\r\n\r\n<p>L&rsquo;&eacute;diteur ne collecte que les cookies strictement n&eacute;cessaires au bon fonctionnement du site. Voici la liste des cookies utilis&eacute;es et leur objectif :</p>\r\n\r\n<ol style="list-style-type:lower-alpha">\r\n\t<li>Invitation &agrave; t&eacute;l&eacute;charger l&rsquo;application : Permet de garder en m&eacute;moire le fait que vous acceptez les cookies afin de ne plus vous importuner lors de votre prochaine visite. D&eacute;lai d&rsquo;expiration : 6 mois</li>\r\n\t<li>G&eacute;olocalisation : positionnement de l&rsquo;usager sur une carte g&eacute;ographique. Ceci pour vous permettre de vous rendre vers les lieux affich&eacute;s dans l&rsquo;application via une application de cartes (fournie par Google, Apple ou Openstreet Map). Une autorisation est demand&eacute;e au visiteur. D&eacute;lai d&rsquo;expiration de l&rsquo;autorisation: 6 mois. En cas de non-autorisation une nouvelle demande sera faite lors d&rsquo;une nouvelle visite apr&egrave;s quinze jours.</li>\r\n\t<li>Cookies usager&nbsp;: pour retenir les choix de l&rsquo;usager concernant les cookies mentionn&eacute;s aux points a) et b). D&eacute;lai d&rsquo;expiration&nbsp;: 6 mois.</li>\r\n</ol>\r\n\r\n<p>Ce site utilise Google Maps API dont les mentions l&eacute;gales peuvent &ecirc;tre consult&eacute;es <span style="color:#0563c1"><u><a href="about:blank" style="color:#0563c1; text-decoration:underline">ici</a></u></span> et les politiques de confidentialit&eacute; au lien <span style="color:#0563c1"><u><a href="about:blank" style="color:#0563c1; text-decoration:underline">suivant</a></u></span>.</p>	47	\N	132
10	<p>Nous devons aux seigneurs de Croissy et de Chatou l&rsquo;ouverture, en 1730, de cette belle avenue arbor&eacute;e. R&eacute;serv&eacute;e aux pi&eacute;tons, elle &eacute;tait tr&egrave;s pris&eacute;e par les habitants de Chatou et Croissy qui s&rsquo;y promenaient les soirs d&rsquo;&eacute;t&eacute; pour prendre l&rsquo;air frais. La rive de la Seine &eacute;tait paisible et l&rsquo;acc&egrave;s &agrave; la rivi&egrave;re ais&eacute;&nbsp;: l&rsquo;endroit id&eacute;al pour ouvrir, d&egrave;s 1887, un espace de baignade d&rsquo;une centaine de m&egrave;tres, un peu cach&eacute; de la vue des habitants, &agrave; la hauteur de l&rsquo;avenue des Chalets (aujourd&rsquo;hui Aristide Briand). Un peu plus loin, en contrebas de l&rsquo;avenue des Tilleuls, on aper&ccedil;oit des chalets de vill&eacute;giature (le nom de l&rsquo;avenue des Chalets n&rsquo;&eacute;tait pas donn&eacute; par hasard)&nbsp;: ce style de constructions &eacute;tait tr&egrave;s &agrave; la mode apr&egrave;s l&rsquo;Exposition universelle de 1867. &Agrave; noter que le marquis d&rsquo;Aligre, propri&eacute;taire des terrains dans cette section de la Ville, fit stipuler, dans les contrats de vente de ses lotissements, l&rsquo;interdiction de b&acirc;tir des constructions plus &eacute;lev&eacute;es que l&rsquo;avenue. Sans doute voulait-il &eacute;viter d&rsquo;obstruer la vue des belles demeures qui la bordaient&nbsp;!</p>\r\n\r\n<p>&lt;ba1&gt;</p>\r\n\r\n<p>&nbsp;</p>	12	6	9
12	<p>L&rsquo;ouverture de la ligne de chemin de fer de Paris - Saint-Germain fit la fortune des propri&eacute;taires terriers des villes qu&rsquo;elle desservait. &Agrave; Chatou, ce fut surtout le cas du marquis d&rsquo;Aligre, propri&eacute;taire d&rsquo;un vaste domaine autour de la nouvelle gare sur le territoire de Chatou et de Croissy. La construction de la gare avait en effet engendr&eacute; une intense activit&eacute; immobili&egrave;re&nbsp;: des dizaines de villas et d&rsquo;autres b&acirc;timents furent &eacute;rig&eacute;s sur les lotissements de sa propri&eacute;t&eacute; ainsi que celle d&rsquo;autres propri&eacute;taires fonciers. Une bonne partie du quartier entre la gare et la rue de Saint-Germain, aujourd&rsquo;hui avenue du Mar&eacute;chal Foch, lui appartenait. Pour permettre un passage rapide et confortable du vieux centre vers la gare, il permit l&rsquo;ouverture de l&rsquo;avenue pi&eacute;tonne qui porte son nom et de l&rsquo;avenue du Chemin de Fer, actuellement avenue du Mar&eacute;chal Sarrail.</p>\r\n\r\n<p>&lt;ba1&gt;</p>\r\n\r\n<p>&nbsp;</p>	14	8	11
\.


--
-- Name: chatou_auto_page_description_PD_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lionhart
--

SELECT pg_catalog.setval('public."chatou_auto_page_description_PD_id_seq"', 48, true);


--
-- Data for Name: chatou_auto_page_image_order; Type: TABLE DATA; Schema: public; Owner: lionhart
--

COPY public.chatou_auto_page_image_order ("PD_id", appearnce_order, page_description_id, page_image_id, is_page_present) FROM stdin;
5	1	7	5	t
6	2	7	6	t
8	1	32	35	t
9	2	32	36	t
10	1	33	38	t
11	1	34	40	t
12	2	34	41	t
16	1	36	47	t
20	1	38	53	t
21	2	38	50	t
22	3	38	51	t
23	1	39	55	t
24	1	40	57	t
25	2	40	58	t
26	3	40	59	t
27	4	40	60	t
19	1	37	48	t
29	1	43	120	t
30	2	43	121	t
31	3	43	122	t
32	1	45	126	t
7	4	7	7	t
28	3	7	117	t
34	1	35	43	t
14	2	35	44	t
15	3	35	45	t
35	1	47	134	t
\.


--
-- Name: chatou_auto_page_image_order_PD_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lionhart
--

SELECT pg_catalog.setval('public."chatou_auto_page_image_order_PD_id_seq"', 35, true);


--
-- Name: chatou_auto_page_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lionhart
--

SELECT pg_catalog.setval('public.chatou_auto_page_page_id_seq', 49, true);


--
-- Data for Name: chatou_auto_resturant; Type: TABLE DATA; Schema: public; Owner: lionhart
--

COPY public.chatou_auto_resturant ("Resturant_id", "Page_id", "Resturant_Description") FROM stdin;
\.


--
-- Name: chatou_auto_resturant_Resturant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lionhart
--

SELECT pg_catalog.setval('public."chatou_auto_resturant_Resturant_id_seq"', 1, false);


--
-- Data for Name: chatou_auto_shopping; Type: TABLE DATA; Schema: public; Owner: lionhart
--

COPY public.chatou_auto_shopping ("Shopping_id", "Page_id", "Shopping_Description") FROM stdin;
\.


--
-- Name: chatou_auto_shopping_Shopping_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lionhart
--

SELECT pg_catalog.setval('public."chatou_auto_shopping_Shopping_id_seq"', 1, false);


--
-- Data for Name: chatou_auto_tickets; Type: TABLE DATA; Schema: public; Owner: lionhart
--

COPY public.chatou_auto_tickets (tickets_id, "Page_id", "tickets_Description") FROM stdin;
1	9	<h3><strong>Tarifs pour les individuels</strong></h3>\r\n\r\n<p>R&eacute;servation fortement conseill&eacute;e (sur place ou&nbsp;<a href="http://www.forumsirius.fr/orion/chatouac.phtml?kld=1" target="_blank">en ligne</a>). La r&eacute;servation entra&icirc;ne le paiement des places.&nbsp;</p>\r\n\r\n<p>Pour retirer vos places, veuillez vous pr&eacute;senter &agrave; l&#39;accueil du mus&eacute;e 15 &agrave; 20 mn &agrave; l&#39;avance.</p>\r\n\r\n<ul>\r\n\t<li>Tarif Plein: 9 &euro;</li>\r\n\t<li>Tarif R&eacute;duit: 7 &euro;</li>\r\n\t<li>Tarif Jeune (moins de 18 ans) : 6 &euro;</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4><strong>Application du tarif r&eacute;duit</strong></h4>\r\n\r\n<p>(sur pr&eacute;sentation d&rsquo;une pi&egrave;ce justificative)</p>\r\n\r\n<ul>\r\n\t<li>Adh&eacute;rents des Amis du Louvre</li>\r\n\t<li>Cartes du Minist&egrave;re de la Culture</li>\r\n\t<li>Sur pr&eacute;sentation du Guide du Routard</li>\r\n\t<li>Sur pr&eacute;sentation de la carte &laquo; CEZAM &raquo;</li>\r\n\t<li>Sur pr&eacute;sentation du &laquo; Pass malin &raquo;</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4><strong>Dispense du droit d&rsquo;entr&eacute;e</strong></h4>\r\n\r\n<p>(sur pr&eacute;sentation d&rsquo;une pi&egrave;ce justificative)</p>\r\n\r\n<ul>\r\n\t<li>Adh&eacute;rents des Amis de la Maison Fournaise</li>\r\n\t<li>Enfants jusqu&rsquo;&agrave; 5 ans</li>\r\n\t<li>Demandeurs d&rsquo;emploi</li>\r\n\t<li>Etudiants du Centre d&rsquo;Etude d&rsquo;Histoire de l&rsquo;Art de Chatou</li>\r\n\t<li>Etudiants en Histoire de l&rsquo;Art</li>\r\n\t<li>Guides-conf&eacute;renciers</li>\r\n\t<li>Personnes en situation de handicap</li>\r\n\t<li>Professeurs des Ecoles d&rsquo;Art</li>\r\n</ul>\r\n\r\n<div>Consultez le <a href="https://www.musee-fournaise.com/Informations-pratiques/Tarifs">site du mus&eacute;e</a> pour conna&icirc;tre la liste compl&egrave;te des dispenses du droit d&#39;entr&eacute;e et les tarifs des visites de groupe. Sur r&eacute;servation : <a href="https://www.musee-fournaise.com/Nous-contacter" target="_blank">contacter le mus&eacute;e</a></div>
\.


--
-- Name: chatou_auto_tickets_tickets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lionhart
--

SELECT pg_catalog.setval('public.chatou_auto_tickets_tickets_id_seq', 1, true);


--
-- Data for Name: chatou_auto_toilets; Type: TABLE DATA; Schema: public; Owner: lionhart
--

COPY public.chatou_auto_toilets ("Toilet_id", "Page_id", "Toilet_Description") FROM stdin;
\.


--
-- Name: chatou_auto_toilets_Toilet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lionhart
--

SELECT pg_catalog.setval('public."chatou_auto_toilets_Toilet_id_seq"', 1, false);


--
-- Data for Name: chatou_auto_transport; Type: TABLE DATA; Schema: public; Owner: lionhart
--

COPY public.chatou_auto_transport (transport_id, "Page_id", "transport_Description") FROM stdin;
1	9	<p><strong>Acc&egrave;s par la route</strong></p>\r\n\r\n<p>Adresse GPS : 3 rue du Bac, 78400 Chatou<br />\r\nCoordonn&eacute;es GPD : latitude : 48.8895945 &ndash; longitude : 2.1631911500000039<br />\r\nDepuis Paris, prendre les autoroutes A14 puis A86 en direction de Versailles.<br />\r\nSortie Chatou n&deg;35a. Sur le pont, prendre &agrave; droite sur l&rsquo;Ile.<br />\r\nParking gratuit pour les voitures et les bus sous le pont.<br />\r\nStation Autolib&#39; &agrave; la gare de Rueil Malmaison</p>\r\n\r\n<p><strong>Acc&egrave;s par les transports en commun</strong></p>\r\n\r\n<ul>\r\n\t<li>Par le RER A, station Rueil-Malmaison</li>\r\n</ul>\r\n\r\n<p>Sortie num&eacute;ro 1 &quot;Rue des Deux Gares&quot;</p>\r\n\r\n<p>Maison Fournaise &agrave; 700 m&egrave;tres : prendre direction Chatou, marcher jusqu&rsquo;au pont. Au milieu du pont, descendre &agrave; droite sur l&rsquo;Ile. Hameau Fournaise &agrave; 30 m&egrave;tres.</p>\r\n\r\n<ul>\r\n\t<li>Par le RER A, station Chatou-Croissy</li>\r\n</ul>\r\n\r\n<p>Maison Fournaise &agrave; 900 m&egrave;tres</p>\r\n\r\n<p><strong>Attention : le mus&eacute;e n&#39;est pas encore adapt&eacute; aux personnes &agrave; mobilit&eacute; r&eacute;duite. Seuls l&#39;accueil et l&#39;espace boutique situ&eacute;s au rez-de-chauss&eacute;e sont accessibles.</strong></p>
2	8	<p><strong>Comment y arriver?</strong></p>\r\n\r\n<p>Vous pouvez commencer votre promenade par la Maison Fournaise sur l&rsquo;&Icirc;le des Impressionnistes ou par la Gare RER de Chatou/Croissy.</p>\r\n\r\n<p>&Icirc;le des Impressionnistes&nbsp;: par le RER Ligne A, station Rueil-Malmaison. Emprunter le pont de Chatou en restant sur la droite et descendre sur l&rsquo;&Icirc;le des Impressionnistes.</p>
\.


--
-- Name: chatou_auto_transport_transport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lionhart
--

SELECT pg_catalog.setval('public.chatou_auto_transport_transport_id_seq', 2, true);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: lionhart
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lionhart
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: lionhart
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	user
3	auth	permission
4	auth	group
5	contenttypes	contenttype
6	sessions	session
7	chatou_auto	menu
8	chatou_auto	itinerary
9	chatou_auto	images
10	chatou_auto	menu_images
11	chatou_auto	lieu
12	chatou_auto	page_description
13	chatou_auto	page
14	chatou_auto	bar
15	chatou_auto	childrenentertainment
16	chatou_auto	resturant
17	chatou_auto	map
18	chatou_auto	shopping
19	chatou_auto	page_image_order
20	chatou_auto	toilets
21	chatou_auto	page_before_after_image_order
22	chatou_auto	burger_menu_ordering
23	chatou_auto	itinerary_color_scheme
24	chatou_auto	audios
25	chatou_auto	audio_page
26	chatou_auto	map_controls
27	chatou_auto	tickets
28	chatou_auto	opening_hours
29	chatou_auto	transport
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lionhart
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 29, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: lionhart
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-12-13 13:36:18.235785+08
2	auth	0001_initial	2019-12-13 13:36:18.270076+08
3	admin	0001_initial	2019-12-13 13:36:18.325744+08
4	admin	0002_logentry_remove_auto_add	2019-12-13 13:36:18.339044+08
5	admin	0003_logentry_add_action_flag_choices	2019-12-13 13:36:18.347079+08
6	contenttypes	0002_remove_content_type_name	2019-12-13 13:36:18.361541+08
7	auth	0002_alter_permission_name_max_length	2019-12-13 13:36:18.365707+08
8	auth	0003_alter_user_email_max_length	2019-12-13 13:36:18.373024+08
9	auth	0004_alter_user_username_opts	2019-12-13 13:36:18.379862+08
10	auth	0005_alter_user_last_login_null	2019-12-13 13:36:18.387135+08
11	auth	0006_require_contenttypes_0002	2019-12-13 13:36:18.388841+08
12	auth	0007_alter_validators_add_error_messages	2019-12-13 13:36:18.395759+08
13	auth	0008_alter_user_username_max_length	2019-12-13 13:36:18.406981+08
14	auth	0009_alter_user_last_name_max_length	2019-12-13 13:36:18.414312+08
15	auth	0010_alter_group_name_max_length	2019-12-13 13:36:18.421242+08
16	auth	0011_update_proxy_permissions	2019-12-13 13:36:18.428168+08
17	sessions	0001_initial	2019-12-13 13:36:18.435608+08
18	chatou_auto	0001_initial	2020-02-13 12:34:05.73761+08
19	chatou_auto	0002_menu	2020-02-13 12:34:05.748467+08
20	chatou_auto	0003_images	2020-02-19 23:07:02.83406+08
32	chatou_auto	0004_auto_20200222_0715	2020-02-22 15:15:53.304132+08
33	chatou_auto	0005_auto_20200223_1628	2020-02-24 00:30:51.405368+08
34	chatou_auto	0006_auto_20200223_2234	2020-02-24 06:35:00.687374+08
35	chatou_auto	0007_auto_20200224_0829	2020-02-24 16:29:18.185571+08
36	chatou_auto	0008_auto_20200224_1340	2020-02-24 21:40:55.82012+08
37	chatou_auto	0009_page_image_order	2020-02-28 02:06:55.296819+08
38	chatou_auto	0010_auto_20200227_1825	2020-02-28 02:26:56.468475+08
39	chatou_auto	0011_toilets	2020-02-29 21:07:44.118963+08
40	chatou_auto	0012_auto_20200303_1831	2020-03-04 02:32:09.365259+08
41	chatou_auto	0013_itinerary_itinerary_type	2020-03-11 10:56:04.767983+08
42	chatou_auto	0014_page_page_summary	2020-03-11 16:28:23.10113+08
43	chatou_auto	0015_auto_20200312_0751	2020-03-12 15:51:29.914777+08
44	chatou_auto	0016_burger_menu_ordering	2020-03-16 10:06:24.499433+08
45	chatou_auto	0017_auto_20200316_0209	2020-03-16 10:10:05.802045+08
46	chatou_auto	0018_itinerary_is_visible_on_homepage	2020-03-25 01:03:18.491143+08
47	chatou_auto	0019_itinerary_color_scheme	2020-03-26 00:42:05.09265+08
48	chatou_auto	0020_audios	2020-04-04 01:20:42.059593+08
49	chatou_auto	0021_auto_20200403_1837	2020-04-04 02:37:20.085586+08
50	chatou_auto	0022_audio_page	2020-04-04 06:44:24.534842+08
51	chatou_auto	0023_map_controls	2020-04-11 09:37:49.227253+08
52	chatou_auto	0024_auto_20200411_0139	2020-04-11 09:39:33.241064+08
53	chatou_auto	0025_opening_hours_tickets_transport	2020-04-17 17:22:49.887108+08
54	chatou_auto	0026_auto_20200425_0857	2020-04-25 16:58:25.533774+08
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lionhart
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 54, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: lionhart
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: chatou_auto_audio_page chatou_auto_audio_page_pkey; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_audio_page
    ADD CONSTRAINT chatou_auto_audio_page_pkey PRIMARY KEY (ap_id);


--
-- Name: chatou_auto_audios chatou_auto_audios_pkey; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_audios
    ADD CONSTRAINT chatou_auto_audios_pkey PRIMARY KEY (audio_id);


--
-- Name: chatou_auto_bar chatou_auto_bar_pkey; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_bar
    ADD CONSTRAINT chatou_auto_bar_pkey PRIMARY KEY ("Bar_id");


--
-- Name: chatou_auto_burger_menu_ordering chatou_auto_burger_menu_ordering_pkey; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_burger_menu_ordering
    ADD CONSTRAINT chatou_auto_burger_menu_ordering_pkey PRIMARY KEY ("BMO_id");


--
-- Name: chatou_auto_childrenentertainment chatou_auto_childrenentertainment_pkey; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_childrenentertainment
    ADD CONSTRAINT chatou_auto_childrenentertainment_pkey PRIMARY KEY ("CE_id");


--
-- Name: chatou_auto_images chatou_auto_images_pkey; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_images
    ADD CONSTRAINT chatou_auto_images_pkey PRIMARY KEY (image_id);


--
-- Name: chatou_auto_itinerary_color_scheme chatou_auto_itinerary_color_scheme_pkey; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_itinerary_color_scheme
    ADD CONSTRAINT chatou_auto_itinerary_color_scheme_pkey PRIMARY KEY ("ICS_id");


--
-- Name: chatou_auto_itinerary chatou_auto_itinerary_pkey; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_itinerary
    ADD CONSTRAINT chatou_auto_itinerary_pkey PRIMARY KEY (itinerary_id);


--
-- Name: chatou_auto_lieu chatou_auto_lieu_pkey; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_lieu
    ADD CONSTRAINT chatou_auto_lieu_pkey PRIMARY KEY ("Lieu_id");


--
-- Name: chatou_auto_map_controls chatou_auto_map_controls_pkey; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_map_controls
    ADD CONSTRAINT chatou_auto_map_controls_pkey PRIMARY KEY ("MC_id");


--
-- Name: chatou_auto_map chatou_auto_map_pkey; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_map
    ADD CONSTRAINT chatou_auto_map_pkey PRIMARY KEY (page_id);


--
-- Name: chatou_auto_menu chatou_auto_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_menu
    ADD CONSTRAINT chatou_auto_menu_pkey PRIMARY KEY (menu_id);


--
-- Name: chatou_auto_opening_hours chatou_auto_opening_hours_pkey; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_opening_hours
    ADD CONSTRAINT chatou_auto_opening_hours_pkey PRIMARY KEY (oh_id);


--
-- Name: chatou_auto_page_before_after_image_order chatou_auto_page_before_after_image_order_pkey; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_page_before_after_image_order
    ADD CONSTRAINT chatou_auto_page_before_after_image_order_pkey PRIMARY KEY ("PD_id");


--
-- Name: chatou_auto_page_description chatou_auto_page_description_pkey; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_page_description
    ADD CONSTRAINT chatou_auto_page_description_pkey PRIMARY KEY ("PD_id");


--
-- Name: chatou_auto_page_image_order chatou_auto_page_image_order_pkey; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_page_image_order
    ADD CONSTRAINT chatou_auto_page_image_order_pkey PRIMARY KEY ("PD_id");


--
-- Name: chatou_auto_page chatou_auto_page_pkey; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_page
    ADD CONSTRAINT chatou_auto_page_pkey PRIMARY KEY (page_id);


--
-- Name: chatou_auto_resturant chatou_auto_resturant_pkey; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_resturant
    ADD CONSTRAINT chatou_auto_resturant_pkey PRIMARY KEY ("Resturant_id");


--
-- Name: chatou_auto_shopping chatou_auto_shopping_pkey; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_shopping
    ADD CONSTRAINT chatou_auto_shopping_pkey PRIMARY KEY ("Shopping_id");


--
-- Name: chatou_auto_tickets chatou_auto_tickets_pkey; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_tickets
    ADD CONSTRAINT chatou_auto_tickets_pkey PRIMARY KEY (tickets_id);


--
-- Name: chatou_auto_toilets chatou_auto_toilets_pkey; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_toilets
    ADD CONSTRAINT chatou_auto_toilets_pkey PRIMARY KEY ("Toilet_id");


--
-- Name: chatou_auto_transport chatou_auto_transport_pkey; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_transport
    ADD CONSTRAINT chatou_auto_transport_pkey PRIMARY KEY (transport_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: chatou_auto_audio_page_audio_id_842a572a; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX chatou_auto_audio_page_audio_id_842a572a ON public.chatou_auto_audio_page USING btree (audio_id);


--
-- Name: chatou_auto_audio_page_page_description_id_1b825212; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX chatou_auto_audio_page_page_description_id_1b825212 ON public.chatou_auto_audio_page USING btree (page_description_id);


--
-- Name: chatou_auto_bar_Page_id_e328a6c2; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX "chatou_auto_bar_Page_id_e328a6c2" ON public.chatou_auto_bar USING btree ("Page_id");


--
-- Name: chatou_auto_burger_menu_ordering_itinerary_id_f73ca8af; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX chatou_auto_burger_menu_ordering_itinerary_id_f73ca8af ON public.chatou_auto_burger_menu_ordering USING btree (itinerary_id);


--
-- Name: chatou_auto_burger_menu_ordering_menu_id_281ca546; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX chatou_auto_burger_menu_ordering_menu_id_281ca546 ON public.chatou_auto_burger_menu_ordering USING btree (menu_id);


--
-- Name: chatou_auto_childrenentertainment_Page_id_cc2a2b10; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX "chatou_auto_childrenentertainment_Page_id_cc2a2b10" ON public.chatou_auto_childrenentertainment USING btree ("Page_id");


--
-- Name: chatou_auto_itinerary_color_scheme_itinerary_id_88b2ed4f; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX chatou_auto_itinerary_color_scheme_itinerary_id_88b2ed4f ON public.chatou_auto_itinerary_color_scheme USING btree (itinerary_id);


--
-- Name: chatou_auto_lieu_Page_id_adeb0419; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX "chatou_auto_lieu_Page_id_adeb0419" ON public.chatou_auto_lieu USING btree ("Page_id");


--
-- Name: chatou_auto_map_Page_id_fdbe82c7; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX "chatou_auto_map_Page_id_fdbe82c7" ON public.chatou_auto_map USING btree ("Page_id");


--
-- Name: chatou_auto_map_itinerary_id_476b16a3; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX chatou_auto_map_itinerary_id_476b16a3 ON public.chatou_auto_map USING btree (itinerary_id);


--
-- Name: chatou_auto_map_map_images_id_bca55e24; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX chatou_auto_map_map_images_id_bca55e24 ON public.chatou_auto_map USING btree (map_images_id);


--
-- Name: chatou_auto_menu_itinerary_id_7246fdb6; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX chatou_auto_menu_itinerary_id_7246fdb6 ON public.chatou_auto_menu USING btree (itinerary_id);


--
-- Name: chatou_auto_menu_menu_images_id_e0044862; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX chatou_auto_menu_menu_images_id_e0044862 ON public.chatou_auto_menu USING btree (menu_images_id);


--
-- Name: chatou_auto_opening_hours_Page_id_b30c7773; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX "chatou_auto_opening_hours_Page_id_b30c7773" ON public.chatou_auto_opening_hours USING btree ("Page_id");


--
-- Name: chatou_auto_page_before_af_page_description_id_6d806adb; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX chatou_auto_page_before_af_page_description_id_6d806adb ON public.chatou_auto_page_before_after_image_order USING btree (page_description_id);


--
-- Name: chatou_auto_page_before_af_page_image_after_id_503f7939; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX chatou_auto_page_before_af_page_image_after_id_503f7939 ON public.chatou_auto_page_before_after_image_order USING btree (page_image_after_id);


--
-- Name: chatou_auto_page_before_af_page_image_before_id_c152cb1b; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX chatou_auto_page_before_af_page_image_before_id_c152cb1b ON public.chatou_auto_page_before_after_image_order USING btree (page_image_before_id);


--
-- Name: chatou_auto_page_description_page_id_fdff6690; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX chatou_auto_page_description_page_id_fdff6690 ON public.chatou_auto_page_description USING btree (page_id);


--
-- Name: chatou_auto_page_description_page_map_id_d29c43f8; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX chatou_auto_page_description_page_map_id_d29c43f8 ON public.chatou_auto_page_description USING btree (page_map_id);


--
-- Name: chatou_auto_page_description_page_title_image_id_886fd950; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX chatou_auto_page_description_page_title_image_id_886fd950 ON public.chatou_auto_page_description USING btree (page_title_image_id);


--
-- Name: chatou_auto_page_image_order_page_description_id_35056f50; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX chatou_auto_page_image_order_page_description_id_35056f50 ON public.chatou_auto_page_image_order USING btree (page_description_id);


--
-- Name: chatou_auto_page_image_order_page_image_id_cf5c8e9b; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX chatou_auto_page_image_order_page_image_id_cf5c8e9b ON public.chatou_auto_page_image_order USING btree (page_image_id);


--
-- Name: chatou_auto_page_itinerary_id_51de4512; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX chatou_auto_page_itinerary_id_51de4512 ON public.chatou_auto_page USING btree (itinerary_id);


--
-- Name: chatou_auto_resturant_Page_id_7abce456; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX "chatou_auto_resturant_Page_id_7abce456" ON public.chatou_auto_resturant USING btree ("Page_id");


--
-- Name: chatou_auto_shopping_Page_id_e5f2d7ad; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX "chatou_auto_shopping_Page_id_e5f2d7ad" ON public.chatou_auto_shopping USING btree ("Page_id");


--
-- Name: chatou_auto_tickets_Page_id_51d6c8cb; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX "chatou_auto_tickets_Page_id_51d6c8cb" ON public.chatou_auto_tickets USING btree ("Page_id");


--
-- Name: chatou_auto_toilets_Page_id_043c35a2; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX "chatou_auto_toilets_Page_id_043c35a2" ON public.chatou_auto_toilets USING btree ("Page_id");


--
-- Name: chatou_auto_transport_Page_id_a8e2c892; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX "chatou_auto_transport_Page_id_a8e2c892" ON public.chatou_auto_transport USING btree ("Page_id");


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: chatou_auto_audio_page chatou_auto_audio_pa_audio_id_842a572a_fk_chatou_au; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_audio_page
    ADD CONSTRAINT chatou_auto_audio_pa_audio_id_842a572a_fk_chatou_au FOREIGN KEY (audio_id) REFERENCES public.chatou_auto_audios(audio_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: chatou_auto_audio_page chatou_auto_audio_pa_page_description_id_1b825212_fk_chatou_au; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_audio_page
    ADD CONSTRAINT chatou_auto_audio_pa_page_description_id_1b825212_fk_chatou_au FOREIGN KEY (page_description_id) REFERENCES public.chatou_auto_page_description("PD_id") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: chatou_auto_bar chatou_auto_bar_Page_id_e328a6c2_fk_chatou_auto_page_page_id; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_bar
    ADD CONSTRAINT "chatou_auto_bar_Page_id_e328a6c2_fk_chatou_auto_page_page_id" FOREIGN KEY ("Page_id") REFERENCES public.chatou_auto_page(page_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: chatou_auto_burger_menu_ordering chatou_auto_burger_m_itinerary_id_f73ca8af_fk_chatou_au; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_burger_menu_ordering
    ADD CONSTRAINT chatou_auto_burger_m_itinerary_id_f73ca8af_fk_chatou_au FOREIGN KEY (itinerary_id) REFERENCES public.chatou_auto_itinerary(itinerary_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: chatou_auto_burger_menu_ordering chatou_auto_burger_m_menu_id_281ca546_fk_chatou_au; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_burger_menu_ordering
    ADD CONSTRAINT chatou_auto_burger_m_menu_id_281ca546_fk_chatou_au FOREIGN KEY (menu_id) REFERENCES public.chatou_auto_menu(menu_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: chatou_auto_childrenentertainment chatou_auto_children_Page_id_cc2a2b10_fk_chatou_au; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_childrenentertainment
    ADD CONSTRAINT "chatou_auto_children_Page_id_cc2a2b10_fk_chatou_au" FOREIGN KEY ("Page_id") REFERENCES public.chatou_auto_page(page_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: chatou_auto_itinerary_color_scheme chatou_auto_itinerar_itinerary_id_88b2ed4f_fk_chatou_au; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_itinerary_color_scheme
    ADD CONSTRAINT chatou_auto_itinerar_itinerary_id_88b2ed4f_fk_chatou_au FOREIGN KEY (itinerary_id) REFERENCES public.chatou_auto_itinerary(itinerary_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: chatou_auto_lieu chatou_auto_lieu_Page_id_adeb0419_fk_chatou_auto_page_page_id; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_lieu
    ADD CONSTRAINT "chatou_auto_lieu_Page_id_adeb0419_fk_chatou_auto_page_page_id" FOREIGN KEY ("Page_id") REFERENCES public.chatou_auto_page(page_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: chatou_auto_map chatou_auto_map_Page_id_fdbe82c7_fk_chatou_auto_page_page_id; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_map
    ADD CONSTRAINT "chatou_auto_map_Page_id_fdbe82c7_fk_chatou_auto_page_page_id" FOREIGN KEY ("Page_id") REFERENCES public.chatou_auto_page(page_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: chatou_auto_map chatou_auto_map_itinerary_id_476b16a3_fk_chatou_au; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_map
    ADD CONSTRAINT chatou_auto_map_itinerary_id_476b16a3_fk_chatou_au FOREIGN KEY (itinerary_id) REFERENCES public.chatou_auto_itinerary(itinerary_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: chatou_auto_map chatou_auto_map_map_images_id_bca55e24_fk_chatou_au; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_map
    ADD CONSTRAINT chatou_auto_map_map_images_id_bca55e24_fk_chatou_au FOREIGN KEY (map_images_id) REFERENCES public.chatou_auto_images(image_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: chatou_auto_menu chatou_auto_menu_itinerary_id_7246fdb6_fk_chatou_au; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_menu
    ADD CONSTRAINT chatou_auto_menu_itinerary_id_7246fdb6_fk_chatou_au FOREIGN KEY (itinerary_id) REFERENCES public.chatou_auto_itinerary(itinerary_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: chatou_auto_menu chatou_auto_menu_menu_images_id_e0044862_fk_chatou_au; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_menu
    ADD CONSTRAINT chatou_auto_menu_menu_images_id_e0044862_fk_chatou_au FOREIGN KEY (menu_images_id) REFERENCES public.chatou_auto_images(image_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: chatou_auto_opening_hours chatou_auto_opening__Page_id_b30c7773_fk_chatou_au; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_opening_hours
    ADD CONSTRAINT "chatou_auto_opening__Page_id_b30c7773_fk_chatou_au" FOREIGN KEY ("Page_id") REFERENCES public.chatou_auto_page(page_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: chatou_auto_page_before_after_image_order chatou_auto_page_bef_page_description_id_6d806adb_fk_chatou_au; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_page_before_after_image_order
    ADD CONSTRAINT chatou_auto_page_bef_page_description_id_6d806adb_fk_chatou_au FOREIGN KEY (page_description_id) REFERENCES public.chatou_auto_page_description("PD_id") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: chatou_auto_page_before_after_image_order chatou_auto_page_bef_page_image_after_id_503f7939_fk_chatou_au; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_page_before_after_image_order
    ADD CONSTRAINT chatou_auto_page_bef_page_image_after_id_503f7939_fk_chatou_au FOREIGN KEY (page_image_after_id) REFERENCES public.chatou_auto_images(image_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: chatou_auto_page_before_after_image_order chatou_auto_page_bef_page_image_before_id_c152cb1b_fk_chatou_au; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_page_before_after_image_order
    ADD CONSTRAINT chatou_auto_page_bef_page_image_before_id_c152cb1b_fk_chatou_au FOREIGN KEY (page_image_before_id) REFERENCES public.chatou_auto_images(image_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: chatou_auto_page_description chatou_auto_page_des_page_id_fdff6690_fk_chatou_au; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_page_description
    ADD CONSTRAINT chatou_auto_page_des_page_id_fdff6690_fk_chatou_au FOREIGN KEY (page_id) REFERENCES public.chatou_auto_page(page_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: chatou_auto_page_description chatou_auto_page_des_page_map_id_d29c43f8_fk_chatou_au; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_page_description
    ADD CONSTRAINT chatou_auto_page_des_page_map_id_d29c43f8_fk_chatou_au FOREIGN KEY (page_map_id) REFERENCES public.chatou_auto_map(page_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: chatou_auto_page_description chatou_auto_page_des_page_title_image_id_886fd950_fk_chatou_au; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_page_description
    ADD CONSTRAINT chatou_auto_page_des_page_title_image_id_886fd950_fk_chatou_au FOREIGN KEY (page_title_image_id) REFERENCES public.chatou_auto_images(image_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: chatou_auto_page_image_order chatou_auto_page_ima_page_description_id_35056f50_fk_chatou_au; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_page_image_order
    ADD CONSTRAINT chatou_auto_page_ima_page_description_id_35056f50_fk_chatou_au FOREIGN KEY (page_description_id) REFERENCES public.chatou_auto_page_description("PD_id") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: chatou_auto_page_image_order chatou_auto_page_ima_page_image_id_cf5c8e9b_fk_chatou_au; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_page_image_order
    ADD CONSTRAINT chatou_auto_page_ima_page_image_id_cf5c8e9b_fk_chatou_au FOREIGN KEY (page_image_id) REFERENCES public.chatou_auto_images(image_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: chatou_auto_page chatou_auto_page_itinerary_id_51de4512_fk_chatou_au; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_page
    ADD CONSTRAINT chatou_auto_page_itinerary_id_51de4512_fk_chatou_au FOREIGN KEY (itinerary_id) REFERENCES public.chatou_auto_itinerary(itinerary_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: chatou_auto_resturant chatou_auto_resturan_Page_id_7abce456_fk_chatou_au; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_resturant
    ADD CONSTRAINT "chatou_auto_resturan_Page_id_7abce456_fk_chatou_au" FOREIGN KEY ("Page_id") REFERENCES public.chatou_auto_page(page_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: chatou_auto_shopping chatou_auto_shopping_Page_id_e5f2d7ad_fk_chatou_au; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_shopping
    ADD CONSTRAINT "chatou_auto_shopping_Page_id_e5f2d7ad_fk_chatou_au" FOREIGN KEY ("Page_id") REFERENCES public.chatou_auto_page(page_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: chatou_auto_tickets chatou_auto_tickets_Page_id_51d6c8cb_fk_chatou_au; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_tickets
    ADD CONSTRAINT "chatou_auto_tickets_Page_id_51d6c8cb_fk_chatou_au" FOREIGN KEY ("Page_id") REFERENCES public.chatou_auto_page(page_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: chatou_auto_toilets chatou_auto_toilets_Page_id_043c35a2_fk_chatou_au; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_toilets
    ADD CONSTRAINT "chatou_auto_toilets_Page_id_043c35a2_fk_chatou_au" FOREIGN KEY ("Page_id") REFERENCES public.chatou_auto_page(page_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: chatou_auto_transport chatou_auto_transpor_Page_id_a8e2c892_fk_chatou_au; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.chatou_auto_transport
    ADD CONSTRAINT "chatou_auto_transpor_Page_id_a8e2c892_fk_chatou_au" FOREIGN KEY ("Page_id") REFERENCES public.chatou_auto_page(page_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

