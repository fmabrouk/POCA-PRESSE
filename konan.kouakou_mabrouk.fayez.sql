--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.19
-- Dumped by pg_dump version 11.7 (Debian 11.7-0+deb10u1)

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

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: acteurs; Type: TABLE; Schema: public; Owner: konan.kouakou
--

CREATE TABLE public.acteurs (
    matricule character varying(25) NOT NULL,
    nom character varying(25),
    prenom character varying(25),
    mail character varying(50),
    statut character varying(25),
    type character(5),
    motpass character varying(25)
);


ALTER TABLE public.acteurs OWNER TO "konan.kouakou";

--
-- Name: article; Type: TABLE; Schema: public; Owner: konan.kouakou
--

CREATE TABLE public.article (
    ref_article integer NOT NULL,
    titre character varying(25) NOT NULL,
    chapeau text,
    lien_contenu character varying(50),
    nombre_feuillet numeric NOT NULL,
    etat character varying(25) NOT NULL,
    date_intranet date,
    matricule character varying(25) NOT NULL,
    code integer,
    num_rub integer
);


ALTER TABLE public.article OWNER TO "konan.kouakou";

--
-- Name: article_num_rub_seq; Type: SEQUENCE; Schema: public; Owner: konan.kouakou
--

CREATE SEQUENCE public.article_num_rub_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.article_num_rub_seq OWNER TO "konan.kouakou";

--
-- Name: article_num_rub_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: konan.kouakou
--

ALTER SEQUENCE public.article_num_rub_seq OWNED BY public.article.num_rub;


--
-- Name: contient; Type: TABLE; Schema: public; Owner: konan.kouakou
--

CREATE TABLE public.contient (
    code integer NOT NULL,
    num_rub integer NOT NULL
);


ALTER TABLE public.contient OWNER TO "konan.kouakou";

--
-- Name: illustre; Type: TABLE; Schema: public; Owner: konan.kouakou
--

CREATE TABLE public.illustre (
    ref_article integer NOT NULL,
    lien_img character varying(50) NOT NULL
);


ALTER TABLE public.illustre OWNER TO "konan.kouakou";

--
-- Name: illustre_sommaire; Type: TABLE; Schema: public; Owner: konan.kouakou
--

CREATE TABLE public.illustre_sommaire (
    num_maq integer NOT NULL,
    lien_img character varying(50) NOT NULL
);


ALTER TABLE public.illustre_sommaire OWNER TO "konan.kouakou";

--
-- Name: image; Type: TABLE; Schema: public; Owner: konan.kouakou
--

CREATE TABLE public.image (
    lien_img character varying(50) NOT NULL
);


ALTER TABLE public.image OWNER TO "konan.kouakou";

--
-- Name: maquette; Type: TABLE; Schema: public; Owner: konan.kouakou
--

CREATE TABLE public.maquette (
    num_maq integer NOT NULL,
    "date_de_création" date NOT NULL,
    lien_fichier character varying(25),
    code integer NOT NULL,
    matricule character varying(25) NOT NULL
);


ALTER TABLE public.maquette OWNER TO "konan.kouakou";

--
-- Name: num_magazine; Type: TABLE; Schema: public; Owner: konan.kouakou
--

CREATE TABLE public.num_magazine (
    code integer NOT NULL,
    date_publication date NOT NULL
);


ALTER TABLE public.num_magazine OWNER TO "konan.kouakou";

--
-- Name: pigiste; Type: TABLE; Schema: public; Owner: konan.kouakou
--

CREATE TABLE public.pigiste (
    matricule character varying(25) NOT NULL,
    notoriete character varying(25) NOT NULL
);


ALTER TABLE public.pigiste OWNER TO "konan.kouakou";

--
-- Name: pratique; Type: TABLE; Schema: public; Owner: konan.kouakou
--

CREATE TABLE public.pratique (
    num integer NOT NULL,
    code_loisir character(3) NOT NULL
);


ALTER TABLE public.pratique OWNER TO "konan.kouakou";

--
-- Name: rubrique; Type: TABLE; Schema: public; Owner: konan.kouakou
--

