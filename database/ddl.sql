--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.5
-- Dumped by pg_dump version 9.5.5

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
-- Name: abono_factura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE abono_factura (
    id integer NOT NULL,
    factura_id integer NOT NULL,
    movimiento_contable_id integer NOT NULL,
    valor numeric(10,2) NOT NULL
);


ALTER TABLE abono_factura OWNER TO globalremises;

--
-- Name: abono_factura_compra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE abono_factura_compra (
    id integer NOT NULL,
    factura_compra_id integer,
    movimiento_contable_id integer,
    valor numeric(10,2)
);


ALTER TABLE abono_factura_compra OWNER TO globalremises;

--
-- Name: abono_factura_compra_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE abono_factura_compra_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE abono_factura_compra_id_seq OWNER TO globalremises;

--
-- Name: abono_factura_compra_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE abono_factura_compra_id_seq OWNED BY abono_factura_compra.id;


--
-- Name: abono_factura_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE abono_factura_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE abono_factura_id_seq OWNER TO globalremises;

--
-- Name: abono_factura_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE abono_factura_id_seq OWNED BY abono_factura.id;


--
-- Name: abono_reserva; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE abono_reserva (
    id integer NOT NULL,
    reserva_id integer NOT NULL,
    mov_contable_id integer NOT NULL,
    fecha timestamp without time zone,
    valor numeric(10,2),
    trm numeric(10,2),
    moneda character varying(5),
    anulado boolean,
    usuario_anulacion_id integer,
    usuario_creacion_id integer,
    ctrl_fecha_creacion timestamp without time zone NOT NULL,
    ctrl_fecha_anulacion timestamp without time zone
);


ALTER TABLE abono_reserva OWNER TO globalremises;

--
-- Name: abono_reserva_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE abono_reserva_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE abono_reserva_id_seq OWNER TO globalremises;

--
-- Name: abono_reserva_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE abono_reserva_id_seq OWNED BY abono_reserva.id;


--
-- Name: ajuste; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ajuste (
    id integer NOT NULL,
    nombre character varying(20)
);


ALTER TABLE ajuste OWNER TO globalremises;

--
-- Name: ajuste_h; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ajuste_h (
    id integer NOT NULL,
    hora_inicio timestamp without time zone NOT NULL,
    hora_fin timestamp without time zone,
    porcentaje numeric(10,2),
    ajuste_id integer NOT NULL
);


ALTER TABLE ajuste_h OWNER TO globalremises;

--
-- Name: ajuste_h_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ajuste_h_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ajuste_h_id_seq OWNER TO globalremises;

--
-- Name: ajuste_h_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ajuste_h_id_seq OWNED BY ajuste_h.id;


--
-- Name: ajuste_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ajuste_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ajuste_id_seq OWNER TO globalremises;

--
-- Name: ajuste_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ajuste_id_seq OWNED BY ajuste.id;


--
-- Name: alerta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE alerta (
    id integer NOT NULL,
    descripcion text,
    asunto character varying(30),
    reserva_id integer,
    usuario_generacion_id integer NOT NULL,
    codigo character varying(30) NOT NULL,
    fecha_generacion timestamp without time zone,
    estado character varying(20),
    usuario_aprobacion_id integer,
    fecha_aprobacion timestamp without time zone,
    prioridad integer
);


ALTER TABLE alerta OWNER TO globalremises;

--
-- Name: alerta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE alerta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alerta_id_seq OWNER TO globalremises;

--
-- Name: alerta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE alerta_id_seq OWNED BY alerta.id;


--
-- Name: cancelacion_servicio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cancelacion_servicio (
    id integer NOT NULL,
    fecha timestamp without time zone NOT NULL,
    comentario text,
    obsequio boolean,
    aprobado boolean,
    cancelacion_tarde boolean,
    usuario_cancelacion_id integer,
    usuario_aprobacion_id integer,
    servicio_id integer,
    minutos_facturar integer
);


ALTER TABLE cancelacion_servicio OWNER TO globalremises;

--
-- Name: cancelacion_servicio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cancelacion_servicio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cancelacion_servicio_id_seq OWNER TO globalremises;

--
-- Name: cancelacion_servicio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cancelacion_servicio_id_seq OWNED BY cancelacion_servicio.id;


--
-- Name: categoria_vehiculo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE categoria_vehiculo (
    id integer NOT NULL,
    nombre character varying(20) NOT NULL,
    descripcion text,
    incluye_protocolo boolean,
    nivel_servicio_id integer,
    calendario character varying(250),
    activo boolean
);


ALTER TABLE categoria_vehiculo OWNER TO globalremises;

--
-- Name: categoria_vehiculo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE categoria_vehiculo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE categoria_vehiculo_id_seq OWNER TO globalremises;

--
-- Name: categoria_vehiculo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE categoria_vehiculo_id_seq OWNED BY categoria_vehiculo.id;


--
-- Name: celular; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE celular (
    id integer NOT NULL,
    nombre character varying(20) NOT NULL,
    descripcion character varying(50) NOT NULL,
    numero character varying(20) NOT NULL,
    imei character varying(30) NOT NULL,
    marca character varying(20) NOT NULL,
    tipo character varying(20) NOT NULL,
    ciudad_id integer NOT NULL,
    activo boolean
);


ALTER TABLE celular OWNER TO globalremises;

--
-- Name: celular_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE celular_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE celular_id_seq OWNER TO globalremises;

--
-- Name: celular_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE celular_id_seq OWNED BY celular.id;


--
-- Name: ciudad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ciudad (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    activo boolean,
    duracion_traslado integer,
    pais_id integer,
    departamento_id integer,
    defecto boolean
);


ALTER TABLE ciudad OWNER TO globalremises;

--
-- Name: ciudad_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ciudad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ciudad_id_seq OWNER TO globalremises;

--
-- Name: ciudad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ciudad_id_seq OWNED BY ciudad.id;


--
-- Name: comisionado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE comisionado (
    id integer NOT NULL,
    tipo character varying(20) NOT NULL,
    tercero_id_cliente integer NOT NULL,
    porcentaje_gestion numeric(10,2) NOT NULL,
    porcentaje_ventas numeric(10,2) NOT NULL,
    cof_vehiculo_externo numeric(10,2) NOT NULL,
    activo boolean NOT NULL,
    tercero_id_comisionado integer
);


ALTER TABLE comisionado OWNER TO globalremises;

--
-- Name: comisionado_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE comisionado_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE comisionado_id_seq OWNER TO globalremises;

--
-- Name: comisionado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE comisionado_id_seq OWNED BY comisionado.id;


--
-- Name: comisionado_servicio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE comisionado_servicio (
    id integer NOT NULL,
    tercero_id integer,
    tipo_comision_id integer,
    valor real,
    servicio_id integer
);


ALTER TABLE comisionado_servicio OWNER TO globalremises;

--
-- Name: comisionado_servicio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE comisionado_servicio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE comisionado_servicio_id_seq OWNER TO globalremises;

--
-- Name: comisionado_servicio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE comisionado_servicio_id_seq OWNED BY comisionado_servicio.id;


--
-- Name: comisionado_tipo_comision; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE comisionado_tipo_comision (
    id integer NOT NULL,
    comisionado_id integer,
    tipo_comision_id integer
);


ALTER TABLE comisionado_tipo_comision OWNER TO globalremises;

--
-- Name: comisionado_tipo_comision_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE comisionado_tipo_comision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE comisionado_tipo_comision_id_seq OWNER TO globalremises;

--
-- Name: comisionado_tipo_comision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE comisionado_tipo_comision_id_seq OWNED BY comisionado_tipo_comision.id;


--
-- Name: conf; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE conf (
    id integer NOT NULL,
    nombre character varying(20) NOT NULL,
    valor character varying(50) NOT NULL
);


ALTER TABLE conf OWNER TO globalremises;

--
-- Name: conf_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE conf_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE conf_id_seq OWNER TO globalremises;

--
-- Name: conf_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE conf_id_seq OWNED BY conf.id;


--
-- Name: contacto_tercero; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE contacto_tercero (
    id integer NOT NULL,
    tercero_id_cliente integer NOT NULL,
    tipo character varying(20) NOT NULL,
    tercero_id_contacto integer
);


ALTER TABLE contacto_tercero OWNER TO globalremises;

--
-- Name: contacto_tercero_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE contacto_tercero_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE contacto_tercero_id_seq OWNER TO globalremises;

--
-- Name: contacto_tercero_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE contacto_tercero_id_seq OWNED BY contacto_tercero.id;


--
-- Name: contacto_tipo_contacto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE contacto_tipo_contacto (
    id integer NOT NULL,
    contacto_id integer,
    tipo_contacto_id integer
);


ALTER TABLE contacto_tipo_contacto OWNER TO globalremises;

--
-- Name: contacto_tipo_contacto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE contacto_tipo_contacto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE contacto_tipo_contacto_id_seq OWNER TO globalremises;

--
-- Name: contacto_tipo_contacto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE contacto_tipo_contacto_id_seq OWNED BY contacto_tipo_contacto.id;


--
-- Name: datos_cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE datos_cliente (
    id integer NOT NULL,
    tarifa_id integer,
    tercero_id integer,
    entregar_hm boolean,
    firmar_hm boolean,
    gastos_adicionales boolean,
    facturar_pasajero boolean,
    codigo character varying(10),
    ins_defecto_dispatch text,
    ins_defecto text,
    plazo_pago_dias integer,
    cond_comerciales text,
    forma_pago_id integer,
    plazo_cancelacion_horas integer,
    referencia_obligatoria boolean,
    usa_letrero_propio boolean,
    usuario_id integer,
    letrero_id integer,
    reteica numeric(10,2),
    retefuente numeric(10,2),
    reteiva numeric(10,2),
    en_cuenta boolean
);


ALTER TABLE datos_cliente OWNER TO globalremises;

--
-- Name: datos_cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE datos_cliente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE datos_cliente_id_seq OWNER TO globalremises;

--
-- Name: datos_cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE datos_cliente_id_seq OWNED BY datos_cliente.id;


--
-- Name: departamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE departamento (
    id integer NOT NULL,
    nombre character varying(50),
    pais_id integer
);


ALTER TABLE departamento OWNER TO globalremises;

--
-- Name: departamento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE departamento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE departamento_id_seq OWNER TO globalremises;

--
-- Name: departamento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE departamento_id_seq OWNED BY departamento.id;


--
-- Name: descuento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE descuento (
    id integer NOT NULL,
    cliente_id integer,
    tipo_servicio_id integer,
    valor numeric(10,2),
    activo boolean
);


ALTER TABLE descuento OWNER TO globalremises;

--
-- Name: descuento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE descuento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE descuento_id_seq OWNER TO globalremises;

--
-- Name: descuento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE descuento_id_seq OWNED BY descuento.id;


--
-- Name: detalle_factura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE detalle_factura (
    id integer NOT NULL,
    base_comisionable numeric(10,2),
    cantidad integer NOT NULL,
    descripcion text NOT NULL,
    factura_id integer NOT NULL,
    precio_unitario numeric(10,2) NOT NULL,
    referencia character varying(50) NOT NULL,
    servicio_id integer NOT NULL,
    valor_total numeric(10,2) NOT NULL
);


ALTER TABLE detalle_factura OWNER TO globalremises;

--
-- Name: detalle_factura_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE detalle_factura_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE detalle_factura_id_seq OWNER TO globalremises;

--
-- Name: detalle_factura_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE detalle_factura_id_seq OWNED BY detalle_factura.id;


--
-- Name: detalle_pago; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE detalle_pago (
    id integer NOT NULL,
    factura_compra_id integer NOT NULL,
    servicio_vehiculo_id integer,
    servicio_personal_id integer NOT NULL,
    comisionado_servicio_id integer,
    tipo_servicio character varying(20) NOT NULL,
    valor real NOT NULL,
    reteica real,
    retefuente real
);


