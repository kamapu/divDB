alter table bib_references.main_table rename column bib_type to bibtype;
alter table "bib_references"."main_table"
add column "journal" text,
add column "note" text,
add column "collection" text,
add column "ppn_gvk" text;
comment on column "bib_references"."main_table"."journal" is 'Or ‘journaltitle’.';
comment on column "bib_references"."main_table"."note" is 'Miscellaneous extra information.';
comment on column "bib_references"."main_table"."collection" is 'JabRef specific field for collection';
comment on column "bib_references"."main_table"."ppn_gvk" is 'JabRef specific field (probably the key in the German Book Catalogue).';

-- Inserting rows
insert into "bib_references"."main_table" ("bibtype","bibtexkey","address","author","booktitle","chapter","collection","comment","copyright","date","doi","ean","edition","editor","eventdate","eventtitle","institution","isbn","issn","issue","journal","journaltitle","keywords","language","location","maintitle","month","note","number","organization","pages","pagetotal","ppn_gvk","publisher","pubstate","series","subtitle","title","type","url","version","volume","volumes","year")
values
('Article','MartinezHarms2008',null,'Martínez-Harms, María José and Gajardo, Rodolfo',null,null,null,null,null,'2008-06','10.1016/j.jnc.2008.02.002',null,null,null,null,null,null,null,'1617-1381',null,null,'Journal for Nature Conservation',null,null,null,null,null,null,'2',null,'72--87',null,null,'Elsevier BV',null,null,null,'Ecosystem value in the Western Patagonia protected areas',null,null,null,'16',null,'2008'),
('Article','PerezMoreau1938',null,'Rom{\''a}n A P{\''e}rez-Moreau',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'Lilloa',null,null,null,null,null,null,'2',null,'413–463',null,null,null,null,null,null,'Revisión de las \emph{Hydrocotyle} argentinas',null,null,null,'2',null,'1938'),
('Book','Luebert2017','Santiago','Federico Luebert and Patricio Pliscoff',null,null,null,null,null,'2017',null,null,null,null,null,null,null,'9789561125759',null,null,null,null,null,null,null,null,null,null,null,null,null,'384',null,'Editorial Universitaria',null,'Biodiversidad',null,'Sinopsis bioclimática y vegetacional de {Chile}',null,null,null,null,null,null),
('Article','RosCandeira2020',null,'Andrea Ros-Candeira and Ricardo Moreno-Llorca and Domingo Alcaraz-Segura and Francisco Javier Bonet-Garc{\''{\i}}a and Ana Sofia Vaz',null,null,null,null,null,null,'10.3897/natureconservation.38.38325',null,null,null,null,null,null,null,null,null,null,'Nature Conservation',null,null,null,null,null,null,null,null,'1--12',null,null,'Pensoft Publishers',null,null,null,'Social media photo content for Sierra Nevada: a dataset to support the assessment of cultural ecosystem services in protected areas',null,null,null,'38',null,'2020'),
('InCollection','Leps2013',null,'Lepš, Jan','Vegetation Ecology',null,null,null,null,'2013-01','10.1002/9781118452592.ch11',null,null,null,null,null,null,'9781118452592',null,null,null,'Vegetation Ecology',null,null,null,null,null,null,null,null,'308--346',null,null,'Wiley',null,null,null,'Diversity and ecosystem function',null,null,null,null,null,null),
('Article','Gonzalez2022',null,'González, Mauro E. and Galleguillos, Mauricio and Lopatin, Javier and Leal, Claudia and Becerra-Rodas, Constanza and Lara, Antonio and San Martín, José',null,null,null,null,null,'2022-10','10.1017/s0030605322000102',null,null,null,null,null,null,null,'1365-3008',null,null,'Oryx',null,null,null,null,null,null,'2',null,'228--238',null,null,'Cambridge University Press (CUP)',null,null,null,'Surviving in a hostile landscape: Nothofagus alessandrii remnant forests threatened by mega-fires and exotic pine invasion in the coastal range of central Chile',null,null,null,'57',null,null),
('Article','CaceresNovoa2024',null,'Cáceres Novoa, Natalia and Meneses Jiménez, Francisca and Fuenzalida Carrión, Javiera and Vidal Ojeda, Osvaldo and Bannister Hepp, Jan',null,null,null,null,null,'2024-01','10.52904/0718-4646.2023.597',null,null,null,null,null,null,null,'0718-4530',null,null,'Ciencia &amp; Investigación Forestal',null,null,null,null,null,null,null,null,'21--44',null,null,'Instituto Forestal',null,null,null,'Diagnóstico del estado actual de los bosques nativos de las islas menores de la región de Los Lagos, Chile.',null,null,null,null,null,null),
('Article','CruzAlonso2023',null,'Cruz-Alonso, Verónica and Pucher, Christoph and Ratcliffe, Sophia and Ruiz-Benito, Paloma and Astigarraga, Julen and Neumann, Mathias and Hasenauer, Hubert and Rodríguez-Sánchez, Francisco',null,null,null,null,null,'2023-03','10.1016/j.envsoft.2023.105627',null,null,null,null,null,null,null,'1364-8152',null,null,'Environmental Modelling &amp; Software',null,null,null,null,null,null,null,null,'105627',null,null,'Elsevier BV',null,null,null,'The easyclimate R package: Easy access to high-resolution daily climate data for Europe',null,null,null,'161',null,null),
('Book','Porma2021',null,'Pablo A. A. Porma',null,null,null,'- Recetario Mapuche',null,'2021',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'Fill Iaguel',null,'https://www.saludoriente.cl/websaludoriente/wp-content/uploads/2021/07/Recetario-Mapuche.pdf',null,null,null,null),
('Article','Augustine2024',null,'Augustine, Steven P. and Bailey‐Marren, Isaac and Charton, Katherine T. and Kiel, Nathan G. and Peyton, Michael S.',null,null,null,null,null,'2024-01','10.1111/gcb.17116',null,null,null,null,null,null,null,'1365-2486',null,null,'Global Change Biology',null,null,null,null,null,null,'1',null,null,null,null,'Wiley',null,null,null,'Improper data practices erode the quality of global ecological databases and impede the progress of ecological research',null,null,null,'30',null,null),
('Article','Gudesho2022',null,'Gudesho, Girma and Woldu, Zerihun',null,null,null,null,null,'2022-04','10.22271/tpr.2022.v9.i1.001',null,null,null,null,null,null,null,'2349-1183',null,null,'Tropical Plant Research',null,null,null,null,null,null,'1',null,'1--15',null,null,'AkiNik Publications',null,null,null,'Plant community along age and disturbance gradients of dry Afromontane forest patches of Wombera district, Benshangul Gumuz, Ethiopia',null,null,null,'9',null,null),
('Article','Bodin2024',null,'Bodin, Stéphanie C. and Neumann, Katharina and Hensel, Elena A. and Vogelsang, Ralf and Demissew, Sebsebe and Casas-Gallego, Manuel and Hahn, Karen',null,null,null,null,null,'2024-01','10.1007/s00334-023-00977-3',null,null,null,null,null,null,null,'1617-6278',null,null,'Vegetation History and Archaeobotany',null,null,null,null,null,null,null,null,null,null,null,'Springer Science and Business Media LLC',null,null,null,'Afromontane forests and human impact after the African Humid Period: wood charcoal from the Sodicho rock shelter, SW Ethiopian highlands',null,null,null,null,null,null),
('Article','Meyer2023',null,'Meyer, Raïssa and Appeltans, Ward and Duncan, William and Dimitrova, Mariya and Gan, Yi-Ming and Stjernegaard Jeppesen, Thomas and Mungall, Christopher and Paul, Deborah and Provoost, Pieter and Robertson, Tim and Schriml, Lynn and Suominen, Saara and Walls, Ramona and Sweetlove, Maxime and Ung, Visotheary and Van de Putte, Anton and Wallis, Elycia and Wieczorek, John and Buttigieg, Pier',null,null,null,null,null,'2023-10','10.3897/bdj.11.e112420',null,null,null,null,null,null,null,'1314-2836',null,null,'Biodiversity Data Journal',null,null,null,null,null,null,null,null,null,null,null,'Pensoft Publishers',null,null,null,'Aligning Standards Communities for Omics Biodiversity Data: Sustainable Darwin Core-MIxS Interoperability',null,null,null,'11',null,null),
('Article','Hubert2023',null,'Hubert, Mali M. and Schweitzer, Jennifer A. and Giam, Xingli and Papeş, Monica',null,null,null,'- Example of use of PERMANOVA',null,'2023-05','10.1002/ecs2.4520',null,null,null,null,null,null,null,'2150-8925',null,null,'Ecosphere',null,null,null,null,null,null,'5',null,null,null,null,'Wiley',null,null,null,'Contrasting effects of urbanization and fire on understory plant communities in the natural and wildland–urban interface',null,null,null,'14',null,null),
('Article','Green2019',null,'Green, Matthew D. and Miller, Thomas E.',null,null,null,'- Use of PERMANOVA?',null,'2019-03','10.1007/s12237-019-00550-0',null,null,null,null,null,null,null,'1559-2731',null,null,'Estuaries and Coasts',null,null,null,null,null,null,'4',null,'1097--1103',null,null,'Springer Science and Business Media LLC',null,null,null,'Germination Traits Explain Deterministic Processes in the Assembly of Early Successional Coastal Dune Vegetation',null,null,null,'42',null,null),
('Article','Leps1999',null,'Lepš, Jan',null,null,null,null,null,'1999-04','10.2307/3237143',null,null,null,null,null,null,null,'1654-1103',null,null,'Journal of Vegetation Science',null,null,null,null,null,null,'2',null,'219--230',null,null,'Wiley',null,null,null,'Nutrient status, disturbance and competition: an experimental test of relationships in a wet meadow',null,null,null,'10',null,null),
('Article','Bazzichetto2023',null,'Bazzichetto, Manuele and Lenoir, Jonathan and Da Re, Daniele and Tordoni, Enrico and Rocchini, Duccio and Malavasi, Marco and Barták, Vojtech and Sperandii, Marta Gaia',null,null,null,null,null,'2023-07','10.1111/geb.13725',null,null,null,null,null,null,null,'1466-8238',null,null,'Global Ecology and Biogeography',null,null,null,null,null,null,'10',null,'1717--1729',null,null,'Wiley',null,null,null,'Sampling strategy matters to accurately estimate response curves’ parameters in species distribution models',null,null,null,'32',null,null),
('Book','Leps2020a',null,'Lepš, Jan and Šmilauer, Petr',null,null,null,null,null,'2020-07','10.1017/9781108616041',null,null,null,null,null,null,'9781108727341',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'Cambridge University Press',null,null,null,'Biostatistics with R: An Introductory Guide for Field Biologists',null,null,null,null,null,null),
('Book','Smilauer2014',null,'Šmilauer, Petr and Lepš, Jan',null,null,null,null,null,'2014',null,null,'2. ed.',null,null,null,null,'9781107694408',null,null,null,null,null,null,'New York, NY',null,null,'Includes bibliographical references and index',null,null,null,'362','1608574326','Cambridge University Press',null,null,null,'Multivariate analysis of ecological data using CANOCO 5',null,null,null,null,null,null),
('Book','Thioulouse2018',null,'Thioulouse, Jean and Dray, Stéphane and Dufour, Anne-Béatrice and Siberchicot, Aurélie and Jombart, Thibaut and Pavoine, Sandrine',null,null,null,null,null,'2018','10.1007/978-1-4939-8850-1',null,null,null,null,null,null,'9781493988501',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'Springer New York',null,null,null,'Multivariate Analysis of Ecological Data with ade4',null,null,null,null,null,null),
('Article','Dray2007',null,'Dray, Stéphane and Dufour, Anne B. and Chessel, Daniel',null,null,null,null,null,null,null,null,null,null,null,null,null,null,'1609-3631','2','R News',null,null,null,null,null,null,null,null,null,'47--52',null,null,null,null,null,null,'The ade4 package–II: Two-table and {K}-table methods',null,'https://journal.r-project.org/articles/RN-2007-019/',null,'7',null,'2007'),
('Misc','Rudner2007',null,'Michael Rudner and Hiltrud Brose',null,null,null,null,null,'2007',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'Multivariate Methoden in der Vegetationskunde -- Kursskript',null,null,null,null,null,null),
('Article','Ndiritu2021',null,'Ndiritu, George G. and Terer, Taita and Njoroge, Peter and Muiruri, Veronica M. and Njagi, Edward L. and Kosgei, Gilbert and Njoroge, Laban and Kamau, Peris W. and Malonza, Patrick K. and Muchane, Mary and Gathua, Joseph and Odeny, Dickens and Courtemanch, David',null,null,null,null,null,'2021-07','10.3389/fenvs.2021.671051',null,null,null,null,null,null,null,'2296-665X',null,null,'Frontiers in Environmental Science',null,null,null,null,null,null,null,null,null,null,null,'Frontiers Media SA',null,null,null,'Using the Biological Condition Gradient Model as a Bioassessment Framework to Support Rehabilitation and Restoration of the Upper Tana River Watershed in Kenya',null,null,null,'9',null,null),
('Article','Sieben2016a',null,'Sieben, E.J.J. and Nyambeni, T. and Mtshali, H. and Corry, F.T.J. and Venter, C.E. and MacKenzie, D.R. and Matela, T.E. and Pretorius, L. and Kotze, D.C.',null,null,null,null,null,'2016-05','10.1016/j.sajb.2015.11.005',null,null,null,null,null,null,null,'0254-6299',null,null,'South African Journal of Botany',null,null,null,null,null,null,null,null,'158--166',null,null,'Elsevier BV',null,null,null,'The herbaceous vegetation of subtropical freshwater wetlands in South Africa: Classification, description and explanatory environmental factors',null,null,null,'104',null,null),
('Article','Sieben2016b',null,'Sieben, E.J.J. and Collins, N.B. and Corry, F.T.J. and Kotze, D.C. and Job, N. and Muasya, A.M. and Venter, C.E. and Mtshali, H. and Zondo, S.A. and Janks, M. and Pretorius, L.',null,null,null,null,null,'2016-05','10.1016/j.sajb.2015.11.003',null,null,null,null,null,null,null,'0254-6299',null,null,'South African Journal of Botany',null,null,null,null,null,null,null,null,'215--224',null,null,'Elsevier BV',null,null,null,'The vegetation of grass lawn wetlands of floodplains and pans in semi-arid regions of South Africa: Description, classification and explanatory environmental factors',null,null,null,'104',null,null),
('Article','Cleaver2004',null,'Cleaver, G. and Brown, L.R. and Bredenkamp, G.J.',null,null,null,null,null,'2004-12','10.4102/koedoe.v47i2.78',null,null,null,null,null,null,null,'0075-6458',null,null,'Koedoe',null,null,null,null,null,null,'2',null,null,null,null,'AOSIS',null,null,null,'A vegetation description and floristic analyses of the springs on the Kammanassie Mountain, Western Cape',null,null,null,'47',null,null),
('Article','duToit2021',null,'{du Toit}, M.J. and Du Preez, C. and Cilliers, S.S.',null,null,null,null,null,'2021-02','10.38201/btha.abc.v51.i1.4',null,null,null,null,null,null,null,'0006-8241',null,null,'Bothalia, African Biodiversity &amp; Conservation',null,null,null,null,null,null,'1',null,null,null,null,'South African National Biodiversity Institute',null,null,null,'Plant diversity and conservation value of wetlands along a rural–urban gradient',null,null,null,'51',null,null),
('Article','Cilliers2012',null,'Cilliers, Sarel S. and Siebert, Stefan J.',null,null,null,null,null,'2012','10.5751/es-05146-170333',null,null,null,null,null,null,null,'1708-3087',null,null,'Ecology and Society',null,null,null,null,null,null,'3',null,null,null,null,'Resilience Alliance, Inc.',null,null,null,'Urban Ecology in Cape Town: South African Comparisons and Reflections',null,null,null,'17',null,null),
('Article','Cilliers1999',null,'Cilliers, S.S. and Bredenkamp, G.J.',null,null,null,null,null,'1999-02','10.1016/s0254-6299(15)30940-6',null,null,null,null,null,null,null,'0254-6299',null,null,'South African Journal of Botany',null,null,null,null,null,null,'1',null,'59--68',null,null,'Elsevier BV',null,null,null,'Analysis of the spontaneous vegetation of intensively managed urban open spaces in the Potchefstroom Municipal Area, North West Province, South Africa',null,null,null,'65',null,null),
('Article','Bezuidenhout1994',null,'Bezuidenhout, H. and Bredenkamp, G.J. and Theron, G.K.',null,null,null,null,null,'1994-08','10.1016/s0254-6299(16)30616-0',null,null,null,null,null,null,null,'0254-6299',null,null,'South African Journal of Botany',null,null,null,null,null,null,'4',null,'214--224',null,null,'Elsevier BV',null,null,null,'The vegetation syntaxa of the Ba land type in the western Transvaal Grassland, South Africa',null,null,null,'60',null,null),
('Article','Bloem1993',null,'Bloem, K.J. and Theron, G.K. and van Rooyen, N.',null,null,null,null,null,'1993-06','10.1016/s0254-6299(16)30729-3',null,null,null,null,null,null,null,'0254-6299',null,null,'South African Journal of Botany',null,null,null,null,null,null,'3',null,'281--286',null,null,'Elsevier BV',null,null,null,'Wetland plant communities of the Verlorenvalei Nature Reserve in the North-eastern Sandy Highveld, Transvaal',null,null,null,'59',null,null),
('Article','Eckhardt1996a',null,'Eckhardt, H.C. and van Rooyen, N. and Bredenkamp, G.J.',null,null,null,null,null,'1996-12','10.1016/s0254-6299(15)30669-4',null,null,null,null,null,null,null,'0254-6299',null,null,'South African Journal of Botany',null,null,null,null,null,null,'6',null,'296--305',null,null,'Elsevier BV',null,null,null,'Species richness and plant communities of the Helichrysum rugulosum–Hyparrhenia hirta Low-altitude grassland of northern KwaZulu-Natal',null,null,null,'62',null,null),
('Article','Jaeger1996a',null,'Jäger, A.K. and Rabe, T. and van Staden, J.',null,null,null,null,null,'1996-10','10.1016/s0254-6299(15)30659-1',null,null,null,null,null,null,null,'0254-6299',null,null,'South African Journal of Botany',null,null,null,null,null,null,'5',null,'282--284',null,null,'Elsevier BV',null,null,null,'Food-flavouring smoke extracts promote seed germination',null,null,null,'62',null,null),
('Article','Coetzee1994',null,'Coetzee, J.P. and Bredenkamp, G.J. and van Rooyen, N.',null,null,null,null,null,'1994-02','10.1016/s0254-6299(16)30661-5',null,null,null,null,null,null,null,'0254-6299',null,null,'South African Journal of Botany',null,null,null,null,null,null,'1',null,'61--67',null,null,'Elsevier BV',null,null,null,'Phytosociology of the wetlands of the Ba and Ib land types in the Pretoria-Witbank-Heidelberg area of the Transvaal, South Africa',null,null,null,'60',null,null),
('Article','Coetzee1994a',null,'Coetzee, J.P. and Bredenkamp, G.J. and van Rooyen, N. and Theron, G.K.',null,null,null,null,null,'1994-02','10.1016/s0254-6299(16)30660-3',null,null,null,null,null,null,null,'0254-6299',null,null,'South African Journal of Botany',null,null,null,null,null,null,'1',null,'49--61',null,null,'Elsevier BV',null,null,null,'An overview of the physical environment and vegetation units of the Ba and Ib land types of the Pretoria-Witbank-Heidelberg area',null,null,null,'60',null,null),
('Article','Chatanga2019a',null,'Chatanga, Peter and Sieben, Erwin J.J.',null,null,null,null,null,'2019-10','10.4102/koedoe.v61i1.1574',null,null,null,null,null,null,null,'0075-6458',null,null,'KOEDOE - African Protected Area Conservation and Science',null,null,null,null,null,null,'1',null,null,null,null,'AOSIS',null,null,null,'Ecology of palustrine wetlands in Lesotho: Vegetation classification, description and environmental factors',null,null,null,'61',null,null),
('Article','Malan2003',null,'Malan, P.W.',null,null,null,null,null,'2003-12','10.1016/s0254-6299(15)30294-5',null,null,null,null,null,null,null,'0254-6299',null,null,'South African Journal of Botany',null,null,null,null,null,null,'4',null,'555--562',null,null,'Elsevier BV',null,null,null,'Phytosociology of the wetland communities of Cookes Lake Recreational Area in Mmabatho, North West Province, South Africa',null,null,null,'69',null,null),
('Article','Janecke2003',null,'Janecke, B.B. and du Preez, P.J. and Venter, H.J.T. and Bredenkamp, G.J.',null,null,null,null,null,'2003-10','10.1016/s0254-6299(15)30323-9',null,null,null,null,null,null,null,'0254-6299',null,null,'South African Journal of Botany',null,null,null,null,null,null,'3',null,'401--409',null,null,'Elsevier BV',null,null,null,'Vegetation ecology of the pans (playas) of Soetdoring Nature Reserve, Free State Province',null,null,null,'69',null,null),
('Article','Sieben2004',null,'Sieben, E. J. J. and Boucher, C. and Mucina, L.',null,null,null,null,null,'2004-09','10.4102/abc.v34i2.428',null,null,null,null,null,null,null,'0006-8241',null,null,'Bothalia',null,null,null,null,null,null,'2',null,'141--153',null,null,'South African National Biodiversity Institute',null,null,null,'Vegetation of high-altitude fens and restio marshlands of the Hottentots Holland Mountains, Western Cape, South Africa',null,null,null,'34',null,null),
('Article','Bezuidenhout1995',null,'Bezuidenhout, H.',null,null,null,null,null,'1995-09','10.4102/koedoe.v38i2.315',null,null,null,null,null,null,null,'0075-6458',null,null,'Koedoe',null,null,null,null,null,null,'2',null,null,null,null,'AOSIS',null,null,null,'An ecological study of the major vegetation communities of the Vaalbos National Park, Northern Cape. 2. The Graspan-Holpan section',null,null,null,'38',null,null),
('Article','Siebert2002',null,'Siebert, S.J. and van Wyk, A.E. and Bredenkamp, G.J.',null,null,null,null,null,'2002-12','10.1016/s0254-6299(15)30377-x',null,null,null,null,null,null,null,'0254-6299',null,null,'South African Journal of Botany',null,null,null,null,null,null,'4',null,'475--496',null,null,'Elsevier BV',null,null,null,'Vegetation ecology of Sekhukhuneland, South Africa: Combretum hereroense–Grewia vernicosa Open Mountain Bushveld',null,null,null,'68',null,null),
('Article','Burgoyne2000',null,'Burgoyne, B. M. and Bredenkamp, G. J. and Van Rooyen, N.',null,null,null,null,null,'2000-09','10.4102/abc.v30i2.558',null,null,null,null,null,null,null,'0006-8241',null,null,'Bothalia',null,null,null,null,null,null,'2',null,'187--200',null,null,'South African National Biodiversity Institute',null,null,null,'Wetland vegetation in the North-eastern Sandy Highveld, Mpumalanga, South Africa',null,null,null,'30',null,null),
('Article','Siebert2003',null,'Siebert, S. J. and Van Wyk, A. E. and Bredenkamp, G. J. and Siebert, F.',null,null,null,null,null,'2003-09','10.4102/abc.v33i2.454',null,null,null,null,null,null,null,'0006-8241',null,null,'Bothalia',null,null,null,null,null,null,'2',null,'207--228',null,null,'South African National Biodiversity Institute',null,null,null,'Vegetation of the rock habitats of the Sekhukhuneland Centre of Plan Endemism, South Africa',null,null,null,'33',null,null),
('Book','Spiegelhalter2020',null,'Spiegelhalter, David J.',null,null,null,null,null,'2020',null,null,'Published in paperback',null,null,null,null,'9780241258767',null,null,null,null,null,null,'UK',null,null,'Literaturangaben',null,null,null,'426','1694261182','Pelican, an imprint of Penguin Books',null,'A @Pelican book','Learning from data','The art of statistics',null,null,null,null,null,null),
('Book','Koehler2012',null,'Köhler, Wolfgang and Schachtel, Gabriel and Voleske, Peter',null,null,null,null,null,'2012','10.1007/978-3-642-29271-2',null,null,null,null,null,null,'9783642292712','0937-7433',null,null,'Springer-Lehrbuch',null,null,null,null,null,null,null,null,null,null,null,'Springer Berlin Heidelberg',null,null,null,'Biostatistik',null,null,null,null,null,null),
('Misc','Hecker2017',null,'Dirk Hecker and Inga Döbel and Ulrike Petersen and André Rauschert and Velina Schmitz and Angelika Voss',null,null,null,null,null,'2017',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'Zukunftsmarkt Künstliche Intelligenz -- Potentiale und Anwendungen',null,null,null,null,null,null),
('Article','Buchenau1878',null,'Franz Buchenau',null,null,null,null,null,'1878',null,null,null,null,null,null,null,null,null,null,null,'Abhandlungen des NaturwissenschaftlichenVereins zu Bremen',null,null,null,null,null,null,null,null,'353--431',null,null,null,null,null,null,'Kritische Zusammenstellung der bis jetzt bekannten Juncaceen aus Süd-Amerika',null,null,null,'6',null,null),
('Article','Kotorova1999',null,'Kotorová, I. and Lepš, J.',null,null,null,null,null,'1999-04','10.2307/3237139',null,null,null,null,null,null,null,'1654-1103',null,null,'Journal of Vegetation Science',null,null,null,null,null,null,'2',null,'175--186',null,null,'Wiley',null,null,null,'Comparative ecology of seedling recruitment in an oligotrophic wet meadow',null,null,null,'10',null,null),
('Article','Leps2014',null,'Lepš, Jan',null,null,null,null,null,'2014-04','10.1111/1365-2664.12255',null,null,'Wan, Shiqiang',null,null,null,null,'1365-2664',null,null,'Journal of Applied Ecology',null,null,null,null,null,null,'4',null,'978--987',null,null,'Wiley',null,null,null,'Scale‐ and time‐dependent effects of fertilization, mowing and dominant removal on a grassland community during a 15‐year experiment',null,null,null,'51',null,null),
('Book','Hoffmann2010',null,'Adriana E. Hoffmann',null,null,null,null,null,'2010',null,null,'4',null,null,null,null,'9567743029',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'El árbol urbano en Chile',null,null,null,null,null,null),
('Book','Hoffmann1992',null,'Adriana Hoffmann and Cristina Farga and Jorge Lastra and Esteban Veghazi',null,null,null,null,null,'1992',null,null,'2',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'Plantas medicinales de uso común en Chile',null,null,null,null,null,null),
('Book','Hoffmann2004',null,'Adriana E. Hoffmann and Helmut E. Walter',null,null,null,null,null,'2004',null,null,'2','Helmut E. Walter M and Andrés Jullián and Rodulfo Amando Philippi',null,null,null,'9567743053',null,null,null,null,null,null,'Santiago de Chile',null,null,'Primera Edición, 1989',null,null,null,'307','869404334','Ediciones Fundacion Claudio Gay',null,null,'En la flora silvetre de Chile ; una guía para la identificación de los cactos que crecen en el país','Cactáceas en la flora silvestre de Chile',null,null,null,null,null,null),
('Article','Widmer2018',null,'{Widmer, Stefan} and {Frei, Eva Silvia} and {Babbi, Manuel} and {Krüsi, Bertil}',null,null,null,null,'Licence according to publishing contract','2018','10.21256/ZHAW-4939',null,null,null,null,null,null,null,null,null,null,null,'Pteridium aquilinum, Bracken control, Floristic diversity, Invasive plant species, Nature conservation, Semi-dry grassland, 577: Ökologie, 580: Pflanzen (Botanik)','de',null,null,null,null,null,null,null,null,null,'Basler Botanische Gesellschaft',null,null,null,'Extensive Bekämpfung des Adlerfarns fördert die floristische Vielfalt',null,null,null,null,null,null),
('Article','Werema2017',null,'Chacha Werema and Cuthbert L. Nahonyo and Mohamed Kibaja',null,null,null,null,null,'2017-07-20',null,null,null,null,null,null,null,null,null,'2',null,'Scopus: Journal of East African Ornithology',null,null,null,null,null,null,null,null,'8--23',null,null,null,null,null,null,'The role of kopjes in bird species’ conservation within an agricultural matrix west of the Greater Serengeti Ecosystem, Tanzania',null,null,null,'37',null,null),
('Article','Weinberger2000',null,'Peter Weinberger',null,null,null,null,null,'2000',null,null,null,null,null,null,null,null,null,'1',null,'Bosque',null,null,null,null,null,null,null,null,'91--94',null,null,null,null,null,null,'Un evaporímetro simple para mediciones de terreno',null,null,null,'21',null,null),
('Article','Weinberger1973',null,'Weinberger, P.',null,null,null,null,null,'1973','10.1016/s0367-2530(17)31701-2',null,null,null,null,null,null,null,'0367-2530',null,null,'Flora',null,null,null,null,null,null,'3',null,'157--179',null,null,'Elsevier BV',null,null,null,'Beziehungen zwischen mikroklimatischen Faktoren und natürlicher Verjüngung araukano-patagonischer Nothofagus-Arten',null,null,null,'162',null,null),
('Article','Weigend2006a',null,'Weigend, Maximilian',null,null,null,null,null,'2006-10','10.3372/wi.36.36212',null,null,null,null,null,null,null,'0511-9618',null,null,'Willdenowia',null,null,null,null,null,null,'2',null,'811',null,null,'Botanic Garden and Botanical Museum Berlin, Freie Universitaet Berlin',null,null,null,'Urtica dioica subsp. cypria, with a re-evaluation of the U. dioica group (Urticaceae) in western Asia',null,null,null,'36',null,null),
('Article','Weigend2004',null,'Weigend, Maximilian and Aitzetmüller, Kurt and Bruehl, Ludger',null,null,null,null,null,'2004-01','10.1078/0367-2530-00170',null,null,null,null,null,null,null,'0367-2530',null,null,'Flora - Morphology, Distribution, Functional Ecology of Plants',null,null,null,null,null,null,'5',null,'424--436',null,null,'Elsevier BV',null,null,null,'The seeds of Loasaceae subfam. Loasoideae (Cornales) I: Seed release, seed numbers and fatty acid composition',null,null,null,'199',null,null),
('Article','Weigend2000',null,'Weigend, Maximilian and Kufer, Johanna and Müller, Andreas A.',null,null,null,null,null,'2000-08','10.2307/2656658',null,null,null,null,null,null,null,'1537-2197',null,null,'American Journal of Botany',null,null,null,null,null,null,'8',null,'1202--1210',null,null,'Wiley',null,null,null,'Phytochemistry and the systematics and ecology of Loasaceae and Gronoviaceae (Loasales)',null,null,null,'87',null,null),
('Article','Weber1986',null,'Carlos Weber',null,null,null,null,null,'1986',null,null,null,null,null,null,null,null,null,'1',null,'Ambiente y Desarrollo',null,null,null,null,null,null,null,null,'165--181',null,null,null,null,null,null,'Conservación y uso racional de la naturaleza, en áreas protegidas',null,null,null,'2',null,null),
('Article','Webb1986',null,'Webb, C. J.',null,null,null,null,null,'1986-10','10.1080/0028825x.1986.10409950',null,null,null,null,null,null,null,'1175-8643',null,null,'New Zealand Journal of Botany',null,null,null,null,null,null,'4',null,'665--669',null,null,'Informa UK Limited',null,null,null,'Variation in achene morphology and its implications for taxonomy in Soliva subgenus Soliva (Anthemideae, Asteraceae)',null,null,null,'24',null,null),
('Article','Wasswa2013',null,'H. Wasswa and F. Mugagga and V. Kakembo',null,null,null,null,null,'2013','10.15413/ajes.2013.0103',null,null,null,null,null,null,null,null,'4',null,'Academia Journal of Environmental Sciences',null,null,null,null,null,null,null,null,'66--77',null,null,null,null,null,null,'Economic Implications of Wetland Conversion to Local People’s Livelihoods: TheCase of Kampala- Mukono Corridor (KMC) Wetlands in Uganda',null,null,null,'1',null,null),
('Book','Watson2010',null,'Watson, R. and Fitzgerald, K.H. and Gitahi, N.',null,null,null,null,null,'2010',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'Expanding options for habitat conservation outside protected areas in Kenya: The use of environmental easements',null,null,null,null,null,null),
('Article','Waswa2002',null,'Fuchaka Waswa and Helmut Eggers and Thomas Kutsch',null,null,null,null,null,'2002',null,null,null,null,null,null,null,null,null,'2',null,'Journal of Agriculture and Rural Development in the Tropics and Subtropics',null,null,null,null,null,null,null,null,'107--115',null,null,null,null,null,null,'Beyond Land Titling for Sustainable Management of Agricultural Land: Lessons from Ndome and Ghazi in Taita-Taveta, Kenya',null,null,null,'103',null,null),
('Article','Washbourn1967',null,'Celia K. Washbourn',null,null,null,null,null,'1967',null,null,null,null,null,null,null,null,null,null,null,'Nature',null,null,null,null,null,null,null,null,'672--673',null,null,null,null,null,null,'Lake Levels and Quaternary Climates in the Eastern Rift Valley of Kenya',null,null,null,'216',null,null),
('Book','Kratochwil2001',null,'Kratochwil, Anselm and Schwabe, Angelika',null,null,null,null,null,'2001',null,null,null,'Angelika Schwabe',null,null,null,'3800127504',null,null,null,null,null,null,'Stuttgart',null,null,'Literaturverz. S. [649] - 715','8199',null,null,'756','322569176','Ulmer',null,'UTB für Wissenschaft','Biozönologie','Ökologie der Lebensgemeinschaften',null,null,null,null,null,null),
('Thesis','TignehEshete2009',null,'{Tigneh Eshete}',null,null,null,null,null,'2009',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'Spatial analysis of erosion and land degradation leading to environmental stress: The case of Lake Hawassa catchment','mathesis',null,null,null,null,null),
('Article','Tilahun2015',null,'Tilahun, Abiyou',null,null,null,null,null,'2015','10.11648/j.aff.20150404.16',null,null,null,null,null,null,null,'2328-563X',null,null,'Agriculture, Forestry and Fisheries',null,null,null,null,null,null,'4',null,'184',null,null,'Science Publishing Group',null,null,null,'Structure and Regeneration Status of Menagesha Amba Mariam Forest in Central Highlands of Shewa, Ethiopia',null,null,null,'4',null,null),
('Article','Timmermann2006',null,'Tiemo Timmermann and Jürgen Dengler and Anja Abdank and Christian Berg',null,null,null,null,null,'2006',null,null,null,null,null,null,null,null,null,'5',null,'Naturschutz und Landschaftsplanung',null,null,null,null,null,null,null,null,'133--139',null,null,null,null,null,null,'Objektivierung von Naturschutzbewertungen: Das Beispiel Roter Listen von Pflanzengesellschaften',null,null,null,'38',null,null),
('Article','Tindano2014',null,'Elycée Tindano and Souleymane Ganaba and Adjima Thiombiano',null,null,null,null,null,'2014',null,null,null,null,null,null,null,null,null,null,null,'Flora et Vegetatio Sudano-Sambesica',null,null,null,null,null,null,null,null,'9--27',null,null,null,null,null,null,'Composition floristique et état des peuplements ligneux des inselbergs suivant un gradient climatique au Burkina Faso (Afrique de l’Ouest)',null,null,null,'17',null,null),
('Article','Tjoelker1998',null,'Tjoelker, M. G. and Oleksyn, J. and Reich, P. B.',null,null,null,null,null,'1998-11','10.1093/treephys/18.11.715',null,null,null,null,null,null,null,'1758-4469',null,null,'Tree Physiology',null,null,null,null,null,null,'11',null,'715--726',null,null,'Oxford University Press (OUP)',null,null,null,'Seedlings of five boreal tree species differ in acclimation of net photosynthesis to elevated CO2 and temperature',null,null,null,'18',null,null),
('Article','Torrejon2004',null,'Torrejón, Fernando and Cisternas, Marco and Araneda, Alberto',null,null,null,null,null,'2004-12','10.4067/s0716-078x2004000400009',null,null,null,null,null,null,null,'0716-078X',null,null,'Revista Chilena de Historia Natural',null,null,null,null,null,null,'4',null,null,null,null,'SciELO Agencia Nacional de Investigacion y Desarrollo (ANID)',null,null,null,'Efectos ambientales de la colonización española desde el río Maullín al archipiélago de Chiloé, sur de Chile',null,null,null,'77',null,null),
('Article','Torrejon2011',null,'Torrejón, Fernando and Cisternas, Marco and Alvial, Ingrid and Torres, Laura',null,null,null,null,null,'2011','10.4067/s0718-22442011000200006',null,null,null,null,null,null,null,'0718-2244',null,null,'Magallania',null,null,null,null,null,null,'2',null,'75--95',null,null,'Universidad de Magallanes',null,null,null,'Consecuencias de la tala maderera colonial en los bosques de alerce de Chiloé, sur de Chile (Siglos XVI-XIX)',null,null,null,'39',null,null),
('Article','TorresMellado2012',null,'Torres-Mellado, Gustavo A and Escobar, Inelia and Palfner, Gotz and Casanova-Katny, M. Angélica',null,null,null,null,null,'2012-06','10.4067/s0716-078x2012000200004',null,null,null,null,null,null,null,'0716-078X',null,null,'Revista chilena de historia natural',null,null,null,null,null,null,'2',null,'179--186',null,null,'SciELO Agencia Nacional de Investigacion y Desarrollo (ANID)',null,null,null,'Mycotrophy in Gilliesieae, a threatened and poorly known tribe of Alliaceae from central Chile',null,null,null,'85',null,null),
('Article','Waring1964',null,'Waring, R. H. and Major, J.',null,null,null,null,null,'1964-03','10.2307/1948452',null,null,null,null,null,null,null,'1557-7015',null,null,'Ecological Monographs',null,null,null,null,null,null,'2',null,'167--215',null,null,'Wiley',null,null,null,'Some Vegetation of the California Coastal Redwood Region in Relation to Gradients of Moisture, Nutrients, Light, and Temperature',null,null,null,'34',null,null),
('Article','Wardle2008',null,'Wardle, David A. and Lagerström, Anna and Nilsson, Marie‐Charlotte',null,null,null,null,null,'2008-10','10.1111/j.1365-2745.2008.01437.x',null,null,null,null,null,null,null,'1365-2745',null,null,'Journal of Ecology',null,null,null,null,null,null,'6',null,'1174--1186',null,null,'Wiley',null,null,null,'Context dependent effects of plant species and functional group loss on vegetation invasibility across an island area gradient',null,null,null,'96',null,null),
('Article','Wan2012',null,'Wan, Kaiyuan and Tao, Yong and Li, Ruhai and Pan, Junfeng and Tang, Leilei and Chen, Fang',null,null,null,null,null,'2012-03','10.1111/j.1445-6664.2011.00430.x',null,null,null,null,null,null,null,'1445-6664',null,null,'Weed Biology and Management',null,null,null,null,null,null,'1',null,'12--21',null,null,'Wiley',null,null,null,'Influences of long‐term different types of fertilization on weed community biodiversity in rice paddy fields',null,null,null,'12',null,null),
('Article','Wang2013',null,'Wang, Guodong and Middleton, Beth and Jiang, Ming',null,null,null,null,null,'2013-04','10.1111/rec.12015',null,null,null,null,null,null,null,'1526-100X',null,null,'Restoration Ecology',null,null,null,null,null,null,'6',null,'801--808',null,null,'Wiley',null,null,null,'Restoration Potential of Sedge Meadows in Hand‐Cultivated Soybean Fields in Northeastern China',null,null,null,'21',null,null),
('Article','Wang2005',null,'Wang, Ailan and Yang, Meihua and Liu, Jianquan',null,null,null,null,null,'2005-07','10.1093/aob/mci201',null,null,null,null,null,null,null,'0305-7364',null,null,'Annals of Botany',null,null,null,null,null,null,'3',null,'489--498',null,null,'Oxford University Press (OUP)',null,null,null,'Molecular Phylogeny, Recent Radiation and Evolution of Gross Morphology of the Rhubarb genus Rheum (Polygonaceae) Inferred from Chloroplast DNA trnL-F Sequences',null,null,null,'96',null,null),
('Article','Wanek2002',null,'Wanek, W. and Stefan K. Arndt',null,null,null,null,null,'2002-05','10.1093/jexbot/53.371.1109',null,null,null,null,null,null,null,'1460-2431',null,null,'Journal of Experimental Botany',null,null,null,null,null,null,'371',null,'1109--1118',null,null,'Oxford University Press (OUP)',null,null,null,'Difference in delta15N signatures between nodulated roots and shoots of soybean is indicative of the contribution of symbiotic N2 fixation to plant N',null,null,null,'53',null,null),
('Article','Fayolle2018',null,'Fayolle, Adeline and Swaine, Michael D. and Aleman, Julie and Azihou, Akomian F. and Bauman, David and te Beest, Mariska and Chidumayo, Emmanuel N. and Cromsigt, Joris P. G. M. and Dessard, Hélène and Finckh, Manfred and Gonçalves, Francisco Maiato P. and Gillet, Jean‐Francois and Gorel, Anais and Hick, Aurélie and Holdo, Ricardo and Kirunda, Ben and Mahy, Gregory and McNicol, Iain and Ryan, Casey M. and Revermann, Rasmus and Plumptre, Andrew and Pritchard, Rose and Nieto‐Quintano, Paula and Schmitt, Christine B. and Seghieri, Josiane and Swemmer, Anthony and Talila, Habte and Woollen, Emily',null,null,null,null,null,'2018-12','10.1111/jbi.13475',null,null,null,null,null,null,null,'1365-2699',null,null,'Journal of Biogeography',null,null,null,null,null,null,'2',null,'454--465',null,null,'Wiley',null,null,null,'A sharp floristic discontinuity revealed by the biogeographic regionalization of African savannas',null,null,null,'46',null,null),
('Article','Streit2024',null,'Streit, Helena and Bergamin, Rodrigo S. and Andrade, Bianca O. and Altesor, Alice and Lezama, Felipe and Perelman, Susana and Muller, Sandra C. and Overbeck, Gerhard E.',null,null,null,null,null,'2024-04','10.1016/j.ppees.2024.125791',null,null,null,null,null,null,null,'1433-8319',null,null,'Perspectives in Plant Ecology, Evolution and Systematics',null,null,null,null,null,null,null,null,'125791',null,null,'Elsevier BV',null,null,null,'Determinants of biogeographical distribution of grasses in grasslands of South America',null,null,null,null,null,null),
('Article','Traufetter2007',null,'Gerald Traufetter',null,null,null,null,null,'2007',null,null,null,null,null,null,null,null,null,null,null,'Der Spiegel',null,null,null,null,null,null,null,null,'138--142',null,null,null,null,null,null,'Der Atem der Taiga',null,null,null,null,null,null),
('Article','Treiber1999',null,'Reinhold Treiber',null,null,null,null,null,'1999',null,null,null,null,null,null,null,null,null,null,null,'Berichte der naturforschenden Gesellschaft zu Freiburg im Breisgau',null,null,null,null,null,null,null,null,'147--184',null,null,null,null,null,null,'Pflanzengesellschaften und Nutzungsgeschichte eines Streuwiesen-Niedermoor-Komplexes im Drumlinfeld des Rhein-Bodensee-Gletschers (Bayern) und ein syntaxonomischer Vergleich mit bodensauren Pfeifengras-Wiesen des Westallgäuer Hügellandes (Baden-Württemberg)',null,null,null,'88--89',null,null),
('Article','Tremetsberger2003',null,'Tremetsberger, Karin and Stuessy, Tod F. and Guo, Yan-Ping and Baeza, Carlos M. and Weiss, Hanna and Samuel, Rosabelle M.',null,null,null,null,null,'2003-05','10.2307/3647491',null,null,null,null,null,null,null,'1996-8175',null,null,'TAXON',null,null,null,null,null,null,'2',null,'237--245',null,null,'Wiley',null,null,null,'Amplified Fragment Length Polymorphism (AFLP) variation within and among populations of Hypochaeris acaulis (Asteraceae) of Andean southern South America',null,null,null,'52',null,null),
('Article','Tribsch2003',null,'Tribsch, Andreas and Schönswetter, Peter',null,null,null,null,null,'2003-08','10.2307/3647447',null,null,null,null,null,null,null,'1996-8175',null,null,'TAXON',null,null,null,null,null,null,'3',null,'477--497',null,null,'Wiley',null,null,null,'Patterns of endemism and comparative phylogeography confirm palaeo‐environmental evidence for Pleistocene refugia in the Eastern Alps',null,null,null,'52',null,null),
('Article','Troia2019',null,'Troia, Angelo and Johnson, Gabriel and Taylor, W. Carl',null,null,null,null,null,'2019-03','10.11646/phytotaxa.395.3.2',null,null,null,null,null,null,null,'1179-3155',null,null,'Phytotaxa',null,null,null,null,null,null,'3',null,'168',null,null,'Magnolia Press',null,null,null,'A contribution to the phylogeny and biogeography of the genus Isoetes (Isoetaceae, Lycopodiidae) in the Mediterranean region',null,null,null,'395',null,null),
('Article','Troncoso1993',null,'Alejandro Troncoso and Edgardo J. Romero',null,null,null,null,null,'1993',null,null,null,null,null,null,null,null,null,null,null,'Boletín del Museo Nacional de Historia Natural',null,null,null,null,null,null,null,null,'47--71',null,null,null,null,null,null,'Consideraciones acerca de las coníferas del Mioceno de Chile central occidental',null,null,null,'44',null,null),
('Article','Troncoso2006',null,'Alejandro Troncoso and Alfonso Encinas',null,null,null,null,null,'2006-03-30',null,null,null,null,null,null,null,null,null,'1',null,'Ameghiniana',null,null,null,null,null,null,null,null,'171--180',null,null,null,null,null,null,'La tafoflora de cerro Centinela (Chile, VI Región): vegetación y clima de Chile central a fines del Mioceno-comienzos del Plioceno',null,null,null,'43',null,null),
('Article','Tuesca2001',null,'Tuesca, D and Puricelli, E and Papa, J C',null,null,null,null,null,'2001-08','10.1046/j.1365-3180.2001.00245.x',null,null,null,null,null,null,null,'1365-3180',null,null,'Weed Research',null,null,null,null,null,null,'4',null,'369--382',null,null,'Wiley',null,null,null,'A long‐term study of weed flora shifts in different tillage systems',null,null,null,'41',null,null),
('Book','Tuhkanen1980',null,'Tuhkanen, Sakari',null,null,null,null,null,'1980',null,null,null,null,null,null,null,'9172104678',null,null,null,null,null,null,'Stockholm',null,null,'Mit Bibliogr','67',null,null,'110','223787035','Almqvist, Wiksell Intern',null,'Acta phytogeographica suecica',null,'Climatic parameters and indices in plant geography',null,null,null,null,null,null),
('Article','Turnbull1999',null,'Turnbull, Lindsay A. and Rees, Mark and Crawley, Michael J.',null,null,null,null,null,'1999-10','10.1046/j.1365-2745.1999.00405.x',null,null,null,null,null,null,null,'1365-2745',null,null,'Journal of Ecology',null,null,null,null,null,null,'5',null,'899--912',null,null,'Wiley',null,null,null,'Seed mass and the competition/colonization trade‐off: a sowing experiment',null,null,null,'87',null,null),
('Article','Turnbull2000',null,'Turnbull, Lindsay A. and Crawley, Michael J. and Rees, Mark',null,null,null,null,null,'2000-02','10.1034/j.1600-0706.2000.880201.x',null,null,null,null,null,null,null,'1600-0706',null,null,'Oikos',null,null,null,null,null,null,'2',null,'225--238',null,null,'Wiley',null,null,null,'Are plant populations seed‐limited? A review of seed sowing experiments',null,null,null,'88',null,null),
('Article','Turnbull2004',null,'Turnbull, Lindsay A. and Coomes, David and Hector, Andy and Rees, Mark',null,null,null,null,null,'2004-01','10.1111/j.1365-2745.2004.00856.x',null,null,null,null,null,null,null,'1365-2745',null,null,'Journal of Ecology',null,null,null,null,null,null,'1',null,'97--109',null,null,'Wiley',null,null,null,'Seed mass and the competition/colonization trade‐off: competitive interactions and spatial patterns in a guild of annual plants',null,null,null,'92',null,null),
('Article','Turnbull2006',null,'Turnbull, Lindsay A and Santamaria, Luis and Martorell, Toni and Rallo, Joan and Hector, Andy',null,null,null,null,null,'2006-05','10.1098/rsbl.2006.0476',null,null,null,null,null,null,null,'1744-957X',null,null,'Biology Letters',null,null,null,null,null,null,'3',null,'397--400',null,null,'The Royal Society',null,null,null,'Seed size variability: from carob to carats',null,null,null,'2',null,null),
('Article','Turyahabwe2013',null,'Turyahabwe, Nelson and Kakuru, Willy and Tweheyo, Mnason and Tumusiime, David Mwesigye',null,null,null,null,null,'2013-03','10.1186/2048-7010-2-5',null,null,null,null,null,null,null,'2048-7010',null,null,'Agriculture &amp; Food Security',null,null,null,null,null,null,'1',null,null,null,null,'Springer Science and Business Media LLC',null,null,null,'Contribution of wetland resources to household food security in Uganda',null,null,null,'2',null,null),
('Article','Uchiyama2006',null,'Uchiyama, Kentaro and Goto, Susumu and Tsuda, Yoshiaki and Takahashi, Yasuo and Ide, Yuji',null,null,null,null,null,'2006-12','10.1016/j.foreco.2006.09.037',null,null,null,null,null,null,null,'0378-1127',null,null,'Forest Ecology and Management',null,null,null,null,null,null,'1–3',null,'119--126',null,null,'Elsevier BV',null,null,null,'Genetic diversity and genetic structure of adult and buried seed populations of Betula maximowicziana in mixed and post-fire stands',null,null,null,'237',null,null),
('Book','Udvardy1975',null,'Miklos D. F. Udvardy',null,null,null,null,null,'1975',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'A Classificationof the Biogeographical Provinces of the World',null,null,null,null,null,null),
('Article','Ueno2000',null,'Ueno, S. and Tomaru, N. and Yoshimaru, H. and Manabe, T. and Yamamoto, S.',null,null,null,null,null,'2000-06','10.1046/j.1365-294x.2000.00891.x',null,null,null,null,null,null,null,'1365-294X',null,null,'Molecular Ecology',null,null,null,null,null,null,'6',null,'647--656',null,null,'Wiley',null,null,null,'Genetic structure of Camellia japonica L. in an old‐growth evergreen forest, Tsushima, Japan',null,null,null,'9',null,null),
('Article','Ugarte2011',null,'Ugarte, Eduardo and Lira, Francisco and Fuentes, Nicol and Klotz, Stefan',null,null,null,null,null,'2011-05','10.15560/7.3.365',null,null,null,null,null,null,null,'1809-127X',null,null,'Check List',null,null,null,null,null,null,'3',null,'365',null,null,'Pensoft Publishers',null,null,null,'Vascular alien flora, Chile',null,null,null,'7',null,null),
('Article','Ramsey1994',null,'Norman Ramsey',null,null,null,null,null,'1994',null,null,null,null,null,null,null,null,null,'5',null,'IEEE Software',null,null,null,null,null,null,null,null,'97--105',null,null,null,null,null,null,'Literate programming simplified',null,'https://www.cs.tufts.edu/~nr/pubs/lpsimp.pdf',null,'11',null,null),
('Article','Waeldchen2018',null,'Wäldchen, Jana and Rzanny, Michael and Seeland, Marco and Mäder, Patrick',null,null,null,null,null,'2018-04','10.1371/journal.pcbi.1005993',null,null,'Bucksch, Alexander',null,null,null,null,'1553-7358',null,null,'PLOS Computational Biology',null,null,null,null,null,null,'4',null,'e1005993',null,null,'Public Library of Science (PLoS)',null,null,null,'Automated plant species identification—Trends and future directions',null,null,null,'14',null,null),
('Article','Kamiri2024',null,'Kamiri, Hellen Wangechi. and Choge, Simon K. and Becker, Mathias',null,null,null,null,null,'2024-04','10.3390/d16040251',null,null,null,null,null,null,null,'1424-2818',null,null,'Diversity',null,null,null,null,null,null,'4',null,'251',null,null,'MDPI AG',null,null,null,'Management Strategies of Prosopis juliflora in Eastern Africa: What Works Where?',null,null,null,'16',null,null),
('Article','Omiye2023',null,'Omiye, Jesutofunmi A. and Lester, Jenna C. and Spichak, Simon and Rotemberg, Veronica and Daneshjou, Roxana',null,null,null,null,null,'2023-10','10.1038/s41746-023-00939-z',null,null,null,null,null,null,null,'2398-6352',null,null,'npj Digital Medicine',null,null,null,null,null,null,'1',null,null,null,null,'Springer Science and Business Media LLC',null,null,null,'Large language models propagate race-based medicine',null,null,null,'6',null,null),
('Article','Sieben2018',null,'Sieben, Erwin J.J.',null,null,null,null,null,'2018-11','10.1111/aec.12679',null,null,null,null,null,null,null,'1442-9993',null,null,'Austral Ecology',null,null,null,null,null,null,'3',null,'449--460',null,null,'Wiley',null,null,null,'Zonal and azonal vegetation revisited: How is wetland vegetation distributed across different zonobiomes',null,null,null,'44',null,null),
('Article','Sieben2021',null,'Sieben, E. J. J. and Glen, R. P. and van Deventer, H. and Dayaram, A.',null,null,null,null,null,'2021-02','10.1007/s10531-020-02104-4',null,null,null,null,null,null,null,'1572-9710',null,null,'Biodiversity and Conservation',null,null,null,null,null,null,'3',null,'575--596',null,null,'Springer Science and Business Media LLC',null,null,null,'The contribution of wetland flora to regional floristic diversity across a wide range of climatic conditions in southern Africa',null,null,null,'30',null,null),
('Article','Sieben2021a',null,'Sieben, Erwin J.J. and Subbiah, Ashley and Job, Nancy and Chatanga, Peter and Collins, Nacelle and Corry, Fynn T.H.',null,null,null,null,null,'2021-11','10.1111/jvs.13097',null,null,'Bruun, Hans Henrik',null,null,null,null,'1654-1103',null,null,'Journal of Vegetation Science',null,null,null,null,null,null,'6',null,null,null,null,'Wiley',null,null,null,'Components of plant species diversity along environmental gradients at various spatial scales in wetland environments of southern Africa',null,null,null,'32',null,null),
('Article','Miller2018',null,'Miller, Nathan A. and Roan, Aaron and Hochberg, Timothy and Amos, John and Kroodsma, David A.',null,null,null,null,null,'2018-07','10.3389/fmars.2018.00240',null,null,null,null,null,null,null,'2296-7745',null,null,'Frontiers in Marine Science',null,null,null,null,null,null,null,null,null,null,null,'Frontiers Media SA',null,null,null,'Identifying Global Patterns of Transshipment Behavior',null,null,null,'5',null,null),
('Article','Ugent1987',null,'Ugent, Donald and Dillehay, Tom and Ramirez, Carlos',null,null,null,null,null,'1987-01','10.1007/bf02859340',null,null,null,null,null,null,null,'1874-9364',null,null,'Economic Botany',null,null,null,null,null,null,'1',null,'17--27',null,null,'Springer Science and Business Media LLC',null,null,null,'Potato remains from a late pleistocene settlement in southcentral Chile',null,null,null,'41',null,null),
('Article','Uhl1981',null,'Uhl, Christopher and Clark, Kathleen and Clark, Howard and Murphy, Peter',null,null,null,null,null,'1981-07','10.2307/2259689',null,null,null,null,null,null,null,'0022-0477',null,null,'The Journal of Ecology',null,null,null,null,null,null,'2',null,'631',null,null,'JSTOR',null,null,null,'Early Plant Succession after Cutting and Burning in the Upper Rio Negro Region of the Amazon Basin',null,null,null,'69',null,null),
('Article','Ulanova2000',null,'Ulanova, Nina G',null,null,null,null,null,'2000-09','10.1016/s0378-1127(00)00307-8',null,null,null,null,null,null,null,'0378-1127',null,null,'Forest Ecology and Management',null,null,null,null,null,null,'1–3',null,'155--167',null,null,'Elsevier BV',null,null,null,'The effects of windthrow on forests at different spatial scales: a review',null,null,null,'135',null,null),
('Book','Ulbrich1928',null,'Ulbrich, E.',null,null,null,null,null,'1928','10.1007/978-3-642-51829-4',null,null,null,null,null,null,'9783642518294',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'Springer Berlin Heidelberg',null,null,null,'Biologie der Früchte und Samen ‹Karpobiologie›',null,null,null,null,null,null),
('Article','Ulrich2004',null,'Ulrich, Werner and Buszko, Jarosław',null,null,null,null,null,'2004-06','10.1016/j.baae.2004.04.002',null,null,null,null,null,null,null,'1439-1791',null,null,'Basic and Applied Ecology',null,null,null,null,null,null,'3',null,'231--240',null,null,'Elsevier BV',null,null,null,'Habitat reduction and patterns of species loss',null,null,null,'5',null,null),
('Article','Ulrich2007',null,'Ulrich, Werner and Buszko, Jarosław',null,null,null,null,null,'2007-01','10.1016/j.actao.2006.03.005',null,null,null,null,null,null,null,'1146-609X',null,null,'Acta Oecologica',null,null,null,null,null,null,'1',null,'54--59',null,null,'Elsevier BV',null,null,null,'Sampling design and the shape of species–area curves on the regional scale',null,null,null,'31',null,null),
('Article','Ulrich2016',null,'Ulrich, Werner and Lens, Luc and Tobias, Joseph A. and Habel, Jan C.',null,null,null,null,null,'2016-11','10.1371/journal.pone.0163338',null,null,'Umapathy, Govindhaswamy',null,null,null,null,'1932-6203',null,null,'PLOS ONE',null,null,null,null,null,null,'11',null,'e0163338',null,null,'Public Library of Science (PLoS)',null,null,null,'Contrasting Patterns of Species Richness and Functional Diversity in Bird Communities of East African Cloud Forest Fragments',null,null,null,'11',null,null),
('Thesis','Uma1980',null,'Mundua Uma',null,null,null,null,null,'1980',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'Etude phytosociologique de la végétation des étangs de Kisangani et de ses environs','bathesis',null,null,null,null,null),
('Book','UNESCO2014',null,'UNESCO',null,null,null,null,null,'2014',null,null,null,null,null,null,null,'978-92-3-100120-8',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'Botanists of the twenty-first century: roles, challenges and opportunities',null,'https://unesdoc.unesco.org/ark:/48223/pf0000243791',null,null,null,null),
('Article','Urban2005',null,'Urban, Katharina E.',null,null,null,null,null,'2005-08','10.1127/0340-269x/2005/0035-0511',null,null,null,null,null,null,null,'0340-269X',null,null,'Phytocoenologia',null,null,null,null,null,null,'2–3',null,'511--532',null,null,'Schweizerbart',null,null,null,'Plant species dynamics during restoration of heath ponds in northwestern Germany',null,null,null,'35',null,null),
('Article','Urbanska1983',null,'{Urbanska, Krystyna M.}',null,null,null,null,null,'1983','10.5169/SEALS-65242',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'Birkhäuser',null,null,null,'Cyto-geographical differentiation in Antennaria carpatis s. 1.',null,null,null,null,null,null),
('Article','Urrutia2012',null,'Urrutia, J and Rivera, R and Hauenstein, E and De los Ríos, P',null,null,null,null,null,'2012','10.5555/20133025528',null,null,null,null,null,null,null,null,'1',null,'Phyton',null,null,null,null,null,null,null,null,'7--13',null,null,null,null,null,null,'Modelos nulos para explicar asociaciones de macrófitas en ambientes lénticos de la región de La Araucanía, Chile',null,null,null,'81',null,null),
('Book','Urrutia2017',null,'Jonathan Urrutia and Paulina Sánchez and Aníbal Pauchard and Enrique Hauenstein',null,null,null,null,null,'2017',null,null,null,null,null,null,null,'978-956-358-892-7',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'Flora acuática y palustre introducida en Chile',null,null,null,null,null,null),
('Article','Urrutia2017a',null,'Urrutia, Jonathan and Sánchez, Paulina and Pauchard, Aníbal and Hauenstein, Enrique',null,null,null,null,null,'2017','10.4067/s0717-66432017005000324',null,null,null,null,null,null,null,'0717-6643','1',null,'Gayana. Botánica',null,null,null,null,null,null,null,null,'147--157',null,null,'SciELO Agencia Nacional de Investigacion y Desarrollo (ANID)',null,null,null,'Plantas acuáticas invasoras presentes en Chile: Distribución, rasgos de vida y potencial invasor',null,null,null,'74',null,null),
('Article','UrrutiaEstrada2018',null,'Jonathan Urrutia-Estrada and Andrés Fuentes-Ramírez and Francisco Correa-Araneda and Enrique Hauenstein',null,null,null,null,null,'2018',null,null,null,null,null,null,null,null,null,'2',null,'Boletín de la Sociedad Argentina de Botánica',null,null,null,null,null,null,null,null,'279--294',null,null,null,null,null,null,'Impactos de la fragmentación sobre la composición florística en bosques pantanosos del centro-sur de Chile',null,null,null,'53',null,null),
('Article','UrrutiaEstrada2018a',null,'Jonathan Urrutia-Estrada and Andrés Fuentes-Ramírez and Enrique Hauenstein4',null,null,null,null,null,'2018-12','10.4067/s0717-66432018000200625',null,null,null,null,null,null,null,'0717-6643','2',null,'Gayana. Botánica',null,null,null,null,null,null,null,null,'625--638',null,null,'SciELO Agencia Nacional de Investigacion y Desarrollo (ANID)',null,null,null,'Diferencias en la composición florística en bosques de Araucaria- Nothofagus afectados por distintas severidades de fuego',null,null,null,'75',null,null),
('Article','Urso2013',null,'Valeria Urso and Maria Adele Signorini and Piero Bruschi',null,null,null,null,null,'2013','10.5897/JMPR11.492',null,null,null,null,null,null,null,null,'1',null,'Journal of Medicinal Plants Research',null,null,null,null,null,null,null,null,'7--18',null,null,null,null,null,null,'Survey of the ethnobotanical uses of Ximenia americana L. (mumpeke) among rural communities in South Angola',null,null,null,'7',null,null),
('Article','Urzua2005',null,'H. Urzúa',null,null,null,null,null,'2005',null,null,null,null,null,null,null,null,null,'2',null,'Ciencia e Investigación Agraria',null,null,null,null,null,null,null,null,'133--150',null,null,null,null,null,null,'Beneficios de la Fijación Simbiótica de Nitrógeno en Chile',null,null,null,'32',null,null),
('Article','Uyehara2016',null,'Uyehara, Isaac K. and Sisanya, Martin and Hemp, Claudia and Rubenstein, Daniel I.',null,null,null,null,null,'2016-03','10.1111/aje.12279',null,null,null,null,null,null,null,'1365-2028',null,null,'African Journal of Ecology',null,null,null,null,null,null,'2',null,'167--173',null,null,'Wiley',null,null,null,'Effects of traditional pastoralism on grasshopper (Caelifera) assemblages in East Africa',null,null,null,'54',null,null),
('Article','Valdes2000',null,'Enrique Valdés',null,null,null,null,null,'2000-05',null,null,null,null,null,null,null,null,null,'36',null,'Caballo de Proa',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'Una carta extraviada de Jorge Teillier',null,null,null,'18',null,null),
('Article','Valdivia2013',null,'Valdivia, Carlos E and Romero, Cristian R',null,null,null,null,null,'2013','10.4067/s0717-66432013000100007',null,null,null,null,null,null,null,'0717-6643',null,null,'Gayana. Botánica',null,null,null,null,null,null,'1',null,'57--65',null,null,'SciELO Agencia Nacional de Investigacion y Desarrollo (ANID)',null,null,null,'En la senda de la extinción: el caso del algarrobo Prosopis chilensis (Fabaceae) y el bosque espinoso en la Región Metropolitana de Chile Central',null,null,null,'70',null,null),
('InCollection','Valdovinos2005',null,'Claudio Valdovinos and David Figueroa and Fernando Peña-Cortés and Enriquehauenstein and Basilio Guíñez and Viviana Olmos','Historia, Biodiversidad y Ecología de los Bosques Costeros de Chile',null,null,null,null,'2005',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'592--605',null,null,null,null,null,null,'Visión sinóptica de la biodiversidad acuática y ribereña del Lago Budi',null,null,null,null,null,null),
('Article','Valeix2007',null,'Valeix, Marion and Fritz, Hervé and Dubois, Ségolène and Kanengoni, Kwanele and Alleaume, Samuel and Saïd, Sonia',null,null,null,null,null,'2007-01','10.1017/s0266467406003609',null,null,null,null,null,null,null,'1469-7831',null,null,'Journal of Tropical Ecology',null,null,null,null,null,null,'1',null,'87--93',null,null,'Cambridge University Press (CUP)',null,null,null,'Vegetation structure and ungulate abundance over a period of increasing elephant abundance in Hwange National Park, Zimbabwe',null,null,null,'23',null,null),
('InCollection','Valenzuela2004',null,'Jorge Valenzuela and Roberto Schlatter','Wetlands International',null,null,null,null,'2004',null,null,null,'Daniel E Blanco and Victoria M {de {la Balze}}',null,null,null,null,null,null,null,null,null,null,'Buenos Aires',null,null,null,'6',null,'81--85',null,null,'Wetlands International',null,null,null,'Las turberas de Cordillera Pelada,provincia de Valdivia (Xa Región, Chile)',null,null,null,null,null,null),
('InCollection','Valenzuela2004a',null,'Jorge Valenzuela and Roberto Schlatter','Wetlands International',null,null,null,null,'2004',null,null,null,'Daniel E Blanco and Victoria M {de {la Balze}}',null,null,null,null,null,null,null,null,null,null,'Buenos Aires',null,null,null,'7',null,'87--92',null,null,'Wetlands International',null,null,null,'Las turberas de la Isla Chiloé (X a Región, Chile): aspectos sobre usos y estado de conservación',null,null,null,null,null,null),
('Article','Valladares2002',null,'Valladares, Fernando and Balaguer, Luis and Martinez‐Ferri, Elsa and Perez‐Corona, Esther and Manrique, Esteban',null,null,null,null,null,'2002-11','10.1046/j.1469-8137.2002.00525.x',null,null,null,null,null,null,null,'1469-8137',null,null,'New Phytologist',null,null,null,null,null,null,'3',null,'457--467',null,null,'Wiley',null,null,null,'Plasticity, instability and canalization: is the phenotypic variation in seedlings of sclerophyll oaks consistent with the environmental unpredictability of Mediterranean ecosystems?',null,null,null,'156',null,null),
('Article','Valladares2000',null,'Valladares, Fernando and Martinez‐Ferri, Elsa and Balaguer, Luis and Perez‐Corona, Esther and Manrique, Esteban',null,null,null,null,null,'2000-10','10.1046/j.1469-8137.2000.00737.x',null,null,null,null,null,null,null,'1469-8137',null,null,'New Phytologist',null,null,null,null,null,null,'1',null,'79--91',null,null,'Wiley',null,null,null,'Low leaf‐level response to light and nutrients in Mediterranean evergreen oaks: a conservative resource‐use strategy?',null,null,null,'148',null,null),
('Article','Novotny2024',null,'Novotny, Ivan P. and Boul Lefeuvre, Nastasia and Attiogbé, Koffi S. and Wouyo, Atakpama and Fousseni, Folega and Dray, Anne and Waeber, Patrick O.',null,null,null,null,null,'2024-06','10.1016/j.agsy.2024.103960',null,null,null,null,null,null,null,'0308-521X',null,null,'Agricultural Systems',null,null,null,null,null,null,null,null,'103960',null,null,'Elsevier BV',null,null,null,'Exploring farmer choices in Southern Togo: Utilizing a strategy game to understand decision-making in agricultural practices',null,null,null,'218',null,null),
('Article','AcostaMaindo2018',null,'Acosta-Maindo, A. and Galbany-Casals, M.',null,null,null,null,null,'2018-07','10.3989/collectbot.2018.v37.012',null,null,null,null,null,null,null,'0010-0730',null,null,'Collectanea Botanica',null,null,null,null,null,null,null,null,'012',null,null,'Editorial CSIC',null,null,null,'\emph{Pseudognaphalium aldunateoides} de nuevo bajo {\emph{Gnaphalium}} ({Compositae: Gnaphalieae})',null,null,null,'37',null,null),
('Book','Eggenberg2018',null,'Eggenberg, Stefan',null,null,null,null,null,'2018',null,null,'1','Christophe Bornand and Philippe Juillerat and Michael Jutzi and Adrian Möhl and Reto Nyffeler and Helder Santiago',null,null,null,'9783258080482',null,null,null,null,null,null,'Chambésy-Genève',null,null,'Literaturverzeichnis: Seiten 769-770',null,null,null,'813','1004898169','Info Flora',null,null,null,'{Flora Helvetica} -- {Exkursionsführer}',null,null,null,null,null,null),
('Book','Yarham2012',null,'Yarham, Robert',null,null,null,null,null,'2012',null,null,'1. Aufl.','David Robinson and Peter Göbel',null,null,null,'9783258076959',null,null,null,null,null,null,'Bern',null,null,'Die englische Originalausgabe erschien 2010 unter dem Titel How to read the landscape',null,null,null,'256','1615534946','Haupt',null,null,'Die Formen der Erdoberfläche erkennen und verstehen','Landschaften lesen',null,null,null,null,null,null),
('Book','Wegmann2020',null,'Wegmann, Martin',null,null,null,null,null,'2020',null,null,null,'Jakob Schwalb-Willmann and Stefan Dech',null,null,null,'9781784272135',null,null,null,null,null,null,'Exeter',null,null,'Literaturverzeichnis: Seite 209',null,null,null,'216','1726983676','Pelagic Publishing',null,'Data in the wild series','Remote sensing and GIS with open source software','An introduction to spatial data analysis',null,null,null,null,null,null),
('Book','PerpinanLamigueiro2015',null,'Perpiñán Lamigueiro, Óscar',null,null,null,null,null,'2015',null,null,null,null,null,null,null,'1498786669',null,null,null,null,null,null,'Boca Raton, FL',null,null,'Includes bibliographical references. - Description based on print version record',null,null,null,'11','1680233688','CRC Press, Taylor & Francis Group',null,'Chapman & Hall/CRC the R series',null,'Displaying time series, spatial, and space-time data with R',null,null,null,null,null,null),
('Book','Hengl2018a',null,'Hengl, Tomislav and MacMillan, Robert A.',null,null,null,null,null,'2018',null,null,null,null,null,null,null,'9780359306350',null,null,null,null,null,null,null,null,null,null,null,null,'372',null,null,'Lulu.com',null,null,null,'Predictive Soil Mapping with R',null,null,null,null,null,null),
('Article','Aria2024',null,'Aria, Massimo and Le, Trang and Cuccurullo, Corrado and Belfiore, Alessandra and Choe, June',null,null,null,null,null,'2024-04','10.32614/rj-2023-089',null,null,null,null,null,null,null,'2073-4859',null,null,'The R Journal',null,null,null,null,null,null,'4',null,'167--180',null,null,'The R Foundation',null,null,null,'openalexR: An R-Tool for Collecting Bibliometric Data from OpenAlex',null,null,null,'15',null,null),
('Article','Aria2017',null,'Aria, Massimo and Cuccurullo, Corrado',null,null,null,null,null,'2017-11','10.1016/j.joi.2017.08.007',null,null,null,null,null,null,null,'1751-1577',null,null,'Journal of Informetrics',null,null,null,null,null,null,'4',null,'959--975',null,null,'Elsevier BV',null,null,null,'bibliometrix : An R-tool for comprehensive science mapping analysis',null,null,null,'11',null,null),
('Article','Drury1970',null,'Drury, D. G.',null,null,null,null,null,'1970-07','10.1080/0028825x.1970.10429122',null,null,null,null,null,null,null,'1175-8643',null,null,'New Zealand Journal of Botany',null,null,null,null,null,null,'2',null,'222--248',null,null,'Informa UK Limited',null,null,null,'A fresh approach to the classification of the genus {\emph{Gnaphalium}} with particular reference to the species present in {New Zealand} ({Inuleae-Compositae})',null,null,null,'8',null,null),
('Book','Howell2006',null,'Clayson Howell and John W.D. Sawyer',null,null,null,null,null,'2006-11',null,null,null,null,null,null,null,'9780473123000',null,null,null,null,null,null,'Wellington',null,null,null,null,null,null,'60',null,'New Zealand Plant Conservation Network',null,null,null,'{New Zealand} naturalised vascular plant checklist',null,null,null,null,null,null),
('Misc','Hauff2024',null,'Marco Hauff and Lina Molinas Comet and Paul Moosmann and Christoph Lange and Ioannis Chrysakis and Johannes Theissen-Lipp',null,null,null,null,null,'2024',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'FAIRness in Dataspaces: The Role of Semantics for Data Management',null,'https://ceur-ws.org/Vol-3705/paper01.pdf',null,null,null,null),
('Book','vanBreugel2011','Hørsholm','Paulo {van Breugel} and Roeland Kindt and Jens-Peter Barnekow Lilles{\o} and M Bingham and Demissew Sebsebe and C Dudley and I Friis and F Gachathi and James Kalema and F Mbago and V Minani and H N Moshi and J Mulumba and Mary Namaganda and H J Ndangalasi and C K Ruffo and R Jamnadass and L Graudal','Forest \& Landscape Working Papers',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'6: An overview of the methods and material used to develop the map',null,null,'129',null,'University of Copenhagen',null,null,null,'Potential natural vegetation of Eastern Africa (Ethiopia, Kenya, Malawi, Rwanda, Tanzania, Uganda and Zambia)',null,'http://vegetationmap4africa.org/documentation.aspx',null,null,null,'2011'),
('Book','vanBreugel2011a','Hørsholm','Paulo {van Breugel} and Roeland Kindt and Jens-Peter Barnekow Lilles{\o} and M Bingham and Demissew Sebsebe and C Dudley and I Friis and F Gachathi and James Kalema and F Mbago and V Minani and H N Moshi and J Mulumba and Mary Namaganda and H J Ndangalasi and C K Ruffo and R Jamnadass and L Graudal','Forest \& Landscape Working Papers',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'7: Projected distributions of potential natural vegetation types and two important agroforestry species (\emph{Prunus africana} and \emph{Warburgia ugandensis}) for six possible future climates',null,null,'55',null,'University of Copenhagen',null,null,null,'Potential natural vegetation of Eastern Africa (Ethiopia, Kenya, Malawi, Rwanda, Tanzania, Uganda and Zambia)',null,'http://vegetationmap4africa.org/documentation.aspx',null,null,null,'2011'),
('Article','vanBreugel2015',null,'{van Breugel}, Paulo and Kindt, Roeland and Lillesø, Jens-Peter Barnekow and van Breugel, Michiel',null,null,null,null,null,'2015-04','10.1371/journal.pone.0121444',null,null,'Jenkins, Clinton N',null,null,null,null,'1932-6203',null,null,'PLOS ONE',null,null,null,null,null,null,'4',null,'e0121444',null,null,'Public Library of Science (PLoS)',null,null,null,'Environmental Gap Analysis to Prioritize Conservation Efforts in Eastern Africa',null,null,null,'10',null,null),
('Book','Vancutsem2006',null,'C. Vancutsem and J.-F. Pekel and C. Evrard and F. Malaisse and P. Defourny',null,null,null,null,null,'2006',null,null,null,null,null,null,null,'9782874630163',null,null,null,null,null,null,'Louvain-la-Neuve',null,null,'Inselkt. - Mit 3 Nebenkt.',null,null,null,'1','526013257','UCL-Geomatics',null,null,'Occupation du sol','Carte de l’occupation du sol de la République Démocratique du Congo au 1 : 3 000 000',null,null,null,null,null,null),
('Article','VanderWall1992',null,'{Vander Wall}, Stephen B.',null,null,null,null,null,'1992-04','10.2307/1940767',null,null,null,null,null,null,null,'1939-9170',null,null,'Ecology',null,null,null,null,null,null,'2',null,'614--621',null,null,'Wiley',null,null,null,'The Role of Animals in Dispersing a “Wind‐Dispersed” Pine',null,null,null,'73',null,null),
('Article','VanderWall2001',null,'Vander Wall, Stephen B.',null,null,null,null,null,'2001-01','10.1007/bf02857850',null,null,null,null,null,null,null,'1874-9372',null,null,'The Botanical Review',null,null,null,null,null,null,'1',null,'74--117',null,null,'Springer Science and Business Media LLC',null,null,null,'The evolutionary ecology of nut dispersal',null,null,null,'67',null,null),
('Article','VanderWall2003',null,'Vander Wall, Stephen B.',null,null,null,null,null,'2003-01','10.1034/j.1600-0706.2003.11973.x',null,null,null,null,null,null,null,'1600-0706',null,null,'Oikos',null,null,null,null,null,null,'1',null,'25--34',null,null,'Wiley',null,null,null,'Effects of seed size of wind‐dispersed pines (Pinus) on secondary seed dispersal and the caching behavior of rodents',null,null,null,'100',null,null),
('Article','VanderWall2006',null,'Vander Wall, Stephen B. and Borchert, Mark I. and Gworek, Jennifer R.',null,null,null,null,null,'2006-07','10.1016/j.actao.2006.02.004',null,null,null,null,null,null,null,'1146-609X',null,null,'Acta Oecologica',null,null,null,null,null,null,'1',null,'100--106',null,null,'Elsevier BV',null,null,null,'Secondary dispersal of bigcone Douglas-fir (Pseudotsuga macrocarpa) seeds',null,null,null,'30',null,null),
('Article','Eldridge2024',null,'Eldridge, David J. and Ding, Jingyi and Dorrough, Josh and Delgado-Baquerizo, Manuel and Sala, Osvaldo and Gross, Nicolas and Le Bagousse-Pinguet, Yoann and Mallen-Cooper, Max and Saiz, Hugo and Asensio, Sergio and Ochoa, Victoria and Gozalo, Beatriz and Guirado, Emilio and García-Gómez, Miguel and Valencia, Enrique and Martínez-Valderrama, Jaime and Plaza, César and Abedi, Mehdi and Ahmadian, Negar and Ahumada, Rodrigo J. and Alcántara, Julio M. and Amghar, Fateh and Azevedo, Luísa and Ben Salem, Farah and Berdugo, Miguel and Blaum, Niels and Boldgiv, Bazartseren and Bowker, Matthew and Bran, Donaldo and Bu, Chongfeng and Canessa, Rafaella and Castillo-Monroy, Andrea P. and Castro, Ignacio and Castro-Quezada, Patricio and Cesarz, Simone and Chibani, Roukaya and Conceição, Abel Augusto and Darrouzet-Nardi, Anthony and Davila, Yvonne C. and Deák, Balázs and Díaz-Martínez, Paloma and Donoso, David A. and Dougill, Andrew David and Durán, Jorge and Eisenhauer, Nico and Ejtehadi, Hamid and Espinosa, Carlos Ivan and Fajardo, Alex and Farzam, Mohammad and Foronda, Ana and Franzese, Jorgelina and Fraser, Lauchlan H. and Gaitán, Juan and Geissler, Katja and Gonzalez, Sofía Laura and Gusman-Montalvan, Elizabeth and Hernández, Rosa Mary and Hölzel, Norbert and Hughes, Frederic Mendes and Jadan, Oswaldo and Jentsch, Anke and Ju, Mengchen and Kaseke, Kudzai F. and Köbel, Melanie and Lehmann, Anika and Liancourt, Pierre and Linstädter, Anja and Louw, Michelle A. and Ma, Quanhui and Mabaso, Mancha and Maggs-Kölling, Gillian and Makhalanyane, Thulani P. and Issa, Oumarou Malam and Marais, Eugene and McClaran, Mitchel and Mendoza, Betty and Mokoka, Vincent and Mora, Juan P. and Moreno, Gerardo and Munson, Seth and Nunes, Alice and Oliva, Gabriel and Oñatibia, Gastón R. and Osborne, Brooke and Peter, Guadalupe and Pierre, Margerie and Pueyo, Yolanda and Emiliano Quiroga, R. and Reed, Sasha and Rey, Ana and Rey, Pedro and Gómez, Víctor Manuel Reyes and Rolo, Víctor and Rillig, Matthias C. and le Roux, Peter C. and Ruppert, Jan Christian and Salah, Ayman and Sebei, Phokgedi Julius and Sharkhuu, Anarmaa and Stavi, Ilan and Stephens, Colton and Teixido, Alberto L. and Thomas, Andrew David and Tielbörger, Katja and Robles, Silvia Torres and Travers, Samantha and Valkó, Orsolya and van den Brink, Liesbeth and Velbert, Frederike and von Heßberg, Andreas and Wamiti, Wanyoike and Wang, Deli and Wang, Lixin and Wardle, Glenda M. and Yahdjian, Laura and Zaady, Eli and Zhang, Yuanming and Zhou, Xiaobing and Maestre, Fernando T.',null,null,null,null,null,'2024-04','10.1038/s41477-024-01670-7',null,null,null,null,null,null,null,'2055-0278',null,null,'Nature Plants',null,null,null,null,null,null,'5',null,'760--770',null,null,'Springer Science and Business Media LLC',null,null,null,'Hotspots of biogeochemical activity linked to aridity and plant traits across global drylands',null,null,null,'10',null,null),
('InProceedings','Zheng2018',null,'Zheng, Guineng and Mukherjee, Subhabrata and Dong, Xin Luna and Li, Feifei','Proceedings of the 24th ACM SIGKDD International Conference on Knowledge Discovery &amp; Data Mining',null,'KDD ’18',null,null,'2018-07','10.1145/3219819.3219839',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'ACM',null,'KDD ’18',null,'OpenTag: Open Attribute Value Extraction from Product Profiles',null,null,null,null,null,null),
('Article','Takuwa2024',null,'Takuwa, Nuubu and Wozei, Eleanor and Kizza-Nkambwe, Sarah and Malinga, Geoffrey and Kilande, George and Kinobe, Joel',null,null,null,null,null,'2024-07','10.1080/27658511.2024.2374114',null,null,null,null,null,null,null,'2765-8511',null,null,'Sustainable Environment',null,null,null,null,null,null,'1',null,null,null,null,'Informa UK Limited',null,null,null,'Plant communities as indicators of anthropogenic disturbance on a peri-urban tropical wetland of Lutembe Bay wetland system, Uganda',null,null,null,'10',null,null),
('Article','Lisner2024',null,'Lisner, Aleš and Segrestin, Jules and Konečná, Marie and Blažek, Petr and Janíková, Eva and Applová, Markéta and Švancárová, Tereza and Lepš, Jan',null,null,null,null,null,'2024-07','10.1111/1365-2745.14364',null,null,null,null,null,null,null,'1365-2745',null,null,'Journal of Ecology',null,null,null,null,null,null,null,null,null,null,null,'Wiley',null,null,null,'Why are plant communities stable? Disentangling the role of dominance, asynchrony and averaging effect following realistic species loss scenario',null,null,null,null,null,null),
('Article','Hemp2024',null,'Hemp, Andreas and Hemp, Judith',null,null,null,null,null,'2024-03','10.1371/journal.pone.0299363',null,null,'Krakauer, Nir Y.',null,null,null,null,'1932-6203',null,null,'PLOS ONE',null,null,null,null,null,null,'3',null,'e0299363',null,null,'Public Library of Science (PLoS)',null,null,null,'Weather or not—Global climate databases: Reliable on tropical mountains?',null,null,null,'19',null,null),
('Article','Zuloaga2019',null,'Zuloaga, Fernando O. and Belgrano, Manuel J. and Zanotti, Christian A.',null,null,null,null,null,'2019-12','10.14522/darwiniana.2019.72.861',null,null,null,null,null,null,null,'1850-1699',null,null,'Darwiniana',null,null,null,null,null,null,'2',null,'208--278',null,null,'Instituto de Botanica Darwinion (IBODA)',null,null,null,'Actualización del catálogo de las plantas vasculares del {Cono Sur}',null,null,null,'7',null,null),
('Article','Urtubey2016',null,'Urtubey, Estrella and López, Alicia and Chemisquy, María A. and Anderberg, Arne A. and Baeza, Carlos M. and Bayón, Néstor D. and Deble, Leonardo P. and Moreira-Muñoz, Andrés and Nesom, Guy L. and Alford, Mac H. and Salomón, Luciana and Freire, Susana E.',null,null,null,null,null,'2016-07','10.1007/s00606-016-1316-4',null,null,null,null,null,null,null,'2199-6881',null,null,'Plant Systematics and Evolution',null,null,null,null,null,null,'8',null,'1047--1066',null,null,'Springer Science and Business Media LLC',null,null,null,'New circumscription of the genus {\emph{Gamochaeta}} ({Asteraceae, Gnaphalieae}) inferred from nuclear and plastid {DNA} sequences',null,null,null,'302',null,null),
('Article','Smissen2020',null,'Smissen, Rob D. and Bayer, Randall J. and Bergh, Nicola G. and Breitwieser, Ilse and Freire, Susana E. and Galbany‐Casals, Mercè and Schmidt‐Lebuhn, Alexander N. and Ward, Josephine M.',null,null,null,null,null,'2020-08','10.1002/tax.12294',null,null,null,null,null,null,null,'1996-8175',null,null,'TAXON',null,null,null,null,null,null,'4',null,'778--806',null,null,'Wiley',null,null,null,'A revised subtribal classification of Gnaphalieae (Asteraceae)',null,null,null,'69',null,null),
('Article','Nie2016',null,'Nie, Ze‐Long and Funk, Vicki A. and Meng, Ying and Deng, Tao and Sun, Hang and Wen, Jun',null,null,null,null,null,'2016','10.1111/nph.13740',null,null,null,null,null,null,null,'1469-8137',null,null,'New Phytologist',null,null,null,null,null,null,'4',null,'1795--1806',null,null,'Wiley',null,null,null,'Recent assembly of the global herbaceous flora: Evidence from the paper daisies ({Asteraceae: Gnaphalieae})',null,null,null,'209',null,null),
('Article','Minh2020',null,'Minh, Bui Quang and Schmidt, Heiko A and Chernomor, Olga and Schrempf, Dominik and Woodhams, Michael D and von Haeseler, Arndt and Lanfear, Robert',null,null,null,null,null,'2020-02','10.1093/molbev/msaa015',null,null,'Teeling, Emma',null,null,null,null,'1537-1719',null,null,'Molecular Biology and Evolution',null,null,null,null,null,null,'5',null,'1530--1534',null,null,'Oxford University Press (OUP)',null,null,null,'{IQ-TREE 2}: new models and efficient methods for phylogenetic inference in the genomic era',null,null,null,'37',null,null),
('Article','Luebert2017a',null,'Luebert, Federico and Moreira-Muñoz, Andrés and Wilke, Katharina and Dillon, Michael O.',null,null,null,null,null,'2017-09','10.12705/665.11',null,null,null,null,null,null,null,'1996-8175',null,null,'TAXON',null,null,null,null,null,null,'5',null,'1184--1199',null,null,'Wiley',null,null,null,'Phylogeny and evolution of achenial trichomes in the {\emph{Lucilia}}‐group ({Asteraceae: Gnaphalieae}) and their systematic significance',null,null,null,'66',null,null),
('Article','Katoh2002',null,'Katoh, K.',null,null,null,null,null,'2002-07','10.1093/nar/gkf436',null,null,null,null,null,null,null,'1362-4962',null,null,'Nucleic Acids Research',null,null,null,null,null,null,'14',null,'3059--3066',null,null,'Oxford University Press',null,null,null,'{MAFFT}: A novel method for rapid multiple sequence alignment based on fast {Fourier} transform',null,null,null,'30',null,null),
('Article','GalbanyCasals2010',null,'Galbany-Casals, Mercè and Andrés-Sánchez, Santiago and Garcia-Jacas, Núria and Susanna, Alfonso and Rico, Enrique and Martínez-Ortega, M. Montserrat',null,null,null,null,null,'2010-12','10.1002/tax.596003',null,null,null,null,null,null,null,'1996-8175',null,null,'TAXON',null,null,null,null,null,null,'6',null,'1671--1689',null,null,'Wiley',null,null,null,'How many of {Cassini} anagrams should there be? Molecular systematics and phylogenetic relationships in the {\emph{Filago}} group ({Asteraceae, Gnaphalieae}), with special focus on the genus \emph{Filago}',null,null,null,'59',null,null),
('Article','Bloech2010',null,'Blöch, C. and Dickoré, W. B. and Samuel, R. and Stuessy, T. F.',null,null,null,null,null,'2010-05','10.1017/s0960428610000065',null,null,null,null,null,null,null,'0960-4286',null,null,'Edinburgh Journal of Botany',null,null,null,null,null,null,'2',null,'235--264',null,null,'Royal Botanic Garden Edinburgh',null,null,null,'Molecular phylogeny of the {Edelweiss} ({\emph{Leontopodium}}, {Asteraceae – Gnaphalieae})',null,null,null,'67',null,null),
('Article','Bergh2015',null,'Bergh, N.G. and Haiden, S.A. and Verboom, G.A.',null,null,null,null,null,'2015-09','10.1016/j.sajb.2015.05.023',null,null,null,null,null,null,null,'0254-6299',null,null,'South African Journal of Botany',null,null,null,null,null,null,null,null,'219--227',null,null,'Elsevier BV',null,null,null,'Molecular phylogeny of the ''{Cape} snow'' genus {\emph{Syncarpha}} ({Asteraceae: Gnaphalieae}) reveals a need for generic re-delimitation',null,null,null,'100',null,null),
('Article','Anderberg1991',null,'Anderberg, Arne A.',null,null,null,null,null,'1991','10.1007/bf00937947',null,null,null,null,null,null,null,'1615-6110',null,null,'Plant Systematics and Evolution',null,null,null,null,null,null,'1–2',null,'75--123',null,null,'Springer Science and Business Media LLC',null,null,null,'Taxonomy and phylogeny of the tribe {Inuleae} ({Asteraceae})',null,null,null,'176',null,null),
('Article','Zizka2019',null,'Zizka, Alexander and Silvestro, Daniele and Andermann, Tobias and Azevedo, Josué and Duarte Ritter, Camila and Edler, Daniel and Farooq, Harith and Herdean, Andrei and Ariza, María and Scharn, Ruud and Svantesson, Sten and Wengström, Niklas and Zizka, Vera and Antonelli, Alexandre',null,null,null,null,null,'2019-02','10.1111/2041-210x.13152',null,null,'Quental, Tiago',null,null,null,null,'2041-210X',null,null,'Methods in Ecology and Evolution',null,null,null,null,null,null,'5',null,'744--751',null,null,'Wiley',null,null,null,'CoordinateCleaner: Standardized cleaning of occurrence records from biological collection databases',null,null,null,'10',null,null),
('Article','Maldonado2015',null,'Maldonado, Carla and Molina, Carlos I. and Zizka, Alexander and Persson, Claes and Taylor, Charlotte M. and Albán, Joaquina and Chilquillo, Eder and Rønsted, Nina and Antonelli, Alexandre',null,null,null,null,null,'2015-05','10.1111/geb.12326',null,null,null,null,null,null,null,'1466-8238',null,null,'Global Ecology and Biogeography',null,null,null,null,null,null,'8',null,'973--984',null,null,'Wiley',null,null,null,'Estimating species diversity and distribution in the era of Big Data: to what extent can we trust public databases?',null,null,null,'24',null,null),
('Book','Kappas2012',null,'Kappas, Martin',null,null,null,null,null,'2012',null,null,'2. Aufl., Neubearb.',null,null,null,null,'9783141603620',null,null,null,null,null,null,'Braunschweig',null,null,null,null,null,null,'284','1615815465','Westermann',null,'Das @geographische Seminar',null,'Geographische Informationssysteme',null,null,null,null,null,null),
('Book','Wegmann2016',null,'Wegmann, Martin',null,null,null,null,null,'2016',null,null,null,null,null,null,null,'9781784270223',null,null,null,null,null,null,'Exeter',null,null,'Description based upon print version of record',null,null,null,'1465','856777854','Pelagic Publishing',null,'Data in the Wild','Using open source software','Remote sensing and GIS for ecologists',null,null,null,null,null,null),
('Article','Behn2024',null,'Behn, Kai and Alvarez, Miguel and Mutebi, Samuel and Becker, Mathias',null,null,null,null,null,'2024-09','10.1007/s11273-024-10011-6',null,null,null,null,null,null,null,'1572-9834',null,null,'Wetlands Ecology and Management',null,null,null,null,null,null,null,null,null,null,null,'Springer Science and Business Media LLC',null,null,null,'Recovery dynamics of wetland vegetation along a hydrological gradient in an agriculturally used inland valley in Uganda',null,null,null,null,null,null),
('Article','Nitta2024',null,'Nitta, Joel H. and Iwasaki, Wataru',null,null,null,null,null,'2024-01','10.21105/joss.06215',null,null,null,null,null,null,null,'2475-9066',null,null,'Journal of Open Source Software',null,null,null,null,null,null,'93',null,'6215',null,null,'The Open Journal',null,null,null,'dwctaxon, an R package for editing and validating taxonomic data in Darwin Core format',null,null,null,'9',null,null),
('Article','Meyer2024',null,'Meyer, Hanna and Ludwig, Marvin and Milà, Carles and Linnenbrink, Jan and Schumacher, Fabian',null,null,null,null,'arXiv.org perpetual, non-exclusive license','2024','10.48550/ARXIV.2404.06978',null,null,null,null,null,null,null,null,null,null,null,'Machine Learning (stat.ML), Machine Learning (cs.LG), Quantitative Methods (q-bio.QM), FOS: Computer and information sciences, FOS: Computer and information sciences, FOS: Biological sciences, FOS: Biological sciences',null,null,null,null,null,null,null,null,null,null,'arXiv',null,null,null,'The CAST package for training and assessment of spatial prediction models in R',null,null,null,null,null,null),
('Article','Guuroh2024',null,'Guuroh, Reginald T. and Brown, Leslie R. and Alvarez, Miguel and Finckh, Manfred and Schmiedel, Ute and Tsheboeng, Gaolathe and Dengler, Jürgen',null,null,null,null,null,'2024-12','10.3897/vcs.143360',null,null,null,null,null,null,null,'2683-0671',null,null,'Vegetation Classification and Survey',null,null,null,null,null,null,null,null,'279--288',null,null,'Pensoft Publishers',null,null,null,'African vegetation studies: introduction to a Special Collection',null,null,null,'5',null,null),
('Article','Joelson2025',null,'Joelson, Natalia Zoe and Simon, Alois and von Lampe, Friedemann and Loguercio, Gabriel Ángel and Zerbe, Stefan and Leuschner, Christoph and Walentowski, Helge',null,null,null,null,null,'2025-02','10.3897/vcs.134621',null,null,null,null,null,null,null,'2683-0671',null,null,'Vegetation Classification and Survey',null,null,null,null,null,null,null,null,'37--56',null,null,'Pensoft Publishers',null,null,null,'Floristic patterns in the Andes of northern Patagonia’s forests, Argentina: towards integrating ecological responses with expert-based and unsupervised classification methods',null,null,null,'6',null,null),
('Dataset','Alvarez2025',null,'Alvarez, Miguel and Lindfeld, Johanna',null,null,null,null,null,null,'10.5281/zenodo.15314852',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,'may',null,null,null,null,null,null,'Zenodo',null,null,null,'Landforms and soils of Baringo District, Kenya (Touber 1989)',null,'https://doi.org/10.5281/zenodo.15314852',null,null,null,'2025'),
('Article','Li2024',null,'Li, Yigang and Liu, Fan and Zhou, Yadong and Liu, Xing and Wang, Qingfeng',null,null,null,null,null,'2024-03','10.1016/j.ecolind.2024.111889',null,null,null,null,null,null,null,'1470-160X',null,null,'Ecological Indicators',null,null,null,null,null,null,null,null,'111889',null,null,'Elsevier BV',null,null,null,'Geographic patterns and environmental correlates of taxonomic, phylogenetic and functional β-diversity of wetland plants in the Qinghai-Tibet Plateau',null,null,null,'160',null,null);
update "bib_references"."main_table" set "author" = 'Anderson, Marti J. and Santana‐Garcon, Julia' where "bibtexkey" = 'Anderson2015';
update "bib_references"."main_table" set "author" = 'Javier Amigo and Manuel A. {Rodríguez Guitián} and Carlos Ramírez' where "bibtexkey" = 'Amigo2010';
update "bib_references"."main_table" set "author" = 'Mary T Kalin Arroyo and Clodomiro Marticorena and Oscar Matthei and Mélica Muñoz and Patricio Pliscoff' where "bibtexkey" = 'Arroyo2002';
update "bib_references"."main_table" set "author" = 'L., Balaguer and Martínez‐Ferri, E. and Valladares, F. and Pérez‐Corona, M. E. and Baquedano, F. J. and Castillo, F. J. and Manrique, E.' where "bibtexkey" = 'Balaguer2001';
update "bib_references"."main_table" set "author" = 'Boyce, Richard L. and Ellison, Paula C.' where "bibtexkey" = 'Boyce2001';
update "bib_references"."main_table" set "author" = 'Berg, Christian and Abdank, Anja and Isermann, Maike and Jansen, Florian and Timmermann, Tiemo and Dengler, Jürgen' where "bibtexkey" = 'Berg2014';
update "bib_references"."main_table" set "author" = 'Cilliers, S. S. and Schoeman, L. L. and Bredenkamp, G. J.' where "bibtexkey" = 'Cilliers1998';
update "bib_references"."main_table" set "author" = 'Dormann, Carsten F.' where "bibtexkey" = 'Dormann2007';
update "bib_references"."main_table" set "author" = 'Susana E Freire and Néstor D. Bayón and Carlos M Baeza and Daniel A Giuliano and Claudia Monti' where "bibtexkey" = 'Freire2014';
update "bib_references"."main_table" set "author" = 'Nicol Fuentes and Aníbal Pauchard and Paulina Sánchez and Jocelyn Esquivel and Alicia Marticorena' where "bibtexkey" = 'Fuentes2013';
update "bib_references"."main_table" set "author" = 'Gondard, Hélène and Deconchat, Marc' where "bibtexkey" = 'Gondard2003';
update "bib_references"."main_table" set "author" = 'Enrique Hauenstein and Marcos González and Fernando Peña-Cortés and Andrés Muñoz-Pedreros' where "bibtexkey" = 'Hauenstein2002';
update "bib_references"."main_table" set "author" = 'Heinrich, Dieter and Hergt, Manfred' where "bibtexkey" = 'Heinrich2006';
update "bib_references"."main_table" set "author" = 'Adriana Hoffmann' where "bibtexkey" = 'Hoffmann1998';
update "bib_references"."main_table" set "author" = 'Adriana Hoffmann J. and Flavia Liberona and Mélica Muñoz and John Watson and Mary T. Kalin Arroyo and Ana Rosa Flores and Andrés Jullián' where "bibtexkey" = 'Hoffmann1998a';
update "bib_references"."main_table" set "author" = 'Lara, A. and Little, C. and Urrutia, R. and McPhee, J. and Álvarez-Garretón, C. and Oyarzún, C. and Soto, D. and Donoso, P. and Nahuelhual, L. and Pino, M. and Arismendi, I.' where "bibtexkey" = 'Lara2009';
update "bib_references"."main_table" set "author" = 'Mayfield, M. M. and Bonser, S. P. and Morgan, J. W. and Aubin, I. and McNamara, S. and Vesk, P. A.' where "bibtexkey" = 'Mayfield2010';
update "bib_references"."main_table" set "author" = 'Claudia Monti and Néstor D. Bayón and Daniel A Giuliano and Susana E Frei' where "bibtexkey" = 'Monti2013';
update "bib_references"."main_table" set "author" = 'Nuzzo, Regina' where "bibtexkey" = 'Nuzzo2014';
update "bib_references"."main_table" set "author" = 'Perkins, Thaïs E. and Wilson, Mark V.' where "bibtexkey" = 'Perkins2005';
update "bib_references"."main_table" set "author" = 'Prach, K. and Lepš, J. and Michálek, J.' where "bibtexkey" = 'Prach1996';
update "bib_references"."main_table" set "author" = 'Pyšek, Petr and Lepš, Jan' where "bibtexkey" = 'Pysek1991';
update "bib_references"."main_table" set "author" = 'Carlos Ramírez and Magaly Riveros' where "bibtexkey" = 'Ramirez1975';
update "bib_references"."main_table" set "author" = 'Seppelt, Ralf and Dormann, Carsten F. and Eppink, Florian V. and Lautenbach, Sven and Schmidt, Stefan' where "bibtexkey" = 'Seppelt2011';
update "bib_references"."main_table" set "author" = 'Tichý, Lubomír' where "bibtexkey" = 'Tichy2005';
update "bib_references"."main_table" set "author" = 'Thorsen, Jack A. and Crabtree, Garvin' where "bibtexkey" = 'Thorsen1977';
update "bib_references"."main_table" set "author" = 'Luebert, Federico and Fuentes-Castillo, Taryn and Pliscoff, Patricio and García, Nicolás and Román, María José and Vera, Diego and Scherson, Rosa A.' where "bibtexkey" = 'Luebert2022a';
update "bib_references"."main_table" set "author" = 'Tjørve, Even and Tjørve, Kathleen M. Calf' where "bibtexkey" = 'Tjoerve2008a';
update "bib_references"."main_table" set "editor" = 'Chase, Jonathan' where "bibtexkey" = 'Anderson2015';
update "bib_references"."main_table" set "editor" = 'Mucina, Ladislav' where "bibtexkey" = 'Berg2014';
update "bib_references"."main_table" set "editor" = 'Christoph Leuschner and Hartmut Dierschke' where "bibtexkey" = 'Ellenberg1996';
update "bib_references"."main_table" set "editor" = 'Rudolf Fahnert' where "bibtexkey" = 'Heinrich2006';
update "bib_references"."main_table" set "editor" = 'Andrés Jullián' where "bibtexkey" = 'Hoffmann2005';
update "bib_references"."main_table" set "editor" = 'Adriana Hoffmann J. and Flavia Liberona and Mélica Muñoz and John Watson and Mary T. Kalin Arroyo and Ana Rosa Flores and Andrés Jullián' where "bibtexkey" = 'Hoffmann1998a';
update "bib_references"."main_table" set "editor" = 'Angelika Schwabe and Theo Müller' where "bibtexkey" = 'Oberdorfer2001';
update "bib_references"."main_table" set "publisher" = 'Scientific Research Publishing, Inc' where "bibtexkey" = 'ShiferawAlem2012';
update "bib_references"."main_table" set "publisher" = 'Wiley' where "bibtexkey" = 'Anderson2015';
update "bib_references"."main_table" set "publisher" = 'Wiley' where "bibtexkey" = 'Balaguer2001';
update "bib_references"."main_table" set "publisher" = 'Wiley' where "bibtexkey" = 'Boyce2001';
update "bib_references"."main_table" set "publisher" = 'Wiley' where "bibtexkey" = 'Berg2014';
update "bib_references"."main_table" set "publisher" = 'South African National Biodiversity Institute' where "bibtexkey" = 'Cilliers1998';
update "bib_references"."main_table" set "publisher" = 'Verlag Eugen Ulmer' where "bibtexkey" = 'Ellenberg1996';
update "bib_references"."main_table" set "publisher" = 'Elsevier BV' where "bibtexkey" = 'Dormann2007';
update "bib_references"."main_table" set "publisher" = 'Elsevier BV' where "bibtexkey" = 'Eckhardt1993a';
update "bib_references"."main_table" set "publisher" = 'Elsevier BV' where "bibtexkey" = 'Eckhardt1996';
update "bib_references"."main_table" set "publisher" = 'SciELO Agencia Nacional de Investigacion y Desarrollo (ANID)' where "bibtexkey" = 'Freire2014';
update "bib_references"."main_table" set "publisher" = 'EDP Sciences' where "bibtexkey" = 'Gondard2003';
update "bib_references"."main_table" set "publisher" = '[Hengl]' where "bibtexkey" = 'Hengl2009';
update "bib_references"."main_table" set "publisher" = 'Fundación Claudio Gay' where "bibtexkey" = 'Hoffmann2005';
update "bib_references"."main_table" set "publisher" = 'Fundación Claudio Gay' where "bibtexkey" = 'Hoffmann1998';
update "bib_references"."main_table" set "publisher" = 'Fundación Claudio Gay' where "bibtexkey" = 'Hoffmann1998a';
update "bib_references"."main_table" set "publisher" = 'Elsevier BV' where "bibtexkey" = 'Lara2009';
update "bib_references"."main_table" set "publisher" = 'Wiley' where "bibtexkey" = 'Licker2010';
update "bib_references"."main_table" set "publisher" = 'Wiley' where "bibtexkey" = 'Maestre2009';
update "bib_references"."main_table" set "publisher" = 'Wiley' where "bibtexkey" = 'Mayfield2010';
update "bib_references"."main_table" set "publisher" = 'Scientific Research Publishing, Inc' where "bibtexkey" = 'Nsubuga2014';
update "bib_references"."main_table" set "publisher" = 'Springer Science and Business Media LLC' where "bibtexkey" = 'Nuzzo2014';
update "bib_references"."main_table" set "publisher" = 'Verlag Eugen Ulmer' where "bibtexkey" = 'Oberdorfer2001';
update "bib_references"."main_table" set "publisher" = 'Elsevier BV' where "bibtexkey" = 'Perkins2005';
update "bib_references"."main_table" set "publisher" = 'Springer Science and Business Media LLC' where "bibtexkey" = 'Pietsch1973';
update "bib_references"."main_table" set "publisher" = 'Wiley' where "bibtexkey" = 'Prach1996';
update "bib_references"."main_table" set "publisher" = 'Wiley' where "bibtexkey" = 'Pysek1991';
update "bib_references"."main_table" set "publisher" = 'Wiley' where "bibtexkey" = 'RuizdelClavijo2001';
update "bib_references"."main_table" set "publisher" = 'Springer Science and Business Media LLC' where "bibtexkey" = 'vanZinderenBakker1974';
update "bib_references"."main_table" set "publisher" = 'Wiley' where "bibtexkey" = 'Seppelt2011';
update "bib_references"."main_table" set "publisher" = 'Springer Science and Business Media LLC' where "bibtexkey" = 'Tichy2005';
update "bib_references"."main_table" set "publisher" = 'Scientific Research Publishing, Inc' where "bibtexkey" = 'Canon2011';
update "bib_references"."main_table" set "publisher" = 'Pensoft Publishers' where "bibtexkey" = 'Fuentes2020';
update "bib_references"."main_table" set "publisher" = 'Cambridge University Press (CUP)' where "bibtexkey" = 'Thorsen1977';
update "bib_references"."main_table" set "publisher" = 'MDPI AG' where "bibtexkey" = 'Luebert2022a';
update "bib_references"."main_table" set "title" = 'Nanism and ephemerism as reasons for a hidden abundance in vernal pool plants: the example of {\emph{Lepuropetalon spathulatum}} in {Chile}' where "bibtexkey" = 'Alvarez2012a';
update "bib_references"."main_table" set "title" = 'Measures of precision for dissimilarity‐based multivariate analysis of ecological communities' where "bibtexkey" = 'Anderson2015';
update "bib_references"."main_table" set "title" = 'Population divergence in the plasticity of the response of Quercus coccifera to the light environment' where "bibtexkey" = 'Balaguer2001';
update "bib_references"."main_table" set "title" = 'Red Lists and conservation prioritization of plant communities – a methodological framework' where "bibtexkey" = 'Berg2014';
update "bib_references"."main_table" set "title" = 'Wetland plant communities in the Potchefstroom Municipal Area, North-West, South Africa' where "bibtexkey" = 'Cilliers1998';
update "bib_references"."main_table" set "title" = 'Vegetation Mitteleuropas mit den {Alpen}' where "bibtexkey" = 'Ellenberg1996';
update "bib_references"."main_table" set "title" = 'Plant communities and species richness of the Agrostis lachnantha–Eragrostis plana Wetlands of northern KwaZulu-Natal' where "bibtexkey" = 'Eckhardt1996';
update "bib_references"."main_table" set "title" = 'Revision of the genus {\emph{Pseudognaphalium}} ({Asteraceae, Gnaphalieae}) in {Chile}' where "bibtexkey" = 'Freire2014';
update "bib_references"."main_table" set "title" = 'A new comprehensive database of alien plant species in {Chile} based on herbarium records' where "bibtexkey" = 'Fuentes2013';
update "bib_references"."main_table" set "title" = 'El género \emph{Festuca} ({Poaceae}) en {Chile}' where "bibtexkey" = 'Matthei1982';
update "bib_references"."main_table" set "title" = 'Estudio crítico de las gramíneas del género \emph{Stipa} en {Chile}' where "bibtexkey" = 'Matthei1965';
update "bib_references"."main_table" set "title" = 'Refining the stress‐gradient hypothesis for competition and facilitation in plant communities' where "bibtexkey" = 'Maestre2009';
update "bib_references"."main_table" set "title" = 'What does species richness tell us about functional trait diversity? Predictions and evidence for responses of species and functional trait diversity to land‐use change' where "bibtexkey" = 'Mayfield2010';
update "bib_references"."main_table" set "title" = 'New combinations, new synonyms, and typifications in {\emph{Pseudognaphalium}} ({Asteraceae: Gnaphalieae}) from {South America}' where "bibtexkey" = 'Monti2013';
update "bib_references"."main_table" set "title" = 'Scientific method: Statistical errors' where "bibtexkey" = 'Nuzzo2014';
update "bib_references"."main_table" set "title" = 'Pflanzensoziologische {Exkursionsflora} für {Deutschland} und angrenzende {Gebiete}' where "bibtexkey" = 'Oberdorfer2001';
update "bib_references"."main_table" set "title" = 'The impacts of \emph{Phalaris arundinacea} (reed canarygrass) invasion on wetland plant richness in the Oregon Coast Range, USA depend on beavers' where "bibtexkey" = 'Perkins2005';
update "bib_references"."main_table" set "title" = 'Zum {Keimverhalten} ausgewählter {Arten} mitteleuropäischer {Zwergbinsengesellschaften}' where "bibtexkey" = 'Pietsch1999';
update "bib_references"."main_table" set "title" = 'Beitrag zur {Gliederung} der europäischen {Zwergbinsengesellschaften} ({\emph{Isoëto-Nanojuncetea}} {Br.-Bl. \& Tx.} 1943)' where "bibtexkey" = 'Pietsch1973';
update "bib_references"."main_table" set "title" = 'Die {Pflanzengesellschaften Deutschlands}' where "bibtexkey" = 'Pott1995';
update "bib_references"."main_table" set "title" = 'Flora de {Chile}' where "bibtexkey" = 'Reiche1905';
update "bib_references"."main_table" set "title" = 'The role of dimorphic achenes in the biology of the annual weed \emph{Leontodon longirostris}' where "bibtexkey" = 'RuizdelClavijo2001';
update "bib_references"."main_table" set "title" = 'A quantitative review of ecosystem service studies: approaches, shortcomings and the road ahead: Priorities for ecosystem service studies' where "bibtexkey" = 'Seppelt2011';
update "bib_references"."main_table" set "title" = 'Raunkiaer''s "life-forms" and statistical methods' where "bibtexkey" = 'Smith1913';
update "bib_references"."main_table" set "title" = 'Multi-taxa inventory of naturalized species in {Chile}' where "bibtexkey" = 'Fuentes2020';
update "bib_references"."main_table" set "title" = 'Plant geography of {Chile}' where "bibtexkey" = 'MoreiraMunoz2011';
update "bib_references"."main_table" set "title" = 'Geographic patterns of vascular plant diversity and endemism using different taxonomic and spatial units' where "bibtexkey" = 'Luebert2022a';
update "bib_references"."main_table" set "title" = 'The species-area relationship, self-similarity, and the true meaning of the {Z}-value' where "bibtexkey" = 'Tjoerve2008a';
update "bib_references"."main_table" set "journaltitle" = 'Ecology Letters' where "bibtexkey" = 'Anderson2015';
update "bib_references"."main_table" set "journaltitle" = 'Functional Ecology' where "bibtexkey" = 'Balaguer2001';
update "bib_references"."main_table" set "journaltitle" = 'Journal of Vegetation Science' where "bibtexkey" = 'Boyce2001';
update "bib_references"."main_table" set "journaltitle" = 'Basic and Applied Ecology' where "bibtexkey" = 'Dormann2007';
update "bib_references"."main_table" set "journaltitle" = 'Gayana. Botánica' where "bibtexkey" = 'Freire2014';
update "bib_references"."main_table" set "journaltitle" = 'Annals of Forest Science' where "bibtexkey" = 'Gondard2003';
update "bib_references"."main_table" set "journaltitle" = 'Gayana Botánica' where "bibtexkey" = 'Matthei1982';
update "bib_references"."main_table" set "journaltitle" = 'Gayana Botánica' where "bibtexkey" = 'Matthei1965';
update "bib_references"."main_table" set "journaltitle" = 'Forest Ecology and Management' where "bibtexkey" = 'Lara2009';
update "bib_references"."main_table" set "journaltitle" = 'Global Ecology and Biogeography' where "bibtexkey" = 'Licker2010';
update "bib_references"."main_table" set "journaltitle" = 'Journal of Ecology' where "bibtexkey" = 'Maestre2009';
update "bib_references"."main_table" set "journaltitle" = 'Global Ecology and Biogeography' where "bibtexkey" = 'Mayfield2010';
update "bib_references"."main_table" set "journaltitle" = 'Biological Conservation' where "bibtexkey" = 'Perkins2005';
update "bib_references"."main_table" set "journaltitle" = 'Mitteilund des badischen Landesvereins für Naturkunde und Naturschutz' where "bibtexkey" = 'Pietsch1999';
update "bib_references"."main_table" set "journaltitle" = 'Journal of Vegetation Science' where "bibtexkey" = 'Prach1996';
update "bib_references"."main_table" set "journaltitle" = 'Journal of Vegetation Science' where "bibtexkey" = 'Pysek1991';
update "bib_references"."main_table" set "journaltitle" = 'Weed Research' where "bibtexkey" = 'RuizdelClavijo2001';
update "bib_references"."main_table" set "journaltitle" = 'Journal of Applied Ecology' where "bibtexkey" = 'Seppelt2011';
update "bib_references"."main_table" set "journaltitle" = 'Gayana. Botánica' where "bibtexkey" = 'Rodriguez2018';
update "bib_references"."main_table" set "journaltitle" = 'Weed Science' where "bibtexkey" = 'Thorsen1977';
update "bib_references"."main_table" set "series" = 'UTB' where "bibtexkey" = 'Ellenberg1996';
update "bib_references"."main_table" set "series" = 'Dtv' where "bibtexkey" = 'Heinrich2006';
update "bib_references"."main_table" set "series" = 'Statistik und ihre Anwendungen' where "bibtexkey" = 'Ligges2008';
update "bib_references"."main_table" set "series" = 'UTB für Wissenschaft' where "bibtexkey" = 'Pott1995';
update "bib_references"."main_table" set "volume" = null where "bibtexkey" = 'Hoffmann2005';
update "bib_references"."main_table" set "volume" = null where "bibtexkey" = 'Hoffmann1998';
update "bib_references"."main_table" set "volume" = '11},
comment-miguel = {This article is about reproducibility.' where "bibtexkey" = 'Donoho2010';
update "bib_references"."main_table" set "number" = '1' where "bibtexkey" = 'Anderson2015';
update "bib_references"."main_table" set "number" = '5' where "bibtexkey" = 'Boyce2001';
update "bib_references"."main_table" set "number" = '8104' where "bibtexkey" = 'Ellenberg1996';
update "bib_references"."main_table" set "number" = '7' where "bibtexkey" = 'Gondard2003';
update "bib_references"."main_table" set "number" = '3329' where "bibtexkey" = 'Heinrich2006';
update "bib_references"."main_table" set "number" = '4' where "bibtexkey" = 'Lara2009';
update "bib_references"."main_table" set "number" = '6' where "bibtexkey" = 'Licker2010';
update "bib_references"."main_table" set "number" = '2' where "bibtexkey" = 'Maestre2009';
update "bib_references"."main_table" set "number" = '4' where "bibtexkey" = 'Mayfield2010';
update "bib_references"."main_table" set "number" = '7487' where "bibtexkey" = 'Nuzzo2014';
update "bib_references"."main_table" set "number" = '2' where "bibtexkey" = 'Perkins2005';
update "bib_references"."main_table" set "number" = '5--6' where "bibtexkey" = 'Pietsch1973';
update "bib_references"."main_table" set "number" = '8067' where "bibtexkey" = 'Pott1995';
update "bib_references"."main_table" set "number" = '2' where "bibtexkey" = 'Pysek1991';
update "bib_references"."main_table" set "number" = null where "bibtexkey" = 'Reiche1905';
update "bib_references"."main_table" set "volumes" = '4' where "bibtexkey" = 'Reiche1905';
update "bib_references"."main_table" set "edition" = '6' where "bibtexkey" = 'Ellenberg1996';
update "bib_references"."main_table" set "edition" = 'Orig.-Ausg., 1. Aufl.' where "bibtexkey" = 'Heinrich2006';
update "bib_references"."main_table" set "edition" = '2nd extended ed' where "bibtexkey" = 'Hengl2009';
update "bib_references"."main_table" set "edition" = '5' where "bibtexkey" = 'Hoffmann2005';
update "bib_references"."main_table" set "edition" = '4' where "bibtexkey" = 'Hoffmann1998';
update "bib_references"."main_table" set "edition" = '3. Aufl. 2008' where "bibtexkey" = 'Ligges2008';
update "bib_references"."main_table" set "edition" = '8' where "bibtexkey" = 'Oberdorfer2001';
update "bib_references"."main_table" set "edition" = '2' where "bibtexkey" = 'Pott1995';
update "bib_references"."main_table" set "pages" = '66--73' where "bibtexkey" = 'Anderson2015';
update "bib_references"."main_table" set "pages" = '85--98' where "bibtexkey" = 'Amigo2010';
update "bib_references"."main_table" set "pages" = '124--135' where "bibtexkey" = 'Balaguer2001';
update "bib_references"."main_table" set "pages" = '711--720' where "bibtexkey" = 'Boyce2001';
update "bib_references"."main_table" set "pages" = '504--515' where "bibtexkey" = 'Berg2014';
update "bib_references"."main_table" set "pages" = '213--229' where "bibtexkey" = 'Cilliers1998';
update "bib_references"."main_table" set "pages" = null where "bibtexkey" = 'Ellenberg1996';
update "bib_references"."main_table" set "pages" = '387--397' where "bibtexkey" = 'Dormann2007';
update "bib_references"."main_table" set "pages" = '391--400' where "bibtexkey" = 'Eckhardt1993a';
update "bib_references"."main_table" set "pages" = '306--315' where "bibtexkey" = 'Eckhardt1996';
update "bib_references"."main_table" set "pages" = '68--107' where "bibtexkey" = 'Freire2014';
update "bib_references"."main_table" set "pages" = '847--858' where "bibtexkey" = 'Fuentes2013';
update "bib_references"."main_table" set "pages" = '725--732' where "bibtexkey" = 'Gondard2003';
update "bib_references"."main_table" set "pages" = '1--64' where "bibtexkey" = 'Matthei1982';
update "bib_references"."main_table" set "pages" = '87--100' where "bibtexkey" = 'Hauenstein2002';
update "bib_references"."main_table" set "pages" = null where "bibtexkey" = 'Hoffmann2005';
update "bib_references"."main_table" set "pages" = null where "bibtexkey" = 'Hoffmann1998';
update "bib_references"."main_table" set "pages" = '1--137' where "bibtexkey" = 'Matthei1965';
update "bib_references"."main_table" set "pages" = '415--424' where "bibtexkey" = 'Lara2009';
update "bib_references"."main_table" set "pages" = '769--782' where "bibtexkey" = 'Licker2010';
update "bib_references"."main_table" set "pages" = null where "bibtexkey" = 'Ligges2008';
update "bib_references"."main_table" set "pages" = '111--130' where "bibtexkey" = 'Luebert2000';
update "bib_references"."main_table" set "pages" = '199--205' where "bibtexkey" = 'Maestre2009';
update "bib_references"."main_table" set "pages" = '423--431' where "bibtexkey" = 'Mayfield2010';
update "bib_references"."main_table" set "pages" = '150--152' where "bibtexkey" = 'Nuzzo2014';
update "bib_references"."main_table" set "pages" = null where "bibtexkey" = 'Oberdorfer2001';
update "bib_references"."main_table" set "pages" = '291--295' where "bibtexkey" = 'Perkins2005';
update "bib_references"."main_table" set "pages" = '401--438' where "bibtexkey" = 'Pietsch1973';
update "bib_references"."main_table" set "pages" = '681--684' where "bibtexkey" = 'Prach1996';
update "bib_references"."main_table" set "pages" = '237--244' where "bibtexkey" = 'Pysek1991';
update "bib_references"."main_table" set "pages" = '81--96' where "bibtexkey" = 'Ramirez1975';
update "bib_references"."main_table" set "pages" = null where "bibtexkey" = 'Reiche1905';
update "bib_references"."main_table" set "pages" = '275--286' where "bibtexkey" = 'RuizdelClavijo2001';
update "bib_references"."main_table" set "pages" = '37--49' where "bibtexkey" = 'vanZinderenBakker1974';
update "bib_references"."main_table" set "pages" = '630--636' where "bibtexkey" = 'Seppelt2011';
update "bib_references"."main_table" set "pages" = '67--72' where "bibtexkey" = 'Tichy2005';
update "bib_references"."main_table" set "pages" = null where "bibtexkey" = 'Rodriguez2018';
update "bib_references"."main_table" set "pagetotal" = '1095' where "bibtexkey" = 'Ellenberg1996';
update "bib_references"."main_table" set "pagetotal" = '270' where "bibtexkey" = 'Hengl2009';
update "bib_references"."main_table" set "pagetotal" = '257' where "bibtexkey" = 'Hoffmann2005';
update "bib_references"."main_table" set "pagetotal" = '254' where "bibtexkey" = 'Hoffmann1998';
update "bib_references"."main_table" set "pagetotal" = '280' where "bibtexkey" = 'Hoffmann1998a';
update "bib_references"."main_table" set "pagetotal" = '251' where "bibtexkey" = 'Ligges2008';
update "bib_references"."main_table" set "pagetotal" = '1051' where "bibtexkey" = 'Oberdorfer2001';
update "bib_references"."main_table" set "pagetotal" = '488' where "bibtexkey" = 'Reiche1905';
update "bib_references"."main_table" set "pagetotal" = '430' where "bibtexkey" = 'Rodriguez2018';
update "bib_references"."main_table" set "date" = '2014-12' where "bibtexkey" = 'Anderson2015';
update "bib_references"."main_table" set "date" = '2001-02' where "bibtexkey" = 'Balaguer2001';
update "bib_references"."main_table" set "date" = '2001-02' where "bibtexkey" = 'Boyce2001';
update "bib_references"."main_table" set "date" = '2014-01' where "bibtexkey" = 'Berg2014';
update "bib_references"."main_table" set "date" = '1998-10' where "bibtexkey" = 'Cilliers1998';
update "bib_references"."main_table" set "date" = '2010' where "bibtexkey" = 'Ellenberg1996';
update "bib_references"."main_table" set "date" = '2007-09' where "bibtexkey" = 'Dormann2007';
update "bib_references"."main_table" set "date" = '1993-08' where "bibtexkey" = 'Eckhardt1993a';
update "bib_references"."main_table" set "date" = '1996-12' where "bibtexkey" = 'Eckhardt1996';
update "bib_references"."main_table" set "date" = '2014-06' where "bibtexkey" = 'Freire2014';
update "bib_references"."main_table" set "date" = '2003-10' where "bibtexkey" = 'Gondard2003';
update "bib_references"."main_table" set "date" = '2006' where "bibtexkey" = 'Heinrich2006';
update "bib_references"."main_table" set "date" = '2009' where "bibtexkey" = 'Hengl2009';
update "bib_references"."main_table" set "date" = '2005' where "bibtexkey" = 'Hoffmann2005';
update "bib_references"."main_table" set "date" = '1998' where "bibtexkey" = 'Hoffmann1998';
update "bib_references"."main_table" set "date" = '1998' where "bibtexkey" = 'Hoffmann1998a';
update "bib_references"."main_table" set "date" = '2009-07' where "bibtexkey" = 'Lara2009';
update "bib_references"."main_table" set "date" = '2010-08' where "bibtexkey" = 'Licker2010';
update "bib_references"."main_table" set "date" = '2008' where "bibtexkey" = 'Ligges2008';
update "bib_references"."main_table" set "date" = '2009-02' where "bibtexkey" = 'Maestre2009';
update "bib_references"."main_table" set "date" = '2010-06' where "bibtexkey" = 'Mayfield2010';
update "bib_references"."main_table" set "date" = '2014-02' where "bibtexkey" = 'Nuzzo2014';
update "bib_references"."main_table" set "date" = '2001' where "bibtexkey" = 'Oberdorfer2001';
update "bib_references"."main_table" set "date" = '2005-07' where "bibtexkey" = 'Perkins2005';
update "bib_references"."main_table" set "date" = '1973-12' where "bibtexkey" = 'Pietsch1973';
update "bib_references"."main_table" set "date" = '1995' where "bibtexkey" = 'Pott1995';
update "bib_references"."main_table" set "date" = '1996-10' where "bibtexkey" = 'Prach1996';
update "bib_references"."main_table" set "date" = '1991-04' where "bibtexkey" = 'Pysek1991';
update "bib_references"."main_table" set "date" = '2001-06' where "bibtexkey" = 'RuizdelClavijo2001';
update "bib_references"."main_table" set "date" = '1974-07' where "bibtexkey" = 'vanZinderenBakker1974';
update "bib_references"."main_table" set "date" = '2011-01' where "bibtexkey" = 'Seppelt2011';
update "bib_references"."main_table" set "date" = '2005-07' where "bibtexkey" = 'Tichy2005';
update "bib_references"."main_table" set "date" = '2020-08' where "bibtexkey" = 'Fuentes2020';
update "bib_references"."main_table" set "url" = 'https://journal.r-project.org/articles/RN-2004-002/' where "bibtexkey" = 'Chessel2004';
update "bib_references"."main_table" set "url" = 'https://publications.jrc.ec.europa.eu/repository/handle/JRC38153' where "bibtexkey" = 'Hengl2009';
update "bib_references"."main_table" set "url" = 'https://www.jstor.org/stable/24621067' where "bibtexkey" = 'Monti2013';
update "bib_references"."main_table" set "url" = null where "bibtexkey" = 'Nuzzo2014';
update "bib_references"."main_table" set "url" = 'https://library.wur.nl/WebQuery/edepot/360907' where "bibtexkey" = 'Touber1989a';
update "bib_references"."main_table" set "url" = null where "bibtexkey" = 'Everitt2010';
update "bib_references"."main_table" set "url" = 'http://www.bibliotecaminsal.cl/wp/wp-content/uploads/2018/01/006.Diccionario-Mapuche.pdf' where "bibtexkey" = 'MinisterioSalud2015';
update "bib_references"."main_table" set "url" = 'http://mires-and-peat.net/media/map15/map_15_05.pdf' where "bibtexkey" = 'MaldonadoFonken2014';
update "bib_references"."main_table" set "doi" = '10.1111/ele.12385' where "bibtexkey" = 'Anderson2015';
update "bib_references"."main_table" set "doi" = '10.1046/j.1365-2435.2001.00505.x' where "bibtexkey" = 'Balaguer2001';
update "bib_references"."main_table" set "doi" = '10.2307/3236912' where "bibtexkey" = 'Boyce2001';
update "bib_references"."main_table" set "doi" = '10.4102/abc.v28i2.642' where "bibtexkey" = 'Cilliers1998';
update "bib_references"."main_table" set "doi" = '10.1016/j.baae.2006.11.001' where "bibtexkey" = 'Dormann2007';
update "bib_references"."main_table" set "doi" = '10.1016/s0254-6299(16)30712-8' where "bibtexkey" = 'Eckhardt1993a';
update "bib_references"."main_table" set "doi" = '10.1016/s0254-6299(15)30670-0' where "bibtexkey" = 'Eckhardt1996';
update "bib_references"."main_table" set "doi" = '10.4067/s0717-66432014000100010' where "bibtexkey" = 'Freire2014';
update "bib_references"."main_table" set "doi" = '10.1051/forest:2003066' where "bibtexkey" = 'Gondard2003';
update "bib_references"."main_table" set "doi" = '10.1640/0002-8444(2003)093[0126:AROISF]2.0.CO;2' where "bibtexkey" = 'Hickey2003'
update "bib_references"."main_table" set "doi" = '10.1016/j.foreco.2009.01.004' where "bibtexkey" = 'Lara2009';
update "bib_references"."main_table" set "doi" = '10.1111/j.1466-8238.2010.00563.x' where "bibtexkey" = 'Licker2010';
update "bib_references"."main_table" set "doi" = '10.1111/j.1365-2745.2008.01476.x' where "bibtexkey" = 'Maestre2009';
update "bib_references"."main_table" set "doi" = '10.1111/j.1466-8238.2010.00532.x' where "bibtexkey" = 'Mayfield2010';
update "bib_references"."main_table" set "doi" = '10.1038/506150a' where "bibtexkey" = 'Nuzzo2014';
update "bib_references"."main_table" set "doi" = '10.1016/j.biocon.2005.01.023' where "bibtexkey" = 'Perkins2005';
update "bib_references"."main_table" set "doi" = '10.1007/bf02386500' where "bibtexkey" = 'Pietsch1973';
update "bib_references"."main_table" set "doi" = '10.2307/3236379' where "bibtexkey" = 'Prach1996';
update "bib_references"."main_table" set "doi" = '10.2307/3235956' where "bibtexkey" = 'Pysek1991';
update "bib_references"."main_table" set "doi" = '10.1046/j.1365-3180.2001.00237.x' where "bibtexkey" = 'RuizdelClavijo2001';
update "bib_references"."main_table" set "doi" = '10.1007/bf02390894' where "bibtexkey" = 'vanZinderenBakker1974';
update "bib_references"."main_table" set "doi" = '10.1111/j.1365-2664.2010.01952.x' where "bibtexkey" = 'Seppelt2011';
update "bib_references"."main_table" set "doi" = '10.3897/neobiota.60.55366' where "bibtexkey" = 'Fuentes2020';
update "bib_references"."main_table" set "doi" = '10.2307/3868138' where "bibtexkey" = 'Cade2003';
update "bib_references"."main_table" set "isbn" = '9783825281045' where "bibtexkey" = 'Ellenberg1996';
update "bib_references"."main_table" set "isbn" = '9090249818' where "bibtexkey" = 'Hengl2009';
update "bib_references"."main_table" set "isbn" = '9567743010' where "bibtexkey" = 'Hoffmann2005';
update "bib_references"."main_table" set "isbn" = '9567743037' where "bibtexkey" = 'Hoffmann1998';
update "bib_references"."main_table" set "isbn" = '9567743002' where "bibtexkey" = 'Hoffmann1998a';
update "bib_references"."main_table" set "isbn" = '9783540799986' where "bibtexkey" = 'Ligges2008';
update "bib_references"."main_table" set "isbn" = '9783818615710' where "bibtexkey" = 'Oberdorfer2001';
update "bib_references"."main_table" set "isbn" = '3800126931' where "bibtexkey" = 'Pott1995';
update "bib_references"."main_table" set "issn" = '1461-0248' where "bibtexkey" = 'Anderson2015';
update "bib_references"."main_table" set "issn" = '1365-2435' where "bibtexkey" = 'Balaguer2001';
update "bib_references"."main_table" set "issn" = '1654-1103' where "bibtexkey" = 'Boyce2001';
update "bib_references"."main_table" set "issn" = '1654-109X' where "bibtexkey" = 'Berg2014';
update "bib_references"."main_table" set "issn" = '0006-8241' where "bibtexkey" = 'Cilliers1998';
update "bib_references"."main_table" set "issn" = '1439-1791' where "bibtexkey" = 'Dormann2007';
update "bib_references"."main_table" set "issn" = '0254-6299' where "bibtexkey" = 'Eckhardt1993a';
update "bib_references"."main_table" set "issn" = '0254-6299' where "bibtexkey" = 'Eckhardt1996';
update "bib_references"."main_table" set "issn" = '0717-6643' where "bibtexkey" = 'Freire2014';
update "bib_references"."main_table" set "issn" = '1297-966X' where "bibtexkey" = 'Gondard2003';
update "bib_references"."main_table" set "issn" = '0378-1127' where "bibtexkey" = 'Lara2009';
update "bib_references"."main_table" set "issn" = '1466-8238' where "bibtexkey" = 'Licker2010';
update "bib_references"."main_table" set "issn" = '1365-2745' where "bibtexkey" = 'Maestre2009';
update "bib_references"."main_table" set "issn" = '1466-8238' where "bibtexkey" = 'Mayfield2010';
update "bib_references"."main_table" set "issn" = '1476-4687' where "bibtexkey" = 'Nuzzo2014';
update "bib_references"."main_table" set "issn" = '0006-3207' where "bibtexkey" = 'Perkins2005';
update "bib_references"."main_table" set "issn" = '1573-5052' where "bibtexkey" = 'Pietsch1973';
update "bib_references"."main_table" set "issn" = '1654-1103' where "bibtexkey" = 'Prach1996';
update "bib_references"."main_table" set "issn" = '1654-1103' where "bibtexkey" = 'Pysek1991';
update "bib_references"."main_table" set "issn" = '1365-3180' where "bibtexkey" = 'RuizdelClavijo2001';
update "bib_references"."main_table" set "issn" = '1573-5052' where "bibtexkey" = 'vanZinderenBakker1974';
update "bib_references"."main_table" set "issn" = '0021-8901' where "bibtexkey" = 'Seppelt2011';
update "bib_references"."main_table" set "issn" = '1573-5052' where "bibtexkey" = 'Tichy2005';
update "bib_references"."main_table" set "issn" = '1619-0033' where "bibtexkey" = 'Fuentes2020';
update "bib_references"."main_table" set "issn" = '1550-2759' where "bibtexkey" = 'Thorsen1977';
update "bib_references"."main_table" set "issn" = '1424-2818' where "bibtexkey" = 'Luebert2022a';
update "bib_references"."main_table" set "issn" = '1939-9170' where "bibtexkey" = 'Tjoerve2008a';
update "bib_references"."main_table" set "location" = 'Stuttgart' where "bibtexkey" = 'Ellenberg1996';
update "bib_references"."main_table" set "location" = 'München' where "bibtexkey" = 'Heinrich2006';
update "bib_references"."main_table" set "location" = '[Amsterdam]' where "bibtexkey" = 'Hengl2009';
update "bib_references"."main_table" set "location" = 'Santiago de Chile' where "bibtexkey" = 'Hoffmann2005';
update "bib_references"."main_table" set "location" = 'Santiago' where "bibtexkey" = 'Hoffmann1998';
update "bib_references"."main_table" set "location" = 'Santiago de Chile' where "bibtexkey" = 'Hoffmann1998a';
update "bib_references"."main_table" set "location" = 'Berlin, Heidelberg' where "bibtexkey" = 'Ligges2008';
update "bib_references"."main_table" set "location" = 'Stuttgart' where "bibtexkey" = 'Oberdorfer2001';
update "bib_references"."main_table" set "location" = 'Stuttgart' where "bibtexkey" = 'Pott1995';
update "bib_references"."main_table" set "location" = 'Santiago' where "bibtexkey" = 'Reiche1905';
update "bib_references"."main_table" set "subtitle" = 'In ökologischer, dynamischer und historischer {Sicht}' where "bibtexkey" = 'Ellenberg1996';
update "bib_references"."main_table" set "subtitle" = 'Physische Geographie' where "bibtexkey" = 'Heinrich2006';
update "bib_references"."main_table" set "subtitle" = 'Zona araucana ; una guía ilustrada para la identificación de las especies de plantas le~nosas del sur de Chile (entre el río Maule y el seno de Reloncaví) ; [arboles, arbustos y enredaderas le~nosas]' where "bibtexkey" = 'Hoffmann2005'
update "bib_references"."main_table" set "subtitle" = 'Zona central ; una guía para la identificación de las especies vegetales más frecuentes' where "bibtexkey" = 'Hoffmann1998'
update "bib_references"."main_table" set "note" = 'Zusatzmaterialien zum UTB-Band bereitgestellt über http://www.utb-shop.de/downloads/dl/file/id/27/zusatzkapitel_zeigerwerte_der_pflanzen_mitteleuropas.pdf (gesehen am 18.06.2013)' where "bibtexkey" = 'Ellenberg1996';
update "bib_references"."main_table" set "note" = 'Literaturverz. S. [294] - 303' where "bibtexkey" = 'Heinrich2006';
update "bib_references"."main_table" set "note" = 'Oorspr. uitg.:EUR 22904 EN Scientific and Technical Research series report. - Luxembourg : Office for Official Publications of the European Communities.' where "bibtexkey" = 'Hengl2009';
update "bib_references"."main_table" set "note" = 'Literaturverz. S. 257' where "bibtexkey" = 'Hoffmann2005';
update "bib_references"."main_table" set "note" = 'Literaturverz. S. 252' where "bibtexkey" = 'Hoffmann1998';
update "bib_references"."main_table" set "note" = 'Description based on publisher supplied metadata and other sources.' where "bibtexkey" = 'Oberdorfer2001';
update "bib_references"."main_table" set "ppn_gvk" = '1605251550' where "bibtexkey" = 'Ellenberg1996';
update "bib_references"."main_table" set "ppn_gvk" = '487454952' where "bibtexkey" = 'Heinrich2006';
update "bib_references"."main_table" set "ppn_gvk" = '638538513' where "bibtexkey" = 'Hengl2009';
update "bib_references"."main_table" set "ppn_gvk" = '513140697' where "bibtexkey" = 'Hoffmann2005';
update "bib_references"."main_table" set "ppn_gvk" = '328742953' where "bibtexkey" = 'Hoffmann1998';
update "bib_references"."main_table" set "ppn_gvk" = '303865237' where "bibtexkey" = 'Hoffmann1998a';
update "bib_references"."main_table" set "ppn_gvk" = '1698418590' where "bibtexkey" = 'Ligges2008';
update "bib_references"."main_table" set "ppn_gvk" = '1801119619' where "bibtexkey" = 'Oberdorfer2001';
update "bib_references"."main_table" set "ppn_gvk" = '189323752' where "bibtexkey" = 'Pott1995';
insert into "bib_references"."file_list" ("bibtexkey","file","mime","description")
values
('Lilleso2011','Lilleso2011_s1.pdf','PDF',null),
('MartinezHarms2008','MartinezHarms2008.pdf','PDF','main text'),
('PerezMoreau1938','PerezMoreau1938.pdf','PDF',null),
('Touber1989a','Touber1989a_s1.zip','zip',null),
('Worku2015','Worku2015.pdf','PDF',null),
('Touber1989','Touber1989_s1.zip','zip',null),
('Worster1990','Worster1990.pdf','PDF',null),
('Verzani2012','Verzani2012-s1.R','r',null),
('Verzani2012','Verzani2012-s2.txt','Text',null),
('RosCandeira2020','RosCandeira2020.pdf','PDF',null),
('Leps2013','Leps2013.pdf','PDF',null),
('MoreiraMunoz2011','MoreiraMunoz2011.pdf','PDF',null),
('MoreiraMunoz2011','MoreiraMunoz2011_s1.xlsx','Excel 2007+',null),
('MoreiraMunoz2011','MoreiraMunoz2011_source.zip',null,null),
('Zarba2022','Zarba2022.pdf','PDF',null),
('Behn2022','Behn2022_s1.pdf','PDF',null),
('Behn2022','Behn2022_s2.pdf','PDF',null),
('Behn2022','Behn2022_s3.pdf','PDF',null),
('Behn2022','Behn2022_s4.pdf','PDF',null),
('Behn2022','Behn2022_s5.zip','zip',null),
('Gonzalez2022','Gonzalez2022.pdf','PDF',null),
('CaceresNovoa2024','CaceresNovoa2024.pdf','PDF',null),
('CruzAlonso2023','CruzAlonso2023.pdf','PDF',null),
('Augustine2024','Augustine2024.pdf','PDF',null),
('Gudesho2022','Gudesho2022.pdf','PDF',null),
('Bodin2024','Bodin2024.pdf','PDF',null),
('Meyer2023','Meyer2023.pdf','PDF',null),
('Hubert2023','Hubert2023.pdf','PDF',null),
('Green2019','Green2019.pdf','PDF',null),
('Leps1999','Leps1999.pdf','PDF',null),
('Dray2007','Dray2007.pdf','PDF',null),
('Rudner2007','Rudner2007.pdf','PDF',null),
('Ndiritu2021','Ndiritu2021.pdf','PDF',null),
('Sieben2016a','Sieben2016a.pdf','PDF',null),
('Sieben2016b','Sieben2016b.pdf','PDF',null),
('Cleaver2004','Cleaver2004.pdf','PDF',null),
('duToit2021','duToit2021.pdf','PDF',null),
('Cilliers2012','Cilliers2012.pdf','PDF',null),
('Cilliers1999','Cilliers1999.pdf','PDF',null),
('Bezuidenhout1994','Bezuidenhout1994.pdf','PDF',null),
('Bloem1993','Bloem1993.pdf','PDF',null),
('Eckhardt1996a','Eckhardt1996a.pdf','PDF',null),
('Jaeger1996a','Jaeger1996a.pdf','PDF',null),
('Coetzee1994','Coetzee1994.pdf','PDF',null),
('Coetzee1994a','Coetzee1994a.pdf','PDF',null),
('Chatanga2019a','Chatanga2019a.pdf','PDF',null),
('Malan2003','Malan2003.pdf','PDF',null),
('Janecke2003','Janecke2003.pdf','PDF',null),
('Sieben2004','Sieben2004.pdf','PDF',null),
('Bezuidenhout1995','Bezuidenhout1995.pdf','PDF',null),
('Siebert2002','Siebert2002.pdf','PDF',null),
('Burgoyne2000','Burgoyne2000.pdf','PDF',null),
('Siebert2003','Siebert2003.pdf','PDF',null),
('Hecker2017','Hecker2017.pdf','PDF',null),
('Buchenau1878','Buchenau1878.pdf','PDF',null),
('Kotorova1999','Kotorova1999.pdf','PDF',null),
('Leps2014','Leps2014.pdf','PDF',null),
('Widmer2018','Widmer2018.pdf','PDF',null),
('Werema2017','Werema2017.pdf','PDF',null),
('Weinberger2000','Weinberger2000.pdf','PDF',null),
('Weinberger1973','Weinberger1973.pdf','PDF',null),
('Weigend2006a','Weigend2006a.pdf','PDF',null),
('Weigend2004','Weigend2004.pdf','PDF',null),
('Weigend2000','Weigend2000.pdf','PDF',null),
('Weber1986','Weber1986.pdf','PDF',null),
('Webb1986','Webb1986.pdf','PDF',null),
('Wasswa2013','Wasswa2013.pdf','PDF',null),
('Watson2010','Watson2010.pdf','PDF',null),
('Waswa2002','Waswa2002.pdf','PDF',null),
('Washbourn1967','Washbourn1967.pdf','PDF',null),
('TignehEshete2009','TignehEshete2009.pdf','PDF',null),
('Tilahun2015','Tilahun2015.pdf','PDF',null),
('Timmermann2006','Timmermann2006.pdf','PDF',null),
('Tindano2014','Tindano2014.pdf','PDF',null),
('Tjoelker1998','Tjoelker1998.pdf','PDF',null),
('Torrejon2004','Torrejon2004.pdf','PDF',null),
('Torrejon2011','Torrejon2011.pdf','PDF',null),
('TorresMellado2012','TorresMellado2012.pdf','PDF',null),
('Waring1964','Waring1964.pdf','PDF',null),
('Wardle2008','Wardle2008.pdf','PDF',null),
('Wan2012','Wan2012.pdf','PDF',null),
('Wang2013','Wang2013.pdf','PDF',null),
('Wang2005','Wang2005.pdf','PDF',null),
('Wanek2002','Wanek2002.pdf','PDF',null),
('Fayolle2018','Fayolle2018.pdf','PDF',null),
('Fayolle2018','Fayolle2018_s1.xlsx','Excel 2007+',null),
('Streit2024','Streit2024.pdf','PDF',null),
('Traufetter2007','Traufetter2007.pdf','PDF',null),
('Treiber1999','Treiber1999.pdf','PDF',null),
('Tremetsberger2003','Tremetsberger2003.pdf','PDF',null),
('Tribsch2003','Tribsch2003.pdf','PDF',null),
('Troia2019','Troia2019.pdf','PDF',null),
('Troncoso1993','Troncoso1993.pdf','PDF',null),
('Troncoso2006','Troncoso2006.pdf','PDF',null),
('Tuesca2001','Tuesca2001.pdf','PDF',null),
('Tuhkanen1980','Tuhkanen1980.pdf','PDF',null),
('Turnbull1999','Turnbull1999.pdf','PDF',null),
('Turnbull2000','Turnbull2000.pdf','PDF',null),
('Turnbull2004','Turnbull2004.pdf','PDF',null),
('Turnbull2006','Turnbull2006.pdf','PDF',null),
('Turyahabwe2013','Turyahabwe2013.pdf','PDF',null),
('Uchiyama2006','Uchiyama2006.pdf','PDF',null),
('Udvardy1975','Udvardy1975.pdf','PDF',null),
('Ueno2000','Ueno2000.pdf','PDF',null),
('Ugarte2011','Ugarte2011.pdf','PDF',null),
('Ramsey1994','Ramsey1994.pdf','PDF',null),
('Waeldchen2018','Waeldchen2018.pdf','PDF',null),
('Kamiri2024','Kamiri2024.pdf','PDF',null),
('Omiye2023','Omiye2023.pdf','PDF',null),
('Sieben2018','Sieben2018.pdf','PDF',null),
('Sieben2021','Sieben2021.pdf','PDF',null),
('Sieben2021a','Sieben2021a.pdf','PDF',null),
('Miller2018','Miller2018.pdf','PDF',null),
('Ugent1987','Ugent1987.pdf','PDF',null),
('Uhl1981','Uhl1981.pdf','PDF',null),
('Ulanova2000','Ulanova2000.pdf','PDF',null),
('Ulbrich1928','Ulbrich1928.pdf','PDF',null),
('Ulrich2004','Ulrich2004.pdf','PDF',null),
('Ulrich2007','Ulrich2007.pdf','PDF',null),
('Ulrich2016','Ulrich2016.pdf','PDF',null),
('Uma1980','Uma1980.pdf','PDF',null),
('UNESCO2014','UNESCO2014.pdf','PDF',null),
('Urban2005','Urban2005.pdf','PDF',null),
('Urbanska1983','Urbanska1983.pdf','PDF',null),
('Urrutia2012','Urrutia2012.pdf','PDF',null),
('Urrutia2017','Urrutia2017.pdf','PDF',null),
('Urrutia2017a','Urrutia2017a.pdf','PDF',null),
('UrrutiaEstrada2018','UrrutiaEstrada2018.pdf','PDF',null),
('UrrutiaEstrada2018a','UrrutiaEstrada2018a.pdf','PDF',null),
('Urso2013','Urso2013.pdf','PDF',null),
('Urzua2005','Urzua2005.pdf','PDF',null),
('Uyehara2016','Uyehara2016.pdf','PDF',null),
('Valdes2000','Valdes2000.pdf','PDF',null),
('Valdivia2013','Valdivia2013.pdf','PDF',null),
('Valdovinos2005','Valdovinos2005.pdf','PDF',null),
('Valeix2007','Valeix2007.pdf','PDF',null),
('Valenzuela2004','Valenzuela2004.pdf','PDF',null),
('Valenzuela2004a','Valenzuela2004a.pdf','PDF',null),
('Valladares2002','Valladares2002.pdf','PDF',null),
('Valladares2000','Valladares2000.pdf','PDF',null),
('Novotny2024','Novotny2024.pdf','PDF',null),
('AcostaMaindo2018','AcostaMaindo2018.pdf','PDF',null),
('Aria2024','Aria2024.pdf','PDF',null),
('Aria2024','Aria2024_s1.zip','zip',null),
('Aria2017','Aria2017.pdf','PDF',null),
('Drury1970','Drury1970.pdf','PDF',null),
('Howell2006','Howell2006.pdf','PDF',null),
('Hauff2024','Hauff2024.pdf','PDF',null),
('vanBreugel2011','vanBreugel2011.pdf','PDF',null),
('vanBreugel2011a','vanBreugel2011a.pdf','PDF',null),
('vanBreugel2015','vanBreugel2015.pdf','PDF',null),
('Vancutsem2006','Vancutsem2006.pdf','PDF',null),
('VanderWall1992','VanderWall1992.pdf','PDF',null),
('VanderWall2001','VanderWall2001.pdf','PDF',null),
('VanderWall2003','VanderWall2003.pdf','PDF',null),
('VanderWall2006','VanderWall2006.pdf','PDF',null),
('Eldridge2024','Eldridge2024.pdf','PDF',null),
('Zheng2018','Zheng2018.pdf','PDF',null),
('Takuwa2024','Takuwa2024.pdf','PDF',null),
('Lisner2024','Lisner2024.pdf','PDF',null),
('Hemp2024','Hemp2024.pdf','PDF',null),
('Zuloaga2019','Zuloaga2019.pdf','PDF',null),
('Urtubey2016','Urtubey2016.pdf','PDF',null),
('Smissen2020','Smissen2020.pdf','PDF',null),
('Nie2016','Nie2016.pdf','PDF',null),
('Minh2020','Minh2020.pdf','PDF',null),
('Luebert2017a','Luebert2017a.pdf','PDF',null),
('Katoh2002','Katoh2002.pdf','PDF',null),
('GalbanyCasals2010','GalbanyCasals2010.pdf','PDF',null),
('Bloech2010','Bloech2010.pdf','PDF',null),
('Bergh2015','Bergh2015.pdf','PDF',null),
('Anderberg1991','Anderberg1991.pdf','PDF',null),
('Zizka2019','Zizka2019.pdf','PDF',null),
('Maldonado2015','Maldonado2015.pdf','PDF',null),
('Behn2024','Behn2024.pdf','PDF',null),
('Nitta2024','Nitta2024.pdf','PDF',null),
('Meyer2024','Meyer2024.pdf','PDF',null),
('Guuroh2024','Guuroh2024.pdf','PDF',null),
('Joelson2025','Joelson2025.pdf','PDF',null),
('Li2024','Li2024.pdf','PDF',null);
delete from "bib_references"."file_list" where "file" in ('LillesoBreugelKindtEtAl2011_s1.pdf','Martinez-HarmsGajardo2008.pdf','Ros-Candeira2020.pdf','Leps2020.pdf','Bonn2020.pdf','MoreiraMunoz2011.zip','Deil2020');
delete from "bib_references"."main_table" where "bibtexkey" in ('Martinez-HarmsGajardo2008','Perez-Moreau1938','Luebert2018','Ros-Candeira2020','Leps2020');