CREATE TABLE public.rubrique (
    num_rub integer NOT NULL,
    titre character varying(50) NOT NULL
);


ALTER TABLE public.rubrique OWNER TO "konan.kouakou";

--
-- Name: rubrique_num_rub_seq; Type: SEQUENCE; Schema: public; Owner: konan.kouakou
--

CREATE SEQUENCE public.rubrique_num_rub_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rubrique_num_rub_seq OWNER TO "konan.kouakou";

--
-- Name: rubrique_num_rub_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: konan.kouakou
--

ALTER SEQUENCE public.rubrique_num_rub_seq OWNED BY public.rubrique.num_rub;


--
-- Name: t_loisir; Type: TABLE; Schema: public; Owner: konan.kouakou
--

CREATE TABLE public.t_loisir (
    code_loisir character(3) NOT NULL,
    lib_loisir character varying(20) NOT NULL
);


ALTER TABLE public.t_loisir OWNER TO "konan.kouakou";

--
-- Name: t_personne; Type: TABLE; Schema: public; Owner: konan.kouakou
--

CREATE TABLE public.t_personne (
    num integer NOT NULL,
    nom character varying(20) DEFAULT ''::character varying NOT NULL,
    prenom character varying(20) DEFAULT NULL::character varying,
    titre character(1) DEFAULT NULL::bpchar,
    date_n date,
    service character varying(4) DEFAULT ''::character varying NOT NULL,
    CONSTRAINT ck_titre CHECK ((titre = ANY (ARRAY['1'::bpchar, '2'::bpchar, '3'::bpchar])))
);


ALTER TABLE public.t_personne OWNER TO "konan.kouakou";

--
-- Name: t_personne_num_seq; Type: SEQUENCE; Schema: public; Owner: konan.kouakou
--

CREATE SEQUENCE public.t_personne_num_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_personne_num_seq OWNER TO "konan.kouakou";

--
-- Name: t_personne_num_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: konan.kouakou
--

ALTER SEQUENCE public.t_personne_num_seq OWNED BY public.t_personne.num;


--
-- Name: t_service; Type: TABLE; Schema: public; Owner: konan.kouakou
--

CREATE TABLE public.t_service (
    code_service character(4) NOT NULL,
    lib_service character varying(20) NOT NULL
);


ALTER TABLE public.t_service OWNER TO "konan.kouakou";

--
-- Name: vue1; Type: VIEW; Schema: public; Owner: konan.kouakou
--

CREATE VIEW public.vue1 AS
 SELECT article.matricule,
    count(article.ref_article) AS nb_arct
   FROM public.article
  GROUP BY article.matricule
  ORDER BY (count(article.ref_article)) DESC
 LIMIT 3;


ALTER TABLE public.vue1 OWNER TO "konan.kouakou";

--
-- Name: vue2; Type: VIEW; Schema: public; Owner: konan.kouakou
--

CREATE VIEW public.vue2 AS
 SELECT article.ref_article,
    article.code,
    article.num_rub
   FROM public.article
  WHERE (article.code IS NOT NULL)
EXCEPT
 SELECT article.ref_article,
    contient.code,
    contient.num_rub
   FROM (public.article
     JOIN public.contient ON (((article.code = contient.code) AND (article.num_rub = contient.num_rub))))
  WHERE ((article.date_intranet IS NOT NULL) AND ((article.etat)::text = 'publier'::text));


ALTER TABLE public.vue2 OWNER TO "konan.kouakou";

--
-- Name: vue3; Type: VIEW; Schema: public; Owner: konan.kouakou
--

CREATE VIEW public.vue3 AS
 SELECT maquette.matricule,
    count(maquette.num_maq) AS nb_maq
   FROM (public.maquette
     JOIN public.acteurs USING (matricule))
  GROUP BY maquette.matricule
  ORDER BY (count(maquette.num_maq)) DESC
 LIMIT 3;


ALTER TABLE public.vue3 OWNER TO "konan.kouakou";

--
-- Name: article num_rub; Type: DEFAULT; Schema: public; Owner: konan.kouakou
--