ALTER TABLE detalle_pago OWNER TO globalremises;

--
-- Name: detalle_pago_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE detalle_pago_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE detalle_pago_id_seq OWNER TO globalremises;

--
-- Name: detalle_pago_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE detalle_pago_id_seq OWNED BY detalle_pago.id;


--
-- Name: entidad_facturacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE entidad_facturacion (
    id integer NOT NULL,
    tercero_id_cliente integer NOT NULL,
    tercero_id_entidad_facturacion integer NOT NULL
);


ALTER TABLE entidad_facturacion OWNER TO globalremises;

--
-- Name: entidad_facturacion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE entidad_facturacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE entidad_facturacion_id_seq OWNER TO globalremises;

--
-- Name: entidad_facturacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE entidad_facturacion_id_seq OWNED BY entidad_facturacion.id;


--
-- Name: estado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE estado (
    id integer NOT NULL,
    nombre character varying(20),
    descripcion text,
    inicial boolean
);


ALTER TABLE estado OWNER TO globalremises;

--
-- Name: estado_servicio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE estado_servicio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE estado_servicio_id_seq OWNER TO globalremises;

--
-- Name: estado_servicio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE estado_servicio_id_seq OWNED BY estado.id;


--
-- Name: evento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE evento (
    id integer NOT NULL,
    referencia character varying(100) NOT NULL
);


ALTER TABLE evento OWNER TO globalremises;

--
-- Name: evento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE evento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE evento_id_seq OWNER TO globalremises;

--
-- Name: evento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE evento_id_seq OWNED BY evento.id;


--
-- Name: factura_compra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE factura_compra (
    id integer NOT NULL,
    fecha timestamp without time zone NOT NULL,
    tercero_id integer NOT NULL,
    referencia character varying(50),
    movimiento_contable_id integer
);


ALTER TABLE factura_compra OWNER TO globalremises;

--
-- Name: factura_compra_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE factura_compra_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE factura_compra_id_seq OWNER TO globalremises;

--
-- Name: factura_compra_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE factura_compra_id_seq OWNED BY factura_compra.id;


--
-- Name: factura_venta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE factura_venta (
    id integer NOT NULL,
    numero_factura character varying(50),
    tercero_id integer,
    nombre_cliente character varying(50),
    motivo_obsequio character varying(150),
    valor_obsequio numeric(10,2),
    iva_obsequio numeric(10,2),
    subtotal numeric(10,2) NOT NULL,
    iva numeric(10,2) NOT NULL,
    pagado boolean NOT NULL,
    trm numeric(10,2),
    observaciones text,
    fecha timestamp without time zone,
    vencimiento timestamp without time zone,
    moneda_id integer,
    direccion_cliente character varying(50),
    cedula_cliente character varying(50),
    telefono_cliente character varying(50),
    anulada boolean,
    finalizada boolean
);


ALTER TABLE factura_venta OWNER TO globalremises;

--
-- Name: factura_venta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE factura_venta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE factura_venta_id_seq OWNER TO globalremises;

--
-- Name: factura_venta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE factura_venta_id_seq OWNED BY factura_venta.id;


--
-- Name: forma_pago; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE forma_pago (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion character varying(50),
    codigo character varying(2),
    activo boolean
);


ALTER TABLE forma_pago OWNER TO globalremises;

--
-- Name: forma_pago_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE forma_pago_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE forma_pago_id_seq OWNER TO globalremises;

--
-- Name: forma_pago_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE forma_pago_id_seq OWNED BY forma_pago.id;


--
-- Name: gasto_gasolina; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE gasto_gasolina (
    id integer NOT NULL,
    fecha_hora timestamp without time zone,
    volumen numeric(10,2),
    valor numeric(10,2),
    km numeric(10,2),
    moneda character varying(5),
    tercero_tipo_proveedor_id integer,
    servicio_id integer,
    vehiculo_id integer,
    numero_ticket character varying(50)
);


ALTER TABLE gasto_gasolina OWNER TO globalremises;

--
-- Name: gasto_gasolina_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE gasto_gasolina_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE gasto_gasolina_id_seq OWNER TO globalremises;

--
-- Name: gasto_gasolina_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE gasto_gasolina_id_seq OWNED BY gasto_gasolina.id;


--
-- Name: gastos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE gastos (
    id integer NOT NULL,
    hoja_mision_id integer,
    tipo_gasto_id integer,
    valor_con_iva real,
    moneda_id integer,
    referencia character varying(100),
    iva real,
    comentario character varying(200)
);


ALTER TABLE gastos OWNER TO globalremises;

--
-- Name: gastos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE gastos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE gastos_id_seq OWNER TO globalremises;

--
-- Name: gastos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE gastos_id_seq OWNED BY gastos.id;


--
-- Name: grupo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE grupo (
    id integer NOT NULL,
    nombre character varying(50)
);


ALTER TABLE grupo OWNER TO globalremises;

--
-- Name: grupo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE grupo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE grupo_id_seq OWNER TO globalremises;

--
-- Name: grupo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE grupo_id_seq OWNED BY grupo.id;


--
-- Name: grupo_privilegio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE grupo_privilegio (
    id integer NOT NULL,
    grupo_id integer,
    privilegio_id integer
);


ALTER TABLE grupo_privilegio OWNER TO globalremises;

--
-- Name: grupo_privilegio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE grupo_privilegio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE grupo_privilegio_id_seq OWNER TO globalremises;

--
-- Name: grupo_privilegio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE grupo_privilegio_id_seq OWNED BY grupo_privilegio.id;


--
-- Name: grupo_usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE grupo_usuario (
    id integer NOT NULL,
    usuario_id integer,
    grupo_id integer
);


ALTER TABLE grupo_usuario OWNER TO globalremises;

--
-- Name: grupo_usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE grupo_usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE grupo_usuario_id_seq OWNER TO globalremises;

--
-- Name: grupo_usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE grupo_usuario_id_seq OWNED BY grupo_usuario.id;


--
-- Name: historial_mision; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE historial_mision (
    id integer NOT NULL,
    asunto character varying(50) NOT NULL,
    hora timestamp without time zone NOT NULL,
    descripcion character varying(50),
    hoja_mision_id integer NOT NULL
);


ALTER TABLE historial_mision OWNER TO globalremises;

--
-- Name: historial_mision_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE historial_mision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE historial_mision_id_seq OWNER TO globalremises;

--
-- Name: historial_mision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE historial_mision_id_seq OWNED BY historial_mision.id;


--
-- Name: hoja_mision; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE hoja_mision (
    id integer NOT NULL,
    servicio_id integer,
    fecha_hora_regreso_bodega timestamp without time zone,
    fecha_hora_descarga_cliente timestamp without time zone,
    hora_abordaje_cliente timestamp without time zone,
    no_show boolean,
    km_inicial bigint,
    km_final bigint,
    vehiculo_limpio_salida boolean,
    vehiculos_limpio_regreso boolean,
    sin_nuevos_danos_salida boolean,
    sin_nuevos_danos_regreso boolean,
    minutos_obsequiados integer,
    km_obsequiados bigint,
    comentarios text,
    event_id character varying(100)
);


ALTER TABLE hoja_mision OWNER TO globalremises;

--
-- Name: hoja_mision_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hoja_mision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hoja_mision_id_seq OWNER TO globalremises;

--
-- Name: hoja_mision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE hoja_mision_id_seq OWNED BY hoja_mision.id;


--
-- Name: idioma; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE idioma (
    id integer NOT NULL,
    nombre character varying(50),
    activo boolean
);


ALTER TABLE idioma OWNER TO globalremises;

--
-- Name: idioma_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE idioma_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE idioma_id_seq OWNER TO globalremises;

--
-- Name: idioma_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE idioma_id_seq OWNED BY idioma.id;


--
-- Name: idioma_tercero; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE idioma_tercero (
    id integer NOT NULL,
    tercero_id integer NOT NULL,
    idioma_id integer NOT NULL,
    defecto boolean
);


ALTER TABLE idioma_tercero OWNER TO globalremises;

--
-- Name: idioma_tercero_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE idioma_tercero_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE idioma_tercero_id_seq OWNER TO globalremises;

--
-- Name: idioma_tercero_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE idioma_tercero_id_seq OWNED BY idioma_tercero.id;


--
-- Name: instruccion_recogida; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE instruccion_recogida (
    id integer NOT NULL,
    nombre character varying(50),
    descripcion text,
    lugar_id integer,
    idioma_id integer,
    prioridad integer
);


ALTER TABLE instruccion_recogida OWNER TO globalremises;

--
-- Name: instruccion_recogida_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE instruccion_recogida_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE instruccion_recogida_id_seq OWNER TO globalremises;

--
-- Name: instruccion_recogida_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE instruccion_recogida_id_seq OWNED BY instruccion_recogida.id;


--
-- Name: letrero; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE letrero (
    id integer NOT NULL,
    nombre character varying(50),
    logo1_id integer,
    logo2_id integer,
    activo boolean
);


ALTER TABLE letrero OWNER TO globalremises;

--
-- Name: letrero_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE letrero_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE letrero_id_seq OWNER TO globalremises;

--
-- Name: letrero_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE letrero_id_seq OWNED BY letrero.id;


--
-- Name: lugar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE lugar (
    id integer NOT NULL,
    descripcion character varying(50),
    direccion text,
    nombre_contacto character varying(50),
    telefono character varying(50),
    celular character varying(50),
    email character varying(50),
    web character varying(50),
    persona_id integer,
    hora_traslado real,
    tipo_lugar_id integer,
    ciudad_id integer,
    iata character varying(3),
    activo boolean
);


ALTER TABLE lugar OWNER TO globalremises;

--
-- Name: lugar_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE lugar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lugar_id_seq OWNER TO globalremises;

--
-- Name: lugar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE lugar_id_seq OWNED BY lugar.id;


--
-- Name: marca_vehiculo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE marca_vehiculo (
    id integer NOT NULL,
    nombre character varying(20) NOT NULL,
    descripcion text,
    activo boolean
);


ALTER TABLE marca_vehiculo OWNER TO globalremises;

--
-- Name: marca_vehiculo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE marca_vehiculo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE marca_vehiculo_id_seq OWNER TO globalremises;

--
-- Name: marca_vehiculo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE marca_vehiculo_id_seq OWNED BY marca_vehiculo.id;


--
-- Name: media; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE media (
    id integer NOT NULL,
    ruta character varying(50),
    nombre character varying(50),
    descripcion text
);


ALTER TABLE media OWNER TO globalremises;

--
-- Name: media_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE media_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE media_id_seq OWNER TO globalremises;

--
-- Name: media_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE media_id_seq OWNED BY media.id;


--
-- Name: modelo_email; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE modelo_email (
    id integer NOT NULL,
    nombre character varying(50),
    contenido text,
    asunto character varying(50),
    reserva_cp boolean,
    reserva_sp boolean,
    letrero boolean,
    ubicacion character varying(1)
);


ALTER TABLE modelo_email OWNER TO globalremises;

--
-- Name: modelo_email_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE modelo_email_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE modelo_email_id_seq OWNER TO globalremises;

--
-- Name: modelo_email_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE modelo_email_id_seq OWNED BY modelo_email.id;


--
-- Name: modelo_vehiculo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE modelo_vehiculo (
    id integer NOT NULL,
    nombre character varying(20) NOT NULL,
    descripcion text,
    marca_vehiculo_id integer NOT NULL
);


ALTER TABLE modelo_vehiculo OWNER TO globalremises;

--
-- Name: modelo_vehiculo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE modelo_vehiculo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE modelo_vehiculo_id_seq OWNER TO globalremises;

--
-- Name: modelo_vehiculo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE modelo_vehiculo_id_seq OWNED BY modelo_vehiculo.id;


