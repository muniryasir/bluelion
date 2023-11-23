--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.20
-- Dumped by pg_dump version 9.6.20

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
-- Name: commune_de_paris_cdp_audio_page; Type: TABLE; Schema: public; Owner: lionhart
--

CREATE TABLE public.commune_de_paris_cdp_audio_page (
    ap_id integer NOT NULL,
    audio_appearnce_order integer NOT NULL,
    is_audio_present_on_page boolean NOT NULL,
    audio_id integer NOT NULL,
    page_description_id integer NOT NULL
);


ALTER TABLE public.commune_de_paris_cdp_audio_page OWNER TO lionhart;

--
-- Name: commune_de_paris_cdp_audio_page_ap_id_seq; Type: SEQUENCE; Schema: public; Owner: lionhart
--

CREATE SEQUENCE public.commune_de_paris_cdp_audio_page_ap_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.commune_de_paris_cdp_audio_page_ap_id_seq OWNER TO lionhart;

--
-- Name: commune_de_paris_cdp_audio_page_ap_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lionhart
--

ALTER SEQUENCE public.commune_de_paris_cdp_audio_page_ap_id_seq OWNED BY public.commune_de_paris_cdp_audio_page.ap_id;


--
-- Name: commune_de_paris_cdp_audios; Type: TABLE; Schema: public; Owner: lionhart
--

CREATE TABLE public.commune_de_paris_cdp_audios (
    audio_id integer NOT NULL,
    audio_title character varying(520) NOT NULL,
    audio_description text NOT NULL,
    audio_file character varying(100) NOT NULL
);


ALTER TABLE public.commune_de_paris_cdp_audios OWNER TO lionhart;

--
-- Name: commune_de_paris_cdp_audios_audio_id_seq; Type: SEQUENCE; Schema: public; Owner: lionhart
--

CREATE SEQUENCE public.commune_de_paris_cdp_audios_audio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.commune_de_paris_cdp_audios_audio_id_seq OWNER TO lionhart;

--
-- Name: commune_de_paris_cdp_audios_audio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lionhart
--

ALTER SEQUENCE public.commune_de_paris_cdp_audios_audio_id_seq OWNED BY public.commune_de_paris_cdp_audios.audio_id;


--
-- Name: commune_de_paris_cdp_bar; Type: TABLE; Schema: public; Owner: lionhart
--

CREATE TABLE public.commune_de_paris_cdp_bar (
    "Bar_id" integer NOT NULL,
    "Bar_Address" character varying(520) NOT NULL,
    "Bar_Comment" character varying(520) NOT NULL,
    "Page_id" integer NOT NULL
);


ALTER TABLE public.commune_de_paris_cdp_bar OWNER TO lionhart;

--
-- Name: commune_de_paris_cdp_bar_Bar_id_seq; Type: SEQUENCE; Schema: public; Owner: lionhart
--

CREATE SEQUENCE public."commune_de_paris_cdp_bar_Bar_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."commune_de_paris_cdp_bar_Bar_id_seq" OWNER TO lionhart;

--
-- Name: commune_de_paris_cdp_bar_Bar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lionhart
--

ALTER SEQUENCE public."commune_de_paris_cdp_bar_Bar_id_seq" OWNED BY public.commune_de_paris_cdp_bar."Bar_id";


--
-- Name: commune_de_paris_cdp_burger_menu_ordering; Type: TABLE; Schema: public; Owner: lionhart
--

CREATE TABLE public.commune_de_paris_cdp_burger_menu_ordering (
    "BMO_id" integer NOT NULL,
    appearnce_order_in_burger_menu integer NOT NULL,
    itinerary_id integer NOT NULL,
    menu_id integer
);


ALTER TABLE public.commune_de_paris_cdp_burger_menu_ordering OWNER TO lionhart;

--
-- Name: commune_de_paris_cdp_burger_menu_ordering_BMO_id_seq; Type: SEQUENCE; Schema: public; Owner: lionhart
--

CREATE SEQUENCE public."commune_de_paris_cdp_burger_menu_ordering_BMO_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."commune_de_paris_cdp_burger_menu_ordering_BMO_id_seq" OWNER TO lionhart;

--
-- Name: commune_de_paris_cdp_burger_menu_ordering_BMO_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lionhart
--

ALTER SEQUENCE public."commune_de_paris_cdp_burger_menu_ordering_BMO_id_seq" OWNED BY public.commune_de_paris_cdp_burger_menu_ordering."BMO_id";


--
-- Name: commune_de_paris_cdp_childrenentertainment; Type: TABLE; Schema: public; Owner: lionhart
--

CREATE TABLE public.commune_de_paris_cdp_childrenentertainment (
    "CE_id" integer NOT NULL,
    "CE_Address" character varying(520) NOT NULL,
    "CE_Comment" character varying(520) NOT NULL,
    "Page_id" integer NOT NULL
);


ALTER TABLE public.commune_de_paris_cdp_childrenentertainment OWNER TO lionhart;

--
-- Name: commune_de_paris_cdp_childrenentertainment_CE_id_seq; Type: SEQUENCE; Schema: public; Owner: lionhart
--

CREATE SEQUENCE public."commune_de_paris_cdp_childrenentertainment_CE_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."commune_de_paris_cdp_childrenentertainment_CE_id_seq" OWNER TO lionhart;

--
-- Name: commune_de_paris_cdp_childrenentertainment_CE_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lionhart
--

ALTER SEQUENCE public."commune_de_paris_cdp_childrenentertainment_CE_id_seq" OWNED BY public.commune_de_paris_cdp_childrenentertainment."CE_id";


--
-- Name: commune_de_paris_cdp_images; Type: TABLE; Schema: public; Owner: lionhart
--

CREATE TABLE public.commune_de_paris_cdp_images (
    image_id integer NOT NULL,
    filename character varying(300) NOT NULL,
    image_name character varying(1000) NOT NULL,
    long_description text NOT NULL,
    short_description text NOT NULL,
    image_type character varying(520) NOT NULL,
    "Page_id" integer
);


ALTER TABLE public.commune_de_paris_cdp_images OWNER TO lionhart;

--
-- Name: commune_de_paris_cdp_images_image_id_seq; Type: SEQUENCE; Schema: public; Owner: lionhart
--

CREATE SEQUENCE public.commune_de_paris_cdp_images_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.commune_de_paris_cdp_images_image_id_seq OWNER TO lionhart;

--
-- Name: commune_de_paris_cdp_images_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lionhart
--

ALTER SEQUENCE public.commune_de_paris_cdp_images_image_id_seq OWNED BY public.commune_de_paris_cdp_images.image_id;


--
-- Name: commune_de_paris_cdp_itinerary; Type: TABLE; Schema: public; Owner: lionhart
--

CREATE TABLE public.commune_de_paris_cdp_itinerary (
    itinerary_id integer NOT NULL,
    itinerary_name character varying(520) NOT NULL,
    itinerary_steps integer NOT NULL,
    itinerary_type character varying(520) NOT NULL,
    is_visible_on_homepage boolean NOT NULL
);


ALTER TABLE public.commune_de_paris_cdp_itinerary OWNER TO lionhart;

--
-- Name: commune_de_paris_cdp_itinerary_color_scheme; Type: TABLE; Schema: public; Owner: lionhart
--

CREATE TABLE public.commune_de_paris_cdp_itinerary_color_scheme (
    "ICS_id" integer NOT NULL,
    itinerary_colors character varying(520) NOT NULL,
    itinerary_id integer
);


ALTER TABLE public.commune_de_paris_cdp_itinerary_color_scheme OWNER TO lionhart;

--
-- Name: commune_de_paris_cdp_itinerary_color_scheme_ICS_id_seq; Type: SEQUENCE; Schema: public; Owner: lionhart
--

CREATE SEQUENCE public."commune_de_paris_cdp_itinerary_color_scheme_ICS_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."commune_de_paris_cdp_itinerary_color_scheme_ICS_id_seq" OWNER TO lionhart;

--
-- Name: commune_de_paris_cdp_itinerary_color_scheme_ICS_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lionhart
--

ALTER SEQUENCE public."commune_de_paris_cdp_itinerary_color_scheme_ICS_id_seq" OWNED BY public.commune_de_paris_cdp_itinerary_color_scheme."ICS_id";


--
-- Name: commune_de_paris_cdp_itinerary_itinerary_id_seq; Type: SEQUENCE; Schema: public; Owner: lionhart
--

CREATE SEQUENCE public.commune_de_paris_cdp_itinerary_itinerary_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.commune_de_paris_cdp_itinerary_itinerary_id_seq OWNER TO lionhart;

--
-- Name: commune_de_paris_cdp_itinerary_itinerary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lionhart
--

ALTER SEQUENCE public.commune_de_paris_cdp_itinerary_itinerary_id_seq OWNED BY public.commune_de_paris_cdp_itinerary.itinerary_id;


--
-- Name: commune_de_paris_cdp_lieu; Type: TABLE; Schema: public; Owner: lionhart
--

CREATE TABLE public.commune_de_paris_cdp_lieu (
    "Lieu_id" integer NOT NULL,
    "Lieu_Address" character varying(520) NOT NULL,
    "Lieu_Comment" character varying(520) NOT NULL,
    "Page_id" integer NOT NULL
);


ALTER TABLE public.commune_de_paris_cdp_lieu OWNER TO lionhart;

--
-- Name: commune_de_paris_cdp_lieu_Lieu_id_seq; Type: SEQUENCE; Schema: public; Owner: lionhart
--

CREATE SEQUENCE public."commune_de_paris_cdp_lieu_Lieu_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."commune_de_paris_cdp_lieu_Lieu_id_seq" OWNER TO lionhart;

--
-- Name: commune_de_paris_cdp_lieu_Lieu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lionhart
--

ALTER SEQUENCE public."commune_de_paris_cdp_lieu_Lieu_id_seq" OWNED BY public.commune_de_paris_cdp_lieu."Lieu_id";


--
-- Name: commune_de_paris_cdp_map; Type: TABLE; Schema: public; Owner: lionhart
--

CREATE TABLE public.commune_de_paris_cdp_map (
    page_id integer NOT NULL,
    lat character varying(520) NOT NULL,
    longt character varying(520) NOT NULL,
    "Page_id" integer NOT NULL,
    itinerary_id integer NOT NULL,
    map_images_id integer,
    geo_coordinates character varying(520)
);


ALTER TABLE public.commune_de_paris_cdp_map OWNER TO lionhart;

--
-- Name: commune_de_paris_cdp_map_controls; Type: TABLE; Schema: public; Owner: lionhart
--

CREATE TABLE public.commune_de_paris_cdp_map_controls (
    "MC_id" integer NOT NULL,
    zoom_for_home numeric(3,1) NOT NULL,
    pin_zoom numeric(3,1) NOT NULL,
    itinerary_id integer,
    map_center character varying(520) NOT NULL
);


ALTER TABLE public.commune_de_paris_cdp_map_controls OWNER TO lionhart;

--
-- Name: commune_de_paris_cdp_map_controls_MC_id_seq; Type: SEQUENCE; Schema: public; Owner: lionhart
--

CREATE SEQUENCE public."commune_de_paris_cdp_map_controls_MC_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."commune_de_paris_cdp_map_controls_MC_id_seq" OWNER TO lionhart;

--
-- Name: commune_de_paris_cdp_map_controls_MC_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lionhart
--

ALTER SEQUENCE public."commune_de_paris_cdp_map_controls_MC_id_seq" OWNED BY public.commune_de_paris_cdp_map_controls."MC_id";


--
-- Name: commune_de_paris_cdp_map_page_id_seq; Type: SEQUENCE; Schema: public; Owner: lionhart
--

CREATE SEQUENCE public.commune_de_paris_cdp_map_page_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.commune_de_paris_cdp_map_page_id_seq OWNER TO lionhart;

--
-- Name: commune_de_paris_cdp_map_page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lionhart
--

ALTER SEQUENCE public.commune_de_paris_cdp_map_page_id_seq OWNED BY public.commune_de_paris_cdp_map.page_id;


--
-- Name: commune_de_paris_cdp_menu; Type: TABLE; Schema: public; Owner: lionhart
--

CREATE TABLE public.commune_de_paris_cdp_menu (
    menu_id integer NOT NULL,
    menu_title character varying(520) NOT NULL,
    menu_link character varying(520) NOT NULL,
    menu_type character varying(520) NOT NULL,
    itinerary_id integer NOT NULL,
    menu_images_id integer
);


ALTER TABLE public.commune_de_paris_cdp_menu OWNER TO lionhart;

--
-- Name: commune_de_paris_cdp_menu_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: lionhart
--

CREATE SEQUENCE public.commune_de_paris_cdp_menu_menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.commune_de_paris_cdp_menu_menu_id_seq OWNER TO lionhart;

--
-- Name: commune_de_paris_cdp_menu_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lionhart
--

ALTER SEQUENCE public.commune_de_paris_cdp_menu_menu_id_seq OWNED BY public.commune_de_paris_cdp_menu.menu_id;


--
-- Name: commune_de_paris_cdp_opening_hours; Type: TABLE; Schema: public; Owner: lionhart
--

CREATE TABLE public.commune_de_paris_cdp_opening_hours (
    oh_id integer NOT NULL,
    "oh_Details" character varying(520) NOT NULL,
    "oh_Comment" character varying(520) NOT NULL,
    "Page_id" integer NOT NULL
);


ALTER TABLE public.commune_de_paris_cdp_opening_hours OWNER TO lionhart;

--
-- Name: commune_de_paris_cdp_opening_hours_oh_id_seq; Type: SEQUENCE; Schema: public; Owner: lionhart
--

CREATE SEQUENCE public.commune_de_paris_cdp_opening_hours_oh_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.commune_de_paris_cdp_opening_hours_oh_id_seq OWNER TO lionhart;

--
-- Name: commune_de_paris_cdp_opening_hours_oh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lionhart
--

ALTER SEQUENCE public.commune_de_paris_cdp_opening_hours_oh_id_seq OWNED BY public.commune_de_paris_cdp_opening_hours.oh_id;


--
-- Name: commune_de_paris_cdp_page; Type: TABLE; Schema: public; Owner: lionhart
--

CREATE TABLE public.commune_de_paris_cdp_page (
    page_id integer NOT NULL,
    page_title character varying(520) NOT NULL,
    page_type character varying(520) NOT NULL,
    page_order integer,
    "page_Summary" character varying(100000) NOT NULL,
    itinerary_id integer NOT NULL,
    is_page_zero boolean NOT NULL,
    page_display_title character varying(520),
    show_display_title boolean NOT NULL
);


ALTER TABLE public.commune_de_paris_cdp_page OWNER TO lionhart;

--
-- Name: commune_de_paris_cdp_page_before_after_image_order; Type: TABLE; Schema: public; Owner: lionhart
--

CREATE TABLE public.commune_de_paris_cdp_page_before_after_image_order (
    "PD_id" integer NOT NULL,
    is_page_in_present boolean NOT NULL,
    appearnce_order_in_page integer NOT NULL,
    page_description_id integer NOT NULL,
    page_image_after_id integer NOT NULL,
    page_image_before_id integer NOT NULL
);


ALTER TABLE public.commune_de_paris_cdp_page_before_after_image_order OWNER TO lionhart;

--
-- Name: commune_de_paris_cdp_page_before_after_image_order_PD_id_seq; Type: SEQUENCE; Schema: public; Owner: lionhart
--

CREATE SEQUENCE public."commune_de_paris_cdp_page_before_after_image_order_PD_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."commune_de_paris_cdp_page_before_after_image_order_PD_id_seq" OWNER TO lionhart;

--
-- Name: commune_de_paris_cdp_page_before_after_image_order_PD_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lionhart
--

ALTER SEQUENCE public."commune_de_paris_cdp_page_before_after_image_order_PD_id_seq" OWNED BY public.commune_de_paris_cdp_page_before_after_image_order."PD_id";


--
-- Name: commune_de_paris_cdp_page_description; Type: TABLE; Schema: public; Owner: lionhart
--

CREATE TABLE public.commune_de_paris_cdp_page_description (
    "PD_id" integer NOT NULL,
    "page_Text" text NOT NULL,
    page_id integer NOT NULL,
    page_map_id integer,
    page_title_image_id integer,
    show_title_audio boolean NOT NULL
);


ALTER TABLE public.commune_de_paris_cdp_page_description OWNER TO lionhart;

--
-- Name: commune_de_paris_cdp_page_description_PD_id_seq; Type: SEQUENCE; Schema: public; Owner: lionhart
--

CREATE SEQUENCE public."commune_de_paris_cdp_page_description_PD_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."commune_de_paris_cdp_page_description_PD_id_seq" OWNER TO lionhart;

--
-- Name: commune_de_paris_cdp_page_description_PD_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lionhart
--

ALTER SEQUENCE public."commune_de_paris_cdp_page_description_PD_id_seq" OWNED BY public.commune_de_paris_cdp_page_description."PD_id";


--
-- Name: commune_de_paris_cdp_page_image_order; Type: TABLE; Schema: public; Owner: lionhart
--

CREATE TABLE public.commune_de_paris_cdp_page_image_order (
    "PD_id" integer NOT NULL,
    appearnce_order integer NOT NULL,
    is_page_present boolean NOT NULL,
    page_description_id integer NOT NULL,
    page_image_id integer NOT NULL
);


ALTER TABLE public.commune_de_paris_cdp_page_image_order OWNER TO lionhart;

--
-- Name: commune_de_paris_cdp_page_image_order_PD_id_seq; Type: SEQUENCE; Schema: public; Owner: lionhart
--

CREATE SEQUENCE public."commune_de_paris_cdp_page_image_order_PD_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."commune_de_paris_cdp_page_image_order_PD_id_seq" OWNER TO lionhart;

--
-- Name: commune_de_paris_cdp_page_image_order_PD_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lionhart
--

ALTER SEQUENCE public."commune_de_paris_cdp_page_image_order_PD_id_seq" OWNED BY public.commune_de_paris_cdp_page_image_order."PD_id";


--
-- Name: commune_de_paris_cdp_page_page_id_seq; Type: SEQUENCE; Schema: public; Owner: lionhart
--

CREATE SEQUENCE public.commune_de_paris_cdp_page_page_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.commune_de_paris_cdp_page_page_id_seq OWNER TO lionhart;

--
-- Name: commune_de_paris_cdp_page_page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lionhart
--

ALTER SEQUENCE public.commune_de_paris_cdp_page_page_id_seq OWNED BY public.commune_de_paris_cdp_page.page_id;


--
-- Name: commune_de_paris_cdp_resturant; Type: TABLE; Schema: public; Owner: lionhart
--

CREATE TABLE public.commune_de_paris_cdp_resturant (
    "Resturant_id" integer NOT NULL,
    "Resturant_Address" character varying(520) NOT NULL,
    "Resturant_Comment" character varying(520) NOT NULL,
    "Page_id" integer NOT NULL
);


ALTER TABLE public.commune_de_paris_cdp_resturant OWNER TO lionhart;

--
-- Name: commune_de_paris_cdp_resturant_Resturant_id_seq; Type: SEQUENCE; Schema: public; Owner: lionhart
--

CREATE SEQUENCE public."commune_de_paris_cdp_resturant_Resturant_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."commune_de_paris_cdp_resturant_Resturant_id_seq" OWNER TO lionhart;

--
-- Name: commune_de_paris_cdp_resturant_Resturant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lionhart
--

ALTER SEQUENCE public."commune_de_paris_cdp_resturant_Resturant_id_seq" OWNED BY public.commune_de_paris_cdp_resturant."Resturant_id";


--
-- Name: commune_de_paris_cdp_shopping; Type: TABLE; Schema: public; Owner: lionhart
--

CREATE TABLE public.commune_de_paris_cdp_shopping (
    "Shopping_id" integer NOT NULL,
    "Shopping_Address" character varying(520) NOT NULL,
    "Shopping_Comment" character varying(520) NOT NULL,
    "Page_id" integer NOT NULL
);


ALTER TABLE public.commune_de_paris_cdp_shopping OWNER TO lionhart;

--
-- Name: commune_de_paris_cdp_shopping_Shopping_id_seq; Type: SEQUENCE; Schema: public; Owner: lionhart
--

CREATE SEQUENCE public."commune_de_paris_cdp_shopping_Shopping_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."commune_de_paris_cdp_shopping_Shopping_id_seq" OWNER TO lionhart;

--
-- Name: commune_de_paris_cdp_shopping_Shopping_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lionhart
--

ALTER SEQUENCE public."commune_de_paris_cdp_shopping_Shopping_id_seq" OWNED BY public.commune_de_paris_cdp_shopping."Shopping_id";


--
-- Name: commune_de_paris_cdp_tickets; Type: TABLE; Schema: public; Owner: lionhart
--

CREATE TABLE public.commune_de_paris_cdp_tickets (
    tickets_id integer NOT NULL,
    "tickets_Details" character varying(520) NOT NULL,
    "tickets_Comment" character varying(520) NOT NULL,
    "Page_id" integer NOT NULL
);


ALTER TABLE public.commune_de_paris_cdp_tickets OWNER TO lionhart;

--
-- Name: commune_de_paris_cdp_tickets_tickets_id_seq; Type: SEQUENCE; Schema: public; Owner: lionhart
--

CREATE SEQUENCE public.commune_de_paris_cdp_tickets_tickets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.commune_de_paris_cdp_tickets_tickets_id_seq OWNER TO lionhart;

--
-- Name: commune_de_paris_cdp_tickets_tickets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lionhart
--

ALTER SEQUENCE public.commune_de_paris_cdp_tickets_tickets_id_seq OWNED BY public.commune_de_paris_cdp_tickets.tickets_id;


--
-- Name: commune_de_paris_cdp_toilets; Type: TABLE; Schema: public; Owner: lionhart
--

CREATE TABLE public.commune_de_paris_cdp_toilets (
    "Toilet_id" integer NOT NULL,
    "Toilet_Address" character varying(520) NOT NULL,
    "Toilet_Comment" character varying(520) NOT NULL,
    "Page_id" integer NOT NULL
);


ALTER TABLE public.commune_de_paris_cdp_toilets OWNER TO lionhart;

--
-- Name: commune_de_paris_cdp_toilets_Toilet_id_seq; Type: SEQUENCE; Schema: public; Owner: lionhart
--

CREATE SEQUENCE public."commune_de_paris_cdp_toilets_Toilet_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."commune_de_paris_cdp_toilets_Toilet_id_seq" OWNER TO lionhart;

--
-- Name: commune_de_paris_cdp_toilets_Toilet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lionhart
--

ALTER SEQUENCE public."commune_de_paris_cdp_toilets_Toilet_id_seq" OWNED BY public.commune_de_paris_cdp_toilets."Toilet_id";


--
-- Name: commune_de_paris_cdp_transport; Type: TABLE; Schema: public; Owner: lionhart
--

CREATE TABLE public.commune_de_paris_cdp_transport (
    transport_id integer NOT NULL,
    "transport_Details" character varying(520) NOT NULL,
    "transport_Comment" character varying(520) NOT NULL,
    "Page_id" integer NOT NULL
);


ALTER TABLE public.commune_de_paris_cdp_transport OWNER TO lionhart;

--
-- Name: commune_de_paris_cdp_transport_transport_id_seq; Type: SEQUENCE; Schema: public; Owner: lionhart
--

CREATE SEQUENCE public.commune_de_paris_cdp_transport_transport_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.commune_de_paris_cdp_transport_transport_id_seq OWNER TO lionhart;

--
-- Name: commune_de_paris_cdp_transport_transport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lionhart
--

ALTER SEQUENCE public.commune_de_paris_cdp_transport_transport_id_seq OWNED BY public.commune_de_paris_cdp_transport.transport_id;


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
-- Name: commune_de_paris_cdp_audio_page ap_id; Type: DEFAULT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_audio_page ALTER COLUMN ap_id SET DEFAULT nextval('public.commune_de_paris_cdp_audio_page_ap_id_seq'::regclass);


--
-- Name: commune_de_paris_cdp_audios audio_id; Type: DEFAULT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_audios ALTER COLUMN audio_id SET DEFAULT nextval('public.commune_de_paris_cdp_audios_audio_id_seq'::regclass);


--
-- Name: commune_de_paris_cdp_bar Bar_id; Type: DEFAULT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_bar ALTER COLUMN "Bar_id" SET DEFAULT nextval('public."commune_de_paris_cdp_bar_Bar_id_seq"'::regclass);


--
-- Name: commune_de_paris_cdp_burger_menu_ordering BMO_id; Type: DEFAULT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_burger_menu_ordering ALTER COLUMN "BMO_id" SET DEFAULT nextval('public."commune_de_paris_cdp_burger_menu_ordering_BMO_id_seq"'::regclass);


--
-- Name: commune_de_paris_cdp_childrenentertainment CE_id; Type: DEFAULT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_childrenentertainment ALTER COLUMN "CE_id" SET DEFAULT nextval('public."commune_de_paris_cdp_childrenentertainment_CE_id_seq"'::regclass);


--
-- Name: commune_de_paris_cdp_images image_id; Type: DEFAULT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_images ALTER COLUMN image_id SET DEFAULT nextval('public.commune_de_paris_cdp_images_image_id_seq'::regclass);


--
-- Name: commune_de_paris_cdp_itinerary itinerary_id; Type: DEFAULT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_itinerary ALTER COLUMN itinerary_id SET DEFAULT nextval('public.commune_de_paris_cdp_itinerary_itinerary_id_seq'::regclass);


--
-- Name: commune_de_paris_cdp_itinerary_color_scheme ICS_id; Type: DEFAULT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_itinerary_color_scheme ALTER COLUMN "ICS_id" SET DEFAULT nextval('public."commune_de_paris_cdp_itinerary_color_scheme_ICS_id_seq"'::regclass);


--
-- Name: commune_de_paris_cdp_lieu Lieu_id; Type: DEFAULT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_lieu ALTER COLUMN "Lieu_id" SET DEFAULT nextval('public."commune_de_paris_cdp_lieu_Lieu_id_seq"'::regclass);


--
-- Name: commune_de_paris_cdp_map page_id; Type: DEFAULT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_map ALTER COLUMN page_id SET DEFAULT nextval('public.commune_de_paris_cdp_map_page_id_seq'::regclass);


--
-- Name: commune_de_paris_cdp_map_controls MC_id; Type: DEFAULT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_map_controls ALTER COLUMN "MC_id" SET DEFAULT nextval('public."commune_de_paris_cdp_map_controls_MC_id_seq"'::regclass);


--
-- Name: commune_de_paris_cdp_menu menu_id; Type: DEFAULT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_menu ALTER COLUMN menu_id SET DEFAULT nextval('public.commune_de_paris_cdp_menu_menu_id_seq'::regclass);


--
-- Name: commune_de_paris_cdp_opening_hours oh_id; Type: DEFAULT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_opening_hours ALTER COLUMN oh_id SET DEFAULT nextval('public.commune_de_paris_cdp_opening_hours_oh_id_seq'::regclass);


--
-- Name: commune_de_paris_cdp_page page_id; Type: DEFAULT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_page ALTER COLUMN page_id SET DEFAULT nextval('public.commune_de_paris_cdp_page_page_id_seq'::regclass);


--
-- Name: commune_de_paris_cdp_page_before_after_image_order PD_id; Type: DEFAULT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_page_before_after_image_order ALTER COLUMN "PD_id" SET DEFAULT nextval('public."commune_de_paris_cdp_page_before_after_image_order_PD_id_seq"'::regclass);


--
-- Name: commune_de_paris_cdp_page_description PD_id; Type: DEFAULT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_page_description ALTER COLUMN "PD_id" SET DEFAULT nextval('public."commune_de_paris_cdp_page_description_PD_id_seq"'::regclass);


--
-- Name: commune_de_paris_cdp_page_image_order PD_id; Type: DEFAULT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_page_image_order ALTER COLUMN "PD_id" SET DEFAULT nextval('public."commune_de_paris_cdp_page_image_order_PD_id_seq"'::regclass);


--
-- Name: commune_de_paris_cdp_resturant Resturant_id; Type: DEFAULT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_resturant ALTER COLUMN "Resturant_id" SET DEFAULT nextval('public."commune_de_paris_cdp_resturant_Resturant_id_seq"'::regclass);


--
-- Name: commune_de_paris_cdp_shopping Shopping_id; Type: DEFAULT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_shopping ALTER COLUMN "Shopping_id" SET DEFAULT nextval('public."commune_de_paris_cdp_shopping_Shopping_id_seq"'::regclass);


--
-- Name: commune_de_paris_cdp_tickets tickets_id; Type: DEFAULT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_tickets ALTER COLUMN tickets_id SET DEFAULT nextval('public.commune_de_paris_cdp_tickets_tickets_id_seq'::regclass);


--
-- Name: commune_de_paris_cdp_toilets Toilet_id; Type: DEFAULT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_toilets ALTER COLUMN "Toilet_id" SET DEFAULT nextval('public."commune_de_paris_cdp_toilets_Toilet_id_seq"'::regclass);