ALTER TABLE ONLY public.article ALTER COLUMN num_rub SET DEFAULT nextval('public.article_num_rub_seq'::regclass);


--
-- Name: rubrique num_rub; Type: DEFAULT; Schema: public; Owner: konan.kouakou
--

ALTER TABLE ONLY public.rubrique ALTER COLUMN num_rub SET DEFAULT nextval('public.rubrique_num_rub_seq'::regclass);


--
-- Name: t_personne num; Type: DEFAULT; Schema: public; Owner: konan.kouakou
--

ALTER TABLE ONLY public.t_personne ALTER COLUMN num SET DEFAULT nextval('public.t_personne_num_seq'::regclass);


--
-- Data for Name: acteurs; Type: TABLE DATA; Schema: public; Owner: konan.kouakou
--

COPY public.acteurs (matricule, nom, prenom, mail, statut, type, motpass) FROM stdin;
245375K	Khalfa	noémie	noemie.kh@hotmail.fr	salarié	RED  	\N
124427S	Semoine	sylvain	semoine.syl45@gmail.com	travailleur indépendant	MAQ  	\N
156437A	Adrien	diane	adrien.diane8@hotmail.com	salarié	RED  	\N
326424G	Ghaoui	yueene	ghaoui.yuenne@gmail.com	salarié	PIG  	\N
198327D	Dupont	franck	franck-dup45@gmail.com	travailleur indépendant	PIG  	\N
134347S	Lemoine	davide	lemoine.dav@gmail.com	travailleur indépendant	MAQ  	\N
198467k	Koffi	jean	 jean.koffi@gmail.com	salarié	PIG  	\N
1875237S	amelie	ea	ea.amelie@gmail.com	travailleur indépendant	MAQ  	\N
146901D	diao	hamad	 hamad.diao@gmail.com	salarié	MAQ  	\N
198754A	yao	john	jonh1407@gmail.com	travailleur indépendant	PIG  	\N
248796M	Mouaze	thomas	mouaze_th7@outlook.fr	travailleur indépendant	PIG  	\N
542821f	Mabrouk	Fayez	mabroukfayez@gmail.com	administrateur	ADM  	\N
1588467N	clement	barry	 barry.clement@gmail.com	salarié	PIG  	iupupupoip
\.


--
-- Data for Name: article; Type: TABLE DATA; Schema: public; Owner: konan.kouakou
--

COPY public.article (ref_article, titre, chapeau, lien_contenu, nombre_feuillet, etat, date_intranet, matricule, code, num_rub) FROM stdin;
78965458	titre1	d1 	Savoir_vendre/article/78965458	4	publier	2020-05-12	198327D	698	9
94468874	titre2	 d2	Savoir_vendre/article/94468874	3	publier	2020-04-06	248796M	698	1
56448685	titre3	 d3	Savoir_vendre/article/56448685	2	publier	2021-01-02	248796M	985	6
64446418	titre4	 d4	Savoir_vendre/article/64446418	3	publier	2020-05-19	326424G	985	10
8798778	titre8	 d8	Savoir_vendre/article/8798778	3	non_publier	\N	198467k 	\N	3
7676876	titre7	 d7	Savoir_vendre/article/7676876	2	en_attente_publication	2021-04-02	248796M	\N	10
6887678	titre9	 d8	Savoir_vendre/article/6887678	3	non_publier	\N	326424G	\N	11
8787877	titre10	 d10	Savoir_vendre/article/8787877	7	non_publier	\N	326424G	\N	9
77666776	titre5	d5 	Savoir_vendre/article/77666776	4	publier	2020-01-12	198327D	854	2
64846848	titre6	 d6	Savoir_vendre/article/64846848	3	publier	2020-03-06	198754A	854	1
\.


--
-- Data for Name: contient; Type: TABLE DATA; Schema: public; Owner: konan.kouakou
--

COPY public.contient (code, num_rub) FROM stdin;
854	2
854	6
854	7
854	1
854	8
698	11
698	9
698	1
698	5
698	2
963	3
963	4
963	7
963	11
963	8
985	4
985	10
985	7
985	6
985	2
\.