--
-- Name: moneda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE moneda (
    id integer NOT NULL,
    nombre character varying(50),
    iso character varying(5),
    formato character varying(50),
    simbolo character varying(4),
    defecto boolean,
    decimales integer,
    activo boolean
);


ALTER TABLE moneda OWNER TO globalremises;

--
-- Name: moneda_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE moneda_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE moneda_id_seq OWNER TO globalremises;

--
-- Name: moneda_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE moneda_id_seq OWNED BY moneda.id;


--
-- Name: movimiento_contable; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE movimiento_contable (
    id integer NOT NULL,
    tercero_id integer NOT NULL,
    tipo_movimiento_id integer NOT NULL,
    valor_sin_iva real,
    fecha timestamp without time zone,
    moneda_id integer,
    numero_movimiento character varying(50),
    ciudad_id integer,
    iva real,
    porceiva real,
    valor_reteica real,
    valor_retefuente real,
    valor_otrosrete real,
    forma_pago_id integer,
    referencia_forma_pago character varying(50),
    descripcion text,
    categoria_movimiento character varying(2),
    anulado boolean,
    usuario_anulacion_id integer,
    trm real,
    nombre_tercero character varying(50),
    tipo_documento_tercero character varying(50),
    numero_documento_tercero character varying(50),
    direccion_tercero character varying(50),
    telefono_tercero character varying(50)
);


ALTER TABLE movimiento_contable OWNER TO globalremises;

--
-- Name: movimiento_contable_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE movimiento_contable_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE movimiento_contable_id_seq OWNER TO globalremises;

--
-- Name: movimiento_contable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE movimiento_contable_id_seq OWNED BY movimiento_contable.id;


--
-- Name: nivel_servicio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE nivel_servicio (
    id integer NOT NULL,
    nombre character varying(20),
    descripcion text,
    activo boolean,
    defecto boolean
);


ALTER TABLE nivel_servicio OWNER TO globalremises;

--
-- Name: nivel_servicio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE nivel_servicio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE nivel_servicio_id_seq OWNER TO globalremises;

--
-- Name: nivel_servicio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE nivel_servicio_id_seq OWNED BY nivel_servicio.id;


--
-- Name: pais; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pais (
    id integer NOT NULL,
    iso2 character varying(10),
    iso3 character varying(10),
    prefijo character varying(10),
    nombre character varying(50) NOT NULL,
    continente character varying(50),
    subcontinente character varying(50),
    iso_moneda character varying(5),
    nombre_moneda text
);


ALTER TABLE pais OWNER TO globalremises;

--
-- Name: pais_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pais_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pais_id_seq OWNER TO globalremises;

--
-- Name: pais_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pais_id_seq OWNED BY pais.id;


--
-- Name: pasajeros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pasajeros (
    id integer NOT NULL,
    pasajero_principal boolean,
    nombre character varying(50),
    iden character varying(50),
    servicio_id integer,
    tercero_id integer,
    telefono_pasajero character varying(50)
);


ALTER TABLE pasajeros OWNER TO globalremises;

--
-- Name: pasajeros_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pasajeros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pasajeros_id_seq OWNER TO globalremises;

--
-- Name: pasajeros_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pasajeros_id_seq OWNED BY pasajeros.id;


--
-- Name: personal_tipo_proveedor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE personal_tipo_proveedor (
    id integer NOT NULL,
    tercero_tipo_proveedor_id integer NOT NULL,
    tercero_id integer NOT NULL,
    activo boolean,
    opcional boolean,
    tarifa_id integer,
    notas text
);


ALTER TABLE personal_tipo_proveedor OWNER TO globalremises;

--
-- Name: personal_tipo_proveedor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE personal_tipo_proveedor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE personal_tipo_proveedor_id_seq OWNER TO globalremises;

--
-- Name: personal_tipo_proveedor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE personal_tipo_proveedor_id_seq OWNED BY personal_tipo_proveedor.id;


--
-- Name: privilegios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE privilegios (
    id integer NOT NULL,
    nombre character varying(50)
);


ALTER TABLE privilegios OWNER TO globalremises;

--
-- Name: privilegios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE privilegios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE privilegios_id_seq OWNER TO globalremises;

--
-- Name: privilegios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE privilegios_id_seq OWNED BY privilegios.id;


--
-- Name: relacion_estado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE relacion_estado (
    id integer NOT NULL,
    estado_padre_id integer NOT NULL,
    estado_hijo_id integer NOT NULL
);


ALTER TABLE relacion_estado OWNER TO globalremises;

--
-- Name: relacion_estado_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE relacion_estado_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE relacion_estado_id_seq OWNER TO globalremises;

--
-- Name: relacion_estado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE relacion_estado_id_seq OWNED BY relacion_estado.id;


--
-- Name: reserva; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE reserva (
    id integer NOT NULL,
    numero_reserva character varying(30),
    tercero_id integer,
    fecha_creacion timestamp without time zone NOT NULL,
    usuario_creacion_id integer NOT NULL,
    tarifa_id integer NOT NULL
);


ALTER TABLE reserva OWNER TO globalremises;

--
-- Name: COLUMN reserva.tercero_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN reserva.tercero_id IS 'este el id del cliente';


--
-- Name: reserva_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reserva_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reserva_id_seq OWNER TO globalremises;

--
-- Name: reserva_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reserva_id_seq OWNED BY reserva.id;


--
-- Name: servicio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE servicio (
    id integer NOT NULL,
    fecha_hora_inicio timestamp without time zone NOT NULL,
    duracion_inicial_minutos integer,
    vehiculo_id integer,
    categoria_vehiculo_id integer,
    tipo_operacion_id integer NOT NULL,
    cantidad_pasajeros integer,
    cantidad_equipaje integer,
    letrero character varying(50),
    direccion_recogida text,
    direccion_destino text,
    instrucciones_mision text,
    numero_vuelo_recogida character varying(50),
    numero_vuelo_destino character varying(50),
    clave_seguridad character varying(5),
    lugar_recogida_id integer,
    lugar_destino_id integer,
    instrucciones_recogida text,
    descuento real,
    cargo_inicial real,
    cargo_hora_adicional real,
    km_incluidos_en_cargo_inicial integer,
    km_incluidos_por_hora_adicional integer,
    fraccion_facturable_minutos integer,
    cargo_inicial_manual real,
    cargo_hora_adicional_manual real,
    km_incluidos_ci_manual integer,
    km_incluidos_ha_manual integer,
    descuento_manual real,
    referencia character varying(50),
    entregar_hm boolean,
    firmar_hm boolean,
    gastos_adicionales boolean,
    facturar_pasajero boolean,
    usuario_confirmacion_id integer,
    fecha_confirmacion timestamp without time zone,
    evento_id integer,
    entidad_facturacion_id integer,
    reagendar boolean,
    instruciones_dispatch text,
    contacto_id integer,
    reserva_id integer NOT NULL,
    ciudad_id integer NOT NULL,
    nivel_servicio_id integer NOT NULL
);


ALTER TABLE servicio OWNER TO globalremises;

--
-- Name: servicio_estado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE servicio_estado (
    id integer NOT NULL,
    servicio_id integer NOT NULL,
    estado_id integer NOT NULL,
    actual boolean
);


ALTER TABLE servicio_estado OWNER TO globalremises;

--
-- Name: servicio_estado_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE servicio_estado_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE servicio_estado_id_seq OWNER TO globalremises;

--
-- Name: servicio_estado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE servicio_estado_id_seq OWNED BY servicio_estado.id;


--
-- Name: servicio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE servicio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE servicio_id_seq OWNER TO globalremises;

--
-- Name: servicio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE servicio_id_seq OWNED BY servicio.id;


--
-- Name: servicio_personal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE servicio_personal (
    id integer NOT NULL,
    personal_tipo_proveedor_id integer NOT NULL,
    servicio_id integer NOT NULL,
    valor real,
    instrucciones text,
    celular_id integer,
    celular_manual character varying(20),
    hora_salida timestamp without time zone,
    hora_regreso timestamp without time zone,
    estado_confirmacion character varying(2),
    pagar_cancelacion boolean,
    valor_cotizado real,
    valor_cotizado_manual real,
    hecho boolean
);


ALTER TABLE servicio_personal OWNER TO globalremises;

--
-- Name: servicio_personal_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE servicio_personal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE servicio_personal_id_seq OWNER TO globalremises;

--
-- Name: servicio_personal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE servicio_personal_id_seq OWNED BY servicio_personal.id;


--
-- Name: servicio_vehiculo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE servicio_vehiculo (
    id integer NOT NULL,
    vehiculo_id integer,
    servicio_id integer,
    valor real,
    instrucciones text,
    celular character varying(50)
);


ALTER TABLE servicio_vehiculo OWNER TO globalremises;

--
-- Name: servicio_vehiculo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE servicio_vehiculo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE servicio_vehiculo_id_seq OWNER TO globalremises;

--
-- Name: servicio_vehiculo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE servicio_vehiculo_id_seq OWNED BY servicio_vehiculo.id;


--
-- Name: tarifa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tarifa (
    id integer NOT NULL,
    nombre character varying(50),
    iva_incluido boolean,
    trm real,
    activo boolean,
    defecto boolean,
    tipo_tarifa character varying(1),
    moneda_id integer,
    tipo_tarifa_id integer
);


ALTER TABLE tarifa OWNER TO globalremises;

--
-- Name: tarifa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tarifa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tarifa_id_seq OWNER TO globalremises;

--
-- Name: tarifa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tarifa_id_seq OWNED BY tarifa.id;


--
-- Name: tasa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tasa (
    id integer NOT NULL,
    nombre character varying(30),
    descripcion text,
    activo boolean
);


ALTER TABLE tasa OWNER TO globalremises;

--
-- Name: tasa_cambio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tasa_cambio (
    id integer NOT NULL,
    fecha_inicio timestamp without time zone NOT NULL,
    fecha_final timestamp without time zone,
    valor numeric(10,2),
    moneda_1 character varying(5),
    moneda_2 character varying(5),
    tasa numeric(10,2)
);


ALTER TABLE tasa_cambio OWNER TO globalremises;

--
-- Name: tasa_cambio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tasa_cambio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tasa_cambio_id_seq OWNER TO globalremises;

--
-- Name: tasa_cambio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tasa_cambio_id_seq OWNED BY tasa_cambio.id;


--
-- Name: tasa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tasa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tasa_id_seq OWNER TO globalremises;

--
-- Name: tasa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tasa_id_seq OWNED BY tasa.id;


--
-- Name: tasa_servicio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tasa_servicio (
    id integer NOT NULL,
    servicio_id integer,
    tasa_valor_tarifa_id integer,
    valor_unitario real,
    cantidad real,
    cantidad_obsequiada real,
    valor_obsequiado real
);


ALTER TABLE tasa_servicio OWNER TO globalremises;

--
-- Name: tasa_servicio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tasa_servicio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tasa_servicio_id_seq OWNER TO globalremises;

--
-- Name: tasa_servicio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tasa_servicio_id_seq OWNED BY tasa_servicio.id;


--
-- Name: tasa_servicio_personal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tasa_servicio_personal (
    id integer NOT NULL,
    servicio_personal_id integer,
    tasa_valor_tarifa_id integer,
    valor_unitario real,
    cantidad integer
);


ALTER TABLE tasa_servicio_personal OWNER TO globalremises;

--
-- Name: tasa_servicio_personal_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tasa_servicio_personal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tasa_servicio_personal_id_seq OWNER TO globalremises;

--
-- Name: tasa_servicio_personal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tasa_servicio_personal_id_seq OWNED BY tasa_servicio_personal.id;


--
-- Name: tasa_valor_tarifa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tasa_valor_tarifa (
    id integer NOT NULL,
    valor_tarifa_id integer,
    tasa_id integer,
    reglas_aplicacion character varying(50),
    valor_unitario numeric(10,2)
);


ALTER TABLE tasa_valor_tarifa OWNER TO globalremises;

