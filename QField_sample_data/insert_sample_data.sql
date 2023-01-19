--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Debian 15.1-1.pgdg110+1)
-- Dumped by pg_dump version 15.1

-- Started on 2023-01-19 16:33:54

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
-- TOC entry 6187 (class 0 OID 16390)
-- Dependencies: 224
-- Data for Name: job; Type: TABLE DATA; Schema: cron; Owner: docker
--



--
-- TOC entry 6189 (class 0 OID 16409)
-- Dependencies: 226
-- Data for Name: job_run_details; Type: TABLE DATA; Schema: cron; Owner: docker
--



--
-- TOC entry 6191 (class 0 OID 16738)
-- Dependencies: 228
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: docker
--



--
-- TOC entry 6364 (class 0 OID 18700)
-- Dependencies: 248
-- Data for Name: anchor_point; Type: TABLE DATA; Schema: tempaqua_sample; Owner: docker
--

INSERT INTO tempaqua_sample.anchor_point VALUES ('B1', NULL, 'BVU', 'surface_water', 'anchor point', '0101000020E6100000EAC15BDA9EDB1A40FB83770DB44B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('B11', 'BA76', 'BVU', 'surface_water', 'anchor point', '0101000020E610000059D7D1DE0BDC1A407058EBEF904B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('B12', 'BA75', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000DB6A6E9253DC1A403385AC68994B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('B13', 'BA72', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000728FEA98A9DC1A404BD12D439F4B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('B14', 'J1', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000F54AED4494DB1A40B28ABD1BAE4B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('B15', 'BA13', 'BVU', 'surface_water', 'anchor point', '0101000020E610000006B4E22161DB1A40E6A5C4E2A14B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('B16', 'BA24', 'BVU', 'surface_water', 'anchor point', '0101000020E61000006D4DC45F02DC1A40C2BF34EDB04B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('B17', 'J9', 'BVU', 'surface_water', 'anchor point', '0101000020E61000006F46B09A31DD1A40F92EF9667C4B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('B18', 'BA51', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000C109FDEF10DD1A4023AB02248D4B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('B2', 'BA2', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000ED84B2AB13DD1A40D6D3057C564B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('B3', 'BA11', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000C5EB3406A6DC1A40A0B42BA3614B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('B4', 'BA6', 'BVU', 'surface_water', 'anchor point', '0101000020E61000004280E9309BDC1A408A90D6DF514B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('B5', 'J6', 'BVU', 'surface_water', 'anchor point', '0101000020E610000059BDA62FB6DC1A40027FB36C8F4B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('B6', 'BA13', 'BVU', 'surface_water', 'anchor point', '0101000020E61000003EBC9C2855DB1A40246ADD4AA54B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('B7', 'J8', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000D19FEB7DE4DC1A405ECEACC8864B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('B8', 'BA94', 'BVU', 'surface_water', 'anchor point', '0101000020E61000003C9971380EDC1A407EB5CDFC6F4B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('B9', 'BA43', 'BVU', 'surface_water', 'anchor point', '0101000020E610000007FED8188FDE1A405C90FABD874B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA100', 'BA101', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000AF760F7858DB1A400878E181664B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA101', 'BA102', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000E7EE351492DB1A404A857D906B4B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA102', 'BA99', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000DA953722A1DB1A407DEC7C83704B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA103', 'BA78', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000C5E0A90AA0DB1A40F687C98C8F4B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA104', 'BA31', 'BVU', 'surface_water', 'anchor point', '0101000020E610000007B3784AA7DD1A40B5CCA489C94B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA105', 'BA71', 'BVU', 'surface_water', 'anchor point', '0101000020E610000044A7F0874ADE1A40EA7F9EED6C4B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA106', 'BA71', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000FCABB1DF2FDE1A405CF895C2654B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA107', 'BA86', 'BVU', 'surface_water', 'anchor point', '0101000020E61000001D9138C811DC1A409C2CD7E3804B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA108', 'BA107', 'BVU', 'surface_water', 'anchor point', '0101000020E61000003F1587FE07DC1A409C89E6757C4B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA109', 'BA78', 'BVU', 'surface_water', 'anchor point', '0101000020E61000001A720DEC96DB1A40DDF9C068934B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA11', 'BA61', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000A23C96B23EDD1A40528925EB714B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA110', 'BA80', 'BVU', 'surface_water', 'anchor point', '0101000020E61000008F296D5296DB1A40ED75BEE1894B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA111', 'BA34', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000DB7758D1DBDD1A40AF2077ACC14B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA112', 'BA35', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000F83B7E50FFDD1A40C1A3E1E2AF4B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA113', 'BA112', 'BVU', 'surface_water', 'anchor point', '0101000020E610000018CBB2F111DE1A407485B0D5AA4B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA114', 'BA19', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000413445C92FDB1A4056374A71934B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA115', 'BA44', 'BVU', 'surface_water', 'anchor point', '0101000020E610000035518E9972E01A4081CD0971934B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA116', 'BA105', 'BVU', 'surface_water', 'anchor point', '0101000020E610000015CA901B13E01A402F715EB3794B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA117', 'BA64', 'BVU', 'surface_water', 'anchor point', '0101000020E61000000BC977B9FBDD1A40BE83D51B6C4B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA118', 'BA119', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000C65DA01A6DDC1A4008627970644B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA119', 'BA96', 'BVU', 'surface_water', 'anchor point', '0101000020E61000009055F39D64DC1A40C1E865C26C4B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA12', 'B14', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000A549B31E81DB1A4003573B0BAA4B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA120', 'BA119', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000576FE6501FDC1A400A688CEA6A4B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA121', 'BA70', 'BVU', 'surface_water', 'anchor point', '0101000020E610000082A5654428DD1A4063A79D734F4B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA122', 'B2', 'BVU', 'surface_water', 'anchor point', '0101000020E61000005F4EB531DFDC1A409689E0FA384B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA13', 'BA12', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000EE17DAFD5FDB1A4095E9444BA64B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA14', 'BA15', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000A4B51A4F13DB1A4085DBED5C8D4B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA15', 'BA16', 'BVU', 'surface_water', 'anchor point', '0101000020E61000003CFB9A1B0FDB1A4099A8B150934B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA16', 'BA17', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000376269500FDB1A405FCEEC699C4B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA17', 'B6', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000F2FB880F1FDB1A40180B2DE5A24B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA19', 'BA18', 'BVU', 'surface_water', 'anchor point', '0101000020E610000073AEE8F769DB1A40C362B881934B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA2', 'BA3', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000D496A19D23DD1A40EB6E6EDD5F4B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA20', 'BA19', 'BVU', 'surface_water', 'anchor point', '0101000020E61000001558A46F73DB1A403D2837178D4B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA21', 'BA22', 'BVU', 'surface_water', 'anchor point', '0101000020E610000064B7BB160DDB1A4020F653F8754B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA22', 'BA23', 'BVU', 'surface_water', 'anchor point', '0101000020E610000077AFD40B5FDB1A40215ED48A7C4B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA23', 'BA20', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000C540E8919FDB1A40054C3BE87F4B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA24', 'J1', 'BVU', 'surface_water', 'anchor point', '0101000020E610000095C48F0AE7DB1A401BA82D9CB04B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA26', 'B16', 'BVU', 'surface_water', 'anchor point', '0101000020E61000009776E84D7EDC1A408F5CD869AF4B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA28', 'BA26', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000E3043A6CF7DC1A40040D8A53B94B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('B10', 'BA28', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000AEBC18572BDD1A400881C34CBC4B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA3', 'BA4', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000FC7E0F7030DD1A4014E06896664B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA30', 'B10', 'BVU', 'surface_water', 'anchor point', '0101000020E61000001D721FF56BDD1A401C188076BC4B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA31', 'BA30', 'BVU', 'surface_water', 'anchor point', '0101000020E61000006F131A4664DD1A40AAE76DDBC14B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA33', 'BA30', 'BVU', 'surface_water', 'anchor point', '0101000020E61000007EEFA2D872DD1A40D2270E10BA4B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA34', 'BA33', 'BVU', 'surface_water', 'anchor point', '0101000020E61000006250F577CFDD1A402AF2AAFCBA4B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA37', 'BA33', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000F9760D13AFDD1A40E015B9A7A64B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA38', 'BA37', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000A4133521D2DD1A402BC056B99E4B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA39', 'BA38', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000D9ED3847EDDD1A409328C129964B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA4', 'J5', 'BVU', 'surface_water', 'anchor point', '0101000020E610000044F16FD237DD1A40FEF034D76B4B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA40', 'BA41', 'BVU', 'surface_water', 'anchor point', '0101000020E61000008E9EB24005DE1A407876ACFF8F4B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA43', 'BA58', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000973A41313ADE1A4039C91800864B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA44', 'BA45', 'BVU', 'surface_water', 'anchor point', '0101000020E610000076E57D51E9DF1A40D1AE42A38F4B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA45', 'BA46', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000CD71D84CBADF1A40CC9C1F348E4B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA46', 'BA47', 'BVU', 'surface_water', 'anchor point', '0101000020E61000007A7C017286DF1A403747A3168D4B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA47', 'B9', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000838FDB894ADF1A4044347D138C4B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA5', 'BA4', 'BVU', 'surface_water', 'anchor point', '0101000020E610000006A163DBD0DC1A40FFA742125D4B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA51', 'J6', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000F8B37266E4DC1A400EA3FD9D8E4B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA53', 'B18', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000DFF1E85151DD1A4047E34FEE8A4B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA55', 'BA53', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000D3E72F24B5DD1A40C2F50AE68D4B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA56', 'BA55', 'BVU', 'surface_water', 'anchor point', '0101000020E61000000D1F7611EFDD1A40094F0E02904B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA58', 'BA53', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000D971D428BDDD1A4052B5FF93864B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA6', 'BA5', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000DE645285B3DC1A409FB21E15584B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA61', 'B17', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000C1B980CC44DD1A400A8066E0784B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA62', 'BA61', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000EAA90D107ADD1A4059447190764B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA64', 'BA62', 'BVU', 'surface_water', 'anchor point', '0101000020E610000035368272C5DD1A4043AF9912714B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA65', 'BA64', 'BVU', 'surface_water', 'anchor point', '0101000020E61000009D0E3191BCDD1A406BBDCA4C6D4B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA67', 'J5', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000B45055977DDD1A40F3886D766A4B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA69', 'BA68', 'BVU', 'surface_water', 'anchor point', '0101000020E610000054D93CF3C2DD1A4082F45E69614B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA7', 'B4', 'BVU', 'surface_water', 'anchor point', '0101000020E61000007F8477D27DDC1A403DEC27464E4B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA70', 'BA69', 'BVU', 'surface_water', 'anchor point', '0101000020E61000008B9E71226ADD1A406D995DB0554B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA71', 'BA69', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000C9FDEBFE0FDE1A40EE040AEB684B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA72', 'BA75', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000D2A6D19792DC1A402EEBA9519F4B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA73', 'B13', 'BVU', 'surface_water', 'anchor point', '0101000020E610000051E9ACFBCFDC1A40C9EA3A509F4B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA75', 'BA24', 'BVU', 'surface_water', 'anchor point', '0101000020E610000070A2637B7BDC1A403943780DA44B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA76', 'B12', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000ADF9E4E022DC1A40735DDC7D934B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA78', 'BA76', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000AA28475BF1DB1A40B1DEE929934B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA79', 'B11', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000DD595277E2DB1A40A00E6E7E8B4B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA8', 'B3', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000D137B8C86EDC1A404D9003F05A4B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA80', 'BA79', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000B73DB109C2DB1A40A6D45AD98A4B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA81', 'BA79', 'BVU', 'surface_water', 'anchor point', '0101000020E61000002092FF29D8DB1A40882A6166874B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA82', 'BA81', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000A3126C88C2DB1A40AF6D1FF87D4B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA85', 'B5', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000B53EC9545CDC1A4082EA77C68D4B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA86', 'BA85', 'BVU', 'surface_water', 'anchor point', '0101000020E61000001E0D4C5D3DDC1A40F6D8AD2D894B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA87', 'J7', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000ADEF60B897DC1A4010277363894B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA88', 'BA87', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000A9C770164CDC1A406F4F6D8B824B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA90', 'B8', 'BVU', 'surface_water', 'anchor point', '0101000020E61000002D750F7BD1DB1A4037D009616B4B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA91', 'BA90', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000E412CDD266DB1A4024893CE2624B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA92', 'BA91', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000611F6F35EBDA1A40C22B2341564B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA93', 'B7', 'BVU', 'surface_water', 'anchor point', '0101000020E61000002A810B5ACCDC1A40C5568D13834B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA94', 'BA93', 'BVU', 'surface_water', 'anchor point', '0101000020E610000017934E0265DC1A40E7041A58764B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA95', 'J9', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000B51A400DFADC1A405A57AEB6784B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA96', 'BA95', 'BVU', 'surface_water', 'anchor point', '0101000020E61000002D501B508CDC1A4024886EA66F4B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA97', 'BA40', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000F525CA6FF5DD1A40825F4C6F944B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA98', 'BA92', 'BVU', 'surface_water', 'anchor point', '0101000020E610000017B08FF1A3DA1A40043DE41C524B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('BA99', 'BA82', 'BVU', 'surface_water', 'anchor point', '0101000020E6100000CCA6B076B8DB1A402DEBE5CB794B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('J1', 'B1', 'BVU', 'surface_water', 'junction', '0101000020E6100000BA34AE08B2DB1A4098986C91B24B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('J5', 'BA11', 'BVU', 'surface_water', 'junction', '0101000020E6100000B0AA0D8740DD1A40FA35C2CC704B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('J6', 'BA72', 'BVU', 'surface_water', 'junction', '0101000020E61000005AC4DE6EDDDC1A40F44F6DCA8F4B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('J7', 'BA51', 'BVU', 'surface_water', 'junction', '0101000020E6100000591F856EE4DC1A4051B488528E4B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('J8', 'J7', 'BVU', 'surface_water', 'junction', '0101000020E6100000CDA13357F8DC1A40C0220DB6884B4740');
INSERT INTO tempaqua_sample.anchor_point VALUES ('J9', 'J8', 'BVU', 'surface_water', 'junction', '0101000020E6100000D563D3CE16DD1A4019138844824B4740');


--
-- TOC entry 6192 (class 0 OID 17602)
-- Dependencies: 233
-- Data for Name: topology; Type: TABLE DATA; Schema: topology; Owner: docker
--



--
-- TOC entry 6193 (class 0 OID 17614)
-- Dependencies: 234
-- Data for Name: layer; Type: TABLE DATA; Schema: topology; Owner: docker
--



--
-- TOC entry 6370 (class 0 OID 0)
-- Dependencies: 223
-- Name: jobid_seq; Type: SEQUENCE SET; Schema: cron; Owner: docker
--

SELECT pg_catalog.setval('cron.jobid_seq', 1, false);


--
-- TOC entry 6371 (class 0 OID 0)
-- Dependencies: 225
-- Name: runid_seq; Type: SEQUENCE SET; Schema: cron; Owner: docker
--

SELECT pg_catalog.setval('cron.runid_seq', 1, false);


-- Completed on 2023-01-19 16:33:54

--
-- PostgreSQL database dump complete
--