--
-- Data for Name: illustre; Type: TABLE DATA; Schema: public; Owner: konan.kouakou
--

COPY public.illustre (ref_article, lien_img) FROM stdin;
78965458	Savoir_vendre/images/img464
94468874	Savoir_vendre/images/img664
56448685	Savoir_vendre/images/img796
77666776	Savoir_vendre/images/img4654
64446418	Savoir_vendre/images/img75
64846848	Savoir_vendre/images/img944
\.


--
-- Data for Name: illustre_sommaire; Type: TABLE DATA; Schema: public; Owner: konan.kouakou
--

COPY public.illustre_sommaire (num_maq, lien_img) FROM stdin;
9658	Savoir_vendre/images/img198
7458	Savoir_vendre/images/img3605
2541	Savoir_vendre/images/img4654
1463	Savoir_vendre/images/img664
1985	Savoir_vendre/images/img664
1369	Savoir_vendre/images/img796
9632	Savoir_vendre/images/img18
7412	Savoir_vendre/images/img459
1259	Savoir_vendre/images/img18
1793	Savoir_vendre/images/img459
\.


--
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: konan.kouakou
--

COPY public.image (lien_img) FROM stdin;
Savoir_vendre/images/img198
Savoir_vendre/images/img208
Savoir_vendre/images/img3605
Savoir_vendre/images/img4654
Savoir_vendre/images/img554
Savoir_vendre/images/img664
Savoir_vendre/images/img796
Savoir_vendre/images/img464
Savoir_vendre/images/img944
Savoir_vendre/images/img75
Savoir_vendre/images/img18
Savoir_vendre/images/img265
Savoir_vendre/images/img323
Savoir_vendre/images/img459
Savoir_vendre/images/img545
Savoir_vendre/images/img615
Savoir_vendre/images/img798
\.


--
-- Data for Name: maquette; Type: TABLE DATA; Schema: public; Owner: konan.kouakou
--

COPY public.maquette (num_maq, "date_de_création", lien_fichier, code, matricule) FROM stdin;
9658	2020-07-20	S_vendre/maquette/maq208	854	124427S
7458	2020-08-05	S_vendre/maquette/maq3605	854	1875237S
2541	2020-09-09	S_vendre/maquette/maq4654	698	134347S
1463	2020-09-01	S_vendre/maquette/maq554	698	146901D
1985	2020-09-29	S_vendre/maquette/maq664	698	124427S
1369	2020-12-12	S_vendre/maquette/maq796	963	1875237S
9632	2020-12-04	S_vendre/maquette/maq18	963	134347S
7412	2020-12-13	S_vendre/maquette/maq459	963	146901D
1259	2021-03-02	S_vendre/maquette/maq798	985	124427S
1793	2021-02-16	S_vendre/maquette/maq459	985	1875237S
\.


--
-- Data for Name: num_magazine; Type: TABLE DATA; Schema: public; Owner: konan.kouakou
--

COPY public.num_magazine (code, date_publication) FROM stdin;
854	2020-08-12
698	2020-10-12
963	2021-01-12
985	2021-04-12
\.


--
-- Data for Name: pigiste; Type: TABLE DATA; Schema: public; Owner: konan.kouakou
--

COPY public.pigiste (matricule, notoriete) FROM stdin;
326424G	niv2
198327D	niv3
248796M	niv2
198754A	niv4
1588467N	niv1
198467k 	niv4
\.


--
-- Data for Name: pratique; Type: TABLE DATA; Schema: public; Owner: konan.kouakou
--

COPY public.pratique (num, code_loisir) FROM stdin;
5	pon
5	ped
15	des
15	ten
15	ski
\.


--
-- Data for Name: rubrique; Type: TABLE DATA; Schema: public; Owner: konan.kouakou
--

COPY public.rubrique (num_rub, titre) FROM stdin;
1	Challenges
2	Le dossier du mois
3	L’enjeu du mois
4	Portrait
5	Interview
6	Relation clients
7	Fidélisation
8	Zapping
9	Efficacité professionnelle
10	Développement personnel
11	Fiches pratiques
\.