--
-- Name: tasa_valor_tarifa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tasa_valor_tarifa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tasa_valor_tarifa_id_seq OWNER TO globalremises;

--
-- Name: tasa_valor_tarifa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tasa_valor_tarifa_id_seq OWNED BY tasa_valor_tarifa.id;


--
-- Name: telefono_tercero; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE telefono_tercero (
    id integer NOT NULL,
    tercero_id integer,
    numero character varying(30),
    nombre character varying(50)
);


ALTER TABLE telefono_tercero OWNER TO globalremises;

--
-- Name: telefono_tercero_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE telefono_tercero_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE telefono_tercero_id_seq OWNER TO globalremises;

--
-- Name: telefono_tercero_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE telefono_tercero_id_seq OWNED BY telefono_tercero.id;


--
-- Name: tercero; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tercero (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    apellido character varying(50),
    tipo_documento_id integer NOT NULL,
    iden character varying(50) NOT NULL,
    direccion character varying(250),
    email character varying(50),
    facturable boolean,
    ciudad_id integer,
    tipo_tercero_id integer,
    razon_social character varying(50),
    moneda_id integer,
    imagen integer
);


ALTER TABLE tercero OWNER TO globalremises;

--
-- Name: tercero_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tercero_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tercero_id_seq OWNER TO globalremises;

--
-- Name: tercero_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tercero_id_seq OWNED BY tercero.id;


--
-- Name: tercero_tipo_proveedor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tercero_tipo_proveedor (
    id integer NOT NULL,
    tercero_id integer NOT NULL,
    tipo_proveedor_id integer NOT NULL,
    reteica numeric(10,2),
    retefuente numeric(10,2),
    iva numeric(10,2),
    tipo_contrato character varying(20),
    diplomas text,
    avisar_proveedor boolean,
    tarifa_id integer,
    modelo_email_id integer
);


ALTER TABLE tercero_tipo_proveedor OWNER TO globalremises;

--
-- Name: tercero_tipo_proveedor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tercero_tipo_proveedor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tercero_tipo_proveedor_id_seq OWNER TO globalremises;

--
-- Name: tercero_tipo_proveedor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tercero_tipo_proveedor_id_seq OWNED BY tercero_tipo_proveedor.id;


--
-- Name: tipo_comision; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tipo_comision (
    id integer NOT NULL,
    nombre character varying(50),
    descripcion character varying(50),
    activo boolean
);


ALTER TABLE tipo_comision OWNER TO globalremises;

--
-- Name: tipo_comision_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipo_comision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tipo_comision_id_seq OWNER TO globalremises;

--
-- Name: tipo_comision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipo_comision_id_seq OWNED BY tipo_comision.id;


--
-- Name: tipo_contacto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tipo_contacto (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion text,
    activo boolean
);


ALTER TABLE tipo_contacto OWNER TO globalremises;

--
-- Name: tipo_contacto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipo_contacto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tipo_contacto_id_seq OWNER TO globalremises;

--
-- Name: tipo_contacto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipo_contacto_id_seq OWNED BY tipo_contacto.id;


--
-- Name: tipo_documento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tipo_documento (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion text,
    activo boolean
);


ALTER TABLE tipo_documento OWNER TO globalremises;

--
-- Name: tipo_documento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipo_documento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tipo_documento_id_seq OWNER TO globalremises;

--
-- Name: tipo_documento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipo_documento_id_seq OWNED BY tipo_documento.id;


--
-- Name: tipo_gasto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tipo_gasto (
    id integer NOT NULL,
    nombre character varying(50),
    descripcion text,
    activo boolean
);


ALTER TABLE tipo_gasto OWNER TO globalremises;

--
-- Name: tipo_gasto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipo_gasto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tipo_gasto_id_seq OWNER TO globalremises;

--
-- Name: tipo_gasto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipo_gasto_id_seq OWNED BY tipo_gasto.id;


--
-- Name: tipo_lugar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tipo_lugar (
    id integer NOT NULL,
    nombre character varying(20) NOT NULL,
    descripcion text,
    activo boolean
);


ALTER TABLE tipo_lugar OWNER TO globalremises;

--
-- Name: tipo_lugar_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipo_lugar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tipo_lugar_id_seq OWNER TO globalremises;

--
-- Name: tipo_lugar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipo_lugar_id_seq OWNED BY tipo_lugar.id;


--
-- Name: tipo_movimiento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tipo_movimiento (
    id integer NOT NULL,
    descripcion text,
    nombre character varying(20),
    activo boolean
);


ALTER TABLE tipo_movimiento OWNER TO globalremises;

--
-- Name: tipo_movimiento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipo_movimiento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tipo_movimiento_id_seq OWNER TO globalremises;

--
-- Name: tipo_movimiento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipo_movimiento_id_seq OWNED BY tipo_movimiento.id;


--
-- Name: tipo_operacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tipo_operacion (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion text,
    activo boolean
);


ALTER TABLE tipo_operacion OWNER TO globalremises;

--
-- Name: tipo_operacion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipo_operacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tipo_operacion_id_seq OWNER TO globalremises;

--
-- Name: tipo_operacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipo_operacion_id_seq OWNED BY tipo_operacion.id;


--
-- Name: tipo_proveedor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tipo_proveedor (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion text NOT NULL,
    activo boolean
);


ALTER TABLE tipo_proveedor OWNER TO globalremises;

--
-- Name: tipo_proveedor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipo_proveedor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tipo_proveedor_id_seq OWNER TO globalremises;

--
-- Name: tipo_proveedor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipo_proveedor_id_seq OWNED BY tipo_proveedor.id;


--
-- Name: tipo_tarifa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tipo_tarifa (
    id integer NOT NULL,
    descripcion text,
    nombre character varying(20),
    activo boolean
);


ALTER TABLE tipo_tarifa OWNER TO globalremises;

--
-- Name: tipo_tarifa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipo_tarifa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tipo_tarifa_id_seq OWNER TO globalremises;

--
-- Name: tipo_tarifa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipo_tarifa_id_seq OWNED BY tipo_tarifa.id;


--
-- Name: tipo_tercero; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tipo_tercero (
    id integer NOT NULL,
    nombre character varying(50),
    codigo character varying(20),
    defecto boolean,
    activo boolean
);


ALTER TABLE tipo_tercero OWNER TO globalremises;

--
-- Name: tipo_tercero_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipo_tercero_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tipo_tercero_id_seq OWNER TO globalremises;

--
-- Name: tipo_tercero_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipo_tercero_id_seq OWNED BY tipo_tercero.id;


--
-- Name: ubicacion_email; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ubicacion_email (
    id integer NOT NULL,
    nombre character varying(20)
);


ALTER TABLE ubicacion_email OWNER TO globalremises;

--
-- Name: ubicacion_email_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ubicacion_email_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ubicacion_email_id_seq OWNER TO globalremises;

--
-- Name: ubicacion_email_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ubicacion_email_id_seq OWNED BY ubicacion_email.id;


--
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE usuario (
    id integer NOT NULL,
    login character varying(50) NOT NULL,
    password character varying(50) NOT NULL,
    activo boolean NOT NULL,
    tercero_id integer,
    ext_sip character varying(20)
);


ALTER TABLE usuario OWNER TO globalremises;

--
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usuario_id_seq OWNER TO globalremises;

--
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE usuario_id_seq OWNED BY usuario.id;


--
-- Name: valor_tarifa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE valor_tarifa (
    id integer NOT NULL,
    tarifa_id integer NOT NULL,
    categoria_vehiculo_id integer NOT NULL,
    ciudad_id integer,
    km_adicional numeric(10,2),
    minutos_espera integer,
    incluye_protocolo boolean,
    lugar_id integer,
    tipo_operacion_id integer,
    valor_hora numeric(10,2),
    valor_hora_adicional numeric(10,2),
    km_incluidos_por_hora integer,
    valor_km_adicional numeric(10,2),
    ajuste_id integer,
    nivel_servicio_id integer,
    minimo_minutos integer,
    minutos_traslado integer,
    valor_prima_transporte numeric(10,2)
);


ALTER TABLE valor_tarifa OWNER TO globalremises;

--
-- Name: valor_tarifa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE valor_tarifa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE valor_tarifa_id_seq OWNER TO globalremises;

--
-- Name: valor_tarifa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE valor_tarifa_id_seq OWNED BY valor_tarifa.id;


--
-- Name: vehiculo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE vehiculo (
    id integer NOT NULL,
    placa character varying(20),
    modelo_vehiculo_id integer,
    year integer,
    color character varying(10),
    categoria_vehiculo_id integer,
    km numeric(10,2),
    activo boolean,
    ciudad_id integer,
    vehiculo_interno integer,
    vehiculo_externo integer,
    conductor_id integer,
    imagen1 integer,
    imagen2 integer,
    imagen3 integer,
    tercero_tipo_proveedor_id integer,
    tarifa_id integer,
    proximo_mantenimiento timestamp without time zone,
    proximo_mantenimientos_km bigint,
    fecha_compra timestamp without time zone,
    fecha_venta timestamp without time zone,
    celular1_id integer,
    celular2_id integer
);


ALTER TABLE vehiculo OWNER TO globalremises;

--
-- Name: vehiculo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE vehiculo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vehiculo_id_seq OWNER TO globalremises;

--
-- Name: vehiculo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE vehiculo_id_seq OWNED BY vehiculo.id;


--
-- Name: vehiculo_tipo_servicio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE vehiculo_tipo_servicio (
    id integer NOT NULL,
    vehiculo_id integer NOT NULL,
    nivel_servicio_id integer NOT NULL
);


ALTER TABLE vehiculo_tipo_servicio OWNER TO globalremises;

--
-- Name: vehiculo_tipo_servicio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE vehiculo_tipo_servicio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vehiculo_tipo_servicio_id_seq OWNER TO globalremises;