--
-- Name: commune_de_paris_cdp_transport transport_id; Type: DEFAULT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_transport ALTER COLUMN transport_id SET DEFAULT nextval('public.commune_de_paris_cdp_transport_transport_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: commune_de_paris_cdp_audio_page; Type: TABLE DATA; Schema: public; Owner: lionhart
--

COPY public.commune_de_paris_cdp_audio_page (ap_id, audio_appearnce_order, is_audio_present_on_page, audio_id, page_description_id) FROM stdin;
2	1	t	11	52
3	1	t	6	6
4	1	t	7	27
5	1	t	3	16
6	1	t	5	23
7	1	t	8	9
9	1	t	20	37
10	1	t	19	19
11	1	t	18	46
12	1	t	13	50
13	1	t	15	47
14	1	t	16	5
16	1	t	12	41
17	1	t	26	17
18	1	t	21	18
19	1	t	24	21
20	1	t	30	22
21	1	t	32	25
22	1	t	29	28
23	1	t	28	2
24	1	t	37	43
25	1	t	41	45
26	1	t	31	14
27	1	t	40	20
30	1	t	42	10
31	1	t	44	49
32	1	t	45	54
35	1	t	47	8
36	1	t	48	51
37	1	t	49	40
38	1	t	50	7
39	1	t	51	11
40	1	t	52	24
41	1	t	53	12
42	1	t	54	30
43	1	t	55	26
44	1	t	56	15
45	1	t	57	4
46	1	t	2	13
47	4	t	9	13
48	5	t	25	13
49	6	t	33	13
50	7	t	39	13
51	8	t	59	13
53	2	t	4	31
54	3	t	23	31
55	4	t	27	31
56	5	t	34	31
57	6	t	36	31
58	7	t	17	31
59	8	t	62	31
60	9	t	63	31
61	10	t	61	31
62	11	t	64	31
64	1	t	35	59
1	1	t	1	44
65	1	t	65	29
66	1	t	67	39
67	1	t	66	55
68	1	t	68	56
69	1	t	70	32
70	1	t	70	57
71	1	t	69	48
52	9	t	60	13
73	3	t	22	13
74	10	t	71	13
75	1	t	72	38
76	1	t	73	53
77	1	t	75	13
78	1	t	74	31
\.


--
-- Name: commune_de_paris_cdp_audio_page_ap_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lionhart
--

SELECT pg_catalog.setval('public.commune_de_paris_cdp_audio_page_ap_id_seq', 78, true);


--
-- Data for Name: commune_de_paris_cdp_audios; Type: TABLE DATA; Schema: public; Owner: lionhart
--

COPY public.commune_de_paris_cdp_audios (audio_id, audio_title, audio_description, audio_file) FROM stdin;
1	Jean Allemane	<p>NA</p>	media/commune_de_paris/audio_files/ALLEMANE_Jean_mp3_48k_mono_ampl2.mp3
2	Paul Émile Bouchet	<p>NA</p>	media/commune_de_paris/audio_files/BOUCHET_Paul_Emile.mp3
3	Augustin Avrial	<p>NA</p>	media/commune_de_paris/audio_files/AVRIAL_Augustin_48k_mono_ampl_dB.mp3
4	Charles Chabert	<p>NA</p>	media/commune_de_paris/audio_files/CHABERT_Charles_mp3_48k_mono_2_dB.mp3
5	Charles Louis Chassin	<p>NA</p>	media/commune_de_paris/audio_files/CHASSIN_Charles_Louis_mp3_48k_mono_ampl_2dB.mp3
6	Eugène Cleray	<p>NA</p>	media/commune_de_paris/audio_files/CLERAY_Eugene_mp3_48k_mono_ampl_2dB.mp3
7	Eugène Delaplanche	<p>NA</p>	media/commune_de_paris/audio_files/DELAPLANCHE_Eugene_mp3_48k_mono_ampl_2dB.mp3
8	Charles Delecluze	<p>NA</p>	media/commune_de_paris/audio_files/DELESCLUZE_Charles_mp3_48k_mono_ampl_2dB.mp3
9	Louis Simon Dereure	<p>NA</p>	media/commune_de_paris/audio_files/DEREURE_Louis_Simon_mp3_48k_mono_ampl_2dB.mp3
10	Jaroslaw Dombrowski	<p>NA</p>	media/commune_de_paris/audio_files/DOMBROWSKI_Jaroslaw_mp3_48k_mono_ampl_2dB.mp3
11	La Garde Nationale	<p>NA</p>	media/commune_de_paris/audio_files/LA_GARDE_NATIONALE_mp3_48k_mono_ampl_2dB.mp3
12	L'œuvre de la Commune	<p>NA</p>	media/commune_de_paris/audio_files/L_OEUVRE_DE_LA_COMMUNE_mp3_48k.mp3
13	La presse	<p>NA</p>	media/commune_de_paris/audio_files/LA_PRESSE_mp3_48k.mp3
14	Le 18 Mars - Début de la Commune	<p>NA</p>	media/commune_de_paris/audio_files/LE_18_MARS_1871_DEBUT_DE_LA_COMMUNE_mp3_48k_ampl_2dB.mp3
15	Le fonctionnement de la Commune	<p>NA</p>	media/commune_de_paris/audio_files/LE_FONCTIONNEMENT_DE_LA_COMMUNE_mp3_48k_ampl_2dB.mp3
16	Monument à la gloire des Gardes nationaux	<p>NA</p>	media/commune_de_paris/audio_files/MONUMENT_A_LA_GLOIRE_DES_GARDES_NATIONAUX_mp3_48k_ampl_2_dB.mp3
17	Benoît Malon	<p>NA</p>	media/commune_de_paris/audio_files/MALON_Benoit_mp3_48k_ampl_2dB.mp3
18	Augustin-Jean Vauthier-Moreau	<p>NA</p>	media/commune_de_paris/audio_files/MOREAU_VAUTHIER_Augustin_mp3_48k_ampl_2_dB.mp3
19	Victor Noir	<p>NA</p>	media/commune_de_paris/audio_files/NOIR_Victor_mp3_48k_ampl_2dB.mp3
20	Présentation de la Commune	<p>NA</p>	media/commune_de_paris/audio_files/PRESENTATION_DE_LA_COMMUNE_DE_PARIS_mp3_48k_ampl_2_dB.mp3
21	Auguste Blanqui	<p>NA</p>	media/commune_de_paris/audio_files/BLANQUI_Auguste_mp3_48K_ampl_2dB.mp3
22	Emmanuel Chauvière	<p>NA</p>	media/commune_de_paris/audio_files/CHAUVIERE_Emmanuel_mp3_48K_ampl_2dB.mp3
23	Jean-Baptiste Clément	<p>NA</p>	media/commune_de_paris/audio_files/CLEMENT_Jean_Baptiste_mp3_48k_ampl_2dB.mp3
24	Frédéric Cournet	<p>NA</p>	media/commune_de_paris/audio_files/COURNET_Frederic_mp3_48k_ampl_2dB.mp3
25	Jean-Baptiste Dumey	<p>NA</p>	media/commune_de_paris/audio_files/DUMEY_Jean_Baptiste_mp3_48K_ampl_2dB.mp3
26	Émile Eudes	<p>NA</p>	media/commune_de_paris/audio_files/EUDES_Emile_mp3_48K_ampl_2dB.mp3
27	Pascal Faberot	<p>NA</p>	media/commune_de_paris/audio_files/FABEROT_Pascal_mp3_48K_ampl_2dB.mp3
28	Gustave Flourens	<p>NA</p>	media/commune_de_paris/audio_files/FLOURENS_Gustave_mp3_48k_ampl_2dB.mp3
29	Léo Frankel	<p>NA</p>	media/commune_de_paris/audio_files/FRANKEL_Leo_mp3_48k_ampl_2dB.mp3
30	André Gill	<p>NA</p>	media/commune_de_paris/audio_files/GILL_Andre_mp3_48k_ampl_2dB.mp3
31	Pascal Grousset	<p>NA</p>	media/commune_de_paris/audio_files/GROUSSET_Pascal_mp3_48k_ampl_2dB.mp3
32	Jules Joffrin	<p>NA</p>	media/commune_de_paris/audio_files/JOFFRIN_Jules_mp3_48k_ampl_2dB.mp3
33	Maurice Lachâtre	<p>NA</p>	media/commune_de_paris/audio_files/LACHATRE_Maurice_mp3_48k_ampl_2dB.mp3
34	Paul Lafargue	<p>NA</p>	media/commune_de_paris/audio_files/LAFARGUE_Paul_mp3_48k_ampl_2dB.mp3
35	Le temps des cerises	<p>NA</p>	media/commune_de_paris/audio_files/LE_TEMPS_DES_CERISES_mp3_48k.mp3
36	Gustave Lefrançais	<p>NA</p>	media/commune_de_paris/audio_files/LEFRANCAIS_Gustave_mp3_48k_ampl_2dB.mp3
37	Adrien Lejeune	<p>NA</p>	media/commune_de_paris/audio_files/LEJEUNE_Adrien_mp3_48k_ampl_2dB.mp3
38	Les fosses communes	<p>NA</p>	media/commune_de_paris/audio_files/LES_FOSSES_COMMUNES_mp3_48k_ampl_2dB.mp3
39	Hippolyte Lissagaray	<p>NA</p>	media/commune_de_paris/audio_files/LISSAGARAY_Hippolyte_mp3_48k_ampl_2dB.mp3
40	Charles Longuet	<p>NA</p>	media/commune_de_paris/audio_files/LONGUET_Charles_mp3_48k_ampl_2dB.mp3
41	Louis Adrien Lucipia	<p>NA</p>	media/commune_de_paris/audio_files/LUCIPIA_Louis_Adrien_mp3_48k_ampl_2dB.mp3
42	Charles Romain Capellaro	<p>NA</p>	media/commune_de_paris/audio_files/CAPELLARO_Charles_Romain_mp3_48K_ampl_4dB.mp3
43	Colombarium et Crématorium	<p>NA</p>	media/commune_de_paris/audio_files/COLOMBARIUM_et_CREMATORIUM_mp3_48k_ampl_2dB.mp3
44	La Fédération des artistes	<p>NA</p>	media/commune_de_paris/audio_files/LA_FEDERATION_DES_ARTISTES_v2_mp3_48k_ampl_2dB.mp3
45	La semaine sanglante	<p>NA</p>	media/commune_de_paris/audio_files/LA_SEMAINE_SANGLANTE_mp3_48k_ampl_4dB.mp3
46	Le mur des Fédérés	<p>NA</p>	media/commune_de_paris/audio_files/LE_MUR_DES_FEDERES_mp3_48k_ampl2_dB.mp3
47	Le site des derniers combats	<p>NA</p>	media/commune_de_paris/audio_files/LE_SITE_DES_DERNIERS_COMBATS_mp3_48k_ampl_2dB.mp3
48	Les écrivains contre la Commune	<p>NA</p>	media/commune_de_paris/audio_files/LES_ECRIVAINS_CONTRE_LA_COMMUNE_DE_PARIS_mp3_48k_ampl_4dB.mp3
49	Les femmes dans la Commune	<p>NA</p>	media/commune_de_paris/audio_files/LES_FEMMES_DANS_LA_COMMUNE_mp3_48k_ampl_4dB.mp3
50	Jules Miot	<p>NA</p>	media/commune_de_paris/audio_files/MIOT_Jules_mp3_48K_ampl_4dB.mp3
51	Jules Okolowicz	<p>NA</p>	media/commune_de_paris/audio_files/OKOLOWICZ_Auguste_mp3_48k_ampl_2dB.mp3
52	Eugène Pottier	<p>NA</p>	media/commune_de_paris/audio_files/POTTIER_Eugene_mp3_48k_ampl_4dB.mp3
53	Félix Pyat	<p>NA</p>	media/commune_de_paris/audio_files/PYAT_Felix_mp3_48k_ampl_2dB.mp3
54	Arthur Ranc	<p>NA</p>	media/commune_de_paris/audio_files/RANC_Arthur_mp3_48k_ampl_4dB.mp3
55	Louis Auguste Rogeard	<p>NA</p>	media/commune_de_paris/audio_files/ROGEARD_Louis_Auguste_mp3_48k_ampl_2dB.mp3
56	Raoul Urbain	<p>NA</p>	media/commune_de_paris/audio_files/URBAIN_Raoul_mp3_48k_ampl_4dB.mp3
57	Jules Vallès	<p>NA</p>	media/commune_de_paris/audio_files/VALLES_Jules_mp3_48k_ampl_4dB.mp3
58	Paul-Émile Bouchet	<p>NA</p>	media/commune_de_paris/audio_files/BOUCHET_Paul_Emile_raN3rs0.mp3
59	Jules Martelet	<p>NA</p>	media/commune_de_paris/audio_files/MARTELET_Jules_mp3_48K_ampl_4dB.mp3
60	Paule Mink	<p>NA</p>	media/commune_de_paris/audio_files/MINK_Paule_mp3_48K_ampl_2dB.mp3
61	Onésime Prudent-Dervillers	<p>NA</p>	media/commune_de_paris/audio_files/DERVILLERS_Onesime.mp3
62	Henri Mortier	<p>NA</p>	media/commune_de_paris/audio_files/MORTIER_Henri_mp3_48k_ampl_2dB.mp3
63	Ernest-Louis Pichio	<p>NA</p>	media/commune_de_paris/audio_files/PICHIO_Ernest_Louis_mp3_48k_ampl_4dB.mp3
64	Valéry Wroblewsky	<p>NA</p>	media/commune_de_paris/audio_files/WROBLEWSKY_Valery_mp3_48k_ampl_4_dB.mp3
65	Charles Amouroux	<p>Charlers Amouroux</p>	media/commune_de_paris/audio_files/AMOUROUX_Charles_mp3_mono_48K_ampl_2dB.mp3
66	La repression	<p>La repression</p>	media/commune_de_paris/audio_files/LA_REPRESSION_et_PONTONS_ET_PRISONS_mp3_48k_mono_ampl_0dB.mp3
67	Le 18 Mars - Début de la Commune	<p>Le 18 Mars - D&eacute;but de la Commune</p>	media/commune_de_paris/audio_files/LE_18_MARS_1871_mp3_48k_mono_ampl_0dB.mp3
68	Le cimetière du Père lachaise	<p>Le cimeti&egrave;re du P&egrave;re lachaise</p>	media/commune_de_paris/audio_files/LE_CIMETIERE_DU_PERE_LACHAISE_mp3_mono_48k_amp2dB.mp3
69	Les étrangers et la Commune	<p>Les &eacute;trangers et la Commune</p>	media/commune_de_paris/audio_files/LES_ETRANGERS_ET_LACOMMUNE_mp3_48K_ampl_4dB.mp3
70	Le mur des Fédérés	<p>Le mur des F&eacute;d&eacute;r&eacute;s</p>	media/commune_de_paris/audio_files/MUR_DES_FEDERES_et_UN_MUR_QUI_VOUDRAIT_EN_CACHER_UN_A_yoxg0HQ.mp3
71	Eugène Vigey	<p>Eug&egrave;ne Vigey</p>	media/commune_de_paris/audio_files/VIGEY_Eugène_mp3_48K_ampl_4dB.mp3
72	Le contexte de la Commune	<p>Le contexte de la Commune</p>	media/commune_de_paris/audio_files/LE_CONTEXTE_DE_LA_COMMUNE_mono_mp3_48k_ampl_2dB.mp3
73	Adolphe Thiers	<p>Adolphe Thiers</p>	media/commune_de_paris/audio_files/THIERS_Adolphe_mp3_mono_48k_ampl_0dB.mp3
75	Henri Brissac	<p>Henri Brissac</p>	media/commune_de_paris/audio_files/Henri_Brissac.mp3
74	Paul Brousse	<p>Paul Brousse</p>	media/commune_de_paris/audio_files/Paul_Brousse.mp3
\.


--
-- Name: commune_de_paris_cdp_audios_audio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lionhart
--

SELECT pg_catalog.setval('public.commune_de_paris_cdp_audios_audio_id_seq', 75, true);


--
-- Data for Name: commune_de_paris_cdp_bar; Type: TABLE DATA; Schema: public; Owner: lionhart
--

COPY public.commune_de_paris_cdp_bar ("Bar_id", "Bar_Address", "Bar_Comment", "Page_id") FROM stdin;
\.


--
-- Name: commune_de_paris_cdp_bar_Bar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lionhart
--

SELECT pg_catalog.setval('public."commune_de_paris_cdp_bar_Bar_id_seq"', 1, false);


--
-- Data for Name: commune_de_paris_cdp_burger_menu_ordering; Type: TABLE DATA; Schema: public; Owner: lionhart
--

COPY public.commune_de_paris_cdp_burger_menu_ordering ("BMO_id", appearnce_order_in_burger_menu, itinerary_id, menu_id) FROM stdin;
5	1	7	71
3	2	4	44
1	3	1	2
4	4	6	51
2	5	2	37
\.


--
-- Name: commune_de_paris_cdp_burger_menu_ordering_BMO_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lionhart
--

SELECT pg_catalog.setval('public."commune_de_paris_cdp_burger_menu_ordering_BMO_id_seq"', 5, true);


--
-- Data for Name: commune_de_paris_cdp_childrenentertainment; Type: TABLE DATA; Schema: public; Owner: lionhart
--

COPY public.commune_de_paris_cdp_childrenentertainment ("CE_id", "CE_Address", "CE_Comment", "Page_id") FROM stdin;
\.


--
-- Name: commune_de_paris_cdp_childrenentertainment_CE_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lionhart
--

SELECT pg_catalog.setval('public."commune_de_paris_cdp_childrenentertainment_CE_id_seq"', 1, false);


--
-- Data for Name: commune_de_paris_cdp_images; Type: TABLE DATA; Schema: public; Owner: lionhart
--

COPY public.commune_de_paris_cdp_images (image_id, filename, image_name, long_description, short_description, image_type, "Page_id") FROM stdin;
7	media/communde_de_paris/Main_gate_of_the_Pere-Lachaise_Cemetery.jpg	Entrée principale du Père Lachaise	<p>Entr&eacute;e principale du P&egrave;re Lachaise (photographie: Etienne-Hippolyte Godde, 2014, Wikimedia)</p>	<p>NA</p>	NORMAL_IMAGE	\N
6	media/communde_de_paris/R400_Vallès_Jules_par_Gustave_Courbet_1861_Musée_Carnavalet.jpg	Gustave Courbet, Portrait de Jules Vallès	<p>Gustave Courbet, <em>Portrait de Jules Vall&egrave;s</em>, 1861, huile sur toile, Mus&eacute;e Carnavalet, Paris</p>	<p>Gustave Courbet, <em>Portrait de Jules Vall&egrave;s</em></p>	NORMAL_IMAGE	\N
4	media/communde_de_paris/Vallès_Jules-1.jpg	Tombeau de Jules Vallès	<p>Tombeau de Jules Vall&egrave;s au P&egrave;re Lachaise (photographie Antonio Ca&#39; Zorzi, 2019)</p>	<p>NA</p>	NORMAL_IMAGE	\N
1	media/communde_de_paris/Commune_de_Paris_barricade_Place_Blanche.jpg	Barricade de la Place Blanche	<p>Barricade de la Place Blanche, d&eacute;fendue par des femmes pendant la <em>semaine sanglante</em> - Lithographie - Mus&eacute;e Carnavalet</p>	<p>NA</p>	NORMAL_IMAGE	\N
2	media/communde_de_paris/Vallès_Jules-1_Bx4gXe7.jpg	Tombeau de Gustave Flourens	<p>Le Tombeau de Gustave Flourens au P&egrave;re Lachaise, (photographie Antonio Ca&#39; Zorzi, 2019)</p>	<p>NA</p>	NORMAL_IMAGE	\N
8	media/communde_de_paris/Monument_gardes_nationaux_1200.jpg	Monument à la mémoire des gardes nationaux	<p>Le monument &agrave; la m&eacute;moire des gardes nationaux au cimeti&egrave;re du P&egrave;re Lachaise &agrave; Paris (photographie: Antonio Ca&#39; Zorzi, 2019)</p>	<p>NA</p>	NORMAL_IMAGE	\N
9	media/communde_de_paris/R400_Mon_Défense_de_Paris-1.jpg	Monument à la mémoire des gardes nationaux	<p>Le monument &agrave; la m&eacute;moire des gardes nationaux au cimeti&egrave;re du P&egrave;re Lachaise, paris (photographie: Antonio Ca&#39; Zorzi)</p>	<p>&Agrave; la m&eacute;moire des gardes nationaux</p>	NORMAL_IMAGE	\N
11	media/communde_de_paris/Cleray_Eugene_P-L.jpg	Tombeau de Eugène Cléray	<p>Tombeau de Eug&egrave;ne Cl&eacute;ray au cim&eacute;ti&egrave;re du P&egrave;re-Lachaise, (photograohie Pierre-Yeves Beaudoin, 2017, Wikimedia)</p>	<p>NA</p>	NORMAL_IMAGE	\N
12	media/communde_de_paris/Miot_Jules-4.jpg	Tombeau de Jules Miot	<p>Le tombeau de Jules Miot au cimeti&egrave;re du P&egrave;re Lachaise, Paris</p>	<p>NA</p>	NORMAL_IMAGE	\N
14	media/communde_de_paris/Site_Derniers_Combats-1.jpg	Le site des derniers combats - Tombeau de Charles Nodier	<p>Le tombeau de Charles Nodier, lieu o&ugrave; eurent lie les derniers combats de la Commune de Paris</p>	<p>NA</p>	NORMAL_IMAGE	\N
15	media/communde_de_paris/Deslescluze_Charles-1.jpg	Tombeau de Charles Delescluze	<p>Le tombeau de Charles Delescluze au cimeti&egrave;re du P&egrave;re Lachaise</p>	<p>NA</p>	NORMAL_IMAGE	\N
18	media/communde_de_paris/Capellaro_Charles-Romain-1.jpg	Tombeau de Charles-Romain Capellaro	<p>Tombeau de Charles-Romain Capellaro au cimeti&egrave;re du P&egrave;re Lachaise &agrave; Paris</p>	<p>NA</p>	NORMAL_IMAGE	\N
19	media/communde_de_paris/Okolowicz_Auguste-1.jpg	Tombeau de Auguste Okolowicz	<p>Tombeau de Auguste Okolowicz au cimeti&egrave;re du P&egrave;re Lachaise &agrave; Paris</p>	<p>NA</p>	NORMAL_IMAGE	\N
22	media/communde_de_paris/T_Pyat_Félix-2.jpg	Tombeau de Félix Pyat	<p>Le tombeau de F&eacute;lix Pyat au cimeti&egrave;re du P&egrave;re Lachaise &agrave; Paris</p>	<p>NA</p>	NORMAL_IMAGE	\N
23	media/communde_de_paris/R1400_Pere-Lachaise_-Entree.jpg	Entrée principale du Père Lachaise	<p>Entr&eacute;e principale du P&egrave;re Lachaise</p>	<p>NA</p>	NORMAL_IMAGE	\N
24	media/communde_de_paris/R1400_Pere-Lachaise_-Entree-V2.jpg	Entrée principale du Père Lachaise	<p>Entr&eacute;e principale du P&egrave;re Lachaise</p>	<p>NA</p>	NORMAL_IMAGE	\N
25	media/communde_de_paris/Crematorium_V2.jpg	Le Crématorium du Père Lachaise	<p>Le Cr&eacute;matorium du cimeti&egrave;re du P&egrave;re Lachaise &agrave; Paris</p>	<p>NA</p>	NORMAL_IMAGE	\N
26	media/communde_de_paris/Chauviere_Emmanuel-Jean-Jules_par_Marius.JPG	Emmanuel Chauvière par Marius	<p>Portrait de Emmanuel Chauvi&egrave;re par Marius</p>	<p>Emmanuel Chauvi&egrave;re</p>	NORMAL_IMAGE	\N
32	media/communde_de_paris/Grousset_Paschal-1.jpg	Tombeau de Paschal Grousset	<p>Tombeau de Paschal Grousset au cimeti&egrave;re du P&egrave;re Lachaise, Paris</p>	<p>NA</p>	NORMAL_IMAGE	\N
33	media/communde_de_paris/T_Urbain_Raoul-3.jpg	Tombeau de Raoul Urbain	<p>Tombeau de Raoul Urbain au cimeti&egrave;re du P&egrave;re Lachaise &agrave; Paris</p>	<p>NA</p>	NORMAL_IMAGE	\N
10	media/communde_de_paris/R400_Cleray_Eugene_Buste_P-L.jpg	Clérey, Eugène	<p>Buste de Eug&egrave;ne Cl&eacute;rey au cimeti&egrave;re du P&egrave;re Lachaise, Paris</p>	<p>Eug&egrave;ne Cl&eacute;rey au P&egrave;re Lachaise</p>	INDEX_IMAGE	8
13	media/communde_de_paris/R400_Miot_Jules1871_Unknown_W.jpg	Miot, Jules	<p>Portrait de Jules Miot</p>	<p>Jules Miot</p>	INDEX_IMAGE	9
16	media/communde_de_paris/R400_Delecluze_Charles.jpg	Delescluze, Charles	<p>Portrait de Charles Delescluze</p>	<p>Charles Delescluze</p>	INDEX_IMAGE	11
17	media/communde_de_paris/Capellaro_Charles-Romain.jpg	Capellaro, Charles-Romain	<p>Portrait de Charles-Romain Capellaro</p>	<p>Charkes-Romain Capellaro</p>	INDEX_IMAGE	12
20	media/communde_de_paris/Okolowicz_Auguste.jpg	Okolowicz, Auguste	<p>Portrait de Auguste Okolowicz</p>	<p>Auguste Okolowicz</p>	INDEX_IMAGE	13
21	media/communde_de_paris/P_R400_Pyat_Felix_Photo_Nadar_W.jpg	Pyat, Félix	<p>Portrait de F&eacute;lix Pyat, photographie de Nadar</p>	<p>Nadar, Portrait de F&eacute;lix Pyat</p>	INDEX_IMAGE	14
27	media/communde_de_paris/P_R400_Chauviere_Emmanuel-Jean-Jules_par_Marius.jpg	Chauvière, Emmanuel	<p>Portrait de Emmanuel Chauvi&egrave;re par Marius</p>	<p>Emmanuel Chauvi&egrave;re</p>	INDEX_IMAGE	15
28	media/communde_de_paris/P_Bouchet_Paul_Emile_Brutus_Colombarium.jpg	Bouchet, Paul Émile "Brutus"	<p>Portrait de Paul &Eacute;mile Bouchet, &quot;Brutus&quot;</p>	<p>Paul &Eacute;mile Bouchet, &quot;Brutus&quot;</p>	INDEX_IMAGE	15
29	media/communde_de_paris/Dereure_Simon.jpg	Dereure, Dereure	<p>Portrait de Simon Dereure</p>	<p>Simon Dereure</p>	INDEX_IMAGE	15
30	media/communde_de_paris/P_R400_Dumay_Jean-Baptiste.jpg	Dumay, Jean-Baptiste	<p>Jean-Baptiste Dumay (Dessin apparu dans &quot;Le Radical&quot;, 3 Octobre 1889)</p>	<p>Jean-Baptiste Dumay</p>	INDEX_IMAGE	15
31	media/communde_de_paris/P_R400_Grousset_Paschal.jpg	Grousset, Paschal	<p>Portrait de Paschal Grousset</p>	<p>Paschal Grousset</p>	INDEX_IMAGE	16
34	media/communde_de_paris/P_R400_Urbain_Raoul.jpg	Urbain, Raoul	<p>Portrait de Raoul Urbain</p>	<p>Raoul Urbain</p>	INDEX_IMAGE	17
35	media/communde_de_paris/Avrial_Augustin.jpg	Avrial, Augustin	<p>Portrait de Augustin Avrial</p>	<p>Augustin Avrial</p>	INDEX_IMAGE	18
36	media/communde_de_paris/T_Avrial_Augustin-1.jpg	Tombeau de Augustin Avrial	<p>Tombeau de Augustin Avrial</p>	<p>NA</p>	NORMAL_IMAGE	\N
37	media/communde_de_paris/T_Eudes_Émile-1.jpg	Tombeau de Émile Eudes	<p>Tombeau de &Eacute;mile Eudes</p>	<p>NA</p>	NORMAL_IMAGE	\N
39	media/communde_de_paris/R1400_Pere-Lachaise_-Entree-Bordeaux.jpg	L'éntrée principale du Père Lachaise	<p>L&#39;&eacute;ntr&eacute;e principale du P&egrave;re Lachaise</p>	<p>NA</p>	NORMAL_IMAGE	\N
40	media/communde_de_paris/T_Blanqui_Auguste-3.jpg	Tombeau de Auguste Blanqui	<p>Tombeau de Auguste Blanqui</p>	<p>NA</p>	NORMAL_IMAGE	\N
43	media/communde_de_paris/T_Noir_Victor-2.jpg	Tombeau de Victor Noir	<p>Tombeau de Victor Noir</p>	<p>NA</p>	NORMAL_IMAGE	\N
44	media/communde_de_paris/T_Longuet_Charles-1.jpg	Tombeau de Charles Longuet	<p>Tombeau de Charles Longuet</p>	<p>NA</p>	NORMAL_IMAGE	\N
47	media/communde_de_paris/T_Chassin_Charles-Louis-1.jpg	Tombeau de Charles-Louis Chassin	<p>Tombeau de Charles-Louis Chassin au cimeti&egrave;re du P&egrave;re Lachaise, Paris</p>	<p>NA</p>	NORMAL_IMAGE	\N
48	media/communde_de_paris/T_Cournet_Frédéric-3.jpg	Tombeau de Frédéric Cournet	<p>Tombeau de Fr&eacute;d&eacute;ric Cournet au cimeti&egrave;re du P&egrave;re Lachaise</p>	<p>NA</p>	NORMAL_IMAGE	\N
51	media/communde_de_paris/T_Gill_Andre-2.jpg	Tombeau de André Gill	<p>Tombeau de Andr&eacute; Gill</p>	<p>NA</p>	NORMAL_IMAGE	\N
52	media/communde_de_paris/T_Pottier_Eugène-1.jpg	Tombeau de Eugène Pottier	<p>Tombeau de Eug&egrave;ne Pottier</p>	<p>NA</p>	NORMAL_IMAGE	\N
55	media/communde_de_paris/T_Joffrin_Jules-1.jpg	Tombeau de Jules Joffrin	<p>Tombeau de Jules Joffrin</p>	<p>NA</p>	NORMAL_IMAGE	\N
56	media/communde_de_paris/T_Rogeard_Louis_Auguste.jpg	Tombeau de Louis Auguste Rogeard	<p>Tombeau de Louis Auguste Rogeard</p>	<p>NA</p>	NORMAL_IMAGE	\N
59	media/communde_de_paris/T_Délaplanche_Eugène-1.jpg	Tombeau de Eugène Delaplanche	<p>Tombeau de Eug&egrave;ne Delaplanche</p>	<p>NA</p>	NORMAL_IMAGE	\N
60	media/communde_de_paris/T_Frankel_Léo-1.jpg	Tombeau de Léo Frankel	<p>Tombeau de L&eacute;o Frankel</p>	<p>NA</p>	NORMAL_IMAGE	\N
63	media/communde_de_paris/T_Amouroux_Charles-1.jpg	Tombeau de Charles Amouroux	<p>Tombeau de Charles Amouroux</p>	<p>NA</p>	NORMAL_IMAGE	\N
64	media/communde_de_paris/Thumbnail_Monument_gardes_nationaux.jpg	Monument à la mémoire des gardes nationaux	<p>Monument &agrave; la m&eacute;moire des gardes nationaux</p>	<p>NA</p>	NORMAL_IMAGE	\N
65	media/communde_de_paris/Thumbnail_Longuet_Charles.jpg	Tombeau de Charles Longuet	<p>Tombeau de Charles Longuet</p>	<p>NA</p>	NORMAL_IMAGE	\N
66	media/communde_de_paris/Thumbnail_Rogeard_Louis_Auguste.jpg	Tombeau de Louis Auguste Rogeard	<p>Tombeau de Louis Auguste Rogeard</p>	<p>NA</p>	NORMAL_IMAGE	\N
67	media/communde_de_paris/T_Ranc_Arthur-1.jpg	Tombeau de Arthur Ranc	<p>Tombeau de Arthur Ranc</p>	<p>NA</p>	NORMAL_IMAGE	\N
68	media/communde_de_paris/Thumbnail_Ranc_Arthur.jpg	Tombeau de Arthur Ranc	<p>Tombeau de Arthur Ranc</p>	<p>NA</p>	NORMAL_IMAGE	\N
70	media/communde_de_paris/Thumbnail_Devant_le_mur_des_Federes.jpg	Devant le mur des Fédérés	<p>Devant le mur des F&eacute;d&eacute;r&eacute;s</p>	<p>NA</p>	NORMAL_IMAGE	\N
71	media/communde_de_paris/T_Devant_le_mur_des_Federes.jpg	Devant le mur des Fédérés	<p>Devant le mur des F&eacute;d&eacute;r&eacute;s</p>	<p>NA</p>	NORMAL_IMAGE	\N
73	media/communde_de_paris/Derniers_combats_au_Pere-Lachaise_-_Le_monde_illustre_-_24_juin_1871.jpg	Les derniers combats au Père-Lachaise	<p>Les derniers combats au P&egrave;re-Lachaise, 24 Juin 1871, dans <em>Le Monde illustr&eacute;</em>, n&deg;741, p. 385.</p>	<p>Les derniers combats au P&egrave;re-Lachaise</p>	NORMAL_IMAGE	\N
75	media/communde_de_paris/Mur_des_Federes.jpg	Le Mur des Fédérés	<p>Le Mur des F&eacute;d&eacute;r&eacute;s</p>	<p>Le Mur des F&eacute;d&eacute;r&eacute;s</p>	NORMAL_IMAGE	\N
38	media/communde_de_paris/P_R400_Eudes_Emile.jpg	Eudes, Émile	<p>Portrait de &Eacute;mile Eudes</p>	<p>&Eacute;mile Eudes</p>	INDEX_IMAGE	19
41	media/communde_de_paris/P_R400_Blanqui_Luois-Auguste_En-buste-de-face-1860s-via-Gallica_Anonyme.jpg	Blanqui, Auguste	<p>Portrait dessin&eacute; de Auguste Blanqui, anonyme, Gallica, BNF</p>	<p>Auguste Blanqui</p>	INDEX_IMAGE	20
42	media/communde_de_paris/P_R400_Noir_Victor_par_Ernest-Charles_Appert.jpg	Noir, Victor	<p>Victor Noir, vu par Ernest Appert (vers 1865 - 1870)</p>	<p>Victor Noir</p>	INDEX_IMAGE	21
45	media/communde_de_paris/P_R400_Longuet_Charles_Felix_Cesar_-_par_Ernest_Charles_Appert_vers_1870.jpg	Longuet, Charles	<p>Charles Longuet vu par Charles Ernest Appert, 1870</p>	<p>Charles Longuet</p>	INDEX_IMAGE	22
50	media/communde_de_paris/P_R400_Gill_André.jpg	Gill, André	<p>Andr&eacute; Gill, photographie, auteur inconnu</p>	<p>Andr&eacute; Gill</p>	INDEX_IMAGE	25
46	media/communde_de_paris/P_R400_Chassin_Charles-Louis_par_Etienne_Carjat_BNF_Gallica.jpg	Chassin, Charles-Louis	<p>Charles-Louis Chassin, photo de Etienne Carjat, Gallica BNF, Paris</p>	<p>Charles-Louis Chassin</p>	INDEX_IMAGE	23
53	media/communde_de_paris/P_R400_Pottier_Eugene_-_par_Etienne_Carjat_W.jpg	Pottier, Eugène	<p>Portrait de Eug&egrave;ne Pottier par &Eacute;tienne Carjat</p>	<p>Eug&egrave;ne Pottier</p>	INDEX_IMAGE	26
54	media/communde_de_paris/P_R400_Joffrin_Jules_-_dans_Histoire_Socialiste-XII-p157.jpg	Joffrin, Jules	<p>Portrait de Jules Joffrin, dans Histoire Socialiste, vol. XII, p. 157</p>	<p>Jules Joffrin</p>	INDEX_IMAGE	27
57	media/communde_de_paris/P_R400_Rogeard_Louis_Auguste_par_Lege.jpg	Rogeard, Louis Auguste	<p>Portrait de Louis Auguste Rogeard par Leg&eacute;</p>	<p>Louis Auguste Rogeard</p>	INDEX_IMAGE	28
58	media/communde_de_paris/P_R400_Delaplanche_Eugene.jpg	Delaplanche, Eugène	<p>Eug&egrave;ne Delaplanche</p>	<p>Eug&egrave;ne Delaplanche</p>	INDEX_IMAGE	29
61	media/communde_de_paris/P_R400_Frankel_Leo.jpg	Frankel, Léo	<p>L&eacute;o Frankel, photographe inconnu</p>	<p>L&eacute;o Frankel</p>	INDEX_IMAGE	30
62	media/communde_de_paris/P_R400_Amouroux_Charles_par_Ernest_Charles_Appert_vers_1870.jpg	Amouroux, Charles	<p>Portrait de Charles Amouroux par Ernest Charles Appert, vers 1870</p>	<p>Charles Amouroux</p>	INDEX_IMAGE	31
69	media/communde_de_paris/P_R400_Ranc_Arthur_vers_1900_par_Félix_Potin.jpg	Ranc, Arthur	<p>Portrait de Arthur Ranc par F&eacute;lix Potin</p>	<p>Arthur Ranc</p>	INDEX_IMAGE	32
72	media/communde_de_paris/P_Brousse_Paul.png	Brousse, Paul	<p>Paul Brousse</p>	<p>Paul Brousse</p>	INDEX_IMAGE	33
76	media/communde_de_paris/Mur_des_Federes_-_2.jpg	Le Mur des Fédérés	<p>Le Mur des F&eacute;d&eacute;r&eacute;s</p>	<p>Le Mur des F&eacute;d&eacute;r&eacute;s</p>	NORMAL_IMAGE	\N
111	media/communde_de_paris/P_R400_Lachatre_Maurice.jpg	Lachatre, Maurice	<p>Maurice Lachatre</p>	<p>Maurice Lachatre</p>	INDEX_IMAGE	15
78	media/communde_de_paris/Monument_aux_victimes_des_Revolutions_LPLT_W.JPG	Monument aux victimes des Révolutions	<p>Monument aux victimes des R&eacute;volutions, photo LPLT, Wikimedia</p>	<p>Le monument aux victimes des R&eacute;volutions</p>	NORMAL_IMAGE	\N
79	media/communde_de_paris/Amis_de_La_Commune_Bandeau-11.gif	Amis de la Commune de Paris	<p>Les Amis de la Commune de Paris</p>	<p>NA</p>	NORMAL_IMAGE	\N
80	media/communde_de_paris/Barricades_devant_la_Madeleine_Disderi.jpg	Barricades devant la Madeleine	<p>Barricades devant la Madeleine au cours de la Commune de Paris, photo de <a class="extiw" href="https://en.wikipedia.org/wiki/en:Andr%C3%A9-Adolphe-Eug%C3%A8ne_Disd%C3%A9ri" title="w:en:André-Adolphe-Eugène Disdéri">Andr&eacute;-Adolphe-Eug&egrave;ne Disd&eacute;ri</a> &nbsp;(1819&ndash;1889)</p>	<p>NA</p>	NORMAL_IMAGE	\N
81	media/communde_de_paris/Proclamation_de_la_Commune_Roquette.jpg	Proclamation de la Commune	<p>Proclamation de la Commune</p>	<p>NA</p>	NORMAL_IMAGE	\N
82	media/communde_de_paris/Commune_de_Paris_barricade_Place_Blanche_j7iDO0y.jpg	Barricade de la Place Blanche	<p>La barricade de la Place Blanche</p>	<p>NA</p>	NORMAL_IMAGE	\N
83	media/communde_de_paris/Proclamation_de_la_Commune.jpg	Proclamation de la Commune	<p>Proclamation de la Commune le 18 mars 1871</p>	<p>NA</p>	NORMAL_IMAGE	\N
84	media/communde_de_paris/JD_Linton_Women_of_the_Parisan_Commune.jpg	Women of the Parisian Commune	<p>JD Linton, Women of the Parisian Commune</p>	<p>NA</p>	NORMAL_IMAGE	\N
85	media/communde_de_paris/Autre_image_de_la_Commune.jpg	Une barricade d ela Commune	<p>Une barricade de la Commune</p>	<p>NA</p>	NORMAL_IMAGE	\N
86	media/communde_de_paris/Barricades_pres_de_Ministere_de_la_Marine_et_lHötel_Crillon_Collard.jpg	Barricades au Ministère de la Marine	<p>Barricades au Minist&egrave;re de la Marine</p>	<p>NA</p>	NORMAL_IMAGE	\N
87	media/communde_de_paris/On_brule_la_guillotine.jpg	On brûle la guillotine devant le monument de Voltaire	<p>On br&ucirc;le la guillotine devant le monument de Voltaire</p>	<p>NA</p>	NORMAL_IMAGE	\N
88	media/communde_de_paris/Pere-Lachaise_-Entree-V2.jpg	Entrée principale du Père Lachaise	<p>NA</p>	<p>NA</p>	NORMAL_IMAGE	\N
89	media/communde_de_paris/Pere-Lachaise_-Entree_Light.jpg	Entrée principale du Père Lachaise	<p>NA</p>	<p>NA</p>	NORMAL_IMAGE	\N
90	media/communde_de_paris/Pere-Lachaise_-Entree_Light_V2_COUL_E30613.jpg	L'éntrée principale du Père Lachaise	<p>NA</p>	<p>NA</p>	NORMAL_IMAGE	\N
100	media/communde_de_paris/P_R400_Wroblewski_Walery_2.jpg	Wroblewski, Walery	<p>Walery Wroblewski</p>	<p>Walery Wroblewski</p>	INDEX_IMAGE	33
3	media/communde_de_paris/PL_Flourens_Gustave-1_800px.jpg	Tombeau de Gustave Flourens	<p>Tombeau de Gustave Flourens, (photographie: Antonio Ca&#39; Zorzi, 2019)</p>	<p>Tombeau de Gustave Flourens</p>	NORMAL_IMAGE	4
74	media/communde_de_paris/P_R400_Flourens_Gustave.jpg	Flourens, Gustave	<p>Portait de Gustave Flourens</p>	<p>Gustave Flourens</p>	INDEX_IMAGE	4
5	media/communde_de_paris/Vallès_Jules_par_Gustave_Courbet_1861_Musée_Carnavalet_Wsflno3.jpg	Vallès, Jules	<p>Gustave Courbet, <em>Portrait de Jules Vall&egrave;s</em>, 1861, hule sur toile, Mus&eacute;e Carnavalet</p>	<p>Gustave Courbet, <em>Portrait de Jules Vall&egrave;s</em></p>	INDEX_IMAGE	6
49	media/communde_de_paris/P_R400_Cournet_Frédéric_par_Ernest_Charles_Appert.jpg	Cournet, Frédéric	<p>Fr&eacute;d&eacute;ric Cournet, par Ernest Charles Appert</p>	<p>Fr&eacute;d&eacute;ric Cournet</p>	INDEX_IMAGE	24
91	media/communde_de_paris/P_R400_Chabert_Edme_Charles_par_Charles_Lafuma_P-L-Photo_Pierre-Yves_Beaudoin_W.jpg	Chabert, Edme Charles	<p>Edme Charles ChabertPortrait de Edme Charles Chabert par Charles Lafuma au P&egrave;re Lachaise (photo Pierre-Yves Beaudoin, via Wikimedia)</p>	<p>Edme Charles Chabert</p>	INDEX_IMAGE	33
92	media/communde_de_paris/P_R400_Clement_Jean-Baptiste_Clement_by_Nadar.jpg	Clément, Jean-Baptiste	<p>Portrait de Jean-Baptiste Cl&eacute;ment par Nadar</p>	<p>Jean-Baptiste Cl&eacute;ment</p>	INDEX_IMAGE	33
93	media/communde_de_paris/P_R400_Faberot_Pascal.jpg	Faberot, Pascal	<p>Pascal Faberot</p>	<p>Pascal Faberot</p>	INDEX_IMAGE	33
94	media/communde_de_paris/P_R400_Lafargue_Paul_Emile.jpg	Lafargue, Paul Emile	<p>Paul Emile Lafargue</p>	<p>Paul Emile Lafargue</p>	INDEX_IMAGE	33
95	media/communde_de_paris/P_R400_Lefrancais_Gustave.jpg	Lefrançais, Gustave	<p>Gustave Lefran&ccedil;ais</p>	<p>Gustave Lefran&ccedil;ais</p>	INDEX_IMAGE	33
96	media/communde_de_paris/P_R400_Malon_Benoit.jpg	Malon, Benoît	<p>Beno&icirc;t Malon</p>	<p>Beno&icirc;t Malon</p>	INDEX_IMAGE	33
97	media/communde_de_paris/P_Mortier_Henri.jpg	Mortier, Henri	<p>Effige de Henri Mortier au P&egrave;re Lachaise</p>	<p>Henri Mortier</p>	INDEX_IMAGE	33
98	media/communde_de_paris/P_R400_Pichio_Ernest_Louis.jpg	Pichio, Ernest Louis	<p>Ernest Louis Pichio</p>	<p>Ernest Louis Pichio</p>	INDEX_IMAGE	33
99	media/communde_de_paris/P_R400_Prudent-Dervilliers_Onesime_Prudent_Jean-Francois.jpg	Prudent-Dervilliers, Onésime	<p>Portrait de On&eacute;sime Prudent-Dervilliers par Jean-Fran&ccedil;ois Prudent</p>	<p>On&eacute;sime Prudent-Dervilliers</p>	INDEX_IMAGE	33
101	media/communde_de_paris/T_Brousse_Paul_R400.jpg	Brousse, Paul	<p>Tombeau de Paul Brousse</p>	<p>Tombeau de Paul Brousse</p>	NORMAL_IMAGE	\N
102	media/communde_de_paris/T_Faberot_Pascal_R400.jpg	Tombeau de Pascal Faberot	<p>Tombeau de Pascal Faberot</p>	<p>Tombeau de Pascal Faberot</p>	NORMAL_IMAGE	\N
103	media/communde_de_paris/T_Prudent-Devilliers_Onesime_R400.jpg	Tombeau de Onésime Prudent-Dervilliers	<p>Tombeau de On&eacute;sime Prudent-Dervilliers</p>	<p>Tombeau de On&eacute;sime Prudent-Dervilliers</p>	NORMAL_IMAGE	\N
104	media/communde_de_paris/T_Mortier_Henri_R400.jpg	Tombeau de Henri Mortier	<p>Tombeau de Henri Mortier</p>	<p>Tombeau de Henri Mortier</p>	NORMAL_IMAGE	\N
105	media/communde_de_paris/T_Clement_Jean-Baptiste_R400.jpg	Tombeau de Jean-Baptiste Clément	<p>Tombeau de Jean-Baptiste Cl&eacute;ment</p>	<p>Tombeau de Jean-Baptiste Cl&eacute;ment</p>	NORMAL_IMAGE	\N
106	media/communde_de_paris/T_Wroblewsky_Valery-1_R400.jpg	Tombeau de Valéry Wroblewski	<p>Tombeau de Val&eacute;ry Wroblewski</p>	<p>Tombeau de Val&eacute;ry Wroblewski</p>	NORMAL_IMAGE	\N
107	media/communde_de_paris/T_Lefrancais_Gustave_R400.jpg	Tombeau de Gustave Lefrançais	<p>Tombeau de Gustave Lefran&ccedil;ais</p>	<p>Tombeau de Gustave Lefran&ccedil;ais</p>	NORMAL_IMAGE	\N
108	media/communde_de_paris/T_Malon_Benoit_R400.jpg	Tombeau de Benoît Malon	<p>Tombeau de Beno&icirc;t Malon</p>	<p>Tombeau de Beno&icirc;t Malon</p>	NORMAL_IMAGE	\N
109	media/communde_de_paris/T_Pichio_Ernest_Louis_R400.jpg	Tombeau de Ernest Pichio	<p>Tombeau de Ernest Pichio</p>	<p>Tombeau de Ernest Pichio</p>	NORMAL_IMAGE	\N
110	media/communde_de_paris/T_Lafargue_Photo_Pierre-Yves_Beaudouin_W_R400.jpg	Tombeau de Paul et Laura Lafargue	<p>Tombeau de Paul et Laura Lafargue</p>	<p>Tombeau de Paul et Laura Lafargue</p>	NORMAL_IMAGE	\N
112	media/communde_de_paris/P_R400_Lissagaray_Prosper.jpg	Lissagaray, Hippolyte Prosper Olivier	<p>Hippolyte Prosper Olivier Lissagaray</p>	<p>Hippolyte Prosper Olivier Lissagaray</p>	INDEX_IMAGE	15
113	media/communde_de_paris/P_R400_Martelet_Paul.jpg	Martelet, Paul	<p>Paul Martelet</p>	<p>Paul Martelet</p>	INDEX_IMAGE	15
114	media/communde_de_paris/P_R400_Mink_Paule_Photo_JM_Lopez.jpg	Mink, Paule	<p>Paule Mink, par JM Lopez</p>	<p>Paule Mink</p>	INDEX_IMAGE	15
115	media/communde_de_paris/P_Image_de_la_Commune_pour_Eugene_Vigey_R400.jpg	Vigey, Eugène Jean-Baptiste	<p>Une image symbolique de la Commune</p>	<p>Portrait de Eug&egrave;ne Vigey absent</p>	INDEX_IMAGE	15
116	media/communde_de_paris/Lafargue_et_autres-2.jpg	Les Tombeaux devant le Mur des Fédérés	<p>Les Tombeaux devant le Mur des F&eacute;d&eacute;r&eacute;s</p>	<p>Les Tombeaux devant le Mur des F&eacute;d&eacute;r&eacute;s</p>	NORMAL_IMAGE	\N
117	media/communde_de_paris/T_Lejeune_Adrien-2.jpg	Tombeau de Adrien Lejeune	<p>Tombeau de Adrien Lejeune</p>	<p>Tombeau de Adrien Lejeune</p>	NORMAL_IMAGE	\N
118	media/communde_de_paris/T_Allemane_Jean-1.jpg	Tombeau de Jean Allemane	<p>Tombeau de Jean Allemane</p>	<p>Tombeau de Jean Allemane</p>	NORMAL_IMAGE	\N
119	media/communde_de_paris/T_Lucipia_Louis_Adrien-3.jpg	Tombeau de Louis Adrien Lucipia	<p>Tombeau de Louis Adrien Lucipia</p>	<p>Tombeau de Louis Adrien Lucipia</p>	NORMAL_IMAGE	\N
120	media/communde_de_paris/Moreau-Vauthier_Augustin-Jean-1.jpg	Tombeau de Augustin-Jean Moreau-Vauthier	<p>Tombeau de Augustin-Jean Moreau-Vauthier</p>	<p>Tombeau de Augustin-Jean Moreau-Vauthier</p>	NORMAL_IMAGE	\N
121	media/communde_de_paris/P_Lejeune_Adrien.jpg	Lejeune, Adrien	<p>Adrien Lejeune</p>	<p>Adrien Lejeune</p>	INDEX_IMAGE	45
122	media/communde_de_paris/P_Allemane_Jean_photo_Marmand.jpg	Allemane, Jean	<p>Portrait de Jean Allemane par Marmand</p>	<p>Jean Allemane</p>	INDEX_IMAGE	46
123	media/communde_de_paris/P_Lucipia_Louis_Adrien.jpg	Lucipia, Louis Adrien	<p>Louis Adrien Lucipia</p>	<p>Louis Adrien Lucipia</p>	INDEX_IMAGE	47
124	media/communde_de_paris/P_Moreau-Vauthier_Augustin_par_Appert_-vérifier.jpg	Moreau-Vauthier, Augustin-Jean	<p>Augustin-Jean Moreau-Vauthier</p>	<p>Augustin-Jean Moreau-Vauthier</p>	INDEX_IMAGE	48
125	media/communde_de_paris/P_R400_Brissac_Henri_Cri_du_peuple_1885-09-18.jpg	Brissac, Henri	<p>Henri Brissac (dessin apparu dans le Cri du peuple, le 18-09-1885)</p>	<p>Henri Brissac</p>	INDEX_IMAGE	15
126	media/communde_de_paris/Maximilien_Luce_-_A_Street_in_Paris_in_May_1871_-_Google_Art_Project.jpg	Maximilien Luce, Une rue à Paris	<p>Maximilien Luce, Une rue &agrave; Paris en Mai 1871, vers 1903, Mus&eacute;e d&#39;Orsay, Paris (image Google Art Project, Wikimedia Commons)</p>	<p>NA</p>	NORMAL_IMAGE	\N
127	media/communde_de_paris/Le_Cri_du_peuple__23_Mai_1871_Crop.jpeg	Le Cri du Peuple	<p>Le Cri du Peuple, 23 Mai 1871, BNF Gallica</p>	<p>NA</p>	NORMAL_IMAGE	\N
128	media/communde_de_paris/Commune_de_Paris_club_de_Saint-Nicolas-des-Champs_W.jpg	Le Club de Saint-Nicolas-des-Champs	<p>Le Club de Saint-Nicolas-des-Champs</p>	<p>NA</p>	NORMAL_IMAGE	\N
129	media/communde_de_paris/L_Appel_Devambez.jpg	L'appel de de André Devambez	<p>L&#39;appel de de Andr&eacute; Devambez, vers 1910, Mus&eacute;e d&#39;art et d&#39;histoire, Saint-Denis</p>	<p>NA</p>	NORMAL_IMAGE	\N
130	media/communde_de_paris/Commune_de_Paris_gardes_nationaux_sur_la_colonne_Vendome.jpg	Gardes nationaux sur la colonne Vendôme	<p>Gardes nationaux et curieux sur la colonne Vend&ocirc;me renvers&eacute;e le 16 mai 1871 - Photo de Bruno Braquehais.</p>	<p>NA</p>	NORMAL_IMAGE	\N
131	media/communde_de_paris/Commune_de_Paris_versaillais_a_la_porte_de_Saint_Cloud.jpg	Les Versaillais à la porte de Saint-Cloud	<p>Les Versaillais &agrave; la porte de Saint-Cloud</p>	<p>NA</p>	NORMAL_IMAGE	\N
132	media/communde_de_paris/Appert_gouvernement_provisoire_1870-71.jpg	Le gouvernement provisoire 1870-1871	<p>Le gouvernement provisoire d&#39;Adolphe Thiers 1870-1871. Photo (montage) d&#39;Ernest-Eug&egrave;ne Appert, noms manuscrits. 1870</p>	<p>Le gouvernement provisoire de Thiers, 1870</p>	NORMAL_IMAGE	\N
133	media/communde_de_paris/Boulanger_commune_Villette.jpg	La Villette cernée par les troupes versaillaises	<p><span dir="ltr">La Villette cern&eacute;e par les troupes versaillaises, mai 1871, Gustave Boulanger, </span>Mus&eacute;e Carnavalet, Paris</p>	<p>NA</p>	NORMAL_IMAGE	\N
134	media/communde_de_paris/Le_proces_des_communards.jpg	Le procès des communards	<p>Versailles, S&eacute;ance du troisi&egrave;me Conseil de guerre, Anonyme. Saint-Denis, mus&eacute;e d&#39;art et d&#39;histoire</p>	<p>Proc&egrave;s des communards</p>	NORMAL_IMAGE	\N
135	media/communde_de_paris/communards-deportes-ile-des_med_.jpeg	Les communards déportés en Nouvelle Calédonie	<p>Les communards d&eacute;port&eacute;s en Nouvelle Cal&eacute;donie</p>	<p>Les communards d&eacute;port&eacute;s en Nouvelle Cal&eacute;donie</p>	NORMAL_IMAGE	\N
136	media/communde_de_paris/DSC_5540-2_1200.jpg	Une allée au Père Lachaise	<p>Une all&eacute;e au P&egrave;re Lachaise</p>	<p>NA</p>	NORMAL_IMAGE	\N
137	media/communde_de_paris/Tombeau_de_La_Fontaine_1200.jpg	Les tombeaux de Molière et La Fontaine	<p>Les tombeaux de Moli&egrave;re et La Fontaine au P&egrave;re Lachaise</p>	<p>Les tombeaux de Moli&egrave;re et La Fontaine</p>	NORMAL_IMAGE	\N
138	media/communde_de_paris/Logo-1871-01_200.jpg	Logo des Amies et Amis de la Commune de Paris	<p>NA</p>	<p>NA</p>	NORMAL_IMAGE	\N
140	media/communde_de_paris/Logo-1871-01_400_pRuzRCk.jpg	Logo des Amies et Amis de la Commune de Paris	<p>NA</p>	<p><span style="color:#ffffff">NA</span></p>	NORMAL_IMAGE	\N
141	media/communde_de_paris/Temps_des_Cerises_Couverture_originale.png	Affiche Le temps des Cerises	<p>NA</p>	<p>NA</p>	NORMAL_IMAGE	61
77	media/communde_de_paris/Ilya_Repin_-_Rassemblement_au_P-L_1883.JPG	La montée au Mur	<p>Ilya Repine,<em> Rassemblement au P&egrave;re Lachaise en m&eacute;moire des victimes de la Commune</em></p>\r\n\r\n<p>Huile sur toile, 1883, Galerie Tretyakov, Moscou</p>	<p>Ilya Repine, La mont&eacute;e au Mur, 1883</p>	NORMAL_IMAGE	\N
\.


--
-- Name: commune_de_paris_cdp_images_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lionhart
--

SELECT pg_catalog.setval('public.commune_de_paris_cdp_images_image_id_seq', 141, true);


--
-- Data for Name: commune_de_paris_cdp_itinerary; Type: TABLE DATA; Schema: public; Owner: lionhart
--

COPY public.commune_de_paris_cdp_itinerary (itinerary_id, itinerary_name, itinerary_steps, itinerary_type, is_visible_on_homepage) FROM stdin;
1	Les communards au Père Lachaise	34	ITIN	t
2	À propos	0	INTRO	t
7	Le Mur des Fédérés	0	INTRO	t
6	Index alphabétique	0	ITIN_NAME_INDEX	f
8	MENTIONS LÉGALES	0	INTRO	f
4	Histoire de la Commune	15	ITIN_INDEX	t
\.


--
-- Data for Name: commune_de_paris_cdp_itinerary_color_scheme; Type: TABLE DATA; Schema: public; Owner: lionhart
--

COPY public.commune_de_paris_cdp_itinerary_color_scheme ("ICS_id", itinerary_colors, itinerary_id) FROM stdin;
1	RED	1
\.


--
-- Name: commune_de_paris_cdp_itinerary_color_scheme_ICS_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lionhart
--

SELECT pg_catalog.setval('public."commune_de_paris_cdp_itinerary_color_scheme_ICS_id_seq"', 1, true);


--
-- Name: commune_de_paris_cdp_itinerary_itinerary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lionhart
--

SELECT pg_catalog.setval('public.commune_de_paris_cdp_itinerary_itinerary_id_seq', 8, true);


--
-- Data for Name: commune_de_paris_cdp_lieu; Type: TABLE DATA; Schema: public; Owner: lionhart
--

COPY public.commune_de_paris_cdp_lieu ("Lieu_id", "Lieu_Address", "Lieu_Comment", "Page_id") FROM stdin;
\.


--
-- Name: commune_de_paris_cdp_lieu_Lieu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lionhart
--

SELECT pg_catalog.setval('public."commune_de_paris_cdp_lieu_Lieu_id_seq"', 1, false);


--
-- Data for Name: commune_de_paris_cdp_map; Type: TABLE DATA; Schema: public; Owner: lionhart
--

COPY public.commune_de_paris_cdp_map (page_id, lat, longt, "Page_id", itinerary_id, map_images_id, geo_coordinates) FROM stdin;
15	48.86138	2.39600	19	1	37	48.86138,2.39600
13	48.86183	2.39588	17	1	33	48.86183,2.39588
11	48.86263	2.39569	15	1	25	48.86263,2.39569
8	48.86362	2.39334	12	1	18	48.86362,2.39334
10	48.86276	2.39369	14	1	22	48.86276,2.39369
6	48.86283	2.39325	10	1	14	48.86283,2.39325
2	48.86228	2.39043	6	1	4	48.86228,2.39043
23	48.86027	2.39827	27	1	55	48.86027,2.39827
27	48.85864	2.39814	31	1	63	48.85864,2.39814
3	48.86323	2.39083	7	1	64	48.86323,2.39083
24	48.86024	2.39822	28	1	66	48.86024,2.39822
29	48.8598	2.39997	33	1	71	48.8598, 2.39997
30	48.85970	2.40001	34	1	75	48.85970,2.40001
32	48.86209	2.39841	46	1	118	48.86209,2.39841
33	48.86245	2.39757	47	1	119	48.86245,2.39757
34	48.85979	2.39369	48	1	120	48.85979,2.39369
7	48.86298	2.39345	11	1	15	48.86298,2.39345
4	48.86331	2.39137	8	1	11	48.86331,2.39137
1	48.86207	2.39046	4	1	2	48.86207
14	48.86166	2.39531	18	1	36	48.86166,2.39531
16	48.86119	2.39603	20	1	40	48.86119,2.39603
17	48.86083	2.39653	21	1	43	48.86083,2.39653
18	48.86096	2.39684	22	1	65	48.86096,2.39684
21	48.86015	2.39705	25	1	51	48.86015,2.39705
22	48.86050	2.39807	26	1	52	48.86050,2.39807
25	48.86001	2.39838	29	1	59	48.86001, 2.39838
26	48.85934	2.39843	30	1	60	48.85934,2.39843
19	48.86133	2.39737	23	1	47	48.86133,2.39737
20	48.86034	2.39692	24	1	48	48.86034,2.39692
31	48.85983	2.39980	45	1	117	48.85983,2.39980
28	48.85846	2.39660	32	1	68	48.85846,2.39660
12	48.86195	2.39718	16	1	32	48.86195, 2.39718
9	48.86440	2.39498	13	1	19	48.86440,2.39498
5	48.86163	2.39311	9	1	12	48.86163,2.39311
\.


--
-- Data for Name: commune_de_paris_cdp_map_controls; Type: TABLE DATA; Schema: public; Owner: lionhart
--

COPY public.commune_de_paris_cdp_map_controls ("MC_id", zoom_for_home, pin_zoom, itinerary_id, map_center) FROM stdin;
2	16.0	18.0	1	48.861293, 2.395847
1	16.0	18.0	\N	48.861293,2.395847
\.


--
-- Name: commune_de_paris_cdp_map_controls_MC_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lionhart
--

SELECT pg_catalog.setval('public."commune_de_paris_cdp_map_controls_MC_id_seq"', 2, true);


--
-- Name: commune_de_paris_cdp_map_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lionhart
--

SELECT pg_catalog.setval('public.commune_de_paris_cdp_map_page_id_seq', 34, true);


--
-- Data for Name: commune_de_paris_cdp_menu; Type: TABLE DATA; Schema: public; Owner: lionhart
--

COPY public.commune_de_paris_cdp_menu (menu_id, menu_title, menu_link, menu_type, itinerary_id, menu_images_id) FROM stdin;
1	Les communards au Père Lachaise	les-communardars-au-pere-lachaise	Main	1	90
2	Les communards au Père Lachaise	les-communardars-au-pere-lachaise	Burger	1	\N
6	Cléray, Eugène	les-communards-au-pere-lachaise/cleray-eugene	Step	1	11
5	Monument à la mémoire des gardes nationaux	les-communards-au-pere-lachaise/monument-a-la-memoire-des-gardes-nationaux	Step	1	64
7	Miot, Jules	les-communards-au-pere-lachaise/miot-jules	Step	1	12
9	Delescluze, Charles	les-communards-au-pere-lachaise/delecluze-charles	Step	1	15
11	Capellaro, Charles-Romain	les-communards-au-pere-lachaise/capellaro-charles-romain	Step	1	18
4	Vallès, Jules	les-communardars-au-pere-lachaise/valles-jules	Step	1	4
71	Le Mur des Fédérés	le-mur-des-federes	Burger	7	\N
70	Le Mur des Fédérés	le-mur-des-federes	Main	7	\N
69	Le Mur des Fédérés	a-propos/le-mur-des-federes	Step	2	\N
68	Le cimetière du Père Lachaise	les-communards-au-pere-lachaise/le-cimetiere-du-pere-lachaise	Step	1	137
56	Moreau-Vauthier Augustin-Jean	les-communards-au-pere-lachaise/moreau-vauthier-augustin-jean	Step	1	120
65	La répression	articles-thematiques/la-repression	Step	4	134
48	Le 18 mars début de la Commune	articles-thematiques/le-debut-de-la-commune	Step	4	83
62	La garde nationale	articles-thematiques/la-garde-nationale	Step	4	130
58	La Commune et les étrangers	articles-thematiques/les-etrangers-sous-la-commune	Step	4	80
64	La semaine sanglante fin de la Commune	articles-thematiques/la-semaine-sanglante	Step	4	133
61	Les écrivains et la Commune	articles-thematiques/les-ecrivains-contre-la-commune-de-paris	Step	4	129
60	La presse pendant la Commune	articles-thematiques/la-presse	Step	4	127
50	L'œuvre de la Commune	articles-thematiques/l-oeuvre-de-la-commune	Step	4	87
19	Avrial, Augustin	les-communards-au-pere-lachaise/avrial-augustin	Step	1	36
10	Flourens, Gustave	les-communards-au-pere-lachaise/flourens-gustave	Step	1	3
55	Lucipia, Louis Adrien	les-communards-au-pere-lachaise/lucipia-louis-adrien	Step	1	119
54	Allemane, Jean	les-communards-au-pere-lachaise/allemane-jean	Step	1	118
49	Les femmes dans la Commune	articles-thematiques/les-femmes-dans-la-commune	Step	4	82
51	Index alphabétique	name-index	Burger	6	\N
59	La Fédération des artistes	articles-thematiques/la-federation-des-artistes	Step	4	126
57	Le fonctionnement de la Commune	articles-thematiques/le-fonctionnement-de-la-commune	Step	4	128
47	Le contexte de la Commune	articles-thematiques/le-contexte-de-la-commune	Step	4	85
46	Présentation de la Commune	articles-thematiques/presentation-de-la-commune	Step	4	81
44	Histoire de la Commune	articles-thematiques	Burger	4	\N
38	À propos	a-propos/a-propos	Step	2	\N
12	Okolowicz, Auguste	les-communards-au-pere-lachaise/okolowicz-auguste	Step	1	19
14	Pyat, Félix	les-communards-au-pere-lachaise/pyat-felix	Step	1	22
37	À propos	a-propos	Burger	2	\N
35	Le Mur des Fédérés	les-communards-au-pere-lachaise/le-mur-des-federes	Step	1	76
63	Adolphe Thiers	articles-thematiques/adolphe-thiers	Step	4	132
53	Lejeune, Adrien	les-communards-au-pere-lachaise/lejeune-adrien	Step	1	117
33	Ranc, Arthur	les-communards-au-pere-lachaise/ranc-arthur	Step	1	68
32	Amouroux, Charles	les-communards-au-pere-lachaise/amouroux-charles	Step	1	63
31	Frankel, Léo	les-communards-au-pere-lachaise/frankel-leo	Step	1	60
17	Grousset, Paschal	les-communards-au-pere-lachaise/grousset-paschal	Step	1	32
16	Colombarium et crématorium	les-communards-au-pere-lachaise/colombarium-et-crematorium	Step	1	25
18	Urbain, Raoul	les-communards-au-pere-lachaise/urbain-raoul	Step	1	33
21	Blanqui, Auguste	les-communards-au-pere-lachaise/blanqui-auguste	Step	1	40
30	Delaplanche, Eugène	les-communards-au-pere-lachaise/delaplanche-eugene	Step	1	59
29	Rogeard, Louis Auguste	les-communards-au-pere-lachaise/rogeard-louis-auguste	Step	1	66
28	Joffrin, Jules	les-communards-au-pere-lachaise/joffrin-jules	Step	1	55
27	Pottier, Eugène	les-communards-au-pere-lachaise/pottier-eugene	Step	1	52
20	Eudes, Émile	les-communards-au-pere-lachaise/eudes-emile	Step	1	37
26	Gill, André	les-communards-au-pere-lachaise/gill-andre	Step	1	51
8	Le site des derniers combats - Tombeau de Charles Nodier	les-communards-au-pere-lachaise/le-site-des-derniers-combats-tombeau-de-charles-nodier	Step	1	14
22	Noir, Victor	les-communards-au-pere-lachaise/noir-victor	Step	1	43
23	Longuet, Charles	les-communards-au-pere-lachaise/longuet-charles	Step	1	65
24	Chassin, Charles-Louis	les-communards-au-pere-lachaise/chassin-charles-louis	Step	1	47
25	Cournet, Frédéric	les-communards-au-pere-lachaise/cournet-frederic	Step	1	48
72	MENTIONS LÉGALES	commune_de_paris/mentions-legales	Main	8	\N
73	MENTIONS LÉGALES	commune_de_paris/mentions-legales	Burger	8	\N
34	Les tombes devant le mur des Fédérés	les-communards-au-pere-lachaise/devant-le-mur-des-federes	Step	1	70
75	Le temps des cerises	histoire-de-la-commune/le-temps-des-cerises	Step	4	141
43	Histoire de la Commune	articles-thematiques	Main	4	80
\.


--
-- Name: commune_de_paris_cdp_menu_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lionhart
--

SELECT pg_catalog.setval('public.commune_de_paris_cdp_menu_menu_id_seq', 75, true);


--
-- Data for Name: commune_de_paris_cdp_opening_hours; Type: TABLE DATA; Schema: public; Owner: lionhart
--

COPY public.commune_de_paris_cdp_opening_hours (oh_id, "oh_Details", "oh_Comment", "Page_id") FROM stdin;
\.


--
-- Name: commune_de_paris_cdp_opening_hours_oh_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lionhart
--

SELECT pg_catalog.setval('public.commune_de_paris_cdp_opening_hours_oh_id_seq', 1, false);


--
-- Data for Name: commune_de_paris_cdp_page; Type: TABLE DATA; Schema: public; Owner: lionhart
--

COPY public.commune_de_paris_cdp_page (page_id, page_title, page_type, page_order, "page_Summary", itinerary_id, is_page_zero, page_display_title, show_display_title) FROM stdin;
40	Le contexte de la Commune	step_index	2	NA	4	f		f
39	Présentation de la Commune	step_index	1	NA	4	f		f
34	Le Mur des Fédérés	step	30	NA	1	f		f
15	Colombarium et crématorium	step	11	NA	1	f		f
7	Monument à la mémoire des gardes nationaux	step	3	NA	1	f		f
35	À propos	introduction	\N	NA	2	f		f
5	Les communards au Père Lachaise	step_introduction	\N	A vous d'enrichir ce "parcours communard" en complétant ces biographies purement indicatives et volontairement succinctes. Nous vous invitons à consulter notre site et tous ceux qui se consacrent à cette expérience souvent ignorée. Bien sûr, nous espérons vous voir adhérer à notre association, participer à nos recherches, nous aider à faire vivre la Commune de Paris.	1	f		f
58	Le cimetière du Père Lachaise	step	0	NA	1	t		f
44	Index alphabétique	step_introduction_index	\N	NA	6	f		f
59	Le Mur des Fédérés	introduction	\N	Symbole de la semaine sanglante et de la répression dans le sang de la Commune de Paris, le mur du Père Lachaise est le lieu marquant de la Commune. Tous les ans s'organise le pendant la période de la semaine sanglante une "montée au mur" pour célébrer la Commune et commémorer ses morts.	7	f		f
54	La garde nationale	step_index	3	NA	4	f		f
60	Mentions légales	introduction	\N	NA	8	f		f
33	Les tombes devant le mur des Fédérés	step	29	NA	1	f		f
55	Adolphe Thiers	step_index	4	NA	4	f		f
41	Le 18 mars début de la Commune	step_index	5	NA	4	f		f
49	Le fonctionnement de la Commune	step_index	6	NA	4	f		f
43	L'œuvre de la Commune	step_index	7	NA	4	f		f
42	Les femmes dans la Commune	step_index	8	NA	4	f		f
51	La Fédération des artistes	step_index	9	NA	4	f		f
53	Les écrivains et la Commune	step_index	10	NA	4	f		f
50	La Commune et les étrangers	step_index	11	NA	4	f		f
52	La presse pendant la Commune	step_index	12	NA	4	f		f
56	La semaine sanglante fin de la Commune	step_index	13	NA	4	f		f
57	La répression	step_index	14	NA	4	f		f
38	Histoire de la Commune	step_introduction_index	1	Veuillez trouver quelques pages dédiées à l’histoire de la Commune, ses œuvres, ses femmes et hommes, soldats et artistes qui l’ont faite et à la terrible répression qui détruisit cette construction solidaire et politique et massacra sans merci une partie des participants.	4	f		f
24	Cournet, Frédéric	step	20	NA	1	f	Frédéric Cournet (1837 - 1885)	t
25	Gill, André	step	21	NA	1	f	André Gill (1840 - 1885)	t
48	Moreau-Vauthier Augustin-Jean	step	34	NA	1	f	Augustin-Jean Moreau-Vauthier (1831 - 1893)	t
4	Flourens, Gustave	step	1	NA	1	f	Gustave Flourens (1838 - 1871)	t
6	Vallès, Jules	step	2	NA	1	f	Jules Vallès (1832 - 1885)	t
8	Cléray, Eugène	step	4	NA	1	f	Eugène Cléray (1828 - 1882)	t
9	Miot, Jules	step	5	NA	1	f	Jules Miot (1809 - 1883)	t
12	Capellaro, Charles-Romain	step	9	NA	1	f	Charles-Romain Capellaro (1826 - 1899)	t
13	Okolowicz, Auguste	step	10	NA	1	f	Auguste Okolowicz (1837 - 1891)	t
14	Pyat, Félix	step	8	NA	1	f	Félix Pyat (1810 - 1899)	t
16	Grousset, Paschal	step	12	NA	1	f	Paschal Grousset (1844 - 1909)	t
17	Urbain, Raoul	step	13	NA	1	f	Raoul Urbain (1837 - 1902)	t
19	Eudes, Émile	step	15	NA	1	f	Émile Eudes (1843 - 1888)	t
21	Noir, Victor	step	17	NA	1	f	Victor Noir (1848 - 1870)	t
23	Chassin, Charles-Louis	step	19	NA	1	f	Charles-Louis Chassin (1831 - 1901)	t
26	Pottier, Eugène	step	22	NA	1	f	Eugène Pottier (1816 - 1887)	t
27	Joffrin, Jules	step	23	NA	1	f	Jules Joffrin (1846 - 1890)	t
28	Rogeard, Louis Auguste	step	24	NA	1	f	Louis Auguste Rogeard (1820 - 1896)	t
29	Delaplanche, Eugène	step	25	NA	1	f	Eugène Delaplanche (1836 - 1891)	t
30	Frankel, Léo	step	26	NA	1	f	Léo Frankel (1844 - 1896)	t
31	Amouroux, Charles	step	27	NA	1	f	Charles Amouroux (1843 - 1885)	t
32	Ranc, Arthur	step	28	NA	1	f	Arthur Ranc (1831 - 1908)	t
45	Lejeune, Adrien	step	31	NA	1	f	Adrien Lejeune (1847 - 1942)	t
46	Allemane, Jean	step	32	NA	1	f	Jean Allemane (1843 - 1935)	t
47	Lucipia, Louis Adrien	step	33	NA	1	f	Louis Adrien Lucipia (1843 - 1904)	t
18	Avrial, Augustin	step	14	NA	1	f	Augustin Avrial (1840 - 1904)	t
20	Blanqui, Auguste	step	16	NA	1	f	Auguste Blanqui (1805 - 1881)	t
22	Longuet, Charles	step	18	NA	1	f	Charles Longuet (1838 - 1903)	t
10	Le site des derniers combats - Tombeau de Charles Nodier	step	6	NA	1	f	NA	f
61	Le temps des cerises	step_index	15	NA	4	f	NA	f
11	Delescluze, Charles	step	7	NA	1	f	Charles Delescluze (1809 - 1871)	t
\.


--
-- Data for Name: commune_de_paris_cdp_page_before_after_image_order; Type: TABLE DATA; Schema: public; Owner: lionhart
--

COPY public.commune_de_paris_cdp_page_before_after_image_order ("PD_id", is_page_in_present, appearnce_order_in_page, page_description_id, page_image_after_id, page_image_before_id) FROM stdin;
\.


--
-- Name: commune_de_paris_cdp_page_before_after_image_order_PD_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lionhart
--

SELECT pg_catalog.setval('public."commune_de_paris_cdp_page_before_after_image_order_PD_id_seq"', 1, false);


--
-- Data for Name: commune_de_paris_cdp_page_description; Type: TABLE DATA; Schema: public; Owner: lionhart
--

COPY public.commune_de_paris_cdp_page_description ("PD_id", "page_Text", page_id, page_map_id, page_title_image_id, show_title_audio) FROM stdin;
3	<p>A vous d&#39;enrichir ce &quot;parcours communard&quot; en compl&eacute;tant ces biographies purement indicatives et volontairement succinctes. Nous vous invitons &agrave; consulter notre site et tous ceux qui se consacrent &agrave; cette exp&eacute;rience souvent ignor&eacute;e. Bien s&ucirc;r, nous esp&eacute;rons vous voir adh&eacute;rer &agrave; notre association, participer &agrave; nos recherches, nous aider &agrave; faire vivre la Commune de Paris.</p>	5	\N	88	t
21	<p>&lt;1&gt;</p>\r\n\r\n<p>Cheminot. Apr&egrave;s la chute de l&#39;Empire, il commande un bataillon de la <a href="/articles-thematiques/la-garde-nationale" target="_self">garde nationale</a>. &Eacute;lu d&eacute;put&eacute; en f&eacute;vrier 1871, il d&eacute;missionne pour si&eacute;ger &agrave; l&#39;H&ocirc;tel de ville. Lors de la Commune, il fait partie de la <a href="/articles-thematiques/le-fonctionnement-de-la-commune" target="_self">commission de la s&ucirc;ret&eacute; g&eacute;n&eacute;rale et de la guerre</a>. Il s&#39;oppose &agrave; l&#39;ex&eacute;cution des otages. Il s&#39;exile &agrave; Londres. (Buste de Marguerite Syamour).</p>\r\n\r\n<p><a href="https://maitron.fr/spip.php?article2610" target="_self">Pour en savoir plus</a></p>	24	20	48	t
18	<p>&lt;1&gt;</p>\r\n\r\n<p>Journaliste, &eacute;crivain, th&eacute;oricien socialiste. Il ne participe pas &agrave; la Commune, arr&ecirc;t&eacute; le 17 mars par le gouvernement Thiers. De nombreux communards ont adh&eacute;r&eacute; &agrave; ses th&eacute;ories (Ferr&eacute;, Eudes, Mortier, Rigault&hellip;). Surnomm&eacute; &quot;Le vieux&quot; ou &quot;L&#39;enferm&eacute;&quot; (43 ans et 2 mois de prison et de r&eacute;sidence surveill&eacute;e !), il est lib&eacute;r&eacute; en 1879, il combat pour l&#39;<a href="/articles-thematiques/la-repression" target="_self">amnistie</a>, et cr&eacute;e le journal &quot;Ni dieu, ni ma&icirc;tre&quot;. 100 000 personnes assistent &agrave; son enterrement. Le gisant a &eacute;t&eacute; r&eacute;alis&eacute; vers 1900 par le sculpteur Jules Dalou.</p>\r\n\r\n<p><a href="https://maitron.fr/spip.php?article24369" target="_self">Pour en savoir plus</a></p>	20	16	40	t
11	<p>&lt;1&gt;</p>\r\n\r\n<p><em><span style="background-color:#dddddd">Acc&egrave;s&nbsp;: depuis la tombe de Charles Cappellaro continuez en remontant l&rsquo;Avenue Circulaire. Passez la Transversale n. 2 et continuez jusqu&rsquo;&agrave; la hauteur de la Transversale n. 3 et sur votre gauche vous verrez une tombe de la famille Cousin. La tombe de Okolowicz se trouve juste derri&egrave;re, au pied du mur. (Div. 79)</span></em></p>\r\n\r\n<p>N&eacute; &agrave; Vierzon en 1837 dans une famille nombreuse (quatre de ses fr&egrave;res combattront aussi pour la Commune), militaire en Pologne, chanteur, officier pendant la guerre de 1870, il combat pendant le si&egrave;ge, devient commandant d&rsquo;un <a href="/articles-thematiques/la-garde-nationale" target="_self">bataillon de f&eacute;d&eacute;r&eacute;s</a> puis membre de l&rsquo;&eacute;tat-major de Dombrowsky. Bless&eacute;, nomm&eacute; g&eacute;n&eacute;ral, il est captur&eacute; pendant la <a href="/articles-thematiques/la-semaine-sanglante" target="_self">Semaine sanglante</a> mais s&rsquo;&eacute;vade du camp de Satory en septembre 1871. Exil&eacute; en Belgique, il rentre &agrave; Paris en 1879 et dirige une fabrique de porcelaine. Il meurt en 1891. C&rsquo;est lui qui aurait plant&eacute; un drapeau rouge dans les mains du G&eacute;nie de la Bastille en mars 1871.</p>\r\n\r\n<p><a href="https://maitron.fr/spip.php?article67264" target="_blank">Pour en savoir plus</a></p>\r\n\r\n<p>&nbsp;</p>	13	\N	19	t
6	<p>&lt;1&gt;</p>\r\n\r\n<p>Insurg&eacute; en 1848. Membre de la Commune de Paris en 1871.&nbsp; Adjoint au Maire du III&egrave;me arrondissement de Paris. Membre du Conseil municipal de Paris de 1873 &agrave; 1877 et membre du Conseil G&eacute;n&eacute;ral de la Seine.</p>\r\n\r\n<p><a href="https://maitron.fr/spip.php?article182657" target="_blank">Pour en savoir plus</a></p>	8	4	11	t
7	<p>&lt;1&gt;</p>\r\n\r\n<p><em><span style="background-color:#dddddd">Acc&egrave;s&nbsp;: &nbsp;pour rejoindre la tombe de Jules Miot en partant de celle de Eug&egrave;ne Cl&eacute;ray, revenez sur l&rsquo;Avenue de la Chapelle, parcourez-l&agrave; jusqu&rsquo;&agrave; l&rsquo;Avenue Feuillant que vous empruntez sur votre gauche. Puis, au bout d&rsquo;une trentaine de m&egrave;tres tournez encore &agrave; gauche dans le Chemin du Bastion. Quelques m&egrave;tres plus loin, sur votre droite s&rsquo;ouvre un passage au milieu des tombes. Remontez-le et vous trouverez la tombe de Miot au bout d&rsquo;une vingtaine de m&egrave;tres. (Div. 52)</span></em></p>\r\n\r\n<p>Pharmacien. Membre de la 1&egrave;re internationale. &Eacute;lu d&eacute;put&eacute; en 1848, r&eacute;voqu&eacute; et <a href="/articles-thematiques/la-repression" target="_self">d&eacute;port&eacute;</a> en Alg&eacute;rie apr&egrave;s le coup d&#39;&eacute;tat du 2 d&eacute;cembre 1851. Lors de la Commune, il est &eacute;lu du XIX&egrave;me arrondissement et devient membre de la commission de l&#39;enseignement. Il est l&#39;initiateur du Comit&eacute; de salut public. Jules Miot se r&eacute;fugie en Suisse apr&egrave;s avoir &eacute;t&eacute; condamn&eacute; &agrave; mort par contumace par le conseil de guerre. Rentr&eacute; en France apr&egrave;s l&#39;amnistie de 1880, il d&eacute;c&egrave;de le 9 mai 1883 &agrave; Adamville (Seine).</p>\r\n\r\n<p><a href="https://maitron.fr/spip.php?article145545" target="_blank">Pour en savoir plus</a></p>	9	5	12	t
36	<p>NA</p>	38	\N	80	t
27	<p>&lt;1&gt;</p>\r\n\r\n<p>&Eacute;l&egrave;ve de Francisque Duret &agrave; l&#39;&Eacute;cole des Beaux-arts de Paris, Eug&egrave;ne Delaplanche obtient le prix de Rome en sculpture et devient pensionnaire de la villa M&eacute;dicis &agrave; Rome de 1864 &agrave; 1867. Membre de la <a href="/articles-thematiques/la-federation-des-artistes" target="_self">F&eacute;d&eacute;ration des artistes</a>.</p>\r\n\r\n<p><a href="https://fr.wikipedia.org/wiki/Eug%C3%A8ne_Delaplanche" target="_self">Pour en savoir plus</a></p>	29	25	59	t
25	<p>&lt;1&gt;</p>\r\n\r\n<p>Homme politique socialiste. Il combat au cours de la guerre franco-prussienne de 1870. Il soutient la Commune et particuli&egrave;rement Eug&egrave;ne Protot au minist&egrave;re de la justice. Apr&egrave;s la <a href="/articles-thematiques/la-semaine-sanglante" target="_self">Semaine sanglante</a>, il s&#39;exile en Angleterre. Il revient en France apr&egrave;s l&#39;<a href="/articles-thematiques/la-repression" target="_self">amnistie</a>. Il participe &agrave; diff&eacute;rents combats politiques notamment contre le Boulangisme.</p>\r\n\r\n<p><a href="https://maitron.fr/spip.php?article24865" target="_self">Pour en savoir plus</a></p>	27	23	55	t
22	<p>&lt;1&gt;</p>\r\n\r\n<p>Louis Alexandre Gosset de Guinnes dit Gill Andr&eacute;. Dessinateur caricaturiste, il collabore &agrave; diff&eacute;rents journaux. Pendant le si&egrave;ge, il est membre de la <a href="/articles-thematiques/la-garde-nationale" target="_self">garde nationale</a>. Sous la Commune, membre de la <a href="/articles-thematiques/la-federation-des-artistes" target="_self">f&eacute;d&eacute;ration des artistes</a>, il est nomm&eacute; administrateur provisoire du mus&eacute;e du Luxembourg.</p>\r\n\r\n<p><a href="https://maitron.fr/spip.php?article60355" target="_self">Pour en savoir plus</a></p>	25	21	51	t
17	<p>&lt;1&gt;</p>\r\n\r\n<p>&Eacute;tudiant en pharmacie, blanquiste. Condamn&eacute; &agrave; mort pour l&#39;attaque contre la caserne de la Villette le 14 ao&ucirc;t 1870, il est sauv&eacute; par la proclamation de la R&eacute;publique. Membre du <a href="/articles-thematiques/la-garde-nationale" target="_self">comit&eacute; central</a> des vingt arrondissements pendant le si&egrave;ge. Lors de la Commune, &eacute;lu du XI&egrave;me arrondissement, il est nomm&eacute; aux commissions ex&eacute;cutive et militaire, puis inspecteur des forts. Membre du comit&eacute; de salut public. Pendant la <a href="/articles-thematiques/la-semaine-sanglante" target="_self">semaine sanglante</a>, il combat sur les barricades. Condamn&eacute; &agrave; mort, il s&#39;exile en Angleterre jusqu&#39;&agrave; l&#39;<a href="/articles-thematiques/la-repression" target="_self">amnistie</a>. Apr&egrave;s sa rentr&eacute;e en France, il fonde &quot;Ni dieu ni ma&icirc;tre&quot;, journal blanquiste.</p>\r\n\r\n<p><a href="https://maitron.fr/spip.php?article58730" target="_self">Pour en savoir plus</a></p>	19	15	37	t
28	<p>&lt;1&gt;</p>\r\n\r\n<p><em><span style="background-color:#dddddd">Acc&egrave;s&nbsp;: Reprenez l&rsquo;Avenue Transversale n. 3 en descendant vers l&rsquo;Avenue Circulaire. &Agrave; mi-chemin prenez l&rsquo;all&eacute;e &agrave; droite et continuez jusqu&rsquo;au croisement d&rsquo;une autre all&eacute;e mineure. Tournez &agrave; gauche sur celle-ci et descendez encore une vingtaine de m&egrave;tres et sur la gauche, derri&egrave;re la premi&egrave;re ligne se trouve la tombe de Frankel. (Div. 96)</span></em></p>\r\n\r\n<p>Orf&egrave;vre, membre de la 1&egrave;re internationale. Pendant le si&egrave;ge, membre de la <a href="/articles-thematiques/la-garde-nationale" target="_self">garde nationale</a> et du comit&eacute; central des vingt arrondissements. Lors de la Commune, il appartient aux <a href="/articles-thematiques/le-fonctionnement-de-la-commune" target="_self">commissions du Travail et de l&#39;&eacute;change et des finances</a>. Ensuite il devient d&eacute;l&eacute;gu&eacute; au travail. Ses principales mesures concernent : la r&eacute;quisition des ateliers abandonn&eacute;s par les patrons, la suppression du travail de nuit chez les boulangers et l&#39;interdiction des retenues sur salaires. Il soutient le Comit&eacute; de salut public puis rejoint la minorit&eacute;. Bless&eacute; le 25 mai sur les <a href="/articles-thematiques/la-semaine-sanglante" target="_self">barricades</a>, il s&#39;exile en Suisse, puis en Angleterre.</p>\r\n\r\n<p><a href="https://maitron.fr/spip.php?article24624" target="_self">Pour en savoir plus</a></p>	30	26	60	t
13	<p>Le cr&eacute;matorium-columbarium du P&egrave;re-Lachaise est un ensemble architectural compos&eacute; du premier cr&eacute;matorium de France, et d&#39;un columbarium.</p>\r\n\r\n<p>L&#39;&eacute;difice du XIX&egrave;me si&egrave;cle construit par l&#39;architecte Jean Camille Formig&eacute; est situ&eacute; &agrave; l&#39;int&eacute;rieur du cimeti&egrave;re du P&egrave;re-Lachaise. Il est inscrit au titre des monuments historiques depuis 1995.</p>\r\n\r\n<p>Le 21 mai 1804, le cimeti&egrave;re alors situ&eacute; sur le territoire de l&#39;ancienne commune de Charonne est officiellement ouvert. Puis, en 1859, la commune de Charonne est int&eacute;gr&eacute;e &agrave; la ville de Paris pour former une partie du 20e arrondissement.</p>\r\n\r\n<div>\r\n<p>En 1883, le Conseil municipal de Paris demande &agrave; l&#39;architecte Jean Camille Formig&eacute; d&#39;&eacute;difier un cr&eacute;matorium. La construction de l&#39;&eacute;difice s&#39;&eacute;talera de 1887 &agrave; 1908. D&#39;abord limit&eacute;, par l&#39;ordonnance du 28 juillet 1885, &agrave; l&#39;incin&eacute;ration des d&eacute;chets provenant des h&ocirc;pitaux, le b&acirc;timent est ensuite d&eacute;di&eacute; &agrave; la cr&eacute;mation des corps permise par la loi du 15 novembre 1887. La premi&egrave;re cr&eacute;mation en France a donc eu lieu le 30 janvier 1889 au cr&eacute;matorium du P&egrave;re-Lachaise</p>\r\n\r\n<p>Les cendres d&#39;un certain nombre de communards ont &eacute;t&eacute; relev&eacute;es, cons&eacute;quence des fins de concession, nous avons n&eacute;anmoins tenu &agrave; les faire figurer dans ce recueil et ainsi en conserver la m&eacute;moire.</p>\r\n</div>\r\n\r\n<hr />\r\n<p>&lt;gs1&gt;</p>\r\n\r\n<p><strong>Paul &Eacute;mile Bouchet, &quot;Brutus&quot; (1840 - 1915)</strong></p>\r\n\r\n<p>-audio1-</p>\r\n\r\n<p>&lt;1&gt;</p>\r\n\r\n<p>Avocat. Tr&egrave;s li&eacute; &agrave; Gaston Cr&eacute;mieux (fusill&eacute; &agrave; Marseille le 30 novembre 1871), il soutient la Commune de Marseille, Il est condamn&eacute; &agrave; 3 mois de prison, puis acquitt&eacute;, mais radi&eacute; du barreau. &Eacute;lu d&eacute;put&eacute;, il si&egrave;ge &agrave; l&rsquo;extr&ecirc;me gauche.</p>\r\n\r\n<p><a href="https://maitron.fr/spip.php?article146216" target="_self">Pour en savoir plus</a></p>\r\n\r\n<p>&lt;ge1&gt;</p>\r\n\r\n<hr />\r\n<p>&lt;gs2&gt;</p>\r\n\r\n<p><strong>Henri Brissac (1826 - 1906)</strong></p>\r\n\r\n<p>-audio2-</p>\r\n\r\n<p>&lt;2&gt;</p>\r\n\r\n<p>Ecrivain et journaliste. Pendant la Commune, il est secr&eacute;taire de la <a href="/articles-thematiques/le-fonctionnement-de-la-commune" target="_self">Commission ex&eacute;cutive</a>, puis, le 1er mai il devient secr&eacute;taire du Comit&eacute; de salut public. Il est condamn&eacute; aux travaux forc&eacute;s en Nouvelle-Cal&eacute;donie, il rentre &agrave; Paris en 1879 et devient libraire.</p>\r\n\r\n<p><a href="https://maitron.fr/spip.php?article145061" target="_self">Pour en savoir plus</a></p>\r\n\r\n<p>&lt;ge2&gt;</p>\r\n\r\n<hr />\r\n<p>&lt;gs3&gt;</p>\r\n\r\n<p><strong>Emmanuel-Jean-Jules Chauvi&egrave;re (1850 - 1910)</strong></p>\r\n\r\n<p>-audio3-</p>\r\n\r\n<p>&lt;3&gt;</p>\r\n\r\n<p>Comptable. Il est plusieurs fois condamn&eacute; sous le Second Empire. Pendant le premier si&egrave;ge, incorpor&eacute; dans le 82e <a href="/articles-thematiques/la-garde-nationale" target="_self">bataillon</a>, il est franc-tireur. Il combat sous les ordres du g&eacute;n&eacute;ral Duval au plateau de Chatillon. Il est arr&ecirc;t&eacute; le 4 avril et condamn&eacute; &agrave; 5 ans de prison. &Eacute;lu conseiller municipal en 1888 et d&eacute;put&eacute; en 1893.</p>\r\n\r\n<p><a href="https://www.commune1871.org/index.php?option=com_content&amp;view=article&amp;id=494:emmanuel-chauviere-un-temperament&amp;catid=12&amp;Itemid=109" target="_self">Pour en savoir plus</a></p>\r\n\r\n<p>&lt;ge3&gt;</p>\r\n\r\n<hr />\r\n<p>&lt;gs4&gt;</p>\r\n\r\n<p><strong>Louis Simon Dereure (1838 - 1900)</strong></p>\r\n\r\n<p>-audio4-</p>\r\n\r\n<p>&lt;4&gt;</p>\r\n\r\n<p>Ouvrier cordonnier, membre de la 1&egrave;re internationale. Maire-adjoint du XVIIIe arrondissement pendant le si&egrave;ge. Elu de son arrondissement pendant la Commune, il participe aux <a href="/articles-thematiques/le-fonctionnement-de-la-commune" target="_self">commissions</a> des subsistances,de la justice, est commissaire civil aupr&egrave;s de Drombrowski. Il vote avec la majorit&eacute; pour le Comit&eacute; de salut public. Il combat sur les <a href="/articles-thematiques/la-semaine-sanglante" target="_self">barricades</a>. Condamn&eacute; &agrave; mort par contumace, il s&#39;exile en Suisse puis &agrave; New-York.</p>\r\n\r\n<p><a href="https://maitron.fr/spip.php?article24607" target="_self">Pour en savoir plus</a></p>\r\n\r\n<p>&lt;ge4&gt;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<hr />\r\n<p>&lt;gs5&gt;</p>\r\n\r\n<p><strong>Jean Baptiste Dumay (1841 - 1926)</strong></p>\r\n\r\n<p>-audio5-</p>\r\n\r\n<p>&lt;5&gt;</p>\r\n\r\n<p>M&eacute;canicien-tourneur au Creusot chez Schneider. Membre de la 1&egrave;re internationale. Nomm&eacute; Maire-adjoint de sa commune, il est battu aux &eacute;lections l&eacute;gislatives du 8 f&eacute;vrier 1871. Il soutient la Commune de Paris et le 26 mars proclame la Commune du Creusot, r&eacute;prim&eacute;e d&egrave;s le lendemain. Condamn&eacute; aux <a href="/articles-thematiques/la-repression" target="_self">travaux forc&eacute;s</a> &agrave; perp&eacute;tuit&eacute;, il se r&eacute;fugie en Suisse. &Eacute;lu d&eacute;put&eacute; de Belleville (1889-1893), ensuite il devient r&eacute;gisseur de la bourse du travail de Paris.</p>\r\n\r\n<p><a href="https://www.commune1871.org/index.php?option=com_content&amp;view=article&amp;id=601:jean-baptiste-dumay&amp;catid=32&amp;Itemid=351" target="_self">Pour en savoir plus</a></p>\r\n\r\n<p>&lt;ge5&gt;</p>\r\n\r\n<hr />\r\n<p>&lt;gs6&gt;</p>\r\n\r\n<p><strong>Maurice Lachatre (1814 - 1900)</strong></p>\r\n\r\n<p>-audio6-</p>\r\n\r\n<p>&lt;6&gt;</p>\r\n\r\n<p>Lachastre (Baron de) Claude, Maurice, ou LACHATRE Maurice, &eacute;diteur anticl&eacute;rical &eacute;dite des livres libertaires. Il est ami de Proudhon. Condamn&eacute; &agrave; Draguignan pour ouverture d&rsquo;une &eacute;cole sans autorisation. Il fonde une banque en 1839. Joue un r&ocirc;le actif de d&eacute;l&eacute;gu&eacute; au comit&eacute; &eacute;lectoral d&eacute;mocratique &agrave; Paris en 1848. Son ch&acirc;teau d&rsquo;Arbana achet&eacute; en 1846 en Gironde sert de &laquo;&nbsp;communaut&eacute; mod&egrave;le&nbsp;&raquo;&nbsp;: s&rsquo;y trouvent une banque, une caisse mutuelle, deux &eacute;coles, un dispensaire. Collabore au journal &laquo;&nbsp;Combat&nbsp;&raquo; de F&eacute;lix Pyat pendant le si&egrave;ge de 1870-71 puis au &laquo;&nbsp;Vengeur&nbsp;&raquo;. Vers la fin de sa vie La Ch&acirc;tre se rapproche des anarchistes, lance vers 1894, son Dictionnaire-journal, &laquo;&oelig;uvre de propagande d&eacute;mocratique et sociale&raquo; en bonne partie posthume. Fut le premier &eacute;diteur fran&ccedil;ais du Capital de Karl Marx.</p>\r\n\r\n<p><a href="https://maitron.fr/spip.php?article167846" target="_self">Pour en savoir plus</a></p>\r\n\r\n<p>&lt;ge6&gt;</p>\r\n\r\n<hr />\r\n<p>&lt;gs7&gt;</p>\r\n\r\n<p><strong>Hippolyte Prosper-Olivier Lissagaray (1838 - 1901)</strong></p>\r\n\r\n<p>-audio7-</p>\r\n\r\n<p>&lt;7&gt;</p>\r\n\r\n<p>Animateur litt&eacute;raire, journaliste r&eacute;publicain socialiste et conf&eacute;rencier. Connu et r&eacute;put&eacute; pour son &laquo;&nbsp;Histoire de la Commune de 1871&nbsp;&raquo; &agrave; laquelle il a particip&eacute;. Il s&rsquo;installe &agrave; Paris en 1860, s&rsquo;engage contre l&rsquo;Empire en 1868. Cr&eacute;e le journal &laquo;&nbsp;L&rsquo;Avenir&nbsp;&raquo; &agrave; Auch. En 1870 il cr&eacute;e avec Rochefort le journal &laquo;&nbsp;<a href="/articles-thematiques/la-presse" target="_self">La Marseillaise</a>&nbsp;&raquo;. En 1871, il participe au 18 mars en tant que &laquo;&nbsp;simple du rang&nbsp;&raquo;. Il cr&eacute;e &laquo;&nbsp;L&rsquo;Action&nbsp;&raquo; et y d&eacute;nonce l&rsquo;inexistence de jeunes chefs militaires, y r&eacute;clame le programme de la Commune, souhaite que les int&eacute;r&ecirc;ts des paysans rejoignent ceux des ouvriers et que l&rsquo;&eacute;ducation soit &eacute;tendue aux campagnes. Ses derniers &eacute;crits dans le &laquo;&nbsp;Journal du Peuple&nbsp;&raquo;&nbsp;: &laquo;&nbsp;Au feu maintenant&nbsp;! Il ne s&rsquo;agit plus de crier Vive la r&eacute;publique, mais de la vivre&nbsp;!&nbsp;&raquo;</p>\r\n\r\n<p><a href="https://www.commune1871.org/index.php?option=com_content&amp;view=article&amp;id=525:lissagaray-le-michelet-de-la-commune-mousquetaire-de-la-sociale&amp;catid=12&amp;Itemid=109" target="_self">Pour en savoir plus</a></p>\r\n\r\n<p>&lt;ge7&gt;</p>\r\n\r\n<hr />\r\n<p>&lt;gs8&gt;</p>\r\n\r\n<p><strong>Jules Martelet (1843 - 1916)</strong></p>\r\n\r\n<p>-audio8-</p>\r\n\r\n<p>&lt;8&gt;</p>\r\n\r\n<p>N&eacute; dans la Marne en 1843, peintre sur verre, il adh&egrave;re &agrave; l&rsquo;AIT quand il arrive &agrave; Paris.&nbsp; Avec Sapia et Rigault on le retrouve &agrave; la t&ecirc;te du journal &laquo;&nbsp;<a href="/articles-thematiques/la-presse" target="_self">La R&eacute;sistance</a>&nbsp;&raquo;, organe d&eacute;mocratique du XIVe. S&rsquo;&eacute;tant battu dans la <a href="/articles-thematiques/la-garde-nationale" target="_self">Garde nationale</a> sous le si&egrave;ge de Paris, il s&rsquo;empare de la mairie de cet arrondissement le 18 mars, et l&rsquo;administrera durant la Commune dont il est un &eacute;lu d&egrave;s le 26 mars. Apr&egrave;s les <a href="/articles-thematiques/la-semaine-sanglante" target="_self">derniers combats</a>, il s&rsquo;&eacute;chappe et se r&eacute;fugie en Suisse puis en Belgique. Rentr&eacute; en 1880, fid&egrave;le &agrave; ses id&eacute;aux il devient membre du PSOR et s&rsquo;attache &agrave; reconstruire le socialisme dans le XIVe. Il meurt &agrave; l&rsquo;hospice en 1916 et est incin&eacute;r&eacute; au P&egrave;re Lachaise.</p>\r\n\r\n<p><a href="https://maitron.fr/spip.php?article75972" target="_self">Pour en savoir plus</a></p>\r\n\r\n<p>&lt;ge8&gt;</p>\r\n\r\n<hr />\r\n<p>&lt;gs9&gt;</p>\r\n\r\n<p><strong>Paule Mink (1839 - 1901)</strong></p>\r\n\r\n<p>-audio9-</p>\r\n\r\n<p>&lt;9&gt;</p>\r\n\r\n<p>Paulina MEKARSKA (MEKARSKI) n&eacute;e &agrave; Clermont-Ferrand, milite avec Andr&eacute; LEO et cr&eacute;e la &laquo;&nbsp;Soci&eacute;t&eacute; fraternelle de l&rsquo;ouvri&egrave;re&nbsp;&raquo;, <a href="/articles-thematiques/les-femmes-dans-la-commune" target="_self">organisation militante f&eacute;ministe</a>. En 1871, propagandiste &eacute;nergique, elle anime des clubs r&eacute;volutionnaires aussi bien &agrave; Paris qu&#39;en province , ouvre une &eacute;cole gratuite &agrave; l&rsquo;&eacute;glise&nbsp; Saint-Pierre de Montmartre, anime le &laquo;&nbsp;Club Saint-Sulpice&nbsp;&raquo;. Elle fait aussi partie du Comit&eacute; de Vigilance de Montmartre avec Louise Michel.</p>\r\n\r\n<p><a href="https://maitron.fr/spip.php?article24873" target="_self">Pour en savoir plus</a></p>\r\n\r\n<p>&lt;ge9&gt;</p>\r\n\r\n<hr />\r\n<p>&lt;gs10&gt;</p>\r\n\r\n<p><strong>Eug&egrave;ne Jean-Baptiste Vigey (1845 -1928)</strong></p>\r\n\r\n<p>-audio10-</p>\r\n\r\n<p>&lt;10&gt;</p>\r\n\r\n<p>N&eacute; en 1845 en C&ocirc;te-d&rsquo;or, fourrier &agrave; l&rsquo;H&ocirc;tel de Ville sous la Commune, combattant sur les <a href="/articles-thematiques/la-semaine-sanglante" target="_self">barricades</a> pendant la Semaine sanglante, il fut le porte-drapeau des &quot;Anciens combattants de la Commune&quot;. Ce grand ami de Camelinat meurt &agrave; Paris en 1928.</p>\r\n\r\n<p>&lt;ge10&gt;</p>\r\n\r\n<p>&nbsp;</p>	15	11	25	t
41	<p>En 72 jours, la Commune a r&eacute;alis&eacute; une &oelig;uvre d&rsquo;une tr&egrave;s grande richesse et d&rsquo;une grande modernit&eacute; dont voici un aper&ccedil;u&nbsp;:</p>\r\n\r\n<ul>\r\n\t<li><strong>Une v&eacute;ritable d&eacute;mocratie avec des &eacute;lus contr&ocirc;l&eacute;s, r&eacute;vocables, comptables et responsables. Ils ont un mandat imp&eacute;ratif</strong></li>\r\n</ul>\r\n\r\n<p style="margin-left:24px">Intervention du peuple &agrave; travers clubs et associations qui impulsent les r&eacute;formes sociales.</p>\r\n\r\n<p style="margin-left:24px">Libert&eacute; de la presse.</p>\r\n\r\n<p style="margin-left:24px">Arm&eacute;e remplac&eacute;e par le peuple en armes (hommes et femmes)</p>\r\n\r\n<p style="margin-left:24px">S&eacute;paration de l&rsquo;Eglise et de l&rsquo;Etat, suppression du budget des cultes et nationalisation des biens de l&rsquo;Eglise.</p>\r\n\r\n<p style="margin-left:24px">Justice gratuite avec des juges &eacute;lus et r&eacute;vocables.</p>\r\n\r\n<p style="margin-left:24px">&nbsp;</p>\r\n\r\n<ul>\r\n\t<li><strong>Des avanc&eacute;es sociales consid&eacute;rables&nbsp;</strong>:</li>\r\n</ul>\r\n\r\n<p style="margin-left:24px">Interdiction des expulsions des locataires et r&eacute;quisition des logements vacants.</p>\r\n\r\n<p style="margin-left:24px">Remise gratuitement des objets utilitaires gag&eacute;s.</p>\r\n\r\n<p style="margin-left:24px">Remise &eacute;tal&eacute;e sur 3 ans, des dettes sur les loyers</p>\r\n\r\n<p style="margin-left:24px">Pension pour les bless&eacute;s, les orphelins et les &laquo;veuves&raquo;, mari&eacute;es ou pas.</p>\r\n\r\n<p style="margin-left:24px">Aides aux plus d&eacute;munis&nbsp;: cantines municipales, restaurants communautaires (Marmites).</p>\r\n\r\n<p style="margin-left:24px">Remise en route et la&iuml;cisation des services publics (h&ocirc;pitaux, &eacute;cole, poste&hellip;)</p>\r\n\r\n<p style="margin-left:24px">&nbsp;</p>\r\n\r\n<p style="margin-left:24px"><strong>Au travail, projet d&rsquo;&eacute;mancipation ouvri&egrave;re&nbsp;:</strong></p>\r\n\r\n<p style="margin-left:24px">Organisation du travail par les travailleurs&nbsp;: pr&eacute;mices d&rsquo;une autogestion</p>\r\n\r\n<p style="margin-left:24px">Les associations ouvri&egrave;res, pr&eacute;ludes aux syndicats participent aux d&eacute;cisions de la Commune.</p>\r\n\r\n<p style="margin-left:24px">R&eacute;quisition des ateliers abandonn&eacute;s</p>\r\n\r\n<p style="margin-left:24px">Interdiction du travail de nuit dans les boulangeries</p>\r\n\r\n<p style="margin-left:24px">Interdiction des amendes et retenues sur salaires</p>\r\n\r\n<p style="margin-left:24px">R&eacute;duction du temps de travail (10h par jour).</p>\r\n\r\n<p style="margin-left:24px">Salaire minimum et salaire maximum&nbsp;; pas de cumul de salaires chez les fonctionnaires.</p>\r\n\r\n<p style="margin-left:24px">&nbsp;</p>\r\n\r\n<ul>\r\n\t<li>Femmes&nbsp;:</li>\r\n</ul>\r\n\r\n<p style="margin-left:24px">Egalit&eacute; des salaires hommes femmes (&eacute;coles et certains ateliers autog&eacute;r&eacute;s)</p>\r\n\r\n<p style="margin-left:24px">Droit au divorce</p>\r\n\r\n<p style="margin-left:24px">M&ecirc;mes droits aux enfants &laquo;l&eacute;gitimes&raquo; ou non, reconnaissance de l&rsquo;union libre</p>\r\n\r\n<p style="margin-left:24px">Lutte contre la prostitution</p>\r\n\r\n<p style="margin-left:24px">&nbsp;</p>\r\n\r\n<ul>\r\n\t<li><strong>Ecole la&iuml;que, gratuite et obligatoire.</strong></li>\r\n</ul>\r\n\r\n<p style="margin-left:24px">Cr&eacute;ation d&rsquo;un enseignement professionnel pour filles et gar&ccedil;ons.</p>\r\n\r\n<p style="margin-left:24px">&nbsp;</p>\r\n\r\n<ul>\r\n\t<li><strong>Culture&nbsp;</strong>:</li>\r\n</ul>\r\n\r\n<p style="margin-left:24px">Cours gratuits pour adultes,</p>\r\n\r\n<p style="margin-left:24px">concerts gratuits.</p>\r\n\r\n<p style="margin-left:24px">R&eacute;ouverture des th&eacute;&acirc;tres, mus&eacute;es et biblioth&egrave;ques. Les th&eacute;&acirc;tres sont autog&eacute;r&eacute;s.</p>\r\n\r\n<p style="margin-left:24px">Art libre sans &laquo;&nbsp;tutelle gouvernementale&nbsp;&raquo;</p>\r\n\r\n<p style="margin-left:24px">&nbsp;</p>\r\n\r\n<ul>\r\n\t<li><strong>Etrangers citoyens &agrave; part enti&egrave;re</strong></li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>	43	\N	87	t
42	<p>NA</p>	44	\N	136	t
47	<p style="margin-left:-38px">La Commune est proclam&eacute;e le 28 mars 1871 &agrave; l&#39;H&ocirc;tel de Ville. D&egrave;s le 29 mars les nouveaux &eacute;lus se mettent au travail.</p>\r\n\r\n<p style="margin-left:-38px">Le gouvernement communal est compos&eacute; de dix commissions celles des finances, de la justice, de la s&ucirc;ret&eacute; g&eacute;n&eacute;rale, du travail et de l&rsquo;&eacute;change, des subsistances, des relations ext&eacute;rieures, des services publics et de la commission ex&eacute;cutive permanente.</p>\r\n\r\n<p style="margin-left:-38px">Les commissions assurent la tutelle des principales administrations. Elles collaborent avec de nombreuses organisations dont l&rsquo;Union des femmes pour la d&eacute;fense de Paris et les soins aux bless&eacute;s, le Comit&eacute; des vingt arrondissements, les clubs, l&rsquo;Association Internationale des Travailleurs, des syndicats, des associations.</p>\r\n\r\n<p style="margin-left:-38px">Cette collaboration instaure une v&eacute;ritable d&eacute;mocratie qui permet au peuple de s&rsquo;impliquer dans l&rsquo;exercice du pouvoir. Une d&eacute;mocratie citoyenne directe, permettant la r&eacute;vocation &agrave; tout moment des &eacute;lus, <span style="color:black">o&ugrave; le<em> peuple n&rsquo;abdique jamais sa souverainet&eacute;.</em></span></p>\r\n\r\n<p style="margin-left:-38px">La Commune veille &agrave; ce que la justice soit accessible &agrave; tous. Les actes judiciaires deviennent gratuits. La garde &agrave; vue est limit&eacute;e &agrave; 24 heures. Les prisons sont visit&eacute;es.</p>\r\n\r\n<p style="margin-left:-38px">La Commune va s&rsquo;appuyer sur La f&eacute;d&eacute;ration des artistes pour la r&eacute;ouverture des biblioth&egrave;ques et des mus&eacute;es, et avec la f&eacute;d&eacute;ration artistique elle organise des concerts populaires au profit des bless&eacute;s, veuves et orphelins de la Garde nationale.</p>\r\n\r\n<p style="margin-left:-38px">C&rsquo;est dans les conditions difficiles d&rsquo;une guerre civile, Paris est bombard&eacute; par les versaillais, que les membres de la Commune assurent leurs t&acirc;ches d&rsquo;&eacute;lus&nbsp;: tenir leurs fonctions dans les mairies, prendre des mesures importantes que les Versaillais ne leur ont pas laiss&eacute; le temps de mettre en&nbsp; place. Ces mesures qui continuent de nous interpeler par leur modernit&eacute;.</p>	49	\N	85	t
46	<p>&lt;1&gt;</p>\r\n\r\n<p>Augustin Moreau-Vauthier sculpteur est membre de la <a href="/articles-thematiques/la-federation-des-artistes" target="_self">Commission f&eacute;d&eacute;rale des artistes</a> durant la Commune de Paris. Ironie de l&#39;histoire plusieurs de ses &oelig;uvres contribuent &agrave; la reconstruction de l&#39;H&ocirc;tel de Ville de Paris incendi&eacute; le 24 mai 1871. Son fils Paul (1871-1936) est l&#39;auteur du mur comm&eacute;moratif aux &quot;Victimes des R&eacute;volutions&quot; sur l&#39;avenue Gambetta, dans le square longeant l&#39;enceinte du cimeti&egrave;re.</p>\r\n\r\n<p><a href="https://www.commune1871.org/index.php?option=com_content&amp;view=article&amp;id=701:augustin-moreau-vauthier-1831-1893-sculpteur-oublie&amp;catid=31&amp;Itemid=349" target="_self">Pour en savoir plus</a></p>	48	34	120	t
43	<p>&lt;1&gt;</p>\r\n\r\n<p>Adrien Lejeune, n&eacute; le 3 juin 1847 &agrave; Bagnolet et mort le 9 janvier 1942 &agrave; Novossibirsk (URSS), est un communard consid&eacute;r&eacute; comme le dernier vivant d&#39;entre eux. &Agrave; sa mort, il est enterr&eacute; en URSS avant que ses cendres ne soient rapatri&eacute;es en France &agrave; l&#39;occasion du centenaire de la Commune de Paris organis&eacute; par le PCF en 1971 et enterr&eacute; &agrave; proximit&eacute; du mur des F&eacute;d&eacute;r&eacute;s. Toutefois, certains pensent que d&#39;autres survivants anonymes lui surv&eacute;curent de plusieurs ann&eacute;es. Peut-&ecirc;tre ? Saura-t-on jamais ?</p>\r\n\r\n<p><a href="https://maitron.fr/spip.php?article64068" target="_self">Pour en savoir plus</a></p>	45	31	117	t
38	<p>En 1870, la soci&eacute;t&eacute; est tr&egrave;s nettement divis&eacute;e en deux&nbsp;: riches patrons et nantis contre ouvriers, artisans et petit peuple vivant au jour le jour.</p>\r\n\r\n<p>Dans les rues on entend le vacarme des carrioles sur les pav&eacute;s, les cris des vendeurs ambulants, le tapage des ateliers, quand d&rsquo;autres arpentent le bois de Boulogne et profitent de l&rsquo;ombre des marronniers, qu&rsquo;appr&eacute;cie tant le baron Haussmann.</p>\r\n\r\n<p><span style="color:black">Napol&eacute;on III est au pouvoir depuis le 10 d&eacute;cembre 1848, il restaure l&rsquo;Empire, avec la b&eacute;n&eacute;diction des nantis. Par le coup d&rsquo;Etat du 2 d&eacute;cembre 1851, il met fin &agrave; la 2e R&eacute;publique.</span></p>\r\n\r\n<p>Haussmann, pr&eacute;fet de la Seine, administre Paris depuis 1853. Il est le responsable des grands travaux command&eacute;s par Napol&eacute;on III pour rendre Paris plus salubre et en faire une ville admir&eacute;e de toute l&rsquo;Europe. Mais c&rsquo;est surtout le moyen de d&eacute;molir les vieux quartiers parisiens qui, depuis 1789, constituent les principaux foyers r&eacute;volutionnaires de la ville.</p>\r\n\r\n<p>Les r&eacute;volutions de 1830 et de 1848 sont encore dans toutes les m&eacute;moires.</p>\r\n\r\n<p>De 1860 &agrave; 1870, Paris a vu le nombre de ses habitants doubler. Ils sont pr&egrave;s de deux millions. Venus nombreux de province pour y trouver un travail, ils vivent dans la mis&egrave;re. Les plus riches habitent dans des immeubles cossus, alors que les pauvres s&rsquo;entassent dans des mansardes insalubres aux loyers exorbitants, souffrant de froid l&rsquo;hiver et de chaleur l&rsquo;&eacute;t&eacute;.</p>\r\n\r\n<p>Les quartiers populaires restent nombreux&nbsp;: Saint-Antoine, quartier des &eacute;b&eacute;nistes, La Villette celui des bouchers et le XIIIe arrondissement, celui des tanneurs (la Bi&egrave;vre n&rsquo;est pas encore recouverte).</p>\r\n\r\n<p>La r&eacute;volution industrielle d&eacute;bute, il faut du monde pour faire tourner cette machine. Une nouvelle classe ouvri&egrave;re non qualifi&eacute;e, apparait.</p>\r\n\r\n<p>Les journ&eacute;es de travail comptent en moyenne douze heures et les gamins d&egrave;s leur plus jeune &acirc;ge sont embauch&eacute;s pour quelques sous dans des ateliers o&ugrave; les accidents sont monnaie courante.</p>\r\n\r\n<p>Pour les femmes, pay&eacute;es 50 &agrave; 70% de moins que les hommes, c&rsquo;est la mis&egrave;re noire et la plupart d&rsquo;entre-elles ont recours &agrave; la prostitution pour nourrir leur famille. Il n&rsquo;y a aucune protection sociale.</p>\r\n\r\n<p><span style="color:black">La r&eacute;pression contre les ouvriers ne va pas les emp&ecirc;cher de s&rsquo;organiser. En 1864, Napol&eacute;on III doit leur accorder le droit de gr&egrave;ve, tol&egrave;re le d&eacute;veloppement de coop&eacute;ratives, mutuelles &hellip;</span></p>\r\n\r\n<p><span style="color:black">Napol&eacute;on III d&eacute;clare la guerre &agrave; la Prusse le 19 juillet 1870. L&rsquo;accumulation des d&eacute;faites militaires conduit le pays &agrave; la catastrophe et l&rsquo;Empereur &agrave; sa perte&nbsp;: il est fait prisonnier &agrave; Sedan le 2 septembre.</span></p>\r\n\r\n<p><span style="color:black">La R&eacute;publique est proclam&eacute;e le 4 septembre 1870 et un gouvernement de D&eacute;fense Nationale est &eacute;lu.</span></p>\r\n\r\n<p><span style="color:black">Le si&egrave;ge de la capitale par les arm&eacute;es prussiennes va durer quatre longs mois. Le froid et la faim frappent tr&egrave;s durement les quartiers populaires. Malgr&eacute; cela, le peuple est galvanis&eacute;, il veut d&eacute;fendre sa patrie, son honneur et refuse la capitulation du gouvernement.</span></p>\r\n\r\n<p><span style="color:black">Fin 1870 est cr&eacute;&eacute; le Comit&eacute; central r&eacute;publicain de D&eacute;fense Nationale des 20 arrondissements. Le 7 janvier 1871, ce comit&eacute; r&eacute;clame, dans une proclamation connue sous le nom d&rsquo;Affiche Rouge, la formation d&rsquo;un gouvernement populaire, les habitants des quartiers populaires s&rsquo;engagent et viennent grossir les rangs de la Garde Nationale d&eacute;sormais ouverte &agrave; tous. Ces bataillons vont se f&eacute;d&eacute;rer le 15 mars 1871 pour coordonner leurs actions, d&rsquo;o&ugrave; l&rsquo;appellation de F&eacute;d&eacute;r&eacute;s. </span></p>\r\n\r\n<p>Le gouvernement de D&eacute;fense Nationale a&nbsp; peur de ce peuple en armes et signe l&rsquo;armistice avec les prussiens le 28 janvier 1871. L&rsquo;abandon de l&rsquo;Alsace et la Lorraine c&eacute;d&eacute;es &agrave; la Prusse et l&rsquo;&eacute;norme ran&ccedil;on en or provoquent la col&egrave;re des parisiens.</p>\r\n\r\n<p><span style="color:black">Le 8 f&eacute;vrier le gouvernement organise des &eacute;lections. Il en ressort une Assembl&eacute;e majoritairement royaliste et rurale, avec comme chef de l&rsquo;ex&eacute;cutif&nbsp;: Adolphe Thiers.</span></p>	40	\N	85	t
40	<p><span style="color:#00000a">D&egrave;s le 18 mars 1871 les femmes, en emp&ecirc;chant la prise des canons par les soldats versaillais, d&eacute;fendent la Commune. </span><span style="color:black">Des milliers d&rsquo;entre elles se sont engag&eacute;es et ont apport&eacute; leur volont&eacute; de mettre fin &agrave; leur exploitation et &agrave; l&rsquo;inf&eacute;riorit&eacute; de leur condition. Elles ont donn&eacute; toute leur flamme, toutes leurs capacit&eacute;s de lutte et d&rsquo;initiative et donn&eacute; jusqu&rsquo;&agrave; leur vie.</span> <span style="color:black">Ces femmes sont d&rsquo;origines tr&egrave;s diverses et il est difficile d&rsquo;en faire un portrait mod&egrave;le. </span></p>\r\n\r\n<p><span style="color:#00000a">Louise Michel, la plus connue des communardes, </span><span style="color:black">incarne la volont&eacute; de se battre. </span><span style="color:black">Elle va confier la direction du comit&eacute; de vigilance de Montmartre, qu&#39;elle pr&eacute;side, &agrave; Sophie Doctrinal et l&#39;&eacute;cole priv&eacute;e qu&#39;elle dirige &agrave; la sous-ma&icirc;tresse de l&#39;&eacute;cole. Ainsi elle va pouvoir endosser le costume de f&eacute;d&eacute;r&eacute; et durant toute la Commune &ecirc;tre une &laquo;soldate&raquo;. </span></p>\r\n\r\n<p><span style="color:#00000a">&Eacute;lisabeth Dmitrieff, une jeune russe correspondante de Marx s&rsquo;implique dans la Commune. Avec Nathalie Le Mel, une ouvri&egrave;re relieuse n&eacute;e &agrave; Brest en 1826, et plusieurs femmes, elles cr&eacute;ent la premi&egrave;re organisation f&eacute;ministe le 11 avril 1871 : <em>&laquo; l&#39;Union des femmes pour la d&eacute;fense de Paris et les soins aux bless&eacute;s &raquo;.</em> L&rsquo;assembl&eacute;e g&eacute;n&eacute;rale de cette association d&eacute;cerne &agrave; &eacute;lisabeth Dmitrieff le titre de citoyenne de Paris.</span></p>\r\n\r\n<p>Elles prennent toute leur place dans la gestion du pouvoir. La participation des femmes dans les clubs et sections de l&rsquo;Internationale marque l&rsquo;histoire de la Commune. Elles pr&eacute;sident les s&eacute;ances et n&rsquo;h&eacute;sitent pas &agrave; intervenir. Elles obtiennent la mixit&eacute; des clubs. Elles &eacute;crivent dans les journaux.</p>\r\n\r\n<p>Les femmes vont &oelig;uvrer pour la mise en place des mesures sociales :</p>\r\n\r\n<p>&rarr; Le droit au travail pour elles et l&rsquo;&eacute;galit&eacute; des salaires</p>\r\n\r\n<p>&rarr; L&rsquo;&eacute;cole la&iuml;que gratuite pour les filles et les gar&ccedil;ons</p>\r\n\r\n<p>&rarr; La pleine participation au combat de la Commune, y compris dans la Garde nationale : le club de la rue d&rsquo;Arras recueillera 300 inscriptions pour &laquo;les l&eacute;gions des femmes&raquo;.</p>\r\n\r\n<p>&rarr; des Pensions pour les veuves de f&eacute;d&eacute;r&eacute;s tu&eacute;s au combat qu&rsquo;elles soient mari&eacute;es ou non mais &eacute;galement pour les enfants l&eacute;gitimes ou naturels.</p>\r\n\r\n<p><span style="background-color:white"><span style="color:black">Le 23 mai </span></span><span style="color:#00000a">&Eacute;</span><span style="color:#00000a">lisabeth Dmitrieff</span><span style="background-color:white"><span style="color:black"> appelle les parisiennes aux barricades. Elles ont r&eacute;pondu massivement. Parmi elles nous notons&nbsp;: Louise Michel, Andr&eacute; L&eacute;o, Elisabeth Retiffe, Eulalie Papavoine, L&eacute;ontine Suetens, Ad&egrave;le Chignon, Blanche Lefevre, Paule Mink. Elles vont les d&eacute;fendre vaillamment&nbsp;:</span></span></p>\r\n\r\n<p style="margin-left:38px">&rarr; celle de la <span style="color:#00000a">Place Blanche par une compagnie de 120 femmes </span></p>\r\n\r\n<p style="margin-left:38px">&rarr; celle de <span style="color:#00000a">Place Pigalle par 50 femmes </span></p>\r\n\r\n<p style="margin-left:38px">&rarr; celle du <span style="color:#00000a">Ch&acirc;teau d&rsquo;eau, Faubourg St Martin, par 52 femmes. Prises les armes &agrave; la main elles sont fusill&eacute;es. </span></p>\r\n\r\n<p style="margin-left:38px">&nbsp;</p>	42	\N	82	t
39	<p>Thiers<strong> </strong>veut en finir avec l&rsquo;agitation r&eacute;publicaine &agrave; Paris. Les militaires ont ordre de s&rsquo;emparer des canons avant le lever du jour.</p>\r\n\r\n<p>Rassembl&eacute;s sur les hauteurs de la ville, ces canons ont &eacute;t&eacute; achet&eacute;s par souscription publique. Pour les parisiens, c&rsquo;est &agrave; la f&eacute;d&eacute;ration r&eacute;publicaine de la Garde Nationale d&rsquo;en disposer, certainement pas &agrave; une arm&eacute;e &agrave; la solde des monarchistes.</p>\r\n\r\n<p>C&rsquo;est au c&oelig;ur de la nuit que commencent les mouvements de troupes. Aux Buttes-Chaumont, &agrave; Belleville et &agrave; la Villette, l&rsquo;op&eacute;ration semble se d&eacute;rouler comme pr&eacute;vu. Les soldats occupent les postes de la garde nationale, et commencent &agrave; &eacute;vacuer les pi&egrave;ces d&rsquo;artillerie. Mais les attelages qui doivent &eacute;vacuer les canons tardent &agrave; arriver.</p>\r\n\r\n<p>&Agrave; Montmartre, la brigade du g&eacute;n&eacute;ral Lecomte ouvre le feu sur un garde national qui refuse de c&eacute;der le passage. <a href="https://raspou.team/1871/louise-michel/" style="color:blue; text-decoration:underline">Louise Michel</a>, pr&eacute;sente sur les lieux, court alerter le comit&eacute; de vigilance; on bat le rappel dans tout le quartier. Alert&eacute;e par le bruit du tambour, une foule nombreuse d&rsquo;habitants et de gardes nationaux furieux se masse au bas des buttes. Au petit matin, les femmes du quartier se rassemblent devant les canons, et interpellent les soldats en leur apportant du lait et du pain. Pendant ce temps, aux cris de &laquo;&nbsp;Vive la R&eacute;publique&nbsp;&raquo;, les soldats du 88&egrave;me r&eacute;giment de ligne se rallient &agrave; la foule. Gardes nationaux et lignards avancent vers les troupes de Versailles, d&eacute;termin&eacute;s &agrave; conserver les canons. Cern&eacute;, par trois fois le g&eacute;n&eacute;ral Lecomte ordonne de tirer sur la foule. Les lignards refusent. Ils l&egrave;vent les crosses de leurs fusils, en signe de mutinerie. Lecomte est arr&ecirc;t&eacute; ainsi que ses officiers. L&rsquo;insurrection se r&eacute;pand dans Paris et de nombreux soldats fraternisent.</p>\r\n\r\n<p>Dans l&rsquo;apr&egrave;s-midi le g&eacute;n&eacute;ral Cl&eacute;ment Thomas, qui s&rsquo;&eacute;tait d&eacute;j&agrave; illustr&eacute; en r&eacute;primant l&rsquo;insurrection de 1848, est reconnu alors qu&rsquo;il inspecte des barricades habill&eacute; en civil. Il est conduit rue des Rosiers o&ugrave; se trouve d&eacute;j&agrave; le g&eacute;n&eacute;ral Lecomte, sur la butte Montmartre. Tous deux sont fusill&eacute;s par leurs troupes.</p>\r\n\r\n<p>Le gouvernement donne l&rsquo;ordre aux troupes&nbsp;d&rsquo;&eacute;vacuer Paris, y compris les forts du sud restitu&eacute;s par les Prussiens. Thiers, d&eacute;pass&eacute; par la tournure des &eacute;v&egrave;nements, s&rsquo;enfuit illico pour Versailles. L&rsquo;autorit&eacute; de l&rsquo;Assembl&eacute;e n&rsquo;a plus cours &agrave; Paris.&nbsp;</p>\r\n\r\n<p>Ignorants de la victoire, les quartiers se d&eacute;pavent, on &eacute;l&egrave;ve des barricades. Le Comit&eacute; central n&rsquo;est en rien impliqu&eacute; dans les &eacute;v&eacute;nements de la journ&eacute;e, mais des bataillons prennent les casernes, occupent l&rsquo;Imprimerie Nationale, puis l&rsquo;H&ocirc;tel de Ville d&eacute;sert&eacute;.</p>\r\n\r\n<p>Dans la soir&eacute;e, les membres du Comit&eacute; central qui y sont r&eacute;unis se retrouvent aux commandes d&rsquo;une ville libre et d&eacute;cident d&rsquo;organiser des &eacute;lections.</p>\r\n\r\n<p>&nbsp;</p>	41	\N	83	t
31	<p>&lt;gs1&gt;</p>\r\n\r\n<p><strong>Paul Brousse (1844 - 1912)</strong></p>\r\n\r\n<p>-audio1-</p>\r\n\r\n<p>&lt;1&gt;</p>\r\n\r\n<p>M&eacute;decin. Il participe &agrave; la Commune. Il se r&eacute;fugie &agrave; Barcelone, ensuite en Suisse. Il devient membre de la Premi&egrave;re Internationale, actif dans la F&eacute;d&eacute;ration jurassienne, puis il remet en question l&#39;abstentionnisme politique et l&#39;isolement des anarchistes par rapport au reste du mouvement socialiste et ouvrier. Il se rallie alors aux socialistes possibilistes (r&eacute;formistes). Il est l&#39;auteur du chant &quot;Le Drapeau Rouge&quot;.</p>\r\n\r\n<p><a href="https://maitron.fr/spip.php?article24584" target="_self">Pour en savoir plus</a></p>\r\n\r\n<p>&lt;ge1&gt;</p>\r\n\r\n<hr />\r\n<p>&lt;gs2&gt;</p>\r\n\r\n<p><strong>Edme Charles Chabert (1818 - 1890)</strong></p>\r\n\r\n<p>-audio2-</p>\r\n\r\n<p>&lt;2&gt;</p>\r\n\r\n<p>Ouvrier graveur. Membre de la Premi&egrave;re internationale. Il participe &agrave; la r&eacute;volution de 1848 (mouvements de f&eacute;vrier et de juin). Il est membre du <a href="/articles-thematiques/la-garde-nationale" target="_self">Comit&eacute; central</a> des vingt arrondissements. Emprisonn&eacute;, puis rel&acirc;ch&eacute; apr&egrave;s 5 mois d&#39;emprisonnement. Conseiller municipal du 19e.</p>\r\n\r\n<p><a href="https://maitron.fr/spip.php?article182644" target="_self">Pour en savoir plus</a></p>\r\n\r\n<p>&lt;ge2&gt;</p>\r\n\r\n<hr />\r\n<p>&lt;gs3&gt;</p>\r\n\r\n<p><strong>Jean-Baptiste Cl&eacute;ment (1836 - 1903)</strong></p>\r\n\r\n<p>-audio3-</p>\r\n\r\n<p>&lt;3&gt;</p>\r\n\r\n<p>Po&egrave;te, journaliste et chansonnier. Il &eacute;dite sa premi&egrave;re chanson &agrave; 23 ans. Durant la Commune &eacute;lu par le XIIIe arrondissement au Conseil de la Commune, il participe &agrave; la commission des services publics et des subsistances, il est d&eacute;l&eacute;gu&eacute; &agrave; la fabrication des munitions. Il collabore au &quot;<a href="/articles-thematiques/la-presse" target="_self">Cri du peuple</a>&quot; de Jules Vall&egrave;s. Il combat pendant la semaine sanglante. Condamn&eacute; &agrave; mort, il s&#39;exile. Cr&eacute;ateur de la chanson &quot;Le temps des cerises&quot; d&eacute;di&eacute;e en 1882 &agrave; l&#39;ambulanci&egrave;re Louise.</p>\r\n\r\n<p><a href="https://maitron.fr/spip.php?article182151" target="_self">Pour en savoir plus</a></p>\r\n\r\n<p>&lt;ge3&gt;</p>\r\n\r\n<hr />\r\n<p>&lt;gs4&gt;</p>\r\n\r\n<p><strong>Pascal Fab&eacute;rot (1843 - 1803)</strong></p>\r\n\r\n<p>-audio4-</p>\r\n\r\n<p>&lt;4&gt;</p>\r\n\r\n<p>Ouvrier chapelier. Pendant la Commune, il participe &agrave; la prise de la caserne Lobau et de l&#39;H&ocirc;tel de ville. D&eacute;put&eacute; socialiste de la Seine de 1893 &agrave; 1898.</p>\r\n\r\n<p><a href="https://maitron.fr/spip.php?article86684&amp;id_mot=25" target="_self">Pour en savoir plus</a></p>\r\n\r\n<p>&lt;ge4&gt;</p>\r\n\r\n<hr />\r\n<p>&lt;gs5&gt;</p>\r\n\r\n<p><strong>Paul Emile Lafargue (1842 - 1911)</strong></p>\r\n\r\n<p>-audio5-</p>\r\n\r\n<p>&lt;5&gt;</p>\r\n\r\n<p>Journaliste, &eacute;conomiste, essayiste, &eacute;crivain, homme politique socialiste. Fait la connaissance de Proudhon apr&egrave;s ses &eacute;tudes de m&eacute;decine. Pr&eacute;sente&nbsp;&laquo;&nbsp;L&rsquo;&eacute;tat du mouvement socialiste fran&ccedil;ais&nbsp;&raquo; au conseil de l&rsquo;AIT en 1865 &agrave; Londres. Il rencontre Engels et Marx, dont il &eacute;pouse la seconde fille Laura. Durant la Commune de Paris, il est envoy&eacute; &agrave; Bordeaux pour y organiser un soutien au mouvement parisien. Incarc&eacute;r&eacute; &agrave; la prison de Sainte P&eacute;lagie. En 1883, il y r&eacute;dige le &quot;Droit &agrave; la paresse&quot;. En 1911 s&rsquo;&eacute;tant fix&eacute; une limite d&rsquo;&acirc;ge de 70 ans, il se suicide avec son &eacute;pouse &agrave; Draveil.</p>\r\n\r\n<p><a href="https://maitron.fr/spip.php?article24864" target="_self">Pour en savoir plus</a></p>\r\n\r\n<p>&lt;ge5&gt;</p>\r\n\r\n<hr />\r\n<p>&lt;gs6&gt;</p>\r\n\r\n<p><strong>Gustave Lefran&ccedil;ais (1826 - 1901)</strong></p>\r\n\r\n<p>-audio6-</p>\r\n\r\n<p>&lt;6&gt;</p>\r\n\r\n<p>Il adh&egrave;re &agrave; l&rsquo;Association des instituteurs et institutrices socialistes, condamn&eacute; &agrave; 3 mois de prison. Interdit d&rsquo;enseignement, il s&eacute;journe &agrave; Londres, s&rsquo;opposant au coup d&rsquo;&eacute;tat de Napol&eacute;on III. La R&eacute;publique proclam&eacute;e le 4 septembre 1870, le IVe arrondissement de Paris l&rsquo;envoie au Comit&eacute; central des vingt arrondissements qui s&rsquo;oppose au gouvernement de D&eacute;fense nationale. Elu au <a href="/articles-thematiques/le-fonctionnement-de-la-commune" target="_self">conseil de la Commune</a>, il est membre de la commission ex&eacute;cutive puis de celle du travail et des finances. Il combat sur les barricades. Condamn&eacute; &agrave; mort par contumace par le conseil de guerre. Apr&egrave;s la <a href="/articles-thematiques/la-semaine-sanglante" target="_self">Semaine sanglante</a>, r&eacute;fugi&eacute; &agrave; Gen&egrave;ve, il collabore &agrave; diff&eacute;rents journaux anarchistes. Publie l&rsquo; &laquo;&nbsp;Etude sur le mouvement communaliste de Paris&nbsp;&raquo;. Eug&egrave;ne Pottier lui d&eacute;die son po&egrave;me &laquo;&nbsp;L&rsquo;Internationale&nbsp;&raquo; mis en musique en 1888.</p>\r\n\r\n<p><a href="https://maitron.fr/spip.php?article33693" target="_self">Pour en savoir plus</a></p>\r\n\r\n<p>&lt;ge6&gt;</p>\r\n\r\n<hr />\r\n<p>&lt;gs7&gt;</p>\r\n\r\n<p><strong>Beno&icirc;t Malon (1841 - 1893)</strong></p>\r\n\r\n<p>-audio7-</p>\r\n\r\n<p>&lt;7&gt;</p>\r\n\r\n<p>Teinturier, autodidacte. Membre de la 1&egrave;re internationale.&nbsp; Il organise et participe &agrave; de nombreuses luttes au cours du Second Empire. Apr&egrave;s le 4 septembre, il si&egrave;ge au <a href="/articles-thematiques/la-garde-nationale" target="_self">Comit&eacute; central</a> des vingt arrondissements et devient maire-adjoint du XVII&egrave;me arrondissement. Il est &eacute;lu &agrave; l&#39;Assembl&eacute;e nationale le 8 f&eacute;vrier 1871, vote contre les pr&eacute;liminaires de paix et d&eacute;missionne. Lors de la Commune, &eacute;lu par le XVII&egrave;me arrondissement, il est membre de la <a href="/articles-thematiques/le-fonctionnement-de-la-commune" target="_self">commission du travail et des &eacute;changes</a>. Il vote contre le comit&eacute; de salut public. Pendant la <a href="/articles-thematiques/la-semaine-sanglante" target="_self">semaine sanglante</a>, il combat aux Batignolles, s&#39;exile en Suisse, rentre en France apr&egrave;s l&#39;<a href="/articles-thematiques/la-repression" target="_self">amnistie</a>. Auteur de la &quot;Troisi&egrave;me d&eacute;faite du prol&eacute;tariat fran&ccedil;ais&quot;.</p>\r\n\r\n<p><a href="https://www.commune1871.org/index.php?option=com_content&amp;view=article&amp;id=507:benoit-malon-1841-1893&amp;catid=12&amp;Itemid=109" target="_self">Pour en savoir plus</a></p>\r\n\r\n<p>&lt;ge7&gt;</p>\r\n\r\n<hr />\r\n<p>&lt;gs8&gt;</p>\r\n\r\n<p><strong>Henri Mortier (1843 - 1894)</strong></p>\r\n\r\n<p>-audio8-</p>\r\n\r\n<p>&lt;8&gt;</p>\r\n\r\n<p>Ouvrier tourneur sur bois. Blanquiste et membre de l&#39;Association internationale des travailleurs. Pendant le si&egrave;ge de Paris , il est capitaine du 191e bataillon de la <a href="/articles-thematiques/la-garde-nationale" target="_self">Garde nationale</a>. Le 26 mars il est &eacute;lu au <a href="/articles-thematiques/le-fonctionnement-de-la-commune" target="_self">Conseil de la Commune</a> de Paris par le XIe arrondissement, il si&egrave;ge &agrave; la commission des Services publics puis &agrave; la commission de S&ucirc;ret&eacute; g&eacute;n&eacute;rale. Apr&egrave;s la <a href="/articles-thematiques/la-semaine-sanglante" target="_self">Semaine sanglante</a> il est condamn&eacute; &agrave; mort par contumace par le Conseil de guerre, il se r&eacute;fugie &agrave; Londres o&ugrave; il continue de militer dans les rangs blanquistes.</p>\r\n\r\n<p><a href="https://www.commune1871.org/index.php?option=com_content&amp;view=article&amp;id=509:henri-mortier-modeste-mais-efficace-elu-de-la-commune&amp;catid=12&amp;Itemid=109" target="_self">Pour en savoir plus</a></p>\r\n\r\n<p>&lt;ge8&gt;</p>\r\n\r\n<hr />\r\n<p>&lt;gs9&gt;</p>\r\n\r\n<p><strong>Ernest Louis Pichio (1840 - 1893)</strong></p>\r\n\r\n<p>-audio9-</p>\r\n\r\n<p>&lt;9&gt;</p>\r\n\r\n<p>N&eacute; &agrave; Paris en 1840, c&rsquo;est un artiste peintre qui expose dans de nombreux salons avant 1870. D&rsquo;ob&eacute;dience communarde, il fait partie de la <a href="/articles-thematiques/la-federation-des-artistes" target="_self">F&eacute;d&eacute;ration des artistes</a> &eacute;lue en avril 1871 et se bat sur les <a href="/articles-thematiques/la-semaine-sanglante" target="_self">barricades</a>. Exil&eacute; &agrave; Gen&egrave;ve, il r&eacute;alisera diff&eacute;rents tableaux en l&rsquo;honneur de la Commune (Le Triomphe de l&rsquo;ordre, La Veuve du fusill&eacute;..). Il meurt &agrave; Paris en 1893.</p>\r\n\r\n<p><a href="https://fr.wikipedia.org/wiki/Ernest_Pichio" target="_self">Pour en savoir plus</a></p>\r\n\r\n<p>&lt;ge9&gt;</p>\r\n\r\n<hr />\r\n<p>&lt;gs10&gt;</p>\r\n\r\n<p><strong>On&eacute;sime Prudent-Dervilliers (1849 - 1896)</strong></p>\r\n\r\n<p>-audio10-</p>\r\n\r\n<p>&lt;10&gt;</p>\r\n\r\n<p>N&eacute; dans l&rsquo;Aisne en 1849, ma&icirc;tre tailleur oppos&eacute; &agrave; l&rsquo;Empire, combat les Prussiens dans l&rsquo;Arm&eacute;e du Nord. Il rejoint la Commune, officier dans la <a href="/articles-thematiques/la-garde-nationale" target="_self">Garde nationale</a>, participe &agrave; la d&eacute;fense du fort de Vanves, puis est bless&eacute; sur une <a href="/articles-thematiques/la-semaine-sanglante" target="_self">barricade</a>. Syndicaliste, collaborateur de plusieurs journaux, il meurt &agrave; Paris en 1896 alors qu&rsquo;il est d&eacute;put&eacute; de la Seine (XIXe arrondissement) sous l&rsquo;&eacute;tiquette du Parti Ouvrier Socialiste R&eacute;volutionnaire.</p>\r\n\r\n<p><a href="https://maitron.fr/spip.php?article79980" target="_self">Pour en savoir plus</a></p>\r\n\r\n<p>&lt;ge10&gt;</p>\r\n\r\n<hr />\r\n<p>&lt;gs11&gt;</p>\r\n\r\n<p><strong>Val&eacute;ry Wroblewski (1841 - 1908)</strong></p>\r\n\r\n<p>-audio11-</p>\r\n\r\n<p>&lt;11&gt;</p>\r\n\r\n<p>N&eacute; en Pologne en 1841, il est en exil &agrave; Paris en 1870 pour avoir particip&eacute; &agrave; l&rsquo;insurrection polonaise de 1863. Entr&eacute; dans la <a href="/articles-thematiques/la-garde-nationale" target="_self">garde nationale</a>, il soutiendra la Commune dont il devient l&rsquo;un des g&eacute;n&eacute;raux en avril 1871. Il d&eacute;fend h&eacute;ro&iuml;quement les fortifications sur la rive gauche puis la Butte aux Cailles pendant la <a href="/articles-thematiques/la-semaine-sanglante" target="_self">Semaine sanglante</a>. Condamn&eacute; &agrave; mort en 1872, exil&eacute; &agrave; Londres o&ugrave; il est membre du Conseil de l&rsquo;AIT, il rentre en France en 1885 et y meurt en 1908.</p>\r\n\r\n<p><a href="https://www.commune1871.org/index.php?option=com_content&amp;view=article&amp;id=772:walery-wroblewski-general-de-la-commune&amp;catid=12&amp;Itemid=109" target="_self">Pour en savoir plus</a></p>\r\n\r\n<p>&lt;ge11&gt;</p>\r\n\r\n<p>&nbsp;</p>	33	29	71	f
50	<p>Malgr&eacute; la guerre civile qui fait rage, les 72 jours de la Commune sont une p&eacute;riode d&rsquo;intense politisation populaire et de floraison de la presse. Le journal est alors vendu &agrave; la cri&eacute;e, le &laquo;&nbsp;petit journal&nbsp;&raquo; &agrave; un sou (5 centimes) ou le &laquo;&nbsp;grand journal&nbsp;&raquo; (au moins deux sous). Il est achet&eacute;, lu et &eacute;cout&eacute; collectivement au cabaret, dans les cours, sur les pas de porte. Les titres r&eacute;sonnent, jet&eacute;s par les vendeurs &agrave; la cri&eacute;e, et les articles sont repris et comment&eacute;s dans les clubs et dans les ateliers.</p>\r\n\r\n<p>Pendant la Commune, 71 titres de journaux apparaissent, soit un par jour en moyenne. En tout, une centaine de titres ont &eacute;t&eacute; diffus&eacute;s, soit pr&egrave;s de 1 500 num&eacute;ros, parfois &agrave; des milliers d&rsquo;exemplaires. Certains journaux sont &eacute;ph&eacute;m&egrave;res, quelques-uns r&eacute;duits &agrave; un num&eacute;ro unique. D&rsquo;autres subsistent sur la totalit&eacute; ou la quasi-totalit&eacute; de la p&eacute;riode communarde. Compar&eacute;s &agrave; la r&eacute;alit&eacute; sociale parisienne (1,8 million d&rsquo;habitants, 440 000 ouvriers, 485 000 inscrits sur les listes &eacute;lectorales, 230 000 votants pour les partis r&eacute;volutionnaires), les chiffres de diffusion de la presse sont exceptionnels. Les trois titres les plus diffus&eacute;s (le <em>Cri du Peuple</em> de Jules Vall&egrave;s, le <em>Mot d&rsquo;ordre</em> d&rsquo;Henri Rochefort, le <em>P&egrave;re Duch&ecirc;ne</em> d&rsquo;Alphonse Humbert, Eug&egrave;ne Vermersch et Maxime Vuillaume) auraient tir&eacute; &agrave; plus de 150 000 exemplaires &agrave; eux seuls.</p>\r\n\r\n<p>La diversit&eacute; de la presse communarde est &agrave; l&rsquo;image de celle de la Commune tout enti&egrave;re. Toutes les sensibilit&eacute;s sont pr&eacute;sentes, y compris celles qui combattent ouvertement la Commune (quelques journaux partisans de Versailles sont toutefois interdits en mai, pendant l&rsquo;offensive versaillaise contre Paris). Les partisans de Blanqui ont <em>Le</em> <em>R&eacute;veil</em> (Charles Delescluze) et <em>Le</em> <em>Vengeur</em> (F&eacute;lix Pyat)&nbsp;; les proudhoniens lisent <em>La</em> <em>Commune</em> (Georges Duch&ecirc;ne), les &laquo;&nbsp;internationalistes&nbsp;&raquo; ont <em>La R&eacute;volution politique et sociale</em> et <em>Le</em> <em>Cri du peuple</em>, les autres socialistes se tournent vers <em>La</em> <em>Sociale</em> d&rsquo;Auguste Vermorel et de L&eacute;ocadie B&eacute;ra, dite Andr&eacute; L&eacute;o, ou vers <em>Le</em> <em>Tribun du peuple</em> de Prosper-Louis Lissagaray.</p>\r\n\r\n<p>Au lendemain de la Commune, la quasi-totalit&eacute; de la presse se rangea du c&ocirc;t&eacute; des vainqueurs de la Commune. Quelques journaux de province seulement ne particip&egrave;rent pas &agrave; la cur&eacute;e, comme les <em>Droits de l&rsquo;Homme </em>de Jules Guesde &agrave; Montpellier, <em>l&rsquo;&Eacute;mancipation</em> de Toulouse ou le <em>National</em> du Loiret. Au contraire, nombre de journaux qui s&rsquo;&eacute;levaient contre les rigueurs de la r&eacute;pression furent l&rsquo;objet de poursuites, pas toujours suivies d&rsquo;effet heureusement.</p>	52	\N	127	t
56	<p>Le cimeti&egrave;re du P&egrave;re Lachaise tire son nom de l&rsquo;un de ses anciens propri&eacute;taires&nbsp;: Fran&ccedil;ois d&#39;Aix de La Chaise (1624-1709), dit le P&egrave;re La Chaise, confesseur du roi de France Louis XIV. Le cimeti&egrave;re fut ouvert en 1804.&nbsp; Situ&eacute; hors de Paris, il y fut int&eacute;gr&eacute; en 1860.</p>\r\n\r\n<p>Originellement le cimeti&egrave;re n&rsquo;attirait gu&egrave;re les parisiens. Le pr&eacute;fet de Paris organisa alors le transfert des d&eacute;pouilles d&#39;H&eacute;lo&iuml;se et d&#39;Ab&eacute;lard, ainsi que de Moli&egrave;re et de La Fontaine afin d&rsquo;en redorer l&rsquo;image.</p>\r\n\r\n<p>Le cimeti&egrave;re compte aujourd&rsquo;hui 44 ha, 70&nbsp;000 tombes&nbsp; et un million de cadavres. Il accueille chaque ann&eacute;e plus de trois millions et demi de visiteurs.</p>\r\n\r\n<p>Lors de la Commune, de farouches combats se d&eacute;roul&egrave;rent au sein du cimeti&egrave;re, les 147 derniers combattants y furent fusill&eacute;s devant ce qui allait devenir le mur des f&eacute;d&eacute;r&eacute;s. De nombreuses fosses communes&nbsp; servirent &agrave; faire disparaitre les cadavres des communards.</p>\r\n\r\n<p>Aujourd&rsquo;hui 50 tombes de communards y sont identifi&eacute;es. Chacune d&rsquo;elle a son histoire.</p>	58	\N	137	t
51	<p>A la diff&eacute;rence des artistes plasticiens, pratiquement tous les &eacute;crivains prennent ouvertement parti contre la Commune et certains avec une rage, une haine d&rsquo;une violence stup&eacute;fiante !</p>\r\n\r\n<p>Seuls Jules Vall&egrave;s, lui-m&ecirc;me communard, ainsi que Rimbaud et Verlaine soutiennent la Commune. Victor Hugo pour sa part se montre critique envers la Commune mais d&eacute;fend les communards en toutes circonstances.</p>\r\n\r\n<p>Th&eacute;ophile Gautier, Maxime Du Camp, Edmond de Goncourt, Leconte de Lisle, Ernest Feydeau se retrouvent aux c&ocirc;t&eacute;s de Gustave Flaubert, George Sand et &Eacute;mile Zola pour d&eacute;noncer dans la Commune un &laquo; gouvernement du crime et de la d&eacute;mence &raquo; (Anatole France), responsable d&rsquo;avoir plong&eacute; Paris dans un &eacute;tat pathologique, exploit&eacute; par un groupe d&rsquo;ambitieux, de fous et d&rsquo;exalt&eacute;s.</p>\r\n\r\n<ul>\r\n\t<li><a href="about:blank" title="Leconte de Lisle">Charles-Marie Leconte de Lisle</a> &agrave; <a href="about:blank" title="José-Maria de Heredia">Jos&eacute;-Maria de Heredia</a>&nbsp;: &laquo;&nbsp;La Commune&nbsp;? Ce fut la ligue de tous les d&eacute;class&eacute;s, de tous les incapables, de tous les envieux, de tous les assassins, de tous les voleurs, mauvais po&egrave;tes, mauvais peintres, journalistes manqu&eacute;s, tenanciers de bas &eacute;tage.&nbsp;&raquo;</li>\r\n</ul>\r\n\r\n<ul>\r\n\t<li><a href="about:blank" title="George Sand">George Sand</a> &agrave; <a href="about:blank" title="Gustave Flaubert">Gustave Flaubert</a>&nbsp;: &laquo;&nbsp;Cette Commune est une crise de vomissements, les <a href="about:blank" title="Saturnales">saturnales</a> de la folie.&nbsp;&raquo;</li>\r\n</ul>\r\n\r\n<ul>\r\n\t<li>Les communards selon <a href="about:blank" title="Alphonse Daudet">Alphonse Daudet</a>&nbsp;: &laquo;&nbsp;Des t&ecirc;tes de pions, collets crasseux, cheveux luisants, les toqu&eacute;s, les &eacute;leveurs d&#39;escargots, les sauveurs du peuple, les d&eacute;class&eacute;s, les tristes, les tra&icirc;nards, les incapables&nbsp;; Pourquoi les ouvriers se sont-ils m&ecirc;l&eacute;s de politique&nbsp;? &nbsp;&raquo;</li>\r\n</ul>\r\n\r\n<ul>\r\n\t<li>Les communardes selon <a href="about:blank" title="Dumas fils">Dumas fils</a>&nbsp;: &laquo;&nbsp;Nous ne dirons rien de leurs femelles par respect pour les femmes, &agrave; qui elles ressemblent quand elles sont mortes.&nbsp;&raquo;</li>\r\n</ul>\r\n\r\n<ul>\r\n\t<li><a href="about:blank" title="Émile Littré">&Eacute;mile Littr&eacute;</a>&nbsp;: &laquo;&nbsp;J&#39;abhorre la guerre que le prol&eacute;tariat parisien vient de susciter. Il s&#39;est rendu cruellement coupable &agrave; l&#39;&eacute;gard de la patrie, ivre qu&#39;il &eacute;tait de doctrines farouches&nbsp;: le devoir &eacute;troit des gouvernements est de r&eacute;primer fermement le socialisme dans ses &eacute;carts anarchiques.&nbsp;&raquo;</li>\r\n</ul>\r\n\r\n<p>Oscillant entre l&#39;outrance verbale et le sch&eacute;matisme le plus grossier, ne reculant devant aucun manich&eacute;isme et d&eacute;veloppant &agrave; l&#39;extr&ecirc;me la caricature, la litt&eacute;rature anti communarde laisse suinter, &agrave; toutes les lignes, la haine de ces &eacute;crivains &agrave; l&#39;&eacute;gard de la classe ouvri&egrave;re.</p>\r\n\r\n<p>Pour en savoir plus, voir&nbsp;: Paul LIDSKY, &laquo;&nbsp;Les &eacute;crivains contre&nbsp; la Commune&nbsp;&raquo;, Edition La D&eacute;couverte, r&eacute;&eacute;dit&eacute; en 2010</p>\r\n\r\n<p>Paul Lidsky y analyse les convictions politiques et litt&eacute;raires de ces &eacute;crivains anti communards et montre comment ils raisonnaient, pensaient, et avec quels pr&eacute;jug&eacute;s de classe.</p>	53	\N	129	t
54	<p>Dimanche 21 mai apr&egrave;s-midi, l&rsquo;arm&eacute;e de Mac-Mahon entre dans Paris par la porte de St Cloud o&ugrave; la d&eacute;fense est d&eacute;garnie. Men&eacute;e par des g&eacute;n&eacute;raux de l&rsquo;Empire, elle s&rsquo;y d&eacute;ploie par le sud-ouest. L&rsquo;information arrive en fin de journ&eacute;e &agrave; l&rsquo;H&ocirc;tel de Ville. Mais rien n&rsquo;est d&eacute;cid&eacute;, aucun plan de d&eacute;fense pr&eacute;vu. Sans le savoir, le Conseil de la Commune cl&ocirc;t sa derni&egrave;re s&eacute;ance. Dans Paris des informations contradictoires circulent. Le g&eacute;n&eacute;ral Dombrowsky tente d&rsquo;organiser la r&eacute;sistance mais les renforts n&rsquo;arrivent pas. Tueries et arrestations ont d&eacute;j&agrave; commenc&eacute;&hellip;</p>\r\n\r\n<p>Le 22 au matin, une partie des 15e et 16e arrdts sont d&eacute;j&agrave; occup&eacute;s. Delescluze appelle les parisiens au combat, Paris se couvre de barricades, &eacute;rig&eacute;es et d&eacute;fendues par tous, hommes, femmes, enfants.</p>\r\n\r\n<p>Le 23 au matin, la ligne de front court le long des voies ferr&eacute;es de St Lazare et Montparnasse en passant par la Concorde. Les f&eacute;d&eacute;r&eacute;s sont pris en tenaille (au nord gr&acirc;ce &agrave; la complicit&eacute; des prussiens). Montmartre et Montparnasse sont pris. L&rsquo;acharnement des troupes devient sauvage, les prisonniers sont abattus sur le champ, les communards reculent malgr&eacute; des &icirc;lots de r&eacute;sistance acharn&eacute;e (Place Blanche, une barricade tenue&nbsp; plusieurs heures par des femmes est rest&eacute;e dans les m&eacute;moires).</p>\r\n\r\n<p>Le mercredi 24 vit le d&eacute;but des grands incendies, dus aux obus et bombes &agrave; p&eacute;trole que les Versaillais font pleuvoir sur la ville. Les cadavres s&rsquo;entassent suivant leur progression. Six otages ou espions sont alors fusill&eacute;s &agrave; la prison de la Roquette. Les parisiens incendient les Tuileries et l&rsquo;H&ocirc;tel de Ville, pris &agrave; son tour comme le Panth&eacute;on, le centre de Paris, jusqu&rsquo;au 10e arrdt. Les membres de la Commune se replient sur la Mairie du 11e arrdt. Le massacre a pris une dimension furieuse, l&rsquo;arm&eacute;e tue le peuple de Paris sans distinction de sexe ou d&rsquo;&acirc;ge.</p>\r\n\r\n<p>On combat une arm&eacute;e six fois plus nombreuse. Tenue deux longs jours par le g&eacute;n&eacute;ral Wroblewsky, la Butte aux Cailles c&egrave;de et la rive gauche est conquise le 25 mai. Des r&eacute;actionnaires sortent de leur trou et les d&eacute;nonciations viennent grossir le nombre des arrestations dans les quartiers occup&eacute;s. On fusille en masse, m&ecirc;me les bless&eacute;s, souvent &agrave; la mitrailleuse, dans les cours des Mairies, les casernes, les &eacute;difices publics, les squares.</p>\r\n\r\n<p>Le 12e arrdt, la Bastille, la Villette tombent &agrave; leur tour le 26, la r&eacute;sistance se concentre sur M&eacute;nilmontant et Belleville. Cinquante otages (gendarmes, religieux, espions) sont ex&eacute;cut&eacute;s sans commandement rue Haxo.</p>\r\n\r\n<p>Le samedi 27, le cimeti&egrave;re du P&egrave;re-Lachaise est pris &agrave; revers, on combat parmi les tombes. Le 28 au matin, les f&eacute;d&eacute;r&eacute;s ne tiennent plus que deux morceaux des 11e et 20e arrdts, grignot&eacute;s jusqu&rsquo;&agrave; la derni&egrave;re barricade au bas de Belleville&hellip; Tout est fini.</p>\r\n\r\n<p>Le fort de Vincennes, &agrave; l&rsquo;&eacute;cart des combats, sera d&eacute;sarm&eacute; le lundi 29 mai, les derniers d&eacute;fenseurs fusill&eacute;s.</p>\r\n\r\n<p>D&rsquo;&eacute;pouvantables t&eacute;moignages relatent les ruisseaux de sang s&rsquo;&eacute;coulant dans les rues, s&rsquo;&eacute;chappant des abattoirs qu&rsquo;&eacute;taient devenus le Luxembourg,&nbsp; la caserne Lobau, ou l&rsquo;extermination continuait. Le sang&nbsp; des milliers de cadavres qui furent jet&eacute;s &agrave; la fosse commune, &agrave; la Seine, dans des puits ou des carri&egrave;res&hellip; et qui donna son nom &agrave; cette derni&egrave;re semaine de Mai 1871.</p>\r\n\r\n<p>&nbsp;</p>	56	\N	133	t
49	<p>A ne pas confondre avec la F&eacute;d&eacute;ration artistique qui regroupait les artistes du spectacle. En ce qui concerne les artistes plasticiens, la r&eacute;volte grondait depuis longtemps en raison des blocages de l&rsquo;Acad&eacute;mie sur l&rsquo;acc&egrave;s au salon annuel sans lequel il &eacute;tait impossible de se faire conna&icirc;tre. Courbet et Daumier ayant refus&eacute; l&rsquo;aum&ocirc;ne de la L&eacute;gion d&rsquo;honneur en juin 1870 au motif que &laquo;&nbsp;l&rsquo;Etat est incomp&eacute;tent en mati&egrave;re d&rsquo;art&nbsp;&raquo;, les artistes organisent un d&icirc;ner m&eacute;morable en soutien aux deux insolents.</p>\r\n\r\n<p>D&egrave;s le 4 septembre, la R&eacute;publique nomme une commission artistique, install&eacute;e au Louvre avec Courbet pour pr&eacute;sident et pour fonction la sauvegarde des mus&eacute;es nationaux menac&eacute;s par l&rsquo;invasion prussienne. A peine la Commune proclam&eacute;e, Courbet fait para&icirc;tre le 19 mars 1871 dans &laquo;&nbsp;Le Rappel&nbsp;&raquo; une lettre aux artistes dans laquelle il propose une assembl&eacute;e pour r&eacute;organiser les Beaux-Arts et assurer l&rsquo;exposition annuelle. Une commission ex&eacute;cutive de 16 artistes est organis&eacute;e pour pr&eacute;parer cette assembl&eacute;e et le 6 avril un appel para&icirc;t dans le Journal officiel de la Commune. Moulin, sculpteur, Courbet, peintre, et Pottier dessinateur industriel (la F&eacute;d&eacute;ration inclura les artisans d&rsquo;art aux c&ocirc;t&eacute;s des artistes) appellent &agrave; une vaste r&eacute;union dans le grand amphith&eacute;&acirc;tre de l&rsquo;Ecole de m&eacute;decine. Il y aura 400 pr&eacute;sents pour adopter un programme audacieux qui para&icirc;tra deux jours plus tard dans le Journal officiel&nbsp;:</p>\r\n\r\n<p>&laquo;&nbsp;Les artistes de Paris se constituent en F&eacute;d&eacute;ration et d&eacute;cr&egrave;tent&nbsp;:</p>\r\n\r\n<p>- L&rsquo;&eacute;galit&eacute; des droits entre les m&eacute;tiers d&rsquo;art</p>\r\n\r\n<p>- La libre expansion de l&rsquo;art d&eacute;gag&eacute; de toute tutelle gouvernementale et de tous privil&egrave;ges</p>\r\n\r\n<p>-Ils repoussent d&rsquo;une mani&egrave;re absolue toute exhibition mercantile tendant &agrave; substituer le nom de l&rsquo;&eacute;diteur ou du fabricant &agrave; celui du v&eacute;ritable cr&eacute;ateur.&raquo;</p>\r\n\r\n<p>Quelques jours apr&egrave;s, au Louvre, ils &eacute;lisent Courbet pr&eacute;sident de la F&eacute;d&eacute;ration et une commission f&eacute;d&eacute;rale&nbsp; de 47 membres de tous m&eacute;tiers charg&eacute;e de la mise en &oelig;uvre du programme et d&rsquo;organiser l&rsquo;exposition. Elle n&rsquo;aura pas lieu en raison de la r&eacute;pression versaillaise.</p>\r\n\r\n<p>Les artistes ayant particip&eacute; &agrave; la cr&eacute;ation de la F&eacute;d&eacute;ration ne sont pas tous connus, loin de l&agrave;, mais des recherches sont en cours sur une vingtaine d&#39;entres eux.</p>\r\n\r\n<p>Elles t&eacute;moignent de l&#39;ostracisme dont la plupart ont souffert, prison, d&eacute;portation,&nbsp;exil, pillage des ateliers, folie, mis&egrave;re. Cependant Courbet, malgr&eacute; les incessantes pers&eacute;cutions, est &agrave; juste titre une gloire de la peinture mondiale et l&#39;on peut voir ses oeuvres au mus&eacute;e d&#39;Orsay. Dalou, qui fut d&eacute;l&eacute;gu&eacute; au Louvre pendant la Commune, est un grand sculpteur, ami de Rodin et l&#39;auteur du groupe si dynamique de la place de la Nation &agrave; Paris.</p>\r\n\r\n<p>Le programme de la F&eacute;d&eacute;ration des artistes est toujours d&rsquo;actualit&eacute;, alors que 150 ans plus tard, le minist&egrave;re de la culture exerce sa tutelle sans contr&ocirc;le d&eacute;mocratique et que l&rsquo;emprise des sp&eacute;culateurs sur la cote des artistes confine au d&eacute;lire.</p>	51	\N	126	t
52	<p>La Garde nationale est une vieille institution n&eacute;e en juillet 1789, qui a travers&eacute; tous les r&eacute;gimes du XIXe si&egrave;cle. Recrut&eacute;e parmi les citoyens les plus impos&eacute;s, elle est souvent apparue comme l&rsquo;instrument arm&eacute; des notables parisiens. R&eacute;duite &agrave; 28.000 hommes &agrave; la fin du Second Empire, elle trouve une nouvelle vie avec la guerre franco-prussienne de 1870-1871.</p>\r\n\r\n<p>Apr&egrave;s la proclamation de la Troisi&egrave;me R&eacute;publique et le d&eacute;but du si&egrave;ge de Paris, en septembre 1870, ses effectifs sont port&eacute;s &agrave; 300.000 hommes et s&rsquo;ouvrent largement aux classes populaires. Une solde de 30 sous par jour est attribu&eacute;e aux gardes n&eacute;cessiteux, tr&egrave;s nombreux en ce temps de ch&ocirc;mage.</p>\r\n\r\n<p>En 1871, la Garde nationale parisienne est compos&eacute;e de vingt l&eacute;gions, une par arrondissement, et compte 234 bataillons. Un d&eacute;cret du 6 septembre 1870 organise l&rsquo;&eacute;lection des officiers et sous-officiers par les gardes nationaux. Ce mode de d&eacute;signation aboutit &agrave; l&rsquo;&eacute;lection de militants actifs des clubs, des chambres syndicales, des sections de l&rsquo;Internationale. Ainsi, la Garde nationale devient une milice populaire et r&eacute;publicaine, une v&eacute;ritable arm&eacute;e du peuple.</p>\r\n\r\n<p>Apr&egrave;s la signature de l&rsquo;armistice, le 28 janvier 1871, la Garde nationale s&rsquo;affirme comme une force patriotique et r&eacute;publicaine, hostile &agrave; la capitulation, et d&eacute;cid&eacute;e &agrave; d&eacute;fendre la R&eacute;publique face &agrave; la majorit&eacute; monarchiste de l&rsquo;Assembl&eacute;e &eacute;lue le 8 f&eacute;vrier 1871.</p>\r\n\r\n<p>Le 15 f&eacute;vrier 1871, les d&eacute;l&eacute;gu&eacute;s des l&eacute;gions de la Garde nationale se r&eacute;unissent dans la salle du Tivoli-Vauxhall, pr&egrave;s de l&rsquo;actuelle place de la R&eacute;publique pour coordonner l&rsquo;action des 20 l&eacute;gions d&rsquo;arrondissement. Ils &eacute;lisent un Comit&eacute; central de la F&eacute;d&eacute;ration de la Garde nationale d&rsquo;o&ugrave; le nom de &laquo;&nbsp;F&eacute;d&eacute;r&eacute;s&nbsp;&raquo; pour d&eacute;signer les gardes nationaux.</p>\r\n\r\n<p>Le 18 mars 1871, l&rsquo;arm&eacute;e, envoy&eacute;e par Adolphe Thiers, tente de s&rsquo;emparer des canons de la Garde nationale entrepos&eacute;s &agrave; Montmartre et&nbsp;&agrave; Belleville. La population s&rsquo;y oppose et fraternise avec les soldats. Thiers s&rsquo;enfuit &agrave; Versailles. Le soir m&ecirc;me, le Comit&eacute; central de la Garde nationale s&rsquo;installe &agrave; l&rsquo;H&ocirc;tel de Ville et exerce le pouvoir de fait. Le lendemain, il convoque les &eacute;lecteurs parisiens pour &eacute;lire une assembl&eacute;e communale. Les &eacute;lections ont lieu le 26 mars. La Commune est proclam&eacute;e le 28 sur la place de l&rsquo;H&ocirc;tel de Ville en pr&eacute;sence d&rsquo;une foule enthousiaste. Le Comit&eacute; central remet alors ses pouvoirs entre les mains de la Commune.</p>\r\n\r\n<p>Entre sa prise de pouvoir le 18 mars et la proclamation de la Commune le 28, le Comit&eacute; central de la Garde nationale prend des mesures d&rsquo;urgence&nbsp;: relance des services publics, lev&eacute;e de l&rsquo;&eacute;tat de si&egrave;ge, libert&eacute; de la presse, lib&eacute;ration des prisonniers politiques, suspension de la vente des objets d&eacute;pos&eacute;s au Mont-de-Pi&eacute;t&eacute;, r&eacute;tablissement de la solde des gardes nationaux, moratoire sur les loyers et &eacute;ch&eacute;ances&hellip;</p>\r\n\r\n<p>Apr&egrave;s l&rsquo;&eacute;chec des derni&egrave;res sorties, en avril, et l&rsquo;abandon des forts d&rsquo;Issy et de Vanves, d&eacute;but mai, les F&eacute;d&eacute;r&eacute;s se pr&eacute;parent &agrave; l&rsquo;assaut des troupes de Versailles. Le 21 mai, les troupes de Versailles entrent dans Paris, par l&rsquo;ouest. Au cours de la Semaine sanglante (21-28 mai 1871), les F&eacute;d&eacute;r&eacute;s, r&eacute;duits &agrave; quelques milliers, se d&eacute;fendent pied &agrave; pied dans un Paris h&eacute;riss&eacute; de barricades. Les ultimes combats ont lieu dans l&rsquo;Est parisien, au P&egrave;re-Lachaise et &agrave; Belleville.</p>\r\n\r\n<p>Apr&egrave;s l&rsquo;&eacute;crasement de la Commune, l&rsquo;Assembl&eacute;e vote le 25 ao&ucirc;t 1871 la dissolution de la Garde nationale.</p>\r\n\r\n<p>------------------------</p>\r\n\r\n<p><span style="color:#0563c1"><u><a href="about:blank" style="color:#0563c1; text-decoration:underline">https://www.commune1871.org/la-commune-de-paris/histoire-de-la-commune/chronologie-au-jour-le-jour/473-la-garde-nationale-en-1870-et-1871</a></u></span>&nbsp; (Yves Lenoir)</p>	54	\N	130	t
53	<p>N&eacute; en 1797 dans une famille bourgeoise marseillaise commer&ccedil;ante pieuse et royaliste, Thiers est attir&eacute; par la gloire de Napol&eacute;on et l&#39;h&eacute;ritage de la R&eacute;volution .&nbsp;</p>\r\n\r\n<p>L&rsquo;&eacute;tudiant en droit, devenu journaliste, part pour Paris, centre du pouvoir et de l&#39;argent.</p>\r\n\r\n<p>Il &eacute;pouse une riche h&eacute;riti&egrave;re qui lui ouvre l&rsquo;acc&egrave;s &agrave; la grande bourgeoisie.</p>\r\n\r\n<p><span style="background-color:white">Ce mariage lui apporte une fortune et un h&ocirc;tel particulier dans le quartier &agrave; la mode place Saint Georges, o&ugrave; il re&ccedil;oit tous les gens importants. </span></p>\r\n\r\n<p>Alors, qu&rsquo;en 1815, il condamne la Restauration comme &laquo;le gouvernement de l&#39;&eacute;tranger&raquo;,<strong> </strong>lors des journ&eacute;es r&eacute;volutionnaires de 1830 qui renversent Charles X, il est de ceux qui poussent Louis-Philippe d&#39;Orl&eacute;ans, son cousin, &agrave; prendre le pouvoir.</p>\r\n\r\n<p><span style="background-color:white">Ministre de l&rsquo;int&eacute;rieur, en avril 1834, il r&eacute;prime dans le sang la seconde r&eacute;volte des canuts, les tisserands de Lyon, au prix de 600 morts et 10.000 arrestations. </span></p>\r\n\r\n<p>Il cr&eacute;e le d&eacute;lit de &laquo;crime politique&raquo; (d&eacute;lit d&#39;opinion) passible de la forteresse et fait jeter Blanqui dans les cellules du Mont-Saint-Michel.</p>\r\n\r\n<p>Il est partisan d&#39;un suffrage &laquo;censitaire&raquo; (limit&eacute; &agrave; ceux qui paient assez d&rsquo;imp&ocirc;ts), oppos&eacute; &agrave; l&#39;imp&ocirc;t sur le revenu, et &agrave; la l&eacute;galisation des associations ouvri&egrave;res, comme &agrave; toute r&eacute;forme du droit du travail. Louis Philippe en fait son premier ministre en 1836.</p>\r\n\r\n<p>En 1841, il fait construire les fortifications de Paris dont les canons sont tourn&eacute;s aussi vers l&#39;int&eacute;rieur de la ville. Il approuve la r&eacute;pression sanglante contre les ouvriers en juin 1848.</p>\r\n\r\n<p><span style="background-color:white">Il appuie la candidature de Louis-Napol&eacute;on Bonaparte &agrave; la pr&eacute;sidence mais condamne le coup d&rsquo;&Eacute;tat de 1852 et se tient &agrave; l&#39;&eacute;cart de la politique pendant le Second Empire. </span></p>\r\n\r\n<p>A l&rsquo;&eacute;cart de la politique sous le second empire, il fait fructifier sa fortune qui devient consid&eacute;rable. Il est aussi gros actionnaire de la Compagnie G&eacute;n&eacute;rale d&#39;Assurances sur la vie.</p>\r\n\r\n<p>Avec le banquier Casimir P&eacute;rier, il est le symbole de la fusion des int&eacute;r&ecirc;ts priv&eacute;s et de l&#39;appareil d&#39;&Eacute;tat. Balzac dira de lui &laquo; Monsieur Thiers n&rsquo;a jamais eu qu&rsquo;une seule pens&eacute;e : il a toujours song&eacute; &agrave; Monsieur Thiers &hellip;&raquo;</p>\r\n\r\n<p><span style="background-color:white"><strong>Le bourreau de la Commune de Paris </strong></span></p>\r\n\r\n<p><span style="background-color:white">Apr&egrave;s la chute de l&rsquo;empire il n&#39;a qu&#39;une h&acirc;te : conclure un armistice. Il pr&eacute;voit la perte de l&#39;Alsace Lorraine et de lourds dommages de guerre. </span></p>\r\n\r\n<p><span style="background-color:white">Les &eacute;lections sont organis&eacute;es en h&acirc;te et une assembl&eacute;e conservatrice est &eacute;lue qui nomme Thiers &laquo;chef du pouvoir ex&eacute;cutif de la R&eacute;publique fran&ccedil;aise&raquo; le 17 f&eacute;vrier 1871 &agrave; Bordeaux. </span></p>\r\n\r\n<p>&lt;1&gt;</p>\r\n\r\n<p><span style="background-color:white">Mais le peuple de Paris assi&eacute;g&eacute; refuse l&#39;armistice et se soul&egrave;ve : l&#39;Assembl&eacute;e se replie &agrave; Versailles et Thiers organise l&#39;&eacute;crasement de la Commune. </span></p>\r\n\r\n<p><span style="background-color:white">La r&eacute;pression est terrible : ex&eacute;cutions sommaires, proc&egrave;s exp&eacute;ditifs condamnant des communards &agrave; la mort, au bagne ou &agrave; la d&eacute;portation. Pour Georges Cl&eacute;menceau, Thiers est &laquo;le type m&ecirc;me du bourgeois cruel et born&eacute;, qui s&rsquo;enfonce sans broncher dans le sang&raquo;.</span></p>\r\n\r\n<div>\r\n<p><span style="background-color:white"><span style="background-color:white">Thiers devient le premier pr&eacute;sident d&rsquo;une R&eacute;publique socialement conservatrice et politiquement lib&eacute;rale. Il meurt en 1877.</span></span></p>\r\n\r\n<p><span style="background-color:white"><span style="background-color:white">La &laquo;R&eacute;publique conservatrice&raquo; en fit un h&eacute;ros dont le nom est donn&eacute; &agrave; des rues, mais son souvenir populaire est tout autre, celui d&#39;un bourreau. </span></span></p>\r\n</div>\r\n\r\n<p>&nbsp;</p>	55	\N	131	t
55	<p>D&egrave;s le 21 mai 1871, l&rsquo;arm&eacute;e rentre dans Paris. Commence alors une effroyable chasse aux insurg&eacute;s.&nbsp; Elle sera d&eacute;nomm&eacute;e la semaine sanglante. Ex&eacute;cutions&nbsp; sommaires, simulacre de proc&egrave;s au Ch&acirc;telet et au Luxembourg avec pour finalit&eacute; la mort &agrave; la caserne Lobau ou dans les jardins du Luxembourg ou l&rsquo;Ecole militaire. Bien d&rsquo;autres lieux serviront d&rsquo;abattoirs et de fosses communes. Les parcs Monceau et Buttes &ndash;Chaumont, square Saint Jacques en sont un exemple.</p>\r\n\r\n<p>D&egrave;s le mois de juin 1871, vient la r&eacute;pression&nbsp; l&eacute;gale. Plus de tuerie mais des emprisonnements. Plus de 36 000 prisonniers hommes, femmes et enfants sont dirig&eacute;s vers tous les ports de l&#39;Atlantique de Rochefort &agrave; Cherbourg dans l&rsquo;attente d&rsquo;&ecirc;tre traduits dans les conseils de guerre.&nbsp; Ces conseils de guerre au nombre de 26 fonctionneront jusqu&rsquo;en 1878. &nbsp;Les femmes sont r&eacute;parties entre les maisons d&rsquo;arr&ecirc;ts de&nbsp; Clermont (60) Rouen (76)&nbsp; Auberive (52) et Arras (62).</p>\r\n\r\n<p>Les prisons &eacute;tant pleines, des navires d&eacute;sarm&eacute;s appel&eacute;s pontons, ainsi que les forts sur les Iles de l&rsquo;oc&eacute;an, serviront de lieux d&rsquo;enfermement. Des enfants de 8 ans c&ocirc;toient des adultes de plus de 70 ans. Ils y restent 2, 3 voire plus de 6 mois avant qu&rsquo;une d&eacute;cision ne soit prise &agrave; leur encontre&nbsp;: non lieu ou enfermement dans une prison ou d&eacute;portation en Nouvelle- Cal&eacute;donie. Les enfants de moins de 15 ans condamn&eacute;s seront dirig&eacute;s vers la maison de correction de Rouen.&nbsp; Pr&egrave;s d&rsquo;un millier d&rsquo;hommes, de femmes et d&rsquo;enfants d&eacute;c&eacute;deront durant l&rsquo;instruction.</p>\r\n\r\n<p>&lt;1&gt;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Les condamn&eacute;s aux travaux forc&eacute;s, d&eacute;portation en enceinte fortifi&eacute;e, d&eacute;portation simple effectueront leurs peines en Nouvelle-Cal&eacute;donie. &nbsp;Sept femmes sont condamn&eacute;es &agrave; mort, leurs&nbsp; peines seront commu&eacute;es en travaux forc&eacute;s &agrave; perp&eacute;tuit&eacute; &agrave; effectuer sur les Iles du Salut en Guyane.</p>\r\n\r\n<p>Les convois vers la Nouvelle-Cal&eacute;donie s&rsquo;effectuent depuis les ports de Brest, de Toulon ou de Saint Martin de R&eacute;. La travers&eacute;e pour la Nouvelle-Cal&eacute;donie dure au minimum 147 jours. Le scorbut fait des ravages parmi les d&eacute;port&eacute;s.</p>\r\n\r\n<p>Une amnistie partielle fut vot&eacute;e le 3 mars 1879. 5 bateaux arriv&egrave;rent &agrave; Port-Vendres (66) entre le 1er septembre et le 12 octobre 1879. L&#39;aministie totale est promulgu&eacute;e le 11 juillet 1880. Les convois d&eacute;barqueront les d&eacute;port&eacute;s dans le port de Brest.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Pontons et prisons de la c&ocirc;te Atlantique de Rochefort &agrave; Cherbourg</strong></p>\r\n\r\n<p><strong>Secteur de Rochefort</strong><br />\r\n-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Fort de l&rsquo;Ile d&rsquo;Aix<br />\r\n-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Fort du Ch&acirc;teau d&rsquo;Ol&eacute;ron<br />\r\n-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Fort d&rsquo;Enet<br />\r\n-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Fort Boyard<br />\r\n-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Fort Fouras<br />\r\n-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Fort de l&rsquo;ile Madame<br />\r\n-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Fort de Noirmoutier<br />\r\n-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Fort des Saumonards<br />\r\n-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Fort de l&rsquo;ile d&rsquo;Yeu<br />\r\n-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Pontons : La Foudre, L&rsquo;Orne, L&rsquo;Iphig&eacute;nie, Le Pandore<br />\r\n-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; H&ocirc;pital maritime de Rochefort</p>\r\n\r\n<p><strong>Secteur de Lorient</strong><br />\r\n-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Maison de d&eacute;tention de Belle-Ile<br />\r\n-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Fort Port-Louis<br />\r\n-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Pontons : La P&eacute;n&eacute;lope, La Prudence, La Vengeance</p>\r\n\r\n<p><strong>Secteur de Cherbourg</strong><br />\r\n-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Fort des iles Chausey<br />\r\n-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Fort du Hommet<br />\r\n-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Fort de l&rsquo;ile Pel&eacute;e<br />\r\n-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Fort de l&rsquo;ile Saint Marcouf<br />\r\n-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Pontons : L&rsquo;Arcole, Le Bayard, Le Calvados, La Garonne, Le Rh&ocirc;ne, Le Tage, Tourville, Ville de Nantes<br />\r\n-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Navire H&ocirc;pital l&rsquo;Imp&eacute;tueuse</p>\r\n\r\n<p><strong>Secteur de Brest </strong><br />\r\n-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Fort Quelern<br />\r\n-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Prison de Brest<br />\r\n-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Pontons : L&rsquo;Aube, L&rsquo;Austerlitz, Breslau, Le Duguay-Trouin, Le Fontenoy, L&rsquo;Hermione, La Marne, le Napol&eacute;on, Le Tilsitt, Ville de Bordeaux, Ville de Lyon, L&rsquo;Yonne<br />\r\n-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; H&ocirc;pital maritime de Brest<br />\r\n-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Navire h&ocirc;pital La Renomm&eacute;e<br />\r\n-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Navire h&ocirc;pital La Souveraine<br />\r\n-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Lazaret de Tr&eacute;beron</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>	57	\N	134	t
33	<p><a href="https://www.commune1871.org/" target="_blank"><img alt="Logo de l'Association" src="/media/media/communde_de_paris/Logo-1871-01_400_pRuzRCk.jpg" style="float:left; height:210px; margin:5px 20px; width:400px" /></a></p>\r\n\r\n<p><strong>L&#39;association des Amies et Amis de la Commune de Paris 1871</strong></p>\r\n\r\n<p>un id&eacute;al d&#39;une actualit&eacute; br&ucirc;lante dans un monde plus que jamais in&eacute;galitaire, inhumain, domin&eacute; par l&#39;argent</p>\r\n\r\n<p>Cr&eacute;&eacute;e en 1882 par les Communards de retour d&rsquo;exil, l&rsquo;association des Amies et Amis de la Commune de Paris-1871 est la plus ancienne des organisations du mouvement ouvrier fran&ccedil;ais.</p>\r\n\r\n<p>Elle perp&eacute;tue les id&eacute;aux de la Commune et fait conna&icirc;tre son oeuvre pr&eacute;monitoire :</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - la la&iuml;cit&eacute;,</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - le droit du travail et le droit au travail,</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - l&#39;&eacute;mancipation des femmes,</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - les pr&eacute;mices de l&#39;autogestion...</p>\r\n\r\n<p>Pour faire conna&icirc;tre cette passionnante exp&eacute;rience de la d&eacute;mocratie.</p>\r\n\r\n<p>Pour savoir ce que fut l&#39;action des Communards.</p>\r\n\r\n<p>Pour mieux d&eacute;couvrir ce moment important de notre histoire, depuis toujours occult&eacute;, falsifi&eacute;, d&eacute;nigr&eacute; parce qu&rsquo;il fit tr&egrave;s peur aux privil&eacute;gi&eacute;s.</p>\r\n\r\n<p>Le cadavre est &agrave; terre mais l&#39;id&eacute;e est debout !</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>O&ugrave; nous trouver</strong></p>\r\n\r\n<p>46, rue des Cinq-Diamants&nbsp;75013 Paris<br />\r\nT&eacute;l: +33 1 45 81 60 54</p>\r\n\r\n<p>Permanences du lundi au vendredi de 14h &agrave; 17h30</p>\r\n\r\n<p><strong>Des parcours &laquo;&nbsp;Communards&nbsp;&raquo; accompagn&eacute;s et comment&eacute;s par l&rsquo;association sont organis&eacute;s au cimeti&egrave;re du P&egrave;re Lachaise mais &eacute;galement dans d&rsquo;autres lieux &agrave; Paris. Contacter l&rsquo;association pour plus d&rsquo;information.</strong></p>	35	\N	79	t
58	<p>Merci de lire attentivement les pr&eacute;sentes modalit&eacute;s d&#39;utilisation du pr&eacute;sent site avant de le parcourir. En vous connectant sur ce site, vous acceptez sans r&eacute;serve les pr&eacute;sentes modalit&eacute;s.</p>\r\n\r\n<p><strong>Editeur du site</strong><br />\r\nMobile Itineraries SARL<br />\r\n15 Route de Carri&egrave;res - 78400 Chatou<br />\r\n&nbsp;</p>\r\n\r\n<p><strong>Conditions d&#39;utilisation</strong><br />\r\nCe site est exploit&eacute; dans le respect de la l&eacute;gislation fran&ccedil;aise. L&#39;utilisation de ce site est r&eacute;gie par les pr&eacute;sentes conditions g&eacute;n&eacute;rales. En utilisant le site, vous reconnaissez avoir pris connaissance de ces conditions et les avoir accept&eacute;es. Celles-ci pourront &ecirc;tres modifi&eacute;es &agrave; tout moment et sans pr&eacute;avis. L&#39;&eacute;diteur ne saurait &ecirc;tre tenu pour responsable en aucune mani&egrave;re d&rsquo;une mauvaise utilisation du service.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Limitation de responsabilit&eacute;</strong><br />\r\nLes informations contenues sur ce site sont aussi pr&eacute;cises que possibles et le site est p&eacute;riodiquement remis &agrave; jour, mais peut toutefois contenir des inexactitudes, des omissions ou des lacunes. Si vous constatez une lacune, erreur ou ce qui parait &ecirc;tre un dysfonctionnement, merci de bien vouloir le signaler par courriel en d&eacute;crivant le probl&egrave;me de la mani&egrave;re la plus pr&eacute;cise possible (page posant probl&egrave;me, action effectu&eacute;e, type d&rsquo;ordinateur et de navigateur utilis&eacute;, &hellip;).</p>\r\n\r\n<p>Tout contenu t&eacute;l&eacute;charg&eacute; se fait aux risques et p&eacute;rils de l&#39;utilisateur et sous sa seule responsabilit&eacute;. En cons&eacute;quence, ne saurait &ecirc;tre tenu responsable d&#39;un quelconque dommage subi par l&#39;ordinateur de l&#39;utilisateur ou d&#39;une quelconque perte de donn&eacute;es cons&eacute;cutives au t&eacute;l&eacute;chargement.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Les photos sont non contractuelles</strong><br />\r\nLes liens hypertextes mis en place dans le cadre du pr&eacute;sent site internet en direction d&#39;autres ressources pr&eacute;sentes sur le r&eacute;seau Internet ne sauraient engager la responsabilit&eacute; de l&#39;&eacute;diteur du site.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Droit d&#39;acc&egrave;s</strong><br />\r\nEn application de cette loi, les internautes disposent d&rsquo;un droit d&rsquo;acc&egrave;s, de rectification, de modification et de suppression concernant les donn&eacute;es qui les concernent personnellement. Ce droit peut &ecirc;tre exerc&eacute; par voie postale aupr&egrave;s de Mobile Itineraries SARL &ndash; 15 Route de Carri&egrave;res - 78400 Chatou ou par voie &eacute;lectronique &agrave; l&rsquo;adresse courriel suivante : acazorzi@gmail.com.</p>\r\n\r\n<p>Les informations personnelles collect&eacute;es ne sont en aucun cas confi&eacute;es &agrave; des tiers hormis pour l&rsquo;&eacute;ventuelle bonne ex&eacute;cution de la prestation command&eacute;e par l&rsquo;internaute.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Confidentialit&eacute;</strong><br />\r\nVos donn&eacute;es personnelles sont confidentielles et ne seront en aucun cas communiqu&eacute;es &agrave; des tiers hormis pour la bonne ex&eacute;cution de la prestation.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Propri&eacute;t&eacute; intellectuelle</strong><br />\r\nTout le contenu du pr&eacute;sent site, incluant, de fa&ccedil;on non limitative, les graphismes, images, textes, vid&eacute;os, animations, sons, logos, gifs et ic&ocirc;nes ainsi que leur mise en forme sont la propri&eacute;t&eacute; exclusive de l&#39;&eacute;diteur du site &agrave; l&#39;exception des marques, logos ou contenus appartenant &agrave; d&#39;autres soci&eacute;t&eacute;s partenaires ou auteurs.</p>\r\n\r\n<p>Toute reproduction, distribution, modification, adaptation, retransmission ou publication, m&ecirc;me partielle, de ces diff&eacute;rents &eacute;l&eacute;ments est strictement interdite sans l&#39;accord expr&egrave;s par &eacute;crit de l&#39;&eacute;diteur du site. Cette repr&eacute;sentation ou reproduction, par quelque proc&eacute;d&eacute; que ce soit, constitue une contrefa&ccedil;on sanctionn&eacute;e par les articles L.3335-2 et suivants du Code de la propri&eacute;t&eacute; intellectuelle. Le non-respect de cette interdiction constitue une contrefa&ccedil;on pouvant engager la responsabilit&eacute; civile et p&eacute;nale du contrefacteur. En outre, les propri&eacute;taires des Contenus copi&eacute;s pourraient intenter une action en justice &agrave; votre encontre.</p>\r\n\r\n<p>Les utilisateurs et visiteurs du site internet peuvent mettre en place un hyperlien en direction de ce site, &agrave; condition que ce lien s&rsquo;ouvre dans une nouvelle fen&ecirc;tre. En particulier, l&rsquo;ouverture du pr&eacute;sent site au sein d&rsquo;un cadre (&laquo; framing &raquo;), sauf l&#39;autorisation expresse et pr&eacute;alable de l&#39;&eacute;diteur du site.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>H&eacute;bergeur</strong><br />\r\nAlibaba-Cloud.com (Europe) Limited<br />\r\n3rd Floor, Davidson Building<br />\r\n5 Southampton Street<br />\r\nLondon, England, WC2E 7HA<br />\r\nUnited Kingdom.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Informations et exclusion</strong><br />\r\nL&#39;&eacute;diteur met en &oelig;uvre tous les moyens dont elle dispose, pour assurer une information fiable et une mise &agrave; jour fiable de ses sites internet. Toutefois, des erreurs ou omissions peuvent survenir. L&#39;internaute devra donc s&#39;assurer de l&#39;exactitude des informations aupr&egrave;s du responsable &eacute;ditorial, et signaler toutes modifications du site qu&#39;il jugerait utile. Le responsable &eacute;ditorial n&#39;est en aucun cas responsable de l&#39;utilisation faite de ces informations, et de tout pr&eacute;judice direct ou indirect pouvant en d&eacute;couler.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Liens hypertextes</strong><br />\r\nLes sites internet de peuvent offrir des liens vers d&rsquo;autres sites internet ou d&rsquo;autres ressources disponibles sur Internet.</p>\r\n\r\n<p>Le responsable &eacute;ditorial ne dispose d&#39;aucun moyen pour contr&ocirc;ler les sites en connexion avec ses sites internet, ne r&eacute;pond pas de la disponibilit&eacute; de tels sites et sources externes, ni ne la garantit. Il ne peut &ecirc;tre tenu pour responsable de tout dommage, de quelque nature que ce soit, r&eacute;sultant du contenu de ces sites ou sources externes, et notamment des informations, produits ou services qu&rsquo;ils proposent, ou de tout usage qui peut &ecirc;tre fait de ces &eacute;l&eacute;ments. Les risques li&eacute;s &agrave; cette utilisation incombent pleinement &agrave; l&#39;internaute, qui doit se conformer &agrave; leurs conditions d&#39;utilisation.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Cookies</strong><br />\r\nCookies et technologies similaires : la plupart des navigateurs Web sont configur&eacute;s pour accepter les cookies par d&eacute;faut. Si vous pr&eacute;f&eacute;rez, vous pouvez g&eacute;n&eacute;ralement choisir de configurer votre navigateur pour supprimer les cookies et refuser les cookies. Si vous choisissez de supprimer les cookies ou de rejeter les cookies, cela pourrait affecter certaines fonctionnalit&eacute;s ou services de notre application web.</p>\r\n\r\n<p>L&rsquo;&eacute;diteur ne collecte que les cookies strictement n&eacute;cessaires au bon fonctionnement du site. Voici la liste des cookies utilis&eacute;es et leur objectif :</p>\r\n\r\n<ol style="list-style-type:lower-alpha">\r\n\t<li>Invitation &agrave; t&eacute;l&eacute;charger l&rsquo;application : Permet de garder en m&eacute;moire le fait que vous acceptez les cookies afin de ne plus vous importuner lors de votre prochaine visite. D&eacute;lai d&rsquo;expiration : 6 mois</li>\r\n\t<li>G&eacute;olocalisation : positionnement de l&rsquo;usager sur une carte g&eacute;ographique. Ceci pour vous permettre de vous rendre vers les lieux affich&eacute;s dans l&rsquo;application via une application de cartes (fournie par Google, Apple ou Openstreet Map). Une autorisation est demand&eacute;e au visiteur. D&eacute;lai d&rsquo;expiration de l&rsquo;autorisation: 6 mois. En cas de non-autorisation une nouvelle demande sera faite lors d&rsquo;une nouvelle visite apr&egrave;s quinze jours.</li>\r\n\t<li>Cookies usager&nbsp;: pour retenir les choix de l&rsquo;usager concernant les cookies mentionn&eacute;s aux points a) et b). D&eacute;lai d&rsquo;expiration&nbsp;: 6 mois.</li>\r\n</ol>\r\n\r\n<p>Ce site utilise Google Maps API dont les mentions l&eacute;gales peuvent &ecirc;tre consult&eacute;es <span style="color:#0563c1"><u><a href="about:blank" style="color:#0563c1; text-decoration:underline">ici</a></u></span> et les politiques de confidentialit&eacute; au lien <span style="color:#0563c1"><u><a href="about:blank" style="color:#0563c1; text-decoration:underline">suivant</a></u></span>.</p>	60	\N	130	t
15	<p>&lt;1&gt;</p>\r\n\r\n<p><em><span style="background-color:#dddddd">Acc&egrave;s&nbsp;: revenez vers l&rsquo;Avenue Aguado, remontez-la jusqu&rsquo;&agrave; l&rsquo;Avenue Traversi&egrave;re n. 2 o&ugrave; vous tournerez &agrave; gauche. Au bout d&rsquo;une vingtaine de m&egrave;tres, sur votre gauche, vous pourrez apercevoir la tombe de Raoul Urbain en quatri&egrave;me ligne, reconnaissable &agrave; son effigie en bronze. (Div. 91)</span></em></p>\r\n\r\n<p>N&eacute; en 1837, instituteur en Normandie puis &agrave; Paris, il s&rsquo;enr&ocirc;le dans la <a href="/articles-thematiques/la-garde-nationale" target="_self">Garde nationale</a> lors du si&egrave;ge de la ville par les Prussiens, fait partie de son <a href="/articles-thematiques/le-fonctionnement-de-la-commune" target="_self">Comit&eacute; Central</a> r&eacute;publicain. Tr&egrave;s actif d&egrave;s le 18 mars, il est &eacute;lu &agrave; la Commune dans le VIIe arrondissement, sera d&eacute;l&eacute;gu&eacute; &agrave; l&rsquo;enseignement. Arr&ecirc;t&eacute; et condamn&eacute; aux <a href="/articles-thematiques/la-semaine-sanglante" target="_self">travaux forc&eacute;s</a> apr&egrave;s la <a href="/articles-thematiques/la-semaine-sanglante">Semaine Sanglante</a>, rentr&eacute; apr&egrave;s l&rsquo;amnistie, il s&rsquo;occupera du mouvement coop&eacute;ratif. Il meurt &agrave; Paris en 1902.</p>\r\n\r\n<p><a href="https://maitron.fr/spip.php?article9182" target="_self">Pour en savoir plus</a></p>	17	13	33	t
19	<p>&lt;1&gt;</p>\r\n\r\n<p>Yvan SALMON pour l&rsquo;&eacute;tat civil, nait dans les Vosges en 1848. Sous le m&ecirc;me nom de plume que son fr&egrave;re a&icirc;n&eacute; (Louis Noir) il &eacute;crit au &laquo;&nbsp;Pilori&nbsp;&raquo; puis &agrave; &laquo;&nbsp;<a href="/articles-thematiques/la-presse" target="_self">La Marseillaise</a>&nbsp;&raquo;, journal d&rsquo;Henri Rochefort. Il est assassin&eacute; en janvier 1870 par Pierre Bonaparte, cousin de l&rsquo;Empereur, qui sera acquitt&eacute;. Ses obs&egrave;ques sont suivies par plus de 100&nbsp;000 personnes et manquent de tourner &agrave; l&rsquo;insurrection. Elles sont consid&eacute;r&eacute;es comme un v&eacute;ritable pr&eacute;lude &agrave; la chute du Second Empire et &agrave; la r&eacute;volte des parisiens. Sa d&eacute;pouille est transf&eacute;r&eacute;e au P&egrave;re-Lachaise en 1891, son gisant en bronze r&eacute;alis&eacute; par Jules Dalou fait l&rsquo;objet d&rsquo;une curieuse superstition&hellip;</p>\r\n\r\n<p><a href="https://fr.wikipedia.org/wiki/Victor_Noir" target="_self">Pour en savoir plus</a></p>	21	17	43	t
12	<p>&lt;1&gt;</p>\r\n\r\n<p>N&eacute; &agrave; Vierzon en 1810, avocat, journaliste et auteur, il fut tout au long de sa vie activiste et surtout grand orateur. Elu en 1848 et 1849 sous la IIe R&eacute;publique, plusieurs fois condamn&eacute; et exil&eacute;, adh&egrave;re &agrave; l&rsquo;AIT en 1864, fondateur de journaux vite interdits, il devient membre de la Commune (&eacute;lu du Xe) et fait partie de diff&eacute;rentes commissions mais il ne participe pas &agrave; la <a href="/articles-thematiques/la-semaine-sanglante" target="_self">Semaine sanglante</a>. Rentr&eacute; de son exil &agrave; Londres en 1880, il est &eacute;lu s&eacute;nateur du Cher en 1887 puis d&eacute;put&eacute; des Bouches du Rh&ocirc;ne en 1888. Meurt dans le Val d&rsquo;Oise en 1889.</p>\r\n\r\n<p><a href="https://maitron.fr/spip.php?article136008" target="_blank">Pour en savoir plus</a></p>	14	10	22	t
44	<p>&lt;1&gt;</p>\r\n\r\n<p><em><span style="background-color:#dddddd">Acc&egrave;s&nbsp;: la tombe de Jean Allemane se trouve entre les Avenues Carette et Aguado, proche de la petite all&eacute;e centrale entre les deux. Elle est en deuxi&egrave;me ligne, juste derri&egrave;re la tombe de la famille Perdon. (Div. 89).</span></em></p>\r\n\r\n<p>Ouvrier typographe. Il combat le Second Empire. Pendant le si&egrave;ge, il appartient &agrave; la <a href="/articles-thematiques/la-garde-nationale" target="_self">garde nationale</a>. Lors de la Commune, il est &eacute;lu pr&eacute;sident du Conseil de la Ve l&eacute;gion, il pr&eacute;side &eacute;galement le club de la rue d&#39;Arras. Apr&egrave;s avoir combattu sur les <a href="/articles-thematiques/la-semaine-sanglante" target="_self">barricades</a>, il est arr&ecirc;t&eacute; le 28 mai et condamn&eacute; &agrave; la <a href="/articles-thematiques/la-repression" target="_self">d&eacute;portation</a> en Nouvelle-Cal&eacute;donie. &Agrave; son retour, il s&#39;implique dans le mouvement socialiste (d&eacute;put&eacute; du XI&egrave;me arrondissement de 1901 &agrave; 1906). Auteur des &quot;M&eacute;moires d&#39;un communard&quot;.</p>\r\n\r\n<p><a href="https://www.commune1871.org/index.php?option=com_content&amp;view=article&amp;id=506:jean-allemane-1843-1935&amp;catid=12&amp;Itemid=109" target="_self">Pour en savoir plus</a></p>\r\n\r\n<p>&nbsp;</p>	46	32	118	t
29	<p>&lt;1&gt;</p>\r\n\r\n<p>Ouvrier chapelier. Membre de l&#39;Association internationale des travailleurs. Il s&#39;oppose au Second Empire (condamn&eacute;). Apr&egrave;s la proclamation de la R&eacute;publique, il fait partie de la <a href="/articles-thematiques/la-garde-nationale" target="_self">garde nationale</a> et est &eacute;lu au Comit&eacute; central. &Eacute;lu &eacute;galement par le IVe arrondissement, il si&egrave;ge au <a href="/articles-thematiques/le-fonctionnement-de-la-commune" target="_self">Conseil de la Commune</a> (d&eacute;l&eacute;gu&eacute; aux relations ext&eacute;rieures). Il est arr&ecirc;t&eacute; le 21 mai et condamn&eacute; &agrave; la <a href="/articles-thematiques/la-repression" target="_self">d&eacute;portation</a> &agrave; perp&eacute;tuit&eacute;. Graci&eacute; en 1880, il devient journaliste, ensuite conseiller municipal et d&eacute;put&eacute; de la Loire. (M&eacute;daillon du sculpteur Dalou sur sa tombe).</p>\r\n\r\n<p><a href="https://www.commune1871.org/index.php?option=com_content&amp;view=article&amp;id=523:amouroux-un-communard-tricolore&amp;catid=12&amp;Itemid=109" target="_self">Pour en savoir plus</a></p>	31	27	63	t
2	<p>&lt;1&gt;</p>\r\n\r\n<p>Professeur au Coll&egrave;ge de France, o&ugrave; il enseigne l&#39;histoire naturelle, puis r&eacute;voqu&eacute; pour ses id&eacute;es. En 1866, il participe &agrave; l&#39;insurrection cr&eacute;toise. En 1868, de retour en France, il devient journaliste &agrave; la &quot;<a href="/articles-thematiques/la-presse" target="_self">Marseillaise</a>&quot; de Rochefort. Pendant le si&egrave;ge, il est chef de <a href="/articles-thematiques/la-garde-nationale" target="_self">bataillon</a> &agrave; Belleville. Lors de la Commune, &eacute;lu du XIX&egrave;me et XX&egrave;me arrondissement, il si&egrave;ge &agrave; la commission militaire. Le 3 avril 1871, au cours d&#39;une offensive, il est assassin&eacute; par le gendarme Desmarets &agrave; Chatou. Un corps de francs-tireurs prend son nom&nbsp;: &quot;Les vengeurs de Flourens&quot;.</p>\r\n\r\n<p><a href="https://www.commune1871.org/index.php?option=com_content&amp;view=article&amp;id=501:gustave-flourens-1838-1871-le-chevalier-de-la-revolution&amp;catid=12&amp;Itemid=109" target="_self">Pour en savoir plus</a></p>	4	1	3	t
59	<div>LE TEMPS DES CERISES</div>\r\n\r\n<p>Interpret&eacute;e par Francesca Solleville</p>\r\n\r\n<div>\r\n<p>Quand nous chanterons le temps des cerises,<br />\r\nEt gai rossignol, et merle moqueur<br />\r\nSeront tous en f&ecirc;te&nbsp;!<br />\r\nLes belles auront la folie en t&ecirc;te<br />\r\nEt les amoureux, du soleil au c&oelig;ur&nbsp;!<br />\r\nQuand nous chanterons le temps des cerises,<br />\r\nSifflera bien mieux le merle moqueur&nbsp;!<br />\r\n<br />\r\nMais il est bien court, le temps des cerises<br />\r\nO&ugrave; l&rsquo;on s&rsquo;en va deux, cueillir en r&ecirc;vant<br />\r\nDes pendants d&rsquo;oreilles&hellip;<br />\r\nCerises d&rsquo;amour aux roses pareilles,<br />\r\nTombant sous la feuille en gouttes de sang&hellip;<br />\r\nMais il est bien court, le temps des cerises,<br />\r\nPendants de corail qu&rsquo;on cueille en r&ecirc;vant&nbsp;!<br />\r\n<br />\r\nQuand vous en serez au temps des cerises,<br />\r\nSi vous avez peur des chagrins d&rsquo;amour,<br />\r\n&nbsp;&nbsp;&Eacute;vitez les belles&nbsp;!<br />\r\nMoi qui ne crains pas les peines cruelles,<br />\r\nJe ne vivrai point sans souffrir un jour&hellip;<br />\r\nQuand vous en serez au temps des cerises,<br />\r\nVous aurez aussi des peines d&rsquo;amour&nbsp;!<br />\r\n<br />\r\nJ&rsquo;aimerai toujours le temps des cerises&nbsp;:<br />\r\nC&rsquo;est de ce temps-l&agrave; que je garde au c&oelig;ur<br />\r\n&nbsp;&nbsp;Une plaie ouverte&nbsp;!<br />\r\nEt dame Fortune, en m&rsquo;&eacute;tant offerte,<br />\r\nNe pourra jamais fermer ma douleur&hellip;<br />\r\nJ&rsquo;aimerai toujours le temps des cerises<br />\r\nEt le souvenir que je garde au c&oelig;ur&nbsp;!</p>\r\n\r\n<p>&nbsp;</p>\r\n</div>	61	\N	141	t
8	<p><em><span style="background-color:#dddddd">Acc&egrave;s&nbsp;: pour rejoindre cette &eacute;tape, site des derniers combats, revenez sur le Chemin du Bastion et empruntez-le &agrave; votre droite. Suivez le chemin, traversez le carrefour suivant et continuez tout droit sur le Chemin Casimir Delavigne. Apr&egrave;s une trentaine de m&egrave;tres, sur votre droite, vous verrez la tombe de Charles Nodier, site des derniers combats. (Div. 49)</span></em></p>\r\n\r\n<p>Situ&eacute; au c&oelig;ur du Paris populaire o&ugrave; les communards sont solidement implant&eacute;s, le cimeti&egrave;re du P&egrave;re-Lachaise est un camp retranch&eacute; improvis&eacute; par les <a href="/articles-thematiques/la-garde-nationale" target="_self">f&eacute;d&eacute;r&eacute;s</a> pendant que la Commune agonise sur ses derni&egrave;res <a href="/articles-thematiques/la-semaine-sanglante" target="_self">barricades</a>.</p>\r\n\r\n<p>Deux cents f&eacute;d&eacute;r&eacute;s arm&eacute;s d&rsquo;une dizaine de canons se r&eacute;fugient dans la n&eacute;cropole assi&eacute;g&eacute;e par les troupes versaillaises qui, depuis la butte Montmartre, bombardent cette position de repli des communards, avant de donner l&rsquo;assaut.</p>\r\n\r\n<p>Les Versaillais investissent le P&egrave;re Lachaise le 27 mai &agrave; 16h.</p>\r\n\r\n<p>Les f&eacute;d&eacute;r&eacute;s les repoussent (impacts de balles sur la tombe de Nodier). Faute de munitions, des combats &agrave; l&rsquo;arme blanche ont lieu au milieu des s&eacute;pultures...</p>\r\n\r\n<p>&quot;&mdash; Vous avez vu le cimeti&egrave;re apr&egrave;s la bataille ?</p>\r\n\r\n<p>&mdash; Oui, d&egrave;s le lendemain&hellip; le dimanche. J&rsquo;avais h&acirc;te de voir les d&eacute;g&acirc;ts&hellip; J&rsquo;ai construit tant de tombes ici&hellip; Un peu partout, les tombeaux &eacute;taient &eacute;corn&eacute;s par la fusillade, et, surtout, par les obus de Montmartre&hellip; L&agrave; o&ugrave; on s&rsquo;&eacute;tait battu, presque corps &agrave; corps, le terrain &eacute;tait ravag&eacute;, les arbres bris&eacute;s, les monuments renvers&eacute;s&hellip; Des morts, f&eacute;d&eacute;r&eacute;s et soldats, partout&hellip; jusque dans les tombeaux. On ne les avait pas encore relev&eacute;s&hellip; La lutte avait &eacute;t&eacute;, cela se voyait, particuli&egrave;rement vive autour de la pyramide Beaujour et dans les divisions voisines, autour des tombes de Charles Nodier et de Balzac entre autres&hellip; Au terre-plein des pi&egrave;ces, les grands caveaux qui le bordent &eacute;taient presque tous d&eacute;fonc&eacute;s, les statues &agrave; demi bris&eacute;es&hellip; Toute une d&eacute;vastation&hellip; Le sol jonch&eacute; de couronnes, de grilles arrach&eacute;es&hellip; Les pi&egrave;ces de canon &eacute;taient encore l&agrave;, quelques-unes renvers&eacute;es&hellip;&quot; <em>Extrait d&#39;une interview&nbsp;&nbsp; d&#39;un t&eacute;moin des massacres,&nbsp; publi&eacute;e dans la presse en 1920, et&nbsp; r&eacute;alis&eacute;e par Maxime Vuillaume.</em></p>\r\n\r\n<p>&lt;1&gt;</p>	10	6	14	t
45	<p>&lt;1&gt;</p>\r\n\r\n<p>Journaliste, Grand Ma&icirc;tre du Grand Orient de France, &eacute;crivain, homme politique. Il entre dans le journalisme d&rsquo;opposition sous l&rsquo;Empire. Capitaine pendant le si&egrave;ge de Paris, il prend part &agrave; la Commune et collabore au &laquo;&nbsp;<a href="/articles-thematiques/la-presse" target="_self">Cri du Peuple</a>&nbsp;&raquo; de Jules Vall&egrave;s et au &laquo;&nbsp;P&egrave;re Duch&ecirc;ne&nbsp;&raquo;. <a href="/articles-thematiques/la-repression" target="_self">D&eacute;port&eacute;</a> en 1871 en Nouvelle-Cal&eacute;donie, dont il revient apr&egrave;s l&rsquo;amnistie en 1880. Devient conseiller municipal, &eacute;lu au Conseil G&eacute;n&eacute;ral de la Seine, pr&eacute;sident du Conseil municipal en 1900, il est nomm&eacute; Directeur de l&rsquo;asile d&rsquo;ali&eacute;n&eacute;s de Villejuif.</p>\r\n\r\n<p><a href="https://maitron.fr/spip.php?article64882" target="_self">Pour en savoir plus</a></p>	47	33	119	t
23	<p>&lt;1&gt;</p>\r\n\r\n<p><em><span style="background-color:#dddddd">Acc&egrave;s&nbsp;: continuer sur l&rsquo;all&eacute;e et apr&egrave;s avoir quitt&eacute; la tombe de Charles Longuet poursuivez votre chemin pendant encore 30-40 m&egrave;tres. Puis, peu avant d&rsquo;arriver &agrave; l&rsquo;Avenue Transversale n. 3, tournez sur un petit chemin &agrave; gauche, juste derri&egrave;re la premi&egrave;re ligne de tombeaux. Apr&egrave;s une vingtaine de m&egrave;tres vous rencontrerez la tombe de Chassin. (Div. 92)</span></em></p>\r\n\r\n<p>Journaliste. Porte-parole du <a href="/articles-thematiques/la-garde-nationale" target="_self">Comit&eacute; central</a> r&eacute;publicain des 20 arrondissements. Il est arr&ecirc;t&eacute; &agrave; Bordeaux le 18 mars et reste emprisonn&eacute; durant toute la Commune. Jules Vall&egrave;s le d&eacute;peint dans &quot;Le bachelier&quot; sous le nom de Matoussaint.</p>\r\n\r\n<p><a href="https://maitron.fr/spip.php?article182648" target="_self">Pour en savoir plus</a></p>	23	19	47	t
26	<p>&lt;1&gt;</p>\r\n\r\n<p>N&eacute; en 1820, il devient &eacute;l&egrave;ve &agrave; l&rsquo;ENS mais sera r&eacute;voqu&eacute; pour son opposition &agrave; l&rsquo;Empire. Les &laquo;&nbsp;Propos de Labienus&nbsp;&raquo;, satire influente du r&eacute;gime imp&eacute;rial dont il est l&rsquo;auteur, l&rsquo;obligent &agrave; s&rsquo;exiler. Revenu apr&egrave;s la proclamation de la R&eacute;publique en 1870, il collabore &agrave; diff&eacute;rents journaux, est &eacute;lu de la Commune dans le VIe arrondissement mais d&eacute;missionne au vu d&rsquo;une trop faible participation. Condamn&eacute; &agrave; mort, r&eacute;fugi&eacute; &agrave; l&rsquo;&eacute;tranger, il rentre apr&egrave;s l&rsquo;<a href="/articles-thematiques/la-repression" target="_self">amnistie</a> en 1880 et poursuit pauvrement une carri&egrave;re d&rsquo;enseignant. Il meurt &agrave; Paris en 1896.</p>\r\n\r\n<p><a href="https://maitron.fr/spip.php?article144658" target="_self">Pour en savoir plus</a></p>	28	24	56	t
30	<p>&lt;1&gt;</p>\r\n\r\n<p><em><span style="background-color:#dddddd">Acc&egrave;s&nbsp;: la tombe d&rsquo;Arthur Ranc se trouve sur l&rsquo;Avenue Circulaire, juste avant la bifurcation avec le Chemin de la Gu&eacute;rite. En descendant l&rsquo;avenue la tombe se trouve sur la droite en troisi&egrave;me ligne derri&egrave;re la tombe de la famille H&eacute;ron. (Div. 36)</span></em></p>\r\n\r\n<p>N&eacute; en 1831. Opposant au coup d&rsquo;Etat de Louis-Napol&eacute;on Bonaparte en 1851, d&eacute;port&eacute;, amnisti&eacute;, il collabore &agrave; diff&eacute;rents journaux r&eacute;publicains. Maire du IXe apr&egrave;s la proclamation de la R&eacute;publique en 1870, puis d&eacute;put&eacute; en f&eacute;vrier 1871, il d&eacute;missionne de l&rsquo;Assembl&eacute;e, est &eacute;lu par le IXe arrondissement &agrave; la Commune dont il d&eacute;missionne &eacute;galement. Condamn&eacute; &agrave; mort, exil&eacute;, r&eacute;&eacute;lu d&eacute;put&eacute; &agrave; son retour, co-fondateur de la &laquo;&nbsp;Soci&eacute;t&eacute; des droits de l&rsquo;homme et du citoyen&nbsp;&raquo;, il poursuit une carri&egrave;re politique de s&eacute;nateur et meurt &agrave; Paris en 1908.</p>\r\n\r\n<p><a href="https://maitron.fr/spip.php?article136010" target="_self">Pour en savoir plus</a></p>	32	28	67	t
9	<p>&lt;1&gt;</p>\r\n\r\n<p>Journaliste et homme politique. - Prit part &agrave; la R&eacute;volution de 1830 et &agrave; celle de 1848. - D&eacute;port&eacute; (1852-1860). - Fondateur de nombreux journaux en France et en Belgique. - Fut &eacute;lu d&eacute;put&eacute; de la Seine &agrave; l&#39;Assembl&eacute;e nationale en 1870, Apr&egrave;s avoir vot&eacute; contre les pr&eacute;liminaires de paix, il quitta l&#39;assembl&eacute;e de Bordeaux et accepta sa nomination de membre de la Commune de Paris pour le 11e arrondissement. Il fit partie de la premi&egrave;re Commission ex&eacute;cutive. Il fut nomm&eacute; membre du Comit&eacute; de salut public et succ&eacute;da &agrave; Rossel au Minist&egrave;re de la guerre.</p>\r\n\r\n<p>Le jeudi 25 mai, il descendit le boulevard Voltaire et, non sans effort, monta, sans arme, sur la <a href="/articles-thematiques/la-semaine-sanglante" target="_self">barricade</a> &eacute;lev&eacute;e devant la place du Ch&acirc;teau d&rsquo;eau. &quot;Sur sa poitrine d&eacute;couverte, l&rsquo;&eacute;charpe rouge &agrave; frange d&rsquo;or de membre de la Commune le d&eacute;signait, comme une cible, &agrave; l&rsquo;ennemi mass&eacute; &agrave; deux cents m&egrave;tres&quot; Il tomba bient&ocirc;t cribl&eacute; de balles. Le surlendemain, son corps fut port&eacute; nuitamment au cimeti&egrave;re du Nord. Puis, par les soins de ses amis intimes, ses restes ont &eacute;t&eacute; transf&eacute;r&eacute;s au P&egrave;re-Lachaise, sa s&eacute;pulture symbolise une barricade.</p>\r\n\r\n<p><a href="https://www.commune1871.org/index.php?option=com_content&amp;view=article&amp;id=535:charles-delescluze&amp;catid=12&amp;Itemid=109" target="_blank">Pour en savoir plus</a></p>	11	7	15	t
32	<p>Le samedi 27 mai 1871, les troupes versaillaises parviennent &agrave; investir le cimeti&egrave;re du P&egrave;re-Lachaise, les communards r&eacute;sistent au point que les combats se sont parfois termin&eacute;s au corps &agrave; corps et &agrave; l&rsquo;arme blanche, entre les tombes, non loin des s&eacute;pultures de Nodier, Balzac et Souvestre.</p>\r\n\r\n<p>Cent quarante-sept communards faits prisonniers sont fusill&eacute;s contre le mur Est de l&rsquo;enceinte du cimeti&egrave;re. Dans les heures et les jours qui suivent, les corps de milliers d&rsquo;autres f&eacute;d&eacute;r&eacute;s sont ensevelis &agrave; leurs c&ocirc;t&eacute;s, dans les fosses communes utilis&eacute;es &agrave; l&#39;&eacute;poque.</p>\r\n\r\n<p>En leur m&eacute;moire, une section de cette muraille est appel&eacute;e d&egrave;s 1871 le &laquo;Mur des F&eacute;d&eacute;r&eacute;s&raquo;, une comm&eacute;moration annuelle s&rsquo;y d&eacute;roule, &agrave; l&rsquo;initiative d&rsquo;anciens communards et de leurs proches, bient&ocirc;t relay&eacute;s par les organisations militantes de gauche et d&#39;extr&ecirc;me gauche, politiques et syndicales.</p>\r\n\r\n<p>De nos jours, le samedi le plus proche du 28 mai &ndash; qui en 1871 marqua la fin de la &quot;Semaine sanglante&quot; &raquo; et l&rsquo;&eacute;crasement de la Commune &ndash;, est la date d&rsquo;une annuelle &laquo;mont&eacute;e au Mur&raquo; &agrave; l&#39;appel de l&#39;association des Amies et Amis de la Commune de Paris 1871.</p>\r\n\r\n<p>&lt;1&gt;</p>\r\n\r\n<p><strong>Un mur qui voudrait en cacher un autre</strong></p>\r\n\r\n<p>&lt;2&gt;</p>\r\n\r\n<p>Il existe un autre &laquo;&nbsp;mur&nbsp;&raquo;, il s&rsquo;agit d&rsquo;un monument situ&eacute; dans le square Samuel-de-Champlain, en lisi&egrave;re du cimeti&egrave;re, avenue Gambetta &agrave; Paris, dans le XXe&nbsp;! Il est l&rsquo;&oelig;uvre de Paul Moreau-Vauthier fils du Communard Augustin Moreau-Vauthier, intitul&eacute;e &laquo;Aux victimes des r&eacute;volutions&raquo; qui comporte aussi cette citation de Victor Hugo &laquo; Ce que nous demandons &agrave; l&rsquo;avenir, ce que nous voulons de lui, c&rsquo;est la justice, pas la vengeance &raquo; entretient l&#39;ambiguit&eacute;&nbsp; de r&eacute;concilier tous les morts de la Commune, victimes de l&rsquo;un et de l&rsquo;autre camp mais aussi la confusion des lieux surtout aupr&egrave;s des touristes &eacute;trangers.</p>\r\n\r\n<p>Des pierres du mur d&#39;origine auraient &eacute;t&eacute; utilis&eacute;es pour b&acirc;tir ce monument portant les traces des fusillades... On y voit des impacts de balles.</p>\r\n\r\n<p>&nbsp;</p>	34	30	75	t
57	<p>Le samedi 27 mai 1871, les troupes versaillaises parviennent &agrave; investir le cimeti&egrave;re du P&egrave;re-Lachaise, les communards r&eacute;sistent au point que les combats se sont parfois termin&eacute;s au corps &agrave; corps et &agrave; l&rsquo;arme blanche, entre les tombes, non loin des s&eacute;pultures de Nodier, Balzac et Souvestre.</p>\r\n\r\n<p>Cent quarante-sept communards faits prisonniers sont fusill&eacute;s contre le mur Est de l&rsquo;enceinte du cimeti&egrave;re. Dans les heures et les jours qui suivent, les corps de milliers d&rsquo;autres f&eacute;d&eacute;r&eacute;s sont ensevelis &agrave; leurs c&ocirc;t&eacute;s, dans les fosses communes utilis&eacute;es &agrave; l&#39;&eacute;poque.</p>\r\n\r\n<p>En leur m&eacute;moire, une section de cette muraille est appel&eacute;e d&egrave;s 1871 le &laquo;Mur des F&eacute;d&eacute;r&eacute;s&raquo;, une comm&eacute;moration annuelle s&rsquo;y d&eacute;roule, &agrave; l&rsquo;initiative d&rsquo;anciens communards et de leurs proches, bient&ocirc;t relay&eacute;s par les organisations militantes de gauche et d&#39;extr&ecirc;me gauche, politiques et syndicales.</p>\r\n\r\n<p>De nos jours, le samedi le plus proche du 28 mai &ndash; qui en 1871 marqua la fin de la &quot;Semaine sanglante&quot; &raquo; et l&rsquo;&eacute;crasement de la Commune &ndash;, est la date d&rsquo;une annuelle &laquo;mont&eacute;e au Mur&raquo; &agrave; l&#39;appel de l&#39;association des Amies et Amis de la Commune de Paris 1871.</p>\r\n\r\n<p>&lt;1&gt;</p>\r\n\r\n<p><strong>Un mur qui voudrait en cacher un autre</strong></p>\r\n\r\n<p>&lt;2&gt;</p>\r\n\r\n<p>Il existe un autre &laquo;&nbsp;mur&nbsp;&raquo;, il s&rsquo;agit d&rsquo;un monument situ&eacute; dans le square Samuel-de-Champlain, en lisi&egrave;re du cimeti&egrave;re, avenue Gambetta &agrave; Paris, dans le XXe&nbsp;! Il est l&rsquo;&oelig;uvre de Paul Moreau-Vauthier fils du Communard Augustin Moreau-Vauthier, intitul&eacute;e &laquo;Aux victimes des r&eacute;volutions&raquo;. Comportant aussi cette citation de Victor Hugo &laquo; Ce que nous demandons &agrave; l&rsquo;avenir, ce que nous voulons de lui, c&rsquo;est la justice, pas la vengeance &raquo;, il entretient l&#39;ambiguit&eacute;&nbsp; de r&eacute;concilier tous les morts de la Commune, victimes de l&rsquo;un et de l&rsquo;autre camp mais aussi la confusion des lieux surtout aupr&egrave;s des touristes &eacute;trangers.</p>\r\n\r\n<p>Des pierres du mur d&#39;origine auraient &eacute;t&eacute; utilis&eacute;es pour b&acirc;tir ce monument portant les traces des fusillades... On y voit des impacts de balles.</p>	59	\N	76	f
5	<p>&lt;1&gt;</p>\r\n\r\n<p>Monument &agrave; la m&eacute;moire des <a href="/articles-thematiques/la-garde-nationale" target="_self">gardes nationaux</a> tu&eacute;s au combat le 19 janvier 1871 lors de la seconde bataille de Buzenval qui se d&eacute;roula , pendant la guerre franco-prussienne, sur le territoire des communes de Rueil-Malmaison, Garches et Saint-Cloud, . Les troupes assi&eacute;g&eacute;es dans Paris tent&egrave;rent une sortie en direction de Versailles. Succ&eacute;dant &agrave; la vaine tentative de Champigny &agrave; un mois et demi d&#39;intervalle, cette seconde sortie, insuffisamment pr&eacute;par&eacute;e et d&#39;un int&eacute;r&ecirc;t strat&eacute;gique discutable, est imagin&eacute;e et conduite, dans un contexte politique de dissension, par le g&eacute;n&eacute;ral Louis Jules Trochu, gouverneur militaire de Paris et pr&eacute;sident du gouvernement provisoire, pour &laquo; calmer &raquo; les Parisiens les plus bellicistes. Son &eacute;chec exacerbe la division entre partisans d&#39;une paix n&eacute;goci&eacute;e, plut&ocirc;t soutenus par la Province et l&#39;Arm&eacute;e, et partisans de la &laquo; r&eacute;sistance &agrave; outrance &raquo;, o&ugrave; se compte une majorit&eacute; de la Garde Nationale.</p>	7	3	8	t
37	<p>Il existe un trou noir dans l&rsquo;histoire de France. On y a cach&eacute; le plus grand massacre de civils en Europe depuis la Saint Barthelemy&nbsp;: entre 20&nbsp;000 et 30&nbsp;000 communards ont &eacute;t&eacute; assassin&eacute;s par l&rsquo;arm&eacute;e fran&ccedil;aise. Depuis 1871 on cherche &agrave; faire dispara&icirc;tre le crime sous les mensonges et la d&eacute;n&eacute;gation.</p>\r\n\r\n<p>Apr&egrave;s 4 mois et demi de si&egrave;ge, quand le gouvernement capitule devant l&rsquo;arm&eacute;e prussienne, le peuple de Paris se r&eacute;volte et d&eacute;cide de se gouverner lui-m&ecirc;me. La Commune de Paris, d&eacute;but&eacute;e le 18 mars 1871, va durer 72 jours.</p>\r\n\r\n<p>Elle sera un exemple rare de d&eacute;mocratie directe, dans laquelle les &eacute;lus consid&eacute;r&eacute;s comme de simples mandataires re&ccedil;oivent un mandat imp&eacute;ratif et sont responsables et r&eacute;vocables devant le peuple &agrave; chaque instant.</p>\r\n\r\n<p>Premi&egrave;re r&eacute;volution ouvri&egrave;re au monde, elle abolit l&rsquo;arm&eacute;e au profit du peuple en arme, instaure la s&eacute;paration de l&rsquo;Eglise et de l&rsquo;Etat 34 ans avant la loi de 1905, cr&eacute;e l&rsquo;&eacute;cole la&iuml;que, obligatoire et gratuite pour les gar&ccedil;ons et les filles, met les ateliers abandonn&eacute;s en autogestion, cr&eacute;e un salaire minimum et un salaire maximum, instaure l&rsquo;&eacute;galit&eacute; de salaire hommes-femmes chez les instituteurs-trices, accorde les m&ecirc;mes droits aux concubines et aux enfants adult&eacute;rins. Bref, toutes les bases du socialisme sont pos&eacute;es en 55 jours de gouvernement.</p>\r\n\r\n<p>Cette &laquo;audace&raquo; sera ch&egrave;rement pay&eacute;e, le gouvernement fran&ccedil;ais, aid&eacute; par l&rsquo;arm&eacute;e d&rsquo;occupation allemande, va commettre un v&eacute;ritable g&eacute;nocide de classe&nbsp;: 100&nbsp;000 ouvriers seront manquants &agrave; Paris &agrave; l&rsquo;issue de la Commune&nbsp;; 30&nbsp;000 morts, 43 522 prisonniers, 10&nbsp;000 exil&eacute;s et 4&nbsp;500 d&eacute;port&eacute;s.</p>\r\n\r\n<p>Malgr&eacute; la chape de plomb en France, la r&eacute;sonance de la Commune sera immense dans tous les mouvements progressistes du monde entier. Aujourd&rsquo;hui encore 1,4 milliard de chinois ont appris l&rsquo;histoire de la Commune de Paris &agrave; l&rsquo;&eacute;cole primaire. Ce n&rsquo;est pas le cas des &eacute;coliers fran&ccedil;ais.</p>	39	\N	81	t
48	<p>Si la France, berceau des R&eacute;volutions et pays des droits de l&rsquo;homme accueille de longue date les r&eacute;volutionnaires &eacute;trangers, son d&eacute;veloppement industriel attire une nombreuse main d&rsquo;&oelig;uvre &eacute;trang&egrave;re.</p>\r\n\r\n<p>Apr&egrave;s la proclamation de la R&eacute;publique, le 4 septembre 1870, ils participent &agrave; la lutte contre l&rsquo;envahisseur prussien. Apr&egrave;s le 18 mars, beaucoup combattent dans les rangs des communards. Les plus nombreux sont les Belges, form&eacute;s en l&eacute;gion sp&eacute;ciale; viennent ensuite les Italiens (les &laquo;Chemises rouges&raquo; de Garibaldi, qui avaient guerroy&eacute; durant l&rsquo;hiver 1870-1871 contre les allemands en Bourgogne). En retour, la Commune est entour&eacute;e, durant son existence et apr&egrave;s sa d&eacute;faite, de la solidarit&eacute; agissante du mouvement ouvrier international.</p>\r\n\r\n<p>Fait exceptionnel dans l&rsquo;histoire, plusieurs &eacute;trangers occupent une place dirigeante. En mettant deux officiers polonais, Dombrowski et Wroblewski &agrave; la t&ecirc;te de ses arm&eacute;es, le hongrois L&eacute;o Fr&auml;nkel &agrave; l&rsquo;organisation du travail, faisant d&rsquo;une russe, E. Dmitrieff, tr&egrave;s active dans l&rsquo;Union des Femmes, une citoyenne de la Ville de Paris, la Commune affirme son internationalisme.</p>\r\n\r\n<p>La Commune entend donner le titre de citoyen aux &eacute;trangers qui la servent&nbsp;; elle rejette les x&eacute;nophobes qui exigent leur expulsion.</p>\r\n\r\n<p>La Commune d&eacute;clare&nbsp;: &laquo;Consid&eacute;rant que le drapeau de la Commune est celui de la R&eacute;publique Universelle, toute cit&eacute; a le droit de donner le titre de citoyen aux &eacute;trangers qui la servent&hellip;&raquo;</p>	50	\N	80	t
10	<p>&lt;1&gt;</p>\r\n\r\n<p><em><span style="background-color:#dddddd">Acc&egrave;s&nbsp;: apr&egrave;s la tombe de F&eacute;lix Pyat, revenez en arri&egrave;re vers l&rsquo;Avenue des Thuyas et empruntez-la &agrave; droite. Apr&egrave;s quelques m&egrave;tres sur votre gauche prenez le Chemin Beaujour et descendez vers l&rsquo;Avenue Circulaire. L&agrave; vous tournez &agrave; droite, vous passez un le Chemin Casariera et puis apr&egrave;s quelques m&egrave;tres vous trouverez la tombe de Capellaro. (Div. 81)</span></em></p>\r\n\r\n<p><a href="/articles-thematiques/la-federation-des-artistes" target="_self">Sculpteur</a>. &Eacute;l&egrave;ve de David d&#39;Angers et de Rude. Il sert dans la <a href="/articles-thematiques/la-garde-nationale" target="_self">garde nationale</a>, d&eacute;l&eacute;gu&eacute; de la l&eacute;gion au comit&eacute; central. Il appartient &agrave; la commission des artistes, &agrave; la d&eacute;l&eacute;gation et au bureau militaire du 11&egrave;me ,qui&nbsp; fait r&eacute;quisitionner et br&ucirc;ler 2 guillotines. <a href="/articles-thematiques/la-repression" target="_self">D&eacute;port&eacute;</a> en Nouvelle-Cal&eacute;donie.</p>\r\n\r\n<p><a href="https://www.commune1871.org/index.php?option=com_content&amp;view=article&amp;id=609:charles-romain-capellaro-1826-1899&amp;catid=31&amp;Itemid=349" target="_blank">Pour en savoir plus</a></p>	12	8	18	t
14	<p>&lt;1&gt;</p>\r\n\r\n<p><em><span style="background-color:#dddddd">Acc&egrave;s&nbsp;: depuis le Columbarium rejoignez et tournez &agrave; droite sur l&rsquo;Avenue Transversale n. 3. Passez l&rsquo;Avenue Aguado et vous trouverez sur votre gauche une petite all&eacute;e sans nom, qui s&rsquo;ouvre &agrave; c&ocirc;t&eacute; de la tombe de famille des Edwards. Parcourez cette all&eacute;e pour quelques m&egrave;tres et juste derri&egrave;re la premi&egrave;re ligne vous trouverez &agrave; droite la tombe de Grousset. (Div. 89)</span></em></p>\r\n\r\n<p>Journaliste et r&eacute;dacteur en chef de &quot;<a href="/articles-thematiques/la-presse" target="_self">La Marseillaise</a>&quot; de Rochefort. Sous la Commune, &eacute;lu du XVIII&egrave;me arrondissement, il si&egrave;ge &agrave; la <a href="/articles-thematiques/le-fonctionnement-de-la-commune" target="_self">commission</a> des relations ext&eacute;rieures et devient membre de la Commission ex&eacute;cutive. Il vote pour le Comit&eacute; de salut public. Condamn&eacute;, il est <a href="/articles-thematiques/la-repression" target="_self">d&eacute;port&eacute;</a> en Nouvelle-Cal&eacute;donie. Il s&#39;&eacute;vade le 21 mars 1874 avec Jourde et Rochefort et 4 autres d&eacute;tenus (seule &eacute;vasion). Il vit en Angleterre et rentre en France apr&egrave;s l&#39;amnistie. Il devient romancier et traducteur. &Eacute;lu d&eacute;put&eacute; socialiste ind&eacute;pendant de 1893 &agrave; sa mort.</p>\r\n\r\n<p><a href="https://maitron.fr/spip.php?article49816" target="_self">Pour en savoir plus</a></p>	16	12	32	t
16	<p>&lt;1&gt;</p>\r\n\r\n<p><em><span style="background-color:#dddddd">Acc&egrave;s&nbsp;: depuis la tombe de Raoul Urbain, reprenez l&rsquo;Avenue Agudo et allez jusqu&rsquo;au bout de celle-ci. L&agrave; vous tournerez &agrave; gauche dans une tr&egrave;s petite all&eacute;e et au bout d&rsquo;une vingtaine de m&egrave;tre vous verrez la tombe d&rsquo;Augustin Avrial. (Div. 91)</span></em></p>\r\n\r\n<p>Ouvrier m&eacute;canicien. Membre de l&#39;Association internationale des travailleurs. Commandant du 66e bataillon de la <a href="/articles-thematiques/la-garde-nationale" target="_self">garde nationale</a> d&egrave;s la proclamation de la R&eacute;publique, Il joue un grand r&ocirc;le le <a href="/articles-thematiques/le-debut-de-la-commune" target="_self">18 mars</a> &agrave; Montmartre. &Eacute;lu par le XIe arrondissement, il fait partie des commissions&nbsp;: du travail et de l&#39;&eacute;change, ex&eacute;cutive, de la guerre. Il combat sur les <a href="/articles-thematiques/la-semaine-sanglante" target="_self">barricades</a>, s&#39;exile &agrave; Londres puis en Alsace. Il adh&egrave;re au Parti ouvrier socialiste r&eacute;volutionnaire. Cr&eacute;ateur d&#39;une machine &agrave; coudre et d&#39;un motocycle &agrave; p&eacute;trole.</p>\r\n\r\n<p><a href="https://www.commune1871.org/index.php?option=com_content&amp;view=article&amp;id=489:augustin-avrial-1840-1904-syndicaliste-communard-et-inventeur&amp;catid=12&amp;Itemid=109" target="_self">Pour en savoir plus</a></p>	18	14	36	t
4	<p>&lt;1&gt;</p>\r\n\r\n<p><em><span style="background-color:#dddddd">Acc&egrave;s: pour rejoindre la tombe de Vall&egrave;s depuis celle de Flourens, continuez sur le Chemin d&#39;Ornano et apr&egrave;s une dizaine de m&egrave;tres vous verrez sur la gauche une petite all&eacute;e entre les tombes (bien avant d&#39;arriver &agrave; l&#39;Avenue des Peupliers). Empruntez-l&agrave;, puis tournez &agrave; droite et encore &agrave; gauche. Vous trouverez la tombe apr&egrave;s une dizaine de m&egrave;tres sur votre droite. Elle est en deuxi&egrave;me ligne par rapport &agrave; l&#39;avenue des Peupliers. (Div. 66)</span></em></p>\r\n\r\n<p>N&eacute; en 1832, d&eacute;j&agrave; impliqu&eacute; dans les &eacute;v&eacute;nements de 1848, il devient journaliste, fondateur de journaux engag&eacute;s (La Rue, Le Peuple), est emprisonn&eacute; &agrave; deux reprises. Il est l&rsquo;un des r&eacute;dacteurs de &laquo;&nbsp;L&rsquo;Affiche rouge&nbsp;&raquo; en janvier 71, puis fonde &laquo;&nbsp;<a href="/articles-thematiques/la-presse" target="_self">Le Cri du Peuple</a>&nbsp;&raquo; en f&eacute;vrier, qui para&icirc;tra jusqu&rsquo;&agrave; la fin de la Commune dont il est l&rsquo;un des &eacute;lus dans le XVe arrondissement.</p>\r\n\r\n<p>Menac&eacute; de mort, exil&eacute; jusqu&rsquo;en 1880, il poursuit une carri&egrave;re d&rsquo;&eacute;crivain &agrave; l&rsquo;&oelig;uvre largement autobiographique. Incarnation d&rsquo;une r&eacute;volte existentielle, r&eacute;fractaire avant tout, &laquo;&nbsp;L&rsquo;Insurg&eacute;&nbsp;&raquo; meurt &agrave; Paris en 1885.</p>\r\n\r\n<p><a href="https://maitron.fr/spip.php?article136034" target="_self">Pour en savoir plus</a></p>	6	2	4	t
24	<p>&lt;1&gt;</p>\r\n\r\n<p><em><span style="background-color:#dddddd">Acc&egrave;s&nbsp;: empruntez la petite all&eacute;e qui passe &agrave; c&ocirc;t&eacute; de la tombe d&rsquo;Andr&eacute; Gill, au bout de laquelle vous trouverez sur votre gauche la tombe de Eug&egrave;ne Pottier. (Div. 95)</span></em></p>\r\n\r\n<p>N&eacute; &agrave; Paris en 1816, dessinateur sur &eacute;toffe, il &eacute;crit des po&egrave;mes et chansons d&egrave;s son plus jeune &acirc;ge. Apr&egrave;s avoir particip&eacute; &agrave; la r&eacute;volution de 1848, il prosp&egrave;re et fonde une chambre syndicale qui adh&egrave;re &agrave; l&rsquo;AIT. Pendant la guerre de 1870, il combat sous le si&egrave;ge dans la <a href="/articles-thematiques/la-garde-nationale" target="_self">Garde nationale</a> et fait partie de son Comit&eacute; Central. Elu actif de la Commune (IIe arrondissement), membre de la <a href="/articles-thematiques/la-federation-des-artistes" target="_self">F&eacute;d&eacute;ration des artistes</a>, il participe aux combats de la <a href="/articles-thematiques/la-semaine-sanglante" target="_self">Semaine sanglante</a> et c&rsquo;est en juin 1871 qu&rsquo;il &eacute;crit &laquo;&nbsp;L&rsquo;Internationale&nbsp;&raquo;. Exil&eacute; en Angleterre puis aux Etats-Unis, il rentre en 1880, collabore &agrave; plusieurs journaux. Ses &oelig;uvres sont publi&eacute;es tardivement, dont &laquo;&nbsp;Chants r&eacute;volutionnaires&nbsp;&raquo; en 1887, ann&eacute;e de sa mort dans des conditions mis&eacute;rables. Mise en musique l&rsquo;ann&eacute;e suivante, &laquo;&nbsp;L&rsquo;Internationale&nbsp;&raquo; ne se r&eacute;pandra que bien apr&egrave;s sa disparition.</p>\r\n\r\n<p><a href="https://www.commune1871.org/index.php?option=com_content&amp;view=article&amp;id=491:eugene-pottier-un-poete-militant-1816-1887&amp;catid=12&amp;Itemid=109" target="_self">Pour en savoir plus</a></p>	26	22	52	t
20	<p>&lt;1&gt;</p>\r\n\r\n<p><em><span style="background-color:#dddddd">Acc&egrave;s&nbsp;: si vous avez vu la tombe de Victor Noir, revenez en arri&egrave;re quelques pas et empruntez l&rsquo;all&eacute;e qui traverse sur votre droite la division 92 (la m&ecirc;me de la tombe de Noir). Au bout de 30-40 m&egrave;tre se trouve sur votre gauche la tombe d&eacute;pouill&eacute;e de Charles Longuet. (Dov. 92)</span></em></p>\r\n\r\n<p>Homme politique, journaliste, militant socialiste. Devient opposant au Second Empire en 1860. Publie en anglais les statuts de l&rsquo;AIT r&eacute;dig&eacute;s par Marx, s&rsquo;exile en Belgique puis en Angleterre, y devient Franc-Ma&ccedil;on. En 1870 pendant le si&egrave;ge de Paris, il devient membre du Comit&eacute; Central des 20 arrondissements et du 248e bataillon de <a href="/articles-thematiques/la-garde-nationale" target="_self">gardes nationaux</a>. Est &eacute;lu au Conseil de la Commune par le XVIe arrondissement,&nbsp; devient r&eacute;dacteur en chef du Journal Officiel, et si&egrave;ge &agrave; la <a href="/articles-thematiques/le-fonctionnement-de-la-commune" target="_self">Commission du travail et de l&rsquo;&eacute;change</a>. Il vote contre la cr&eacute;ation du Comit&eacute; de Salut Public. Apr&egrave;s la semaine sanglante il se r&eacute;fugie &agrave; Londres et est condamn&eacute; par contumace &agrave; la <a href="/articles-thematiques/la-repression" target="_self">d&eacute;portation</a>. Il &eacute;pouse Jenny, la fille a&icirc;n&eacute;e de Karl Marx. Le couple aura quatre enfants.</p>\r\n\r\n<p><a href="https://maitron.fr/spip.php?article24870" target="_self">Pour en savoir plus</a></p>	22	18	44	t
\.


--
-- Name: commune_de_paris_cdp_page_description_PD_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lionhart
--

SELECT pg_catalog.setval('public."commune_de_paris_cdp_page_description_PD_id_seq"', 59, true);


--
-- Data for Name: commune_de_paris_cdp_page_image_order; Type: TABLE DATA; Schema: public; Owner: lionhart
--

COPY public.commune_de_paris_cdp_page_image_order ("PD_id", appearnce_order, is_page_present, page_description_id, page_image_id) FROM stdin;
3	1	t	4	6
4	1	t	5	9
5	1	t	6	10
6	1	t	7	13
7	1	t	9	16
8	1	t	10	17
9	1	t	11	20
10	1	t	12	21
16	1	t	14	31
17	1	t	15	34
18	1	t	16	35
19	1	t	17	38
20	1	t	18	41
21	1	t	19	42
22	1	t	20	45
23	1	t	21	49
24	1	t	22	50
25	1	t	23	46
26	1	t	24	53
27	1	t	25	54
28	1	t	26	57
29	1	t	27	58
30	1	t	28	61
31	1	t	29	62
32	1	t	30	69
34	1	t	8	73
1	1	t	2	74
35	1	t	32	77
36	2	t	32	78
37	2	t	31	91
33	1	t	31	101
40	5	t	31	110
41	6	t	31	107
42	7	t	31	108
43	8	t	31	104
44	9	t	31	109
45	10	t	31	103
46	11	t	31	106
52	1	t	43	121
53	1	t	44	122
54	1	t	45	123
55	1	t	46	124
12	3	t	13	27
14	4	t	13	29
13	1	t	13	28
15	5	t	13	30
47	6	t	13	111
48	7	t	13	112
49	8	t	13	113
50	9	t	13	114
51	10	t	13	115
56	2	t	13	125
38	3	t	31	105
39	4	t	31	102
57	1	t	53	132
58	1	t	55	135
59	2	t	57	78
60	1	t	57	77
62	1	t	33	140
\.


--
-- Name: commune_de_paris_cdp_page_image_order_PD_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lionhart
--

SELECT pg_catalog.setval('public."commune_de_paris_cdp_page_image_order_PD_id_seq"', 62, true);


--
-- Name: commune_de_paris_cdp_page_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lionhart
--

SELECT pg_catalog.setval('public.commune_de_paris_cdp_page_page_id_seq', 61, true);


--
-- Data for Name: commune_de_paris_cdp_resturant; Type: TABLE DATA; Schema: public; Owner: lionhart
--

COPY public.commune_de_paris_cdp_resturant ("Resturant_id", "Resturant_Address", "Resturant_Comment", "Page_id") FROM stdin;
\.


--
-- Name: commune_de_paris_cdp_resturant_Resturant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lionhart
--

SELECT pg_catalog.setval('public."commune_de_paris_cdp_resturant_Resturant_id_seq"', 1, false);


--
-- Data for Name: commune_de_paris_cdp_shopping; Type: TABLE DATA; Schema: public; Owner: lionhart
--

COPY public.commune_de_paris_cdp_shopping ("Shopping_id", "Shopping_Address", "Shopping_Comment", "Page_id") FROM stdin;
\.


--
-- Name: commune_de_paris_cdp_shopping_Shopping_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lionhart
--

SELECT pg_catalog.setval('public."commune_de_paris_cdp_shopping_Shopping_id_seq"', 1, false);


--
-- Data for Name: commune_de_paris_cdp_tickets; Type: TABLE DATA; Schema: public; Owner: lionhart
--

COPY public.commune_de_paris_cdp_tickets (tickets_id, "tickets_Details", "tickets_Comment", "Page_id") FROM stdin;
\.


--
-- Name: commune_de_paris_cdp_tickets_tickets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lionhart
--

SELECT pg_catalog.setval('public.commune_de_paris_cdp_tickets_tickets_id_seq', 1, false);


--
-- Data for Name: commune_de_paris_cdp_toilets; Type: TABLE DATA; Schema: public; Owner: lionhart
--

COPY public.commune_de_paris_cdp_toilets ("Toilet_id", "Toilet_Address", "Toilet_Comment", "Page_id") FROM stdin;
\.


--
-- Name: commune_de_paris_cdp_toilets_Toilet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lionhart
--

SELECT pg_catalog.setval('public."commune_de_paris_cdp_toilets_Toilet_id_seq"', 1, false);


--
-- Data for Name: commune_de_paris_cdp_transport; Type: TABLE DATA; Schema: public; Owner: lionhart
--

COPY public.commune_de_paris_cdp_transport (transport_id, "transport_Details", "transport_Comment", "Page_id") FROM stdin;
1	Division 66	Accès : pour rejoindre la tombe de Vallès depuis celle de Flourens, continuez sur le Chemin d'Ornano et après une dizaine de mètres vous verrez sur la gauche une petite allée entre les tombes (bien avant d'arriver à l'Avenue des Peupliers). Empruntez-là, puis tournez à droite et encore à gauche. Vous trouverez la tombe après une trentaine de mètres. Elle est en deuxième ligne par rapport à l'avenue des Peupliers. (Div. 66)	6
\.


--
-- Name: commune_de_paris_cdp_transport_transport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lionhart
--

SELECT pg_catalog.setval('public.commune_de_paris_cdp_transport_transport_id_seq', 1, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: lionhart
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	commune_de_paris	0001_initial	2020-04-22 17:18:42.440871+08
2	commune_de_paris	0002_auto_20200423_1212	2020-04-23 20:12:33.732473+08
3	commune_de_paris	0003_auto_20200424_1551	2020-04-24 23:51:35.494451+08
4	commune_de_paris	0004_cdp_map_geo_coordinates	2020-04-25 19:12:45.474707+08
5	commune_de_paris	0005_auto_20200526_1438	2020-05-26 22:39:16.14086+08
6	commune_de_paris	0006_auto_20200614_2000	2020-06-15 04:01:42.395818+08
7	commune_de_paris	0007_cdp_images_page	2020-06-18 21:23:06.338387+08
8	commune_de_paris	0008_auto_20200622_0151	2020-06-22 09:51:33.063793+08
9	commune_de_paris	0009_cdp_page_is_page_zero	2020-06-22 10:07:12.739875+08
10	commune_de_paris	0010_auto_20200622_0208	2020-06-22 10:08:07.981766+08
11	commune_de_paris	0011_auto_20200908_0225	2020-09-08 10:26:52.701193+08
12	commune_de_paris	0012_auto_20200908_0235	2020-09-08 10:36:20.055393+08
13	commune_de_paris	0013_cdp_page_description_show_title_audio	2020-09-30 14:59:44.671362+08
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lionhart
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 13, true);


--
-- Name: commune_de_paris_cdp_audio_page commune_de_paris_cdp_audio_page_pkey; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_audio_page
    ADD CONSTRAINT commune_de_paris_cdp_audio_page_pkey PRIMARY KEY (ap_id);


--
-- Name: commune_de_paris_cdp_audios commune_de_paris_cdp_audios_pkey; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_audios
    ADD CONSTRAINT commune_de_paris_cdp_audios_pkey PRIMARY KEY (audio_id);


--
-- Name: commune_de_paris_cdp_bar commune_de_paris_cdp_bar_pkey; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_bar
    ADD CONSTRAINT commune_de_paris_cdp_bar_pkey PRIMARY KEY ("Bar_id");


--
-- Name: commune_de_paris_cdp_burger_menu_ordering commune_de_paris_cdp_burger_menu_ordering_pkey; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_burger_menu_ordering
    ADD CONSTRAINT commune_de_paris_cdp_burger_menu_ordering_pkey PRIMARY KEY ("BMO_id");


--
-- Name: commune_de_paris_cdp_childrenentertainment commune_de_paris_cdp_childrenentertainment_pkey; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_childrenentertainment
    ADD CONSTRAINT commune_de_paris_cdp_childrenentertainment_pkey PRIMARY KEY ("CE_id");


--
-- Name: commune_de_paris_cdp_images commune_de_paris_cdp_images_pkey; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_images
    ADD CONSTRAINT commune_de_paris_cdp_images_pkey PRIMARY KEY (image_id);


--
-- Name: commune_de_paris_cdp_itinerary_color_scheme commune_de_paris_cdp_itinerary_color_scheme_pkey; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_itinerary_color_scheme
    ADD CONSTRAINT commune_de_paris_cdp_itinerary_color_scheme_pkey PRIMARY KEY ("ICS_id");


--
-- Name: commune_de_paris_cdp_itinerary commune_de_paris_cdp_itinerary_pkey; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_itinerary
    ADD CONSTRAINT commune_de_paris_cdp_itinerary_pkey PRIMARY KEY (itinerary_id);


--
-- Name: commune_de_paris_cdp_lieu commune_de_paris_cdp_lieu_pkey; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_lieu
    ADD CONSTRAINT commune_de_paris_cdp_lieu_pkey PRIMARY KEY ("Lieu_id");


--
-- Name: commune_de_paris_cdp_map_controls commune_de_paris_cdp_map_controls_pkey; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_map_controls
    ADD CONSTRAINT commune_de_paris_cdp_map_controls_pkey PRIMARY KEY ("MC_id");


--
-- Name: commune_de_paris_cdp_map commune_de_paris_cdp_map_pkey; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_map
    ADD CONSTRAINT commune_de_paris_cdp_map_pkey PRIMARY KEY (page_id);


--
-- Name: commune_de_paris_cdp_menu commune_de_paris_cdp_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_menu
    ADD CONSTRAINT commune_de_paris_cdp_menu_pkey PRIMARY KEY (menu_id);


--
-- Name: commune_de_paris_cdp_opening_hours commune_de_paris_cdp_opening_hours_pkey; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_opening_hours
    ADD CONSTRAINT commune_de_paris_cdp_opening_hours_pkey PRIMARY KEY (oh_id);


--
-- Name: commune_de_paris_cdp_page_before_after_image_order commune_de_paris_cdp_page_before_after_image_order_pkey; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_page_before_after_image_order
    ADD CONSTRAINT commune_de_paris_cdp_page_before_after_image_order_pkey PRIMARY KEY ("PD_id");


--
-- Name: commune_de_paris_cdp_page_description commune_de_paris_cdp_page_description_pkey; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_page_description
    ADD CONSTRAINT commune_de_paris_cdp_page_description_pkey PRIMARY KEY ("PD_id");


--
-- Name: commune_de_paris_cdp_page_image_order commune_de_paris_cdp_page_image_order_pkey; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_page_image_order
    ADD CONSTRAINT commune_de_paris_cdp_page_image_order_pkey PRIMARY KEY ("PD_id");


--
-- Name: commune_de_paris_cdp_page commune_de_paris_cdp_page_pkey; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_page
    ADD CONSTRAINT commune_de_paris_cdp_page_pkey PRIMARY KEY (page_id);


--
-- Name: commune_de_paris_cdp_resturant commune_de_paris_cdp_resturant_pkey; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_resturant
    ADD CONSTRAINT commune_de_paris_cdp_resturant_pkey PRIMARY KEY ("Resturant_id");


--
-- Name: commune_de_paris_cdp_shopping commune_de_paris_cdp_shopping_pkey; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_shopping
    ADD CONSTRAINT commune_de_paris_cdp_shopping_pkey PRIMARY KEY ("Shopping_id");


--
-- Name: commune_de_paris_cdp_tickets commune_de_paris_cdp_tickets_pkey; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_tickets
    ADD CONSTRAINT commune_de_paris_cdp_tickets_pkey PRIMARY KEY (tickets_id);


--
-- Name: commune_de_paris_cdp_toilets commune_de_paris_cdp_toilets_pkey; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_toilets
    ADD CONSTRAINT commune_de_paris_cdp_toilets_pkey PRIMARY KEY ("Toilet_id");


--
-- Name: commune_de_paris_cdp_transport commune_de_paris_cdp_transport_pkey; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_transport
    ADD CONSTRAINT commune_de_paris_cdp_transport_pkey PRIMARY KEY (transport_id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: commune_de_paris_cdp_audio_page_audio_id_de98ae49; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX commune_de_paris_cdp_audio_page_audio_id_de98ae49 ON public.commune_de_paris_cdp_audio_page USING btree (audio_id);


--
-- Name: commune_de_paris_cdp_audio_page_page_description_id_cfa18da7; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX commune_de_paris_cdp_audio_page_page_description_id_cfa18da7 ON public.commune_de_paris_cdp_audio_page USING btree (page_description_id);


--
-- Name: commune_de_paris_cdp_bar_Page_id_7c551a03; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX "commune_de_paris_cdp_bar_Page_id_7c551a03" ON public.commune_de_paris_cdp_bar USING btree ("Page_id");


--
-- Name: commune_de_paris_cdp_burger_menu_ordering_itinerary_id_451acd50; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX commune_de_paris_cdp_burger_menu_ordering_itinerary_id_451acd50 ON public.commune_de_paris_cdp_burger_menu_ordering USING btree (itinerary_id);


--
-- Name: commune_de_paris_cdp_burger_menu_ordering_menu_id_10f2238c; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX commune_de_paris_cdp_burger_menu_ordering_menu_id_10f2238c ON public.commune_de_paris_cdp_burger_menu_ordering USING btree (menu_id);


--
-- Name: commune_de_paris_cdp_childrenentertainment_Page_id_7c399f05; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX "commune_de_paris_cdp_childrenentertainment_Page_id_7c399f05" ON public.commune_de_paris_cdp_childrenentertainment USING btree ("Page_id");


--
-- Name: commune_de_paris_cdp_images_Page_id_b38c088a; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX "commune_de_paris_cdp_images_Page_id_b38c088a" ON public.commune_de_paris_cdp_images USING btree ("Page_id");


--
-- Name: commune_de_paris_cdp_itine_itinerary_id_356c21fe; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX commune_de_paris_cdp_itine_itinerary_id_356c21fe ON public.commune_de_paris_cdp_itinerary_color_scheme USING btree (itinerary_id);


--
-- Name: commune_de_paris_cdp_lieu_Page_id_157762fe; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX "commune_de_paris_cdp_lieu_Page_id_157762fe" ON public.commune_de_paris_cdp_lieu USING btree ("Page_id");


--
-- Name: commune_de_paris_cdp_map_Page_id_a4dfab9e; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX "commune_de_paris_cdp_map_Page_id_a4dfab9e" ON public.commune_de_paris_cdp_map USING btree ("Page_id");


--
-- Name: commune_de_paris_cdp_map_controls_itinerary_id_7621b6e9; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX commune_de_paris_cdp_map_controls_itinerary_id_7621b6e9 ON public.commune_de_paris_cdp_map_controls USING btree (itinerary_id);


--
-- Name: commune_de_paris_cdp_map_itinerary_id_d5a22f58; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX commune_de_paris_cdp_map_itinerary_id_d5a22f58 ON public.commune_de_paris_cdp_map USING btree (itinerary_id);


--
-- Name: commune_de_paris_cdp_map_map_images_id_ea0d0b1c; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX commune_de_paris_cdp_map_map_images_id_ea0d0b1c ON public.commune_de_paris_cdp_map USING btree (map_images_id);


--
-- Name: commune_de_paris_cdp_menu_itinerary_id_7e7c3d6b; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX commune_de_paris_cdp_menu_itinerary_id_7e7c3d6b ON public.commune_de_paris_cdp_menu USING btree (itinerary_id);


--
-- Name: commune_de_paris_cdp_menu_menu_images_id_195cff18; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX commune_de_paris_cdp_menu_menu_images_id_195cff18 ON public.commune_de_paris_cdp_menu USING btree (menu_images_id);


--
-- Name: commune_de_paris_cdp_opening_hours_Page_id_451408ce; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX "commune_de_paris_cdp_opening_hours_Page_id_451408ce" ON public.commune_de_paris_cdp_opening_hours USING btree ("Page_id");


--
-- Name: commune_de_paris_cdp_page__page_description_id_57e1df48; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX commune_de_paris_cdp_page__page_description_id_57e1df48 ON public.commune_de_paris_cdp_page_before_after_image_order USING btree (page_description_id);


--
-- Name: commune_de_paris_cdp_page__page_description_id_64ce0d5c; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX commune_de_paris_cdp_page__page_description_id_64ce0d5c ON public.commune_de_paris_cdp_page_image_order USING btree (page_description_id);


--
-- Name: commune_de_paris_cdp_page__page_image_after_id_a5b57b92; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX commune_de_paris_cdp_page__page_image_after_id_a5b57b92 ON public.commune_de_paris_cdp_page_before_after_image_order USING btree (page_image_after_id);


--
-- Name: commune_de_paris_cdp_page__page_image_before_id_b5d851ad; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX commune_de_paris_cdp_page__page_image_before_id_b5d851ad ON public.commune_de_paris_cdp_page_before_after_image_order USING btree (page_image_before_id);


--
-- Name: commune_de_paris_cdp_page__page_title_image_id_ccbf5d73; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX commune_de_paris_cdp_page__page_title_image_id_ccbf5d73 ON public.commune_de_paris_cdp_page_description USING btree (page_title_image_id);


--
-- Name: commune_de_paris_cdp_page_description_page_id_c8c0d8b4; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX commune_de_paris_cdp_page_description_page_id_c8c0d8b4 ON public.commune_de_paris_cdp_page_description USING btree (page_id);


--
-- Name: commune_de_paris_cdp_page_description_page_map_id_4037b015; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX commune_de_paris_cdp_page_description_page_map_id_4037b015 ON public.commune_de_paris_cdp_page_description USING btree (page_map_id);


--
-- Name: commune_de_paris_cdp_page_image_order_page_image_id_dd895281; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX commune_de_paris_cdp_page_image_order_page_image_id_dd895281 ON public.commune_de_paris_cdp_page_image_order USING btree (page_image_id);


--
-- Name: commune_de_paris_cdp_page_itinerary_id_b01ae1ac; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX commune_de_paris_cdp_page_itinerary_id_b01ae1ac ON public.commune_de_paris_cdp_page USING btree (itinerary_id);


--
-- Name: commune_de_paris_cdp_resturant_Page_id_0900ab1f; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX "commune_de_paris_cdp_resturant_Page_id_0900ab1f" ON public.commune_de_paris_cdp_resturant USING btree ("Page_id");


--
-- Name: commune_de_paris_cdp_shopping_Page_id_16c88b18; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX "commune_de_paris_cdp_shopping_Page_id_16c88b18" ON public.commune_de_paris_cdp_shopping USING btree ("Page_id");


--
-- Name: commune_de_paris_cdp_tickets_Page_id_6ab1e327; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX "commune_de_paris_cdp_tickets_Page_id_6ab1e327" ON public.commune_de_paris_cdp_tickets USING btree ("Page_id");


--
-- Name: commune_de_paris_cdp_toilets_Page_id_336905a8; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX "commune_de_paris_cdp_toilets_Page_id_336905a8" ON public.commune_de_paris_cdp_toilets USING btree ("Page_id");


--
-- Name: commune_de_paris_cdp_transport_Page_id_9fa24dbb; Type: INDEX; Schema: public; Owner: lionhart
--

CREATE INDEX "commune_de_paris_cdp_transport_Page_id_9fa24dbb" ON public.commune_de_paris_cdp_transport USING btree ("Page_id");


--
-- Name: commune_de_paris_cdp_resturant commune_de_paris_cdp_Page_id_0900ab1f_fk_commune_d; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_resturant
    ADD CONSTRAINT "commune_de_paris_cdp_Page_id_0900ab1f_fk_commune_d" FOREIGN KEY ("Page_id") REFERENCES public.commune_de_paris_cdp_page(page_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: commune_de_paris_cdp_lieu commune_de_paris_cdp_Page_id_157762fe_fk_commune_d; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_lieu
    ADD CONSTRAINT "commune_de_paris_cdp_Page_id_157762fe_fk_commune_d" FOREIGN KEY ("Page_id") REFERENCES public.commune_de_paris_cdp_page(page_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: commune_de_paris_cdp_shopping commune_de_paris_cdp_Page_id_16c88b18_fk_commune_d; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_shopping
    ADD CONSTRAINT "commune_de_paris_cdp_Page_id_16c88b18_fk_commune_d" FOREIGN KEY ("Page_id") REFERENCES public.commune_de_paris_cdp_page(page_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: commune_de_paris_cdp_toilets commune_de_paris_cdp_Page_id_336905a8_fk_commune_d; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_toilets
    ADD CONSTRAINT "commune_de_paris_cdp_Page_id_336905a8_fk_commune_d" FOREIGN KEY ("Page_id") REFERENCES public.commune_de_paris_cdp_page(page_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: commune_de_paris_cdp_opening_hours commune_de_paris_cdp_Page_id_451408ce_fk_commune_d; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_opening_hours
    ADD CONSTRAINT "commune_de_paris_cdp_Page_id_451408ce_fk_commune_d" FOREIGN KEY ("Page_id") REFERENCES public.commune_de_paris_cdp_page(page_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: commune_de_paris_cdp_tickets commune_de_paris_cdp_Page_id_6ab1e327_fk_commune_d; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_tickets
    ADD CONSTRAINT "commune_de_paris_cdp_Page_id_6ab1e327_fk_commune_d" FOREIGN KEY ("Page_id") REFERENCES public.commune_de_paris_cdp_page(page_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: commune_de_paris_cdp_childrenentertainment commune_de_paris_cdp_Page_id_7c399f05_fk_commune_d; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_childrenentertainment
    ADD CONSTRAINT "commune_de_paris_cdp_Page_id_7c399f05_fk_commune_d" FOREIGN KEY ("Page_id") REFERENCES public.commune_de_paris_cdp_page(page_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: commune_de_paris_cdp_bar commune_de_paris_cdp_Page_id_7c551a03_fk_commune_d; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_bar
    ADD CONSTRAINT "commune_de_paris_cdp_Page_id_7c551a03_fk_commune_d" FOREIGN KEY ("Page_id") REFERENCES public.commune_de_paris_cdp_page(page_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: commune_de_paris_cdp_transport commune_de_paris_cdp_Page_id_9fa24dbb_fk_commune_d; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_transport
    ADD CONSTRAINT "commune_de_paris_cdp_Page_id_9fa24dbb_fk_commune_d" FOREIGN KEY ("Page_id") REFERENCES public.commune_de_paris_cdp_page(page_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: commune_de_paris_cdp_map commune_de_paris_cdp_Page_id_a4dfab9e_fk_commune_d; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_map
    ADD CONSTRAINT "commune_de_paris_cdp_Page_id_a4dfab9e_fk_commune_d" FOREIGN KEY ("Page_id") REFERENCES public.commune_de_paris_cdp_page(page_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: commune_de_paris_cdp_images commune_de_paris_cdp_Page_id_b38c088a_fk_commune_d; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_images
    ADD CONSTRAINT "commune_de_paris_cdp_Page_id_b38c088a_fk_commune_d" FOREIGN KEY ("Page_id") REFERENCES public.commune_de_paris_cdp_page(page_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: commune_de_paris_cdp_audio_page commune_de_paris_cdp_audio_id_de98ae49_fk_commune_d; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_audio_page
    ADD CONSTRAINT commune_de_paris_cdp_audio_id_de98ae49_fk_commune_d FOREIGN KEY (audio_id) REFERENCES public.commune_de_paris_cdp_audios(audio_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: commune_de_paris_cdp_itinerary_color_scheme commune_de_paris_cdp_itinerary_id_356c21fe_fk_commune_d; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_itinerary_color_scheme
    ADD CONSTRAINT commune_de_paris_cdp_itinerary_id_356c21fe_fk_commune_d FOREIGN KEY (itinerary_id) REFERENCES public.commune_de_paris_cdp_itinerary(itinerary_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: commune_de_paris_cdp_burger_menu_ordering commune_de_paris_cdp_itinerary_id_451acd50_fk_commune_d; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_burger_menu_ordering
    ADD CONSTRAINT commune_de_paris_cdp_itinerary_id_451acd50_fk_commune_d FOREIGN KEY (itinerary_id) REFERENCES public.commune_de_paris_cdp_itinerary(itinerary_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: commune_de_paris_cdp_map_controls commune_de_paris_cdp_itinerary_id_7621b6e9_fk_commune_d; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_map_controls
    ADD CONSTRAINT commune_de_paris_cdp_itinerary_id_7621b6e9_fk_commune_d FOREIGN KEY (itinerary_id) REFERENCES public.commune_de_paris_cdp_itinerary(itinerary_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: commune_de_paris_cdp_menu commune_de_paris_cdp_itinerary_id_7e7c3d6b_fk_commune_d; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_menu
    ADD CONSTRAINT commune_de_paris_cdp_itinerary_id_7e7c3d6b_fk_commune_d FOREIGN KEY (itinerary_id) REFERENCES public.commune_de_paris_cdp_itinerary(itinerary_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: commune_de_paris_cdp_page commune_de_paris_cdp_itinerary_id_b01ae1ac_fk_commune_d; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_page
    ADD CONSTRAINT commune_de_paris_cdp_itinerary_id_b01ae1ac_fk_commune_d FOREIGN KEY (itinerary_id) REFERENCES public.commune_de_paris_cdp_itinerary(itinerary_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: commune_de_paris_cdp_map commune_de_paris_cdp_itinerary_id_d5a22f58_fk_commune_d; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_map
    ADD CONSTRAINT commune_de_paris_cdp_itinerary_id_d5a22f58_fk_commune_d FOREIGN KEY (itinerary_id) REFERENCES public.commune_de_paris_cdp_itinerary(itinerary_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: commune_de_paris_cdp_map commune_de_paris_cdp_map_images_id_ea0d0b1c_fk_commune_d; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_map
    ADD CONSTRAINT commune_de_paris_cdp_map_images_id_ea0d0b1c_fk_commune_d FOREIGN KEY (map_images_id) REFERENCES public.commune_de_paris_cdp_images(image_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: commune_de_paris_cdp_burger_menu_ordering commune_de_paris_cdp_menu_id_10f2238c_fk_commune_d; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_burger_menu_ordering
    ADD CONSTRAINT commune_de_paris_cdp_menu_id_10f2238c_fk_commune_d FOREIGN KEY (menu_id) REFERENCES public.commune_de_paris_cdp_menu(menu_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: commune_de_paris_cdp_menu commune_de_paris_cdp_menu_images_id_195cff18_fk_commune_d; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_menu
    ADD CONSTRAINT commune_de_paris_cdp_menu_images_id_195cff18_fk_commune_d FOREIGN KEY (menu_images_id) REFERENCES public.commune_de_paris_cdp_images(image_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: commune_de_paris_cdp_page_before_after_image_order commune_de_paris_cdp_page_description_id_57e1df48_fk_commune_d; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_page_before_after_image_order
    ADD CONSTRAINT commune_de_paris_cdp_page_description_id_57e1df48_fk_commune_d FOREIGN KEY (page_description_id) REFERENCES public.commune_de_paris_cdp_page_description("PD_id") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: commune_de_paris_cdp_page_image_order commune_de_paris_cdp_page_description_id_64ce0d5c_fk_commune_d; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_page_image_order
    ADD CONSTRAINT commune_de_paris_cdp_page_description_id_64ce0d5c_fk_commune_d FOREIGN KEY (page_description_id) REFERENCES public.commune_de_paris_cdp_page_description("PD_id") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: commune_de_paris_cdp_audio_page commune_de_paris_cdp_page_description_id_cfa18da7_fk_commune_d; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_audio_page
    ADD CONSTRAINT commune_de_paris_cdp_page_description_id_cfa18da7_fk_commune_d FOREIGN KEY (page_description_id) REFERENCES public.commune_de_paris_cdp_page_description("PD_id") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: commune_de_paris_cdp_page_description commune_de_paris_cdp_page_id_c8c0d8b4_fk_commune_d; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_page_description
    ADD CONSTRAINT commune_de_paris_cdp_page_id_c8c0d8b4_fk_commune_d FOREIGN KEY (page_id) REFERENCES public.commune_de_paris_cdp_page(page_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: commune_de_paris_cdp_page_before_after_image_order commune_de_paris_cdp_page_image_after_id_a5b57b92_fk_commune_d; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_page_before_after_image_order
    ADD CONSTRAINT commune_de_paris_cdp_page_image_after_id_a5b57b92_fk_commune_d FOREIGN KEY (page_image_after_id) REFERENCES public.commune_de_paris_cdp_images(image_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: commune_de_paris_cdp_page_before_after_image_order commune_de_paris_cdp_page_image_before_id_b5d851ad_fk_commune_d; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_page_before_after_image_order
    ADD CONSTRAINT commune_de_paris_cdp_page_image_before_id_b5d851ad_fk_commune_d FOREIGN KEY (page_image_before_id) REFERENCES public.commune_de_paris_cdp_images(image_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: commune_de_paris_cdp_page_image_order commune_de_paris_cdp_page_image_id_dd895281_fk_commune_d; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_page_image_order
    ADD CONSTRAINT commune_de_paris_cdp_page_image_id_dd895281_fk_commune_d FOREIGN KEY (page_image_id) REFERENCES public.commune_de_paris_cdp_images(image_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: commune_de_paris_cdp_page_description commune_de_paris_cdp_page_map_id_4037b015_fk_commune_d; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_page_description
    ADD CONSTRAINT commune_de_paris_cdp_page_map_id_4037b015_fk_commune_d FOREIGN KEY (page_map_id) REFERENCES public.commune_de_paris_cdp_map(page_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: commune_de_paris_cdp_page_description commune_de_paris_cdp_page_title_image_id_ccbf5d73_fk_commune_d; Type: FK CONSTRAINT; Schema: public; Owner: lionhart
--

ALTER TABLE ONLY public.commune_de_paris_cdp_page_description
    ADD CONSTRAINT commune_de_paris_cdp_page_title_image_id_ccbf5d73_fk_commune_d FOREIGN KEY (page_title_image_id) REFERENCES public.commune_de_paris_cdp_images(image_id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