--
-- Data for Name: t_loisir; Type: TABLE DATA; Schema: public; Owner: konan.kouakou
--

COPY public.t_loisir (code_loisir, lib_loisir) FROM stdin;
ped	Pédalo
mus	Musique
jeu	Jeux de société
des	Dessin
pon	Poney
ski	Ski alpin
ten	Tennis
sky	sky
\.


--
-- Data for Name: t_personne; Type: TABLE DATA; Schema: public; Owner: konan.kouakou
--

COPY public.t_personne (num, nom, prenom, titre, date_n, service) FROM stdin;
1	AMARA	Lise	3	1985-12-31	pers
2	FERRADO	Adèle	3	1978-02-08	comm
3	TAILLIEZ	Anne-Laure	2	1938-01-27	pers
4	BRIGNARD	Arnaud	1	1978-09-14	prod
5	ESPOSITO	Arsene	1	1978-02-07	prod
6	DETE	Audrey	2	1958-02-04	pers
7	DESTRUEL	Aurélie	3	1977-07-03	comm
8	FANTHOU	Baptiste	1	1959-03-22	prod
9	CLERIOT	Camille	3	1959-01-21	comm
10	MISEREY	Candice	2	1965-02-14	pers
11	EBINI	Marc	1	1963-02-06	prod
12	CHARLET	Cédric	1	1968-01-19	prod
13	FONTAO	Clément	1	1954-02-09	prod
14	DAGHER	David	1	1978-07-01	prod
15	BRUNNER	Elise	3	1978-08-15	comm
16	GUENOUN	Elodie	2	1914-02-12	pers
17	ALDEBERT	Guillaume	1	1974-12-28	prod
18	REGNIER	Hélène	3	1985-02-15	comm
19	MAILLARD	Isabelle	2	1948-11-24	pers
20	CLARET	Jean-Paul	1	1988-08-31	prod
21	LE DUC	Jessica	2	1979-02-20	pers
22	DECRUZ	Jinane	2	1958-02-02	pers
23	GODIN	José	1	1978-02-10	prod
24	CHAMARE	Josselin	1	1958-01-17	prod
25	BERGER	Julien	1	1978-11-30	prod
26	BERA	Lucas	1	1978-01-12	comm
27	BORDAS	Marie	3	1978-01-13	comm
28	BRUSCIANO	Marie	3	1978-07-16	comm
29	GOVAERT	Marion	3	1978-01-23	comm
30	L'HOTE	Mathieu	1	1970-11-25	pers
31	BARBIER	Omar	1	1978-01-11	prod
32	CHARBONNEAU	Pascale	2	1968-01-18	pers
33	GUILLEAU	Pierre	1	1925-02-13	prod
34	POULET	Raphaelle	2	1971-01-26	pers
35	GRIMARD	Rémi	1	1945-02-11	prod
36	AUTHIA	Stéphane	1	1978-01-29	prod
37	DOUR	Sylvain	1	1998-02-05	prod
38	YINE	Sylvain	1	1978-02-16	prod
\.


--
-- Data for Name: t_service; Type: TABLE DATA; Schema: public; Owner: konan.kouakou
--

COPY public.t_service (code_service, lib_service) FROM stdin;
comm	Commercial
dvlp	Développement
logi	Logistique
pers	Personnel
dire	Direction
prod	Productique
\.


--
-- Name: article_num_rub_seq; Type: SEQUENCE SET; Schema: public; Owner: konan.kouakou
--

SELECT pg_catalog.setval('public.article_num_rub_seq', 12, true);


--
-- Name: rubrique_num_rub_seq; Type: SEQUENCE SET; Schema: public; Owner: konan.kouakou
--

SELECT pg_catalog.setval('public.rubrique_num_rub_seq', 11, true);


--
-- Name: t_personne_num_seq; Type: SEQUENCE SET; Schema: public; Owner: konan.kouakou
--

SELECT pg_catalog.setval('public.t_personne_num_seq', 1, false);