--
-- Name: vehiculo_tipo_servicio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE vehiculo_tipo_servicio_id_seq OWNED BY vehiculo_tipo_servicio.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY abono_factura ALTER COLUMN id SET DEFAULT nextval('abono_factura_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY abono_factura_compra ALTER COLUMN id SET DEFAULT nextval('abono_factura_compra_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY abono_reserva ALTER COLUMN id SET DEFAULT nextval('abono_reserva_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ajuste ALTER COLUMN id SET DEFAULT nextval('ajuste_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ajuste_h ALTER COLUMN id SET DEFAULT nextval('ajuste_h_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alerta ALTER COLUMN id SET DEFAULT nextval('alerta_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cancelacion_servicio ALTER COLUMN id SET DEFAULT nextval('cancelacion_servicio_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categoria_vehiculo ALTER COLUMN id SET DEFAULT nextval('categoria_vehiculo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY celular ALTER COLUMN id SET DEFAULT nextval('celular_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ciudad ALTER COLUMN id SET DEFAULT nextval('ciudad_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comisionado ALTER COLUMN id SET DEFAULT nextval('comisionado_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comisionado_servicio ALTER COLUMN id SET DEFAULT nextval('comisionado_servicio_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comisionado_tipo_comision ALTER COLUMN id SET DEFAULT nextval('comisionado_tipo_comision_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY conf ALTER COLUMN id SET DEFAULT nextval('conf_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contacto_tercero ALTER COLUMN id SET DEFAULT nextval('contacto_tercero_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contacto_tipo_contacto ALTER COLUMN id SET DEFAULT nextval('contacto_tipo_contacto_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY datos_cliente ALTER COLUMN id SET DEFAULT nextval('datos_cliente_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY departamento ALTER COLUMN id SET DEFAULT nextval('departamento_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY descuento ALTER COLUMN id SET DEFAULT nextval('descuento_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detalle_factura ALTER COLUMN id SET DEFAULT nextval('detalle_factura_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detalle_pago ALTER COLUMN id SET DEFAULT nextval('detalle_pago_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entidad_facturacion ALTER COLUMN id SET DEFAULT nextval('entidad_facturacion_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estado ALTER COLUMN id SET DEFAULT nextval('estado_servicio_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY evento ALTER COLUMN id SET DEFAULT nextval('evento_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY factura_compra ALTER COLUMN id SET DEFAULT nextval('factura_compra_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY factura_venta ALTER COLUMN id SET DEFAULT nextval('factura_venta_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY forma_pago ALTER COLUMN id SET DEFAULT nextval('forma_pago_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gasto_gasolina ALTER COLUMN id SET DEFAULT nextval('gasto_gasolina_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gastos ALTER COLUMN id SET DEFAULT nextval('gastos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY grupo ALTER COLUMN id SET DEFAULT nextval('grupo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY grupo_privilegio ALTER COLUMN id SET DEFAULT nextval('grupo_privilegio_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY grupo_usuario ALTER COLUMN id SET DEFAULT nextval('grupo_usuario_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY historial_mision ALTER COLUMN id SET DEFAULT nextval('historial_mision_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY hoja_mision ALTER COLUMN id SET DEFAULT nextval('hoja_mision_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY idioma ALTER COLUMN id SET DEFAULT nextval('idioma_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY idioma_tercero ALTER COLUMN id SET DEFAULT nextval('idioma_tercero_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY instruccion_recogida ALTER COLUMN id SET DEFAULT nextval('instruccion_recogida_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY letrero ALTER COLUMN id SET DEFAULT nextval('letrero_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lugar ALTER COLUMN id SET DEFAULT nextval('lugar_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY marca_vehiculo ALTER COLUMN id SET DEFAULT nextval('marca_vehiculo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY media ALTER COLUMN id SET DEFAULT nextval('media_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modelo_email ALTER COLUMN id SET DEFAULT nextval('modelo_email_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modelo_vehiculo ALTER COLUMN id SET DEFAULT nextval('modelo_vehiculo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY moneda ALTER COLUMN id SET DEFAULT nextval('moneda_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY movimiento_contable ALTER COLUMN id SET DEFAULT nextval('movimiento_contable_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY nivel_servicio ALTER COLUMN id SET DEFAULT nextval('nivel_servicio_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pais ALTER COLUMN id SET DEFAULT nextval('pais_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pasajeros ALTER COLUMN id SET DEFAULT nextval('pasajeros_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY personal_tipo_proveedor ALTER COLUMN id SET DEFAULT nextval('personal_tipo_proveedor_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY privilegios ALTER COLUMN id SET DEFAULT nextval('privilegios_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY relacion_estado ALTER COLUMN id SET DEFAULT nextval('relacion_estado_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reserva ALTER COLUMN id SET DEFAULT nextval('reserva_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY servicio ALTER COLUMN id SET DEFAULT nextval('servicio_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY servicio_estado ALTER COLUMN id SET DEFAULT nextval('servicio_estado_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY servicio_personal ALTER COLUMN id SET DEFAULT nextval('servicio_personal_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY servicio_vehiculo ALTER COLUMN id SET DEFAULT nextval('servicio_vehiculo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tarifa ALTER COLUMN id SET DEFAULT nextval('tarifa_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tasa ALTER COLUMN id SET DEFAULT nextval('tasa_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tasa_cambio ALTER COLUMN id SET DEFAULT nextval('tasa_cambio_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tasa_servicio ALTER COLUMN id SET DEFAULT nextval('tasa_servicio_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tasa_servicio_personal ALTER COLUMN id SET DEFAULT nextval('tasa_servicio_personal_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tasa_valor_tarifa ALTER COLUMN id SET DEFAULT nextval('tasa_valor_tarifa_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY telefono_tercero ALTER COLUMN id SET DEFAULT nextval('telefono_tercero_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tercero ALTER COLUMN id SET DEFAULT nextval('tercero_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tercero_tipo_proveedor ALTER COLUMN id SET DEFAULT nextval('tercero_tipo_proveedor_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_comision ALTER COLUMN id SET DEFAULT nextval('tipo_comision_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_contacto ALTER COLUMN id SET DEFAULT nextval('tipo_contacto_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_documento ALTER COLUMN id SET DEFAULT nextval('tipo_documento_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_gasto ALTER COLUMN id SET DEFAULT nextval('tipo_gasto_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_lugar ALTER COLUMN id SET DEFAULT nextval('tipo_lugar_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_movimiento ALTER COLUMN id SET DEFAULT nextval('tipo_movimiento_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_operacion ALTER COLUMN id SET DEFAULT nextval('tipo_operacion_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_proveedor ALTER COLUMN id SET DEFAULT nextval('tipo_proveedor_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_tarifa ALTER COLUMN id SET DEFAULT nextval('tipo_tarifa_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_tercero ALTER COLUMN id SET DEFAULT nextval('tipo_tercero_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ubicacion_email ALTER COLUMN id SET DEFAULT nextval('ubicacion_email_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario ALTER COLUMN id SET DEFAULT nextval('usuario_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY valor_tarifa ALTER COLUMN id SET DEFAULT nextval('valor_tarifa_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vehiculo ALTER COLUMN id SET DEFAULT nextval('vehiculo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vehiculo_tipo_servicio ALTER COLUMN id SET DEFAULT nextval('vehiculo_tipo_servicio_id_seq'::regclass);


--
-- Name: PK_relacion_estado; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY relacion_estado
    ADD CONSTRAINT "PK_relacion_estado" PRIMARY KEY (id);


--
-- Name: PK_servicio_estado; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY servicio_estado
    ADD CONSTRAINT "PK_servicio_estado" PRIMARY KEY (id);


--
-- Name: ajuste_h_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ajuste_h
    ADD CONSTRAINT ajuste_h_pkey PRIMARY KEY (id);


--
-- Name: pk_abono_factura; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY abono_factura
    ADD CONSTRAINT pk_abono_factura PRIMARY KEY (id);


--
-- Name: pk_abono_factura_compra; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY abono_factura_compra
    ADD CONSTRAINT pk_abono_factura_compra PRIMARY KEY (id);


--
-- Name: pk_abono_reserva; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY abono_reserva
    ADD CONSTRAINT pk_abono_reserva PRIMARY KEY (id);


--
-- Name: pk_ajuste; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ajuste
    ADD CONSTRAINT pk_ajuste PRIMARY KEY (id);


--
-- Name: pk_alerta; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alerta
    ADD CONSTRAINT pk_alerta PRIMARY KEY (id);


--
-- Name: pk_cancelacion_servicio; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cancelacion_servicio
    ADD CONSTRAINT pk_cancelacion_servicio PRIMARY KEY (id);


--
-- Name: pk_categoria_vehiculo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categoria_vehiculo
    ADD CONSTRAINT pk_categoria_vehiculo PRIMARY KEY (id);


--
-- Name: pk_celular; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY celular
    ADD CONSTRAINT pk_celular PRIMARY KEY (id);


--
-- Name: pk_ciudad; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ciudad
    ADD CONSTRAINT pk_ciudad PRIMARY KEY (id);


--
-- Name: pk_comisionado; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comisionado
    ADD CONSTRAINT pk_comisionado PRIMARY KEY (id);


--
-- Name: pk_comisionado_servicio; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comisionado_servicio
    ADD CONSTRAINT pk_comisionado_servicio PRIMARY KEY (id);


--
-- Name: pk_comisionado_tipo_comision; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comisionado_tipo_comision
    ADD CONSTRAINT pk_comisionado_tipo_comision PRIMARY KEY (id);


--
-- Name: pk_conf; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY conf
    ADD CONSTRAINT pk_conf PRIMARY KEY (id);


--
-- Name: pk_contacto_tercero; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contacto_tercero
    ADD CONSTRAINT pk_contacto_tercero PRIMARY KEY (id);


--
-- Name: pk_contacto_tipo_contacto; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contacto_tipo_contacto
    ADD CONSTRAINT pk_contacto_tipo_contacto PRIMARY KEY (id);


--
-- Name: pk_datos_cliente; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY datos_cliente
    ADD CONSTRAINT pk_datos_cliente PRIMARY KEY (id);


--
-- Name: pk_departamento; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY departamento
    ADD CONSTRAINT pk_departamento PRIMARY KEY (id);


--
-- Name: pk_descuento; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY descuento
    ADD CONSTRAINT pk_descuento PRIMARY KEY (id);


--
-- Name: pk_detalle_factura; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detalle_factura
    ADD CONSTRAINT pk_detalle_factura PRIMARY KEY (id);


--
-- Name: pk_detalle_pago; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detalle_pago
    ADD CONSTRAINT pk_detalle_pago PRIMARY KEY (id);


--
-- Name: pk_entidad_facturacion; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entidad_facturacion
    ADD CONSTRAINT pk_entidad_facturacion PRIMARY KEY (id);


--
-- Name: pk_estado_reserva; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estado
    ADD CONSTRAINT pk_estado_reserva PRIMARY KEY (id);


--
-- Name: pk_evento; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY evento
    ADD CONSTRAINT pk_evento PRIMARY KEY (id);


--
-- Name: pk_factura_compra; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY factura_compra
    ADD CONSTRAINT pk_factura_compra PRIMARY KEY (id);


--
-- Name: pk_factura_venta; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY factura_venta
    ADD CONSTRAINT pk_factura_venta PRIMARY KEY (id);


--
-- Name: pk_forma_pago; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY forma_pago
    ADD CONSTRAINT pk_forma_pago PRIMARY KEY (id);


--
-- Name: pk_gasto_gasolina; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gasto_gasolina
    ADD CONSTRAINT pk_gasto_gasolina PRIMARY KEY (id);


--
-- Name: pk_gastos; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gastos
    ADD CONSTRAINT pk_gastos PRIMARY KEY (id);


--
-- Name: pk_grupo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY grupo
    ADD CONSTRAINT pk_grupo PRIMARY KEY (id);


--
-- Name: pk_grupo_privilegio; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY grupo_privilegio
    ADD CONSTRAINT pk_grupo_privilegio PRIMARY KEY (id);


--
-- Name: pk_grupo_usuario; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY grupo_usuario
    ADD CONSTRAINT pk_grupo_usuario PRIMARY KEY (id);


--
-- Name: pk_historial_mision; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY historial_mision
    ADD CONSTRAINT pk_historial_mision PRIMARY KEY (id);


--
-- Name: pk_hoja_mision; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY hoja_mision
    ADD CONSTRAINT pk_hoja_mision PRIMARY KEY (id);


--
-- Name: pk_idioma; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY idioma
    ADD CONSTRAINT pk_idioma PRIMARY KEY (id);


--
-- Name: pk_idioma_personal; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY idioma_tercero
    ADD CONSTRAINT pk_idioma_personal PRIMARY KEY (id);


--
-- Name: pk_instruccion_recogida; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY instruccion_recogida
    ADD CONSTRAINT pk_instruccion_recogida PRIMARY KEY (id);


--
-- Name: pk_letrero; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY letrero
    ADD CONSTRAINT pk_letrero PRIMARY KEY (id);


--
-- Name: pk_lugar; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lugar
    ADD CONSTRAINT pk_lugar PRIMARY KEY (id);


--
-- Name: pk_marca_vehiculo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY marca_vehiculo
    ADD CONSTRAINT pk_marca_vehiculo PRIMARY KEY (id);


--
-- Name: pk_media; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY media
    ADD CONSTRAINT pk_media PRIMARY KEY (id);


--
-- Name: pk_modelo_email; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modelo_email
    ADD CONSTRAINT pk_modelo_email PRIMARY KEY (id);


--
-- Name: pk_modelo_vehiculo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modelo_vehiculo
    ADD CONSTRAINT pk_modelo_vehiculo PRIMARY KEY (id);


--
-- Name: pk_moneda; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY moneda
    ADD CONSTRAINT pk_moneda PRIMARY KEY (id);


--
-- Name: pk_movimiento_contable; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY movimiento_contable
    ADD CONSTRAINT pk_movimiento_contable PRIMARY KEY (id);


--
-- Name: pk_pais; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pais
    ADD CONSTRAINT pk_pais PRIMARY KEY (id);


--
-- Name: pk_pasajeros; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pasajeros
    ADD CONSTRAINT pk_pasajeros PRIMARY KEY (id);


--
-- Name: pk_personal_tipo_proveedor; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY personal_tipo_proveedor
    ADD CONSTRAINT pk_personal_tipo_proveedor PRIMARY KEY (id);


--
-- Name: pk_privilegios; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY privilegios
    ADD CONSTRAINT pk_privilegios PRIMARY KEY (id);


--
-- Name: pk_reserva; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reserva
    ADD CONSTRAINT pk_reserva PRIMARY KEY (id);


--
-- Name: pk_servicio; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY servicio
    ADD CONSTRAINT pk_servicio PRIMARY KEY (id);


--
-- Name: pk_servicio_personal; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY servicio_personal
    ADD CONSTRAINT pk_servicio_personal PRIMARY KEY (id);


--
-- Name: pk_servicio_vehiculo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY servicio_vehiculo
    ADD CONSTRAINT pk_servicio_vehiculo PRIMARY KEY (id);


--
-- Name: pk_tarifa; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tarifa
    ADD CONSTRAINT pk_tarifa PRIMARY KEY (id);


--
-- Name: pk_tasa; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tasa
    ADD CONSTRAINT pk_tasa PRIMARY KEY (id);


--
-- Name: pk_tasa_servicio; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tasa_servicio
    ADD CONSTRAINT pk_tasa_servicio PRIMARY KEY (id);


--
-- Name: pk_tasa_servicio_personal; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tasa_servicio_personal
    ADD CONSTRAINT pk_tasa_servicio_personal PRIMARY KEY (id);


--
-- Name: pk_tasa_valor_tarifa; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tasa_valor_tarifa
    ADD CONSTRAINT pk_tasa_valor_tarifa PRIMARY KEY (id);


--
-- Name: pk_telefono_tercero; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY telefono_tercero
    ADD CONSTRAINT pk_telefono_tercero PRIMARY KEY (id);


--
-- Name: pk_tercero; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tercero
    ADD CONSTRAINT pk_tercero PRIMARY KEY (id);


--
-- Name: pk_tercero_tipo_proveedor; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tercero_tipo_proveedor
    ADD CONSTRAINT pk_tercero_tipo_proveedor PRIMARY KEY (id);


--
-- Name: pk_tipo_comision; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_comision
    ADD CONSTRAINT pk_tipo_comision PRIMARY KEY (id);


--
-- Name: pk_tipo_contacto; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_contacto
    ADD CONSTRAINT pk_tipo_contacto PRIMARY KEY (id);


--
-- Name: pk_tipo_documento; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_documento
    ADD CONSTRAINT pk_tipo_documento PRIMARY KEY (id);


--
-- Name: pk_tipo_gasto; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_gasto
    ADD CONSTRAINT pk_tipo_gasto PRIMARY KEY (id);


--
-- Name: pk_tipo_lugar; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_lugar
    ADD CONSTRAINT pk_tipo_lugar PRIMARY KEY (id);


--
-- Name: pk_tipo_movimiento; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_movimiento
    ADD CONSTRAINT pk_tipo_movimiento PRIMARY KEY (id);


--
-- Name: pk_tipo_operacion; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_operacion
    ADD CONSTRAINT pk_tipo_operacion PRIMARY KEY (id);


--
-- Name: pk_tipo_proveedor; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_proveedor
    ADD CONSTRAINT pk_tipo_proveedor PRIMARY KEY (id);


--
-- Name: pk_tipo_servicio; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY nivel_servicio
    ADD CONSTRAINT pk_tipo_servicio PRIMARY KEY (id);


--
-- Name: pk_tipo_tarifa; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_tarifa
    ADD CONSTRAINT pk_tipo_tarifa PRIMARY KEY (id);


--
-- Name: pk_tipo_tercero; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_tercero
    ADD CONSTRAINT pk_tipo_tercero PRIMARY KEY (id);


--
-- Name: pk_trm; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tasa_cambio
    ADD CONSTRAINT pk_trm PRIMARY KEY (id);


--
-- Name: pk_ubicacion_email; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ubicacion_email
    ADD CONSTRAINT pk_ubicacion_email PRIMARY KEY (id);


--
-- Name: pk_usuario; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT pk_usuario PRIMARY KEY (id);


--
-- Name: pk_valor_tarifa; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY valor_tarifa
    ADD CONSTRAINT pk_valor_tarifa PRIMARY KEY (id);


--
-- Name: pk_vehiculo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vehiculo
    ADD CONSTRAINT pk_vehiculo PRIMARY KEY (id);


--
-- Name: pk_vehiculo_tipo_servicio; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vehiculo_tipo_servicio
    ADD CONSTRAINT pk_vehiculo_tipo_servicio PRIMARY KEY (id);


--
-- Name: fki_departamento_pais; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_departamento_pais ON departamento USING btree (pais_id);


--
-- Name: fki_personal_tipo_proveedor_tercero; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_personal_tipo_proveedor_tercero ON personal_tipo_proveedor USING btree (tercero_id);


--
-- Name: fki_servicio_ciudad; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_servicio_ciudad ON servicio USING btree (ciudad_id);


--
-- Name: fki_servicio_nivel_servicio; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_servicio_nivel_servicio ON servicio USING btree (nivel_servicio_id);


--
-- Name: fki_servicio_vehiculo_vehiculo; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_servicio_vehiculo_vehiculo ON servicio_vehiculo USING btree (vehiculo_id);


--
-- Name: fki_tarifa_tipo_tarifa; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_tarifa_tipo_tarifa ON tarifa USING btree (tipo_tarifa_id);


--
-- Name: fki_telefono_tercero_tercero; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_telefono_tercero_tercero ON telefono_tercero USING btree (tercero_id);


--
-- Name: fki_tsp_tasa_valor_tarifa; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_tsp_tasa_valor_tarifa ON tasa_servicio_personal USING btree (tasa_valor_tarifa_id);


--
-- Name: fki_valor_tarifa_tipo_operacion; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_valor_tarifa_tipo_operacion ON valor_tarifa USING btree (tipo_operacion_id);


--
-- Name: fki_vehiculo_tipo_servicio_nivel_servicio; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_vehiculo_tipo_servicio_nivel_servicio ON vehiculo_tipo_servicio USING btree (nivel_servicio_id);


--
-- Name: FK_estado_hijo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY relacion_estado
    ADD CONSTRAINT "FK_estado_hijo" FOREIGN KEY (estado_hijo_id) REFERENCES estado(id);


--
-- Name: FK_estado_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY servicio_estado
    ADD CONSTRAINT "FK_estado_id" FOREIGN KEY (estado_id) REFERENCES estado(id);


--
-- Name: FK_estado_padre; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY relacion_estado
    ADD CONSTRAINT "FK_estado_padre" FOREIGN KEY (estado_padre_id) REFERENCES estado(id);


--
-- Name: FK_servicio_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY servicio_estado
    ADD CONSTRAINT "FK_servicio_id" FOREIGN KEY (servicio_id) REFERENCES servicio(id);


--
-- Name: comisionado_servicio_servicio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comisionado_servicio
    ADD CONSTRAINT comisionado_servicio_servicio_id_fkey FOREIGN KEY (servicio_id) REFERENCES servicio(id);


--
-- Name: fk_abono_factura_factura_venta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY abono_factura
    ADD CONSTRAINT fk_abono_factura_factura_venta FOREIGN KEY (factura_id) REFERENCES factura_venta(id);


--
-- Name: fk_abono_factura_movimiento_contable; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY abono_factura
    ADD CONSTRAINT fk_abono_factura_movimiento_contable FOREIGN KEY (movimiento_contable_id) REFERENCES movimiento_contable(id);


--
-- Name: fk_ajuste_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ajuste_h
    ADD CONSTRAINT fk_ajuste_id FOREIGN KEY (ajuste_id) REFERENCES ajuste(id);


--
-- Name: fk_alerta_reserva; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alerta
    ADD CONSTRAINT fk_alerta_reserva FOREIGN KEY (reserva_id) REFERENCES reserva(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_alerta_usuario_aprobacion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alerta
    ADD CONSTRAINT fk_alerta_usuario_aprobacion FOREIGN KEY (usuario_aprobacion_id) REFERENCES usuario(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_alerta_usuario_generacion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alerta
    ADD CONSTRAINT fk_alerta_usuario_generacion FOREIGN KEY (usuario_generacion_id) REFERENCES usuario(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_cancelacion_servicio_servicio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cancelacion_servicio
    ADD CONSTRAINT fk_cancelacion_servicio_servicio FOREIGN KEY (servicio_id) REFERENCES servicio(id);


--
-- Name: fk_cancelacion_servicio_usuario_aprobacion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cancelacion_servicio
    ADD CONSTRAINT fk_cancelacion_servicio_usuario_aprobacion FOREIGN KEY (usuario_aprobacion_id) REFERENCES usuario(id);


--
-- Name: fk_cancelacion_servicio_usuario_cancelacion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cancelacion_servicio
    ADD CONSTRAINT fk_cancelacion_servicio_usuario_cancelacion FOREIGN KEY (usuario_cancelacion_id) REFERENCES usuario(id);


--
-- Name: fk_categoria_vehiculo_tipo_servicio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categoria_vehiculo
    ADD CONSTRAINT fk_categoria_vehiculo_tipo_servicio FOREIGN KEY (nivel_servicio_id) REFERENCES nivel_servicio(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_celular_ciudad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY celular
    ADD CONSTRAINT fk_celular_ciudad FOREIGN KEY (ciudad_id) REFERENCES ciudad(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_ciudad_departamento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ciudad
    ADD CONSTRAINT fk_ciudad_departamento FOREIGN KEY (departamento_id) REFERENCES departamento(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_ciudad_pais; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ciudad
    ADD CONSTRAINT fk_ciudad_pais FOREIGN KEY (pais_id) REFERENCES pais(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_comisionado_servicio_tercero; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comisionado_servicio
    ADD CONSTRAINT fk_comisionado_servicio_tercero FOREIGN KEY (tercero_id) REFERENCES tercero(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_comisionado_servicio_tipo_comision; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comisionado_servicio
    ADD CONSTRAINT fk_comisionado_servicio_tipo_comision FOREIGN KEY (tipo_comision_id) REFERENCES tipo_comision(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_comisionado_tercero_cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comisionado
    ADD CONSTRAINT fk_comisionado_tercero_cliente FOREIGN KEY (tercero_id_cliente) REFERENCES tercero(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_comisionado_tercero_comisionado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comisionado
    ADD CONSTRAINT fk_comisionado_tercero_comisionado FOREIGN KEY (tercero_id_comisionado) REFERENCES tercero(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_comisionado_tipo_comision_comisionado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comisionado_tipo_comision
    ADD CONSTRAINT fk_comisionado_tipo_comision_comisionado FOREIGN KEY (comisionado_id) REFERENCES comisionado(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_comisionado_tipo_comision_tipo_comision; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comisionado_tipo_comision
    ADD CONSTRAINT fk_comisionado_tipo_comision_tipo_comision FOREIGN KEY (tipo_comision_id) REFERENCES tipo_comision(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_contacto_tercero_tercero_cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contacto_tercero
    ADD CONSTRAINT fk_contacto_tercero_tercero_cliente FOREIGN KEY (tercero_id_cliente) REFERENCES tercero(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_contacto_tercero_tercero_contacto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contacto_tercero
    ADD CONSTRAINT fk_contacto_tercero_tercero_contacto FOREIGN KEY (tercero_id_contacto) REFERENCES tercero(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_contacto_tipo_contacto_contacto_tercero; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contacto_tipo_contacto
    ADD CONSTRAINT fk_contacto_tipo_contacto_contacto_tercero FOREIGN KEY (contacto_id) REFERENCES contacto_tercero(id);


--
-- Name: fk_contacto_tipo_contacto_tipo_contacto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contacto_tipo_contacto
    ADD CONSTRAINT fk_contacto_tipo_contacto_tipo_contacto FOREIGN KEY (tipo_contacto_id) REFERENCES tipo_contacto(id);


--
-- Name: fk_datos_cliente_forma_pago; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY datos_cliente
    ADD CONSTRAINT fk_datos_cliente_forma_pago FOREIGN KEY (forma_pago_id) REFERENCES forma_pago(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_datos_cliente_letrero; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY datos_cliente
    ADD CONSTRAINT fk_datos_cliente_letrero FOREIGN KEY (letrero_id) REFERENCES letrero(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_datos_cliente_tarifa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY datos_cliente
    ADD CONSTRAINT fk_datos_cliente_tarifa FOREIGN KEY (tarifa_id) REFERENCES tarifa(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_datos_cliente_tercero; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY datos_cliente
    ADD CONSTRAINT fk_datos_cliente_tercero FOREIGN KEY (tercero_id) REFERENCES tercero(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_datos_cliente_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY datos_cliente
    ADD CONSTRAINT fk_datos_cliente_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_departamento_pais; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY departamento
    ADD CONSTRAINT fk_departamento_pais FOREIGN KEY (pais_id) REFERENCES pais(id);


--
-- Name: fk_descuento_datos_cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY descuento
    ADD CONSTRAINT fk_descuento_datos_cliente FOREIGN KEY (cliente_id) REFERENCES datos_cliente(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_descuento_tipo_servicio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY descuento
    ADD CONSTRAINT fk_descuento_tipo_servicio FOREIGN KEY (tipo_servicio_id) REFERENCES nivel_servicio(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_detalle_factura_factura_venta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detalle_factura
    ADD CONSTRAINT fk_detalle_factura_factura_venta FOREIGN KEY (factura_id) REFERENCES factura_venta(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_detalle_factura_servicio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detalle_factura
    ADD CONSTRAINT fk_detalle_factura_servicio FOREIGN KEY (servicio_id) REFERENCES servicio(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_detalle_pago_comisionado_servicio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detalle_pago
    ADD CONSTRAINT fk_detalle_pago_comisionado_servicio FOREIGN KEY (comisionado_servicio_id) REFERENCES comisionado_servicio(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_detalle_pago_factura_compra; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detalle_pago
    ADD CONSTRAINT fk_detalle_pago_factura_compra FOREIGN KEY (factura_compra_id) REFERENCES factura_compra(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_detalle_pago_servicio_personal; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detalle_pago
    ADD CONSTRAINT fk_detalle_pago_servicio_personal FOREIGN KEY (servicio_personal_id) REFERENCES servicio_personal(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_detalle_pago_servicio_vehiculo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detalle_pago
    ADD CONSTRAINT fk_detalle_pago_servicio_vehiculo FOREIGN KEY (servicio_vehiculo_id) REFERENCES servicio_vehiculo(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_entidad_facturacion_tercero_cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entidad_facturacion
    ADD CONSTRAINT fk_entidad_facturacion_tercero_cliente FOREIGN KEY (tercero_id_cliente) REFERENCES tercero(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_entidad_facturacion_tercero_ef; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entidad_facturacion
    ADD CONSTRAINT fk_entidad_facturacion_tercero_ef FOREIGN KEY (tercero_id_entidad_facturacion) REFERENCES tercero(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_factura_compra_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY abono_factura_compra
    ADD CONSTRAINT fk_factura_compra_id FOREIGN KEY (factura_compra_id) REFERENCES factura_compra(id);


--
-- Name: fk_factura_compra_movimiento_contable; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY factura_compra
    ADD CONSTRAINT fk_factura_compra_movimiento_contable FOREIGN KEY (movimiento_contable_id) REFERENCES movimiento_contable(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_factura_compra_tercero; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY factura_compra
    ADD CONSTRAINT fk_factura_compra_tercero FOREIGN KEY (tercero_id) REFERENCES tercero(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_factura_venta_moneda; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY factura_venta
    ADD CONSTRAINT fk_factura_venta_moneda FOREIGN KEY (moneda_id) REFERENCES moneda(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_factura_venta_tercero; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY factura_venta
    ADD CONSTRAINT fk_factura_venta_tercero FOREIGN KEY (tercero_id) REFERENCES tercero(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_gasto_gasolina_servicio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gasto_gasolina
    ADD CONSTRAINT fk_gasto_gasolina_servicio FOREIGN KEY (servicio_id) REFERENCES servicio(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_gasto_gasolina_tercero_tipo_proveedor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gasto_gasolina
    ADD CONSTRAINT fk_gasto_gasolina_tercero_tipo_proveedor FOREIGN KEY (tercero_tipo_proveedor_id) REFERENCES tercero_tipo_proveedor(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_gasto_gasolina_vehiculo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gasto_gasolina
    ADD CONSTRAINT fk_gasto_gasolina_vehiculo FOREIGN KEY (vehiculo_id) REFERENCES vehiculo(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_gastos_hoja_mision; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gastos
    ADD CONSTRAINT fk_gastos_hoja_mision FOREIGN KEY (hoja_mision_id) REFERENCES hoja_mision(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_gastos_moneda; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gastos
    ADD CONSTRAINT fk_gastos_moneda FOREIGN KEY (moneda_id) REFERENCES moneda(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_gastos_tipo_gasto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gastos
    ADD CONSTRAINT fk_gastos_tipo_gasto FOREIGN KEY (tipo_gasto_id) REFERENCES tipo_gasto(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_grupo_privilegio_grupo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY grupo_privilegio
    ADD CONSTRAINT fk_grupo_privilegio_grupo FOREIGN KEY (grupo_id) REFERENCES grupo(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_grupo_privilegio_privilegios; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY grupo_privilegio
    ADD CONSTRAINT fk_grupo_privilegio_privilegios FOREIGN KEY (privilegio_id) REFERENCES privilegios(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_grupo_usuario_grupo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY grupo_usuario
    ADD CONSTRAINT fk_grupo_usuario_grupo FOREIGN KEY (grupo_id) REFERENCES grupo(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_grupo_usuario_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY grupo_usuario
    ADD CONSTRAINT fk_grupo_usuario_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_historial_mision_hoja_mision; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY historial_mision
    ADD CONSTRAINT fk_historial_mision_hoja_mision FOREIGN KEY (hoja_mision_id) REFERENCES hoja_mision(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_hoja_mision_servicio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY hoja_mision
    ADD CONSTRAINT fk_hoja_mision_servicio FOREIGN KEY (servicio_id) REFERENCES servicio(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_idioma_tercero_idioma; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY idioma_tercero
    ADD CONSTRAINT fk_idioma_tercero_idioma FOREIGN KEY (idioma_id) REFERENCES idioma(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_idioma_tercero_tercero; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY idioma_tercero
    ADD CONSTRAINT fk_idioma_tercero_tercero FOREIGN KEY (tercero_id) REFERENCES tercero(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_instruccion_recogida_idioma; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY instruccion_recogida
    ADD CONSTRAINT fk_instruccion_recogida_idioma FOREIGN KEY (idioma_id) REFERENCES idioma(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_instruccion_recogida_lugar; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY instruccion_recogida
    ADD CONSTRAINT fk_instruccion_recogida_lugar FOREIGN KEY (lugar_id) REFERENCES lugar(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_letrero_media_logo1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY letrero
    ADD CONSTRAINT fk_letrero_media_logo1 FOREIGN KEY (logo1_id) REFERENCES media(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_letrero_media_logo2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY letrero
    ADD CONSTRAINT fk_letrero_media_logo2 FOREIGN KEY (logo2_id) REFERENCES media(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_lugar_ciudad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lugar
    ADD CONSTRAINT fk_lugar_ciudad FOREIGN KEY (ciudad_id) REFERENCES ciudad(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_lugar_tipo_lugar; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lugar
    ADD CONSTRAINT fk_lugar_tipo_lugar FOREIGN KEY (tipo_lugar_id) REFERENCES tipo_lugar(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_modelo_vehiculo_marca_vehiculo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modelo_vehiculo
    ADD CONSTRAINT fk_modelo_vehiculo_marca_vehiculo FOREIGN KEY (marca_vehiculo_id) REFERENCES marca_vehiculo(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_mov_contable_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY abono_reserva
    ADD CONSTRAINT fk_mov_contable_id FOREIGN KEY (mov_contable_id) REFERENCES movimiento_contable(id);


--
-- Name: fk_movimiento_contable_ciudad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY movimiento_contable
    ADD CONSTRAINT fk_movimiento_contable_ciudad FOREIGN KEY (ciudad_id) REFERENCES ciudad(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_movimiento_contable_forma_pago; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY movimiento_contable
    ADD CONSTRAINT fk_movimiento_contable_forma_pago FOREIGN KEY (forma_pago_id) REFERENCES forma_pago(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_movimiento_contable_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY abono_factura_compra
    ADD CONSTRAINT fk_movimiento_contable_id FOREIGN KEY (movimiento_contable_id) REFERENCES movimiento_contable(id);


--
-- Name: fk_movimiento_contable_moneda; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY movimiento_contable
    ADD CONSTRAINT fk_movimiento_contable_moneda FOREIGN KEY (moneda_id) REFERENCES moneda(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_movimiento_contable_tercero; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY movimiento_contable
    ADD CONSTRAINT fk_movimiento_contable_tercero FOREIGN KEY (tercero_id) REFERENCES tercero(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_movimiento_contable_tipo_movimiento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY movimiento_contable
    ADD CONSTRAINT fk_movimiento_contable_tipo_movimiento FOREIGN KEY (tipo_movimiento_id) REFERENCES tipo_movimiento(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_movimiento_contable_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY movimiento_contable
    ADD CONSTRAINT fk_movimiento_contable_usuario FOREIGN KEY (usuario_anulacion_id) REFERENCES usuario(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_pasajeros_servicio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pasajeros
    ADD CONSTRAINT fk_pasajeros_servicio FOREIGN KEY (servicio_id) REFERENCES servicio(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_pasajeros_tercero; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pasajeros
    ADD CONSTRAINT fk_pasajeros_tercero FOREIGN KEY (tercero_id) REFERENCES tercero(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_personal_tipo_proveedor_tarifa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY personal_tipo_proveedor
    ADD CONSTRAINT fk_personal_tipo_proveedor_tarifa FOREIGN KEY (tarifa_id) REFERENCES tarifa(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_personal_tipo_proveedor_tercero_tipo_proveedor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY personal_tipo_proveedor
    ADD CONSTRAINT fk_personal_tipo_proveedor_tercero_tipo_proveedor FOREIGN KEY (tercero_tipo_proveedor_id) REFERENCES tercero_tipo_proveedor(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_ptp_tercero; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY personal_tipo_proveedor
    ADD CONSTRAINT fk_ptp_tercero FOREIGN KEY (tercero_id) REFERENCES tercero(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_reserva_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY abono_reserva
    ADD CONSTRAINT fk_reserva_id FOREIGN KEY (reserva_id) REFERENCES reserva(id);


--
-- Name: fk_reserva_tarifa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reserva
    ADD CONSTRAINT fk_reserva_tarifa FOREIGN KEY (tarifa_id) REFERENCES tarifa(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_reserva_tercero; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reserva
    ADD CONSTRAINT fk_reserva_tercero FOREIGN KEY (tercero_id) REFERENCES tercero(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_reserva_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reserva
    ADD CONSTRAINT fk_reserva_usuario FOREIGN KEY (usuario_creacion_id) REFERENCES usuario(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_servicio_categoria_vehiculo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY servicio
    ADD CONSTRAINT fk_servicio_categoria_vehiculo FOREIGN KEY (categoria_vehiculo_id) REFERENCES categoria_vehiculo(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_servicio_ciudad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY servicio
    ADD CONSTRAINT fk_servicio_ciudad FOREIGN KEY (ciudad_id) REFERENCES ciudad(id);


--
-- Name: fk_servicio_contacto_tercero; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY servicio
    ADD CONSTRAINT fk_servicio_contacto_tercero FOREIGN KEY (contacto_id) REFERENCES contacto_tercero(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_servicio_entidad_facturacion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY servicio
    ADD CONSTRAINT fk_servicio_entidad_facturacion FOREIGN KEY (entidad_facturacion_id) REFERENCES entidad_facturacion(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_servicio_evento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY servicio
    ADD CONSTRAINT fk_servicio_evento FOREIGN KEY (evento_id) REFERENCES evento(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_servicio_lugar_destino; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY servicio
    ADD CONSTRAINT fk_servicio_lugar_destino FOREIGN KEY (lugar_destino_id) REFERENCES lugar(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_servicio_lugar_recogida; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY servicio
    ADD CONSTRAINT fk_servicio_lugar_recogida FOREIGN KEY (lugar_recogida_id) REFERENCES lugar(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_servicio_nivel_servicio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY servicio
    ADD CONSTRAINT fk_servicio_nivel_servicio FOREIGN KEY (nivel_servicio_id) REFERENCES nivel_servicio(id);


--
-- Name: fk_servicio_personal_celular; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY servicio_personal
    ADD CONSTRAINT fk_servicio_personal_celular FOREIGN KEY (celular_id) REFERENCES celular(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_servicio_personal_personal_tipo_proveedor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY servicio_personal
    ADD CONSTRAINT fk_servicio_personal_personal_tipo_proveedor FOREIGN KEY (personal_tipo_proveedor_id) REFERENCES personal_tipo_proveedor(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_servicio_personal_servicio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY servicio_personal
    ADD CONSTRAINT fk_servicio_personal_servicio FOREIGN KEY (servicio_id) REFERENCES servicio(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_servicio_reserva; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY servicio
    ADD CONSTRAINT fk_servicio_reserva FOREIGN KEY (reserva_id) REFERENCES reserva(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_servicio_tipo_operacion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY servicio
    ADD CONSTRAINT fk_servicio_tipo_operacion FOREIGN KEY (tipo_operacion_id) REFERENCES tipo_operacion(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_servicio_usuario_confirmacion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY servicio
    ADD CONSTRAINT fk_servicio_usuario_confirmacion FOREIGN KEY (usuario_confirmacion_id) REFERENCES usuario(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_servicio_vehiculo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY servicio
    ADD CONSTRAINT fk_servicio_vehiculo FOREIGN KEY (vehiculo_id) REFERENCES vehiculo(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_servicio_vehiculo_servicio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY servicio_vehiculo
    ADD CONSTRAINT fk_servicio_vehiculo_servicio FOREIGN KEY (servicio_id) REFERENCES servicio(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_servicio_vehiculo_vehiculo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY servicio_vehiculo
    ADD CONSTRAINT fk_servicio_vehiculo_vehiculo FOREIGN KEY (vehiculo_id) REFERENCES vehiculo(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_tarifa_moneda; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tarifa
    ADD CONSTRAINT fk_tarifa_moneda FOREIGN KEY (moneda_id) REFERENCES moneda(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_tarifa_tipo_tarifa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tarifa
    ADD CONSTRAINT fk_tarifa_tipo_tarifa FOREIGN KEY (tipo_tarifa_id) REFERENCES tipo_tarifa(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_tasa_servicio_personal_servicio_personal; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tasa_servicio_personal
    ADD CONSTRAINT fk_tasa_servicio_personal_servicio_personal FOREIGN KEY (servicio_personal_id) REFERENCES servicio_personal(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_tasa_servicio_servicio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tasa_servicio
    ADD CONSTRAINT fk_tasa_servicio_servicio FOREIGN KEY (servicio_id) REFERENCES servicio(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_tasa_servicio_tasa_valor_tarifa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tasa_servicio
    ADD CONSTRAINT fk_tasa_servicio_tasa_valor_tarifa FOREIGN KEY (tasa_valor_tarifa_id) REFERENCES tasa_valor_tarifa(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_tasa_valor_tarifa_tasa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tasa_valor_tarifa
    ADD CONSTRAINT fk_tasa_valor_tarifa_tasa FOREIGN KEY (tasa_id) REFERENCES tasa(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_tasa_valor_tarifa_valor_tarifa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tasa_valor_tarifa
    ADD CONSTRAINT fk_tasa_valor_tarifa_valor_tarifa FOREIGN KEY (valor_tarifa_id) REFERENCES valor_tarifa(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_telefono_tercero_tercero; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY telefono_tercero
    ADD CONSTRAINT fk_telefono_tercero_tercero FOREIGN KEY (tercero_id) REFERENCES tercero(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_tercero_ciudad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tercero
    ADD CONSTRAINT fk_tercero_ciudad FOREIGN KEY (ciudad_id) REFERENCES ciudad(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_tercero_media; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tercero
    ADD CONSTRAINT fk_tercero_media FOREIGN KEY (imagen) REFERENCES media(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_tercero_moneda; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tercero
    ADD CONSTRAINT fk_tercero_moneda FOREIGN KEY (moneda_id) REFERENCES moneda(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_tercero_tipo_documento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tercero
    ADD CONSTRAINT fk_tercero_tipo_documento FOREIGN KEY (tipo_documento_id) REFERENCES tipo_documento(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_tercero_tipo_proveedor_modelo_email; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tercero_tipo_proveedor
    ADD CONSTRAINT fk_tercero_tipo_proveedor_modelo_email FOREIGN KEY (modelo_email_id) REFERENCES modelo_email(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_tercero_tipo_proveedor_tercero; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tercero_tipo_proveedor
    ADD CONSTRAINT fk_tercero_tipo_proveedor_tercero FOREIGN KEY (tercero_id) REFERENCES tercero(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_tercero_tipo_proveedor_tipo_proveedor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tercero_tipo_proveedor
    ADD CONSTRAINT fk_tercero_tipo_proveedor_tipo_proveedor FOREIGN KEY (tipo_proveedor_id) REFERENCES tipo_proveedor(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_tercero_tipo_tercero; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tercero
    ADD CONSTRAINT fk_tercero_tipo_tercero FOREIGN KEY (tipo_tercero_id) REFERENCES tipo_tercero(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_tsp_tasa_valor_tarifa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tasa_servicio_personal
    ADD CONSTRAINT fk_tsp_tasa_valor_tarifa FOREIGN KEY (tasa_valor_tarifa_id) REFERENCES tasa_valor_tarifa(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_ttp_tarifa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tercero_tipo_proveedor
    ADD CONSTRAINT fk_ttp_tarifa FOREIGN KEY (tarifa_id) REFERENCES tarifa(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_usuario_anulacion_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY abono_reserva
    ADD CONSTRAINT fk_usuario_anulacion_id FOREIGN KEY (usuario_anulacion_id) REFERENCES usuario(id);


--
-- Name: fk_usuario_creacion_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY abono_reserva
    ADD CONSTRAINT fk_usuario_creacion_id FOREIGN KEY (usuario_creacion_id) REFERENCES usuario(id);


--
-- Name: fk_usuario_tercero; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT fk_usuario_tercero FOREIGN KEY (tercero_id) REFERENCES tercero(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_valor_tarifa_categoria_vehiculo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY valor_tarifa
    ADD CONSTRAINT fk_valor_tarifa_categoria_vehiculo FOREIGN KEY (categoria_vehiculo_id) REFERENCES categoria_vehiculo(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_valor_tarifa_ciudad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY valor_tarifa
    ADD CONSTRAINT fk_valor_tarifa_ciudad FOREIGN KEY (ciudad_id) REFERENCES ciudad(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_valor_tarifa_lugar; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY valor_tarifa
    ADD CONSTRAINT fk_valor_tarifa_lugar FOREIGN KEY (lugar_id) REFERENCES lugar(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_valor_tarifa_nivel_servicio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY valor_tarifa
    ADD CONSTRAINT fk_valor_tarifa_nivel_servicio FOREIGN KEY (nivel_servicio_id) REFERENCES nivel_servicio(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_valor_tarifa_tarifa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY valor_tarifa
    ADD CONSTRAINT fk_valor_tarifa_tarifa FOREIGN KEY (tarifa_id) REFERENCES tarifa(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_valor_tarifa_tipo_operacion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY valor_tarifa
    ADD CONSTRAINT fk_valor_tarifa_tipo_operacion FOREIGN KEY (tipo_operacion_id) REFERENCES tipo_operacion(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_vehiculo_categoria_vehiculo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vehiculo
    ADD CONSTRAINT fk_vehiculo_categoria_vehiculo FOREIGN KEY (categoria_vehiculo_id) REFERENCES categoria_vehiculo(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_vehiculo_celular_celular1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vehiculo
    ADD CONSTRAINT fk_vehiculo_celular_celular1 FOREIGN KEY (celular1_id) REFERENCES celular(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_vehiculo_celular_celular2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vehiculo
    ADD CONSTRAINT fk_vehiculo_celular_celular2 FOREIGN KEY (celular2_id) REFERENCES celular(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_vehiculo_ciudad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vehiculo
    ADD CONSTRAINT fk_vehiculo_ciudad FOREIGN KEY (ciudad_id) REFERENCES ciudad(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_vehiculo_media_imagen1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vehiculo
    ADD CONSTRAINT fk_vehiculo_media_imagen1 FOREIGN KEY (imagen1) REFERENCES media(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_vehiculo_media_imagen2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vehiculo
    ADD CONSTRAINT fk_vehiculo_media_imagen2 FOREIGN KEY (imagen2) REFERENCES media(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_vehiculo_media_imagen3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vehiculo
    ADD CONSTRAINT fk_vehiculo_media_imagen3 FOREIGN KEY (imagen3) REFERENCES media(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_vehiculo_modelo_vehiculo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vehiculo
    ADD CONSTRAINT fk_vehiculo_modelo_vehiculo FOREIGN KEY (modelo_vehiculo_id) REFERENCES modelo_vehiculo(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_vehiculo_personal_tipo_proveedor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vehiculo
    ADD CONSTRAINT fk_vehiculo_personal_tipo_proveedor FOREIGN KEY (conductor_id) REFERENCES personal_tipo_proveedor(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_vehiculo_tarifa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vehiculo
    ADD CONSTRAINT fk_vehiculo_tarifa FOREIGN KEY (tarifa_id) REFERENCES tarifa(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_vehiculo_tercero_tipo_proveedor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vehiculo
    ADD CONSTRAINT fk_vehiculo_tercero_tipo_proveedor FOREIGN KEY (tercero_tipo_proveedor_id) REFERENCES tercero_tipo_proveedor(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_vehiculo_tipo_servicio_nivel_servicio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vehiculo_tipo_servicio
    ADD CONSTRAINT fk_vehiculo_tipo_servicio_nivel_servicio FOREIGN KEY (nivel_servicio_id) REFERENCES nivel_servicio(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_vehiculo_tipo_servicio_vehiculo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vehiculo_tipo_servicio
    ADD CONSTRAINT fk_vehiculo_tipo_servicio_vehiculo FOREIGN KEY (vehiculo_id) REFERENCES vehiculo(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