--
-- Name: acteurs acteurs_pkey; Type: CONSTRAINT; Schema: public; Owner: konan.kouakou
--

ALTER TABLE ONLY public.acteurs
    ADD CONSTRAINT acteurs_pkey PRIMARY KEY (matricule);


--
-- Name: article article_pkey; Type: CONSTRAINT; Schema: public; Owner: konan.kouakou
--

ALTER TABLE ONLY public.article
    ADD CONSTRAINT article_pkey PRIMARY KEY (ref_article);


--
-- Name: article article_titre_key; Type: CONSTRAINT; Schema: public; Owner: konan.kouakou
--

ALTER TABLE ONLY public.article
    ADD CONSTRAINT article_titre_key UNIQUE (titre);


--
-- Name: contient contient_pkey; Type: CONSTRAINT; Schema: public; Owner: konan.kouakou
--

ALTER TABLE ONLY public.contient
    ADD CONSTRAINT contient_pkey PRIMARY KEY (code, num_rub);


--
-- Name: illustre illustre_pkey; Type: CONSTRAINT; Schema: public; Owner: konan.kouakou
--

ALTER TABLE ONLY public.illustre
    ADD CONSTRAINT illustre_pkey PRIMARY KEY (ref_article, lien_img);


--
-- Name: illustre_sommaire illustre_sommaire_pkey; Type: CONSTRAINT; Schema: public; Owner: konan.kouakou
--

ALTER TABLE ONLY public.illustre_sommaire
    ADD CONSTRAINT illustre_sommaire_pkey PRIMARY KEY (num_maq, lien_img);


--
-- Name: image image_pkey; Type: CONSTRAINT; Schema: public; Owner: konan.kouakou
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (lien_img);


--
-- Name: maquette maquette_pkey; Type: CONSTRAINT; Schema: public; Owner: konan.kouakou
--

ALTER TABLE ONLY public.maquette
    ADD CONSTRAINT maquette_pkey PRIMARY KEY (num_maq);


--
-- Name: num_magazine num_magazine_pkey; Type: CONSTRAINT; Schema: public; Owner: konan.kouakou
--

ALTER TABLE ONLY public.num_magazine
    ADD CONSTRAINT num_magazine_pkey PRIMARY KEY (code);


--
-- Name: pigiste pigiste_pkey; Type: CONSTRAINT; Schema: public; Owner: konan.kouakou
--

ALTER TABLE ONLY public.pigiste
    ADD CONSTRAINT pigiste_pkey PRIMARY KEY (matricule);


--
-- Name: t_loisir pk_loisir; Type: CONSTRAINT; Schema: public; Owner: konan.kouakou
--

ALTER TABLE ONLY public.t_loisir
    ADD CONSTRAINT pk_loisir PRIMARY KEY (code_loisir);


--
-- Name: t_personne pk_personne; Type: CONSTRAINT; Schema: public; Owner: konan.kouakou
--

ALTER TABLE ONLY public.t_personne
    ADD CONSTRAINT pk_personne PRIMARY KEY (num);


--
-- Name: t_service pk_service; Type: CONSTRAINT; Schema: public; Owner: konan.kouakou
--

ALTER TABLE ONLY public.t_service
    ADD CONSTRAINT pk_service PRIMARY KEY (code_service);


--
-- Name: pratique pratique_pkey; Type: CONSTRAINT; Schema: public; Owner: konan.kouakou
--

ALTER TABLE ONLY public.pratique
    ADD CONSTRAINT pratique_pkey PRIMARY KEY (num, code_loisir);


--
-- Name: rubrique rubrique_pkey; Type: CONSTRAINT; Schema: public; Owner: konan.kouakou
--

ALTER TABLE ONLY public.rubrique
    ADD CONSTRAINT rubrique_pkey PRIMARY KEY (num_rub);


--
-- Name: rubrique rubrique_titre_key; Type: CONSTRAINT; Schema: public; Owner: konan.kouakou
--

ALTER TABLE ONLY public.rubrique
    ADD CONSTRAINT rubrique_titre_key UNIQUE (titre);


--
-- Name: article article_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: konan.kouakou
--

ALTER TABLE ONLY public.article
    ADD CONSTRAINT article_code_fkey FOREIGN KEY (code) REFERENCES public.num_magazine(code);


--
-- Name: article article_matricule_fkey; Type: FK CONSTRAINT; Schema: public; Owner: konan.kouakou
--

ALTER TABLE ONLY public.article
    ADD CONSTRAINT article_matricule_fkey FOREIGN KEY (matricule) REFERENCES public.pigiste(matricule);


--
-- Name: article article_num_rub_fkey; Type: FK CONSTRAINT; Schema: public; Owner: konan.kouakou
--

ALTER TABLE ONLY public.article
    ADD CONSTRAINT article_num_rub_fkey FOREIGN KEY (num_rub) REFERENCES public.rubrique(num_rub);


--
-- Name: contient code; Type: FK CONSTRAINT; Schema: public; Owner: konan.kouakou
--

ALTER TABLE ONLY public.contient
    ADD CONSTRAINT code FOREIGN KEY (code) REFERENCES public.num_magazine(code);


--
-- Name: illustre illustre_lien_img_fkey; Type: FK CONSTRAINT; Schema: public; Owner: konan.kouakou
--

ALTER TABLE ONLY public.illustre
    ADD CONSTRAINT illustre_lien_img_fkey FOREIGN KEY (lien_img) REFERENCES public.image(lien_img);


--
-- Name: illustre illustre_ref_article_fkey; Type: FK CONSTRAINT; Schema: public; Owner: konan.kouakou
--

ALTER TABLE ONLY public.illustre
    ADD CONSTRAINT illustre_ref_article_fkey FOREIGN KEY (ref_article) REFERENCES public.article(ref_article);


--
-- Name: illustre_sommaire illustre_sommaire_lien_img_fkey; Type: FK CONSTRAINT; Schema: public; Owner: konan.kouakou
--

ALTER TABLE ONLY public.illustre_sommaire
    ADD CONSTRAINT illustre_sommaire_lien_img_fkey FOREIGN KEY (lien_img) REFERENCES public.image(lien_img);


--
-- Name: illustre_sommaire illustre_sommaire_num_maq_fkey; Type: FK CONSTRAINT; Schema: public; Owner: konan.kouakou
--

ALTER TABLE ONLY public.illustre_sommaire
    ADD CONSTRAINT illustre_sommaire_num_maq_fkey FOREIGN KEY (num_maq) REFERENCES public.maquette(num_maq);


--
-- Name: maquette maquette_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: konan.kouakou
--

ALTER TABLE ONLY public.maquette
    ADD CONSTRAINT maquette_code_fkey FOREIGN KEY (code) REFERENCES public.num_magazine(code);


--
-- Name: maquette maquette_matricule_fkey; Type: FK CONSTRAINT; Schema: public; Owner: konan.kouakou
--

ALTER TABLE ONLY public.maquette
    ADD CONSTRAINT maquette_matricule_fkey FOREIGN KEY (matricule) REFERENCES public.acteurs(matricule);


--
-- Name: contient num_rub; Type: FK CONSTRAINT; Schema: public; Owner: konan.kouakou
--

ALTER TABLE ONLY public.contient
    ADD CONSTRAINT num_rub FOREIGN KEY (num_rub) REFERENCES public.rubrique(num_rub);


--
-- Name: pratique pratique_code_loisir_fkey; Type: FK CONSTRAINT; Schema: public; Owner: konan.kouakou
--

ALTER TABLE ONLY public.pratique
    ADD CONSTRAINT pratique_code_loisir_fkey FOREIGN KEY (code_loisir) REFERENCES public.t_loisir(code_loisir);


--
-- Name: pratique pratique_num_fkey; Type: FK CONSTRAINT; Schema: public; Owner: konan.kouakou
--

ALTER TABLE ONLY public.pratique
    ADD CONSTRAINT pratique_num_fkey FOREIGN KEY (num) REFERENCES public.t_personne(num);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

