CREATE DATABASE  IF NOT EXISTS `perspectiveart` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `perspectiveart`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: perspectiveart
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `fumetti`
--

DROP TABLE IF EXISTS `fumetti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fumetti` (
  `seriale` varchar(15) NOT NULL,
  `titolo` varchar(45) NOT NULL,
  `prezzo` double NOT NULL,
  `quantità` int NOT NULL,
  `descrizione` varchar(2000) DEFAULT '-',
  `scrittore` varchar(45) NOT NULL,
  `numPagine` int DEFAULT NULL,
  `disegnatore` varchar(45) DEFAULT NULL,
  `categoria` enum('Manga','Manhwa') NOT NULL,
  `numVendite` int NOT NULL DEFAULT '0',
  `iva` double NOT NULL,
  PRIMARY KEY (`seriale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fumetti`
--

LOCK TABLES `fumetti` WRITE;
/*!40000 ALTER TABLE `fumetti` DISABLE KEYS */;
INSERT INTO `fumetti` VALUES ('100000000000000','NARUTO 048',4.5,10,'Naruto ha sconfitto anche l’ultimo Pain, ma Nagato, il marionettista che stava dietro l\'assalto al Villaggio della Foglia, è ancora vivo. Naruto riesce a rintracciarlo e decide di andare ad affrontarlo da solo. Prima di combattere, però, gli chiede di spiegargli le ragioni','Masashi Kishimoto',192,'Masashi Kishimoto','Manga',0,1.22),('100000000000001','TYR CHRONICLES 001',4.5,10,'“Tyr Chonicles” è il fumetto coreano di punta di Daewon, la casa editrice che ha prodotto nel recente passato hit come Priest, Ragnarock e Rebirth. Il protagonista è un ragazzo di nome Tyr, il quale nutre una profonda ammirazione per suo fratello maggiore, Loki. Un giorno Loki lascia la famiglia per arruolarsi in una truppa di mercenari e diventare un eroe ma, un anno più tardi, giunge a casa la notizia della sua morte. Il tempo passae Tyr, è ormai diciassettenne; un giorno incontra un uomo misterioso che gli consegna un diario appartenuto a suo fratello Loki. Leggendolo, Tyr si rende conto che nel diario ci sono dei messaggi nascosti indirizzati a lui; perciò si incammina sulle tracce di Loki e – man mano che si addentra nel tragitto – si accorge che tutto quello che gli accade è già scritto in quel diario… Non lasciatevi sfuggire questo palpitante fumetto in 11 volumi (concluso) stupendamente illustrato dal promettente disegnatore Son Chang-Hoo e sceneggiato dalla penna di Ra In-Soo, acclamato per “Demon King”!','In-Soo Ra',184,'Chang-Hoo Son','Manhwa',28,1.22),('100000000000002','ADEKAN 014',5.5,10,'L\'eccentrica serie di Tsukiji Nao arriva al quattordicesimo volume, tra melodrammatiche storie dalle sfumature erotiche e scene dalla bizzarra e sconclusionata comicità. Shiro è finalmente riuscito a raggiungere la sua bella, ma il lieto fine è ancora lungi dall\'essere annunciato, mentre il fan club di Anri è più scatenato che mai e i disordini causati dalla fazione Shiro che si scontra con quella di Anri sono all\'ordine del giorno.','Nao Tsukiji',192,'Nao Tsukiji','Manga',0,1.22),('100000000000003','TYR CHRONICLES 002',4.5,10,'“Tyr Chonicles” è il fumetto coreano di punta di Daewon, la casa editrice che ha prodotto nel recente passato hit come Priest, Ragnarock e Rebirth. Il protagonista è un ragazzo di nome Tyr, il quale nutre una profonda ammirazione per suo fratello maggiore, Loki. Un giorno Loki lascia la famiglia per arruolarsi in una truppa di mercenari e diventare un eroe ma, un anno più tardi, giunge a casa la notizia della sua morte. Il tempo passae Tyr, è ormai diciassettenne; un giorno incontra un uomo misterioso che gli consegna un diario appartenuto a suo fratello Loki. Leggendolo, Tyr si rende conto che nel diario ci sono dei messaggi nascosti indirizzati a lui; perciò si incammina sulle tracce di Loki e – man mano che si addentra nel tragitto – si accorge che tutto quello che gli accade è già scritto in quel diario… Non lasciatevi sfuggire questo palpitante fumetto in 11 volumi (concluso) stupendamente illustrato dal promettente disegnatore Son Chang-Hoo e sceneggiato dalla penna di Ra In-Soo, acclamato per “Demon King”!','In-Soo Ra',184,'Chang-Hoo Son','Manhwa',0,1.22),('100000000000004','MOMOGUMI PLUS SENKI 015',5,10,'Yuki e i suoi amici decidono di andare alla casa dei genitori di Yukiyo durante le vacanze invernali. Qui, Yuki scopre qualcosa sulla “oscurità” di Yukiyo. Cosa deciderà di fare per salvare il suo cuore?','Eri Sakondo',192,'Eri Sakondo','Manga',0,1.22),('100000000000005','TYR CHRONICLES 003',4.5,10,'“Tyr Chonicles” è il fumetto coreano di punta di Daewon, la casa editrice che ha prodotto nel recente passato hit come Priest, Ragnarock e Rebirth. Il protagonista è un ragazzo di nome Tyr, il quale nutre una profonda ammirazione per suo fratello maggiore, Loki. Un giorno Loki lascia la famiglia per arruolarsi in una truppa di mercenari e diventare un eroe ma, un anno più tardi, giunge a casa la notizia della sua morte. Il tempo passae Tyr, è ormai diciassettenne; un giorno incontra un uomo misterioso che gli consegna un diario appartenuto a suo fratello Loki. Leggendolo, Tyr si rende conto che nel diario ci sono dei messaggi nascosti indirizzati a lui; perciò si incammina sulle tracce di Loki e – man mano che si addentra nel tragitto – si accorge che tutto quello che gli accade è già scritto in quel diario… Non lasciatevi sfuggire questo palpitante fumetto in 11 volumi (concluso) stupendamente illustrato dal promettente disegnatore Son Chang-Hoo e sceneggiato dalla penna di Ra In-Soo, acclamato per “Demon King”!','In-Soo Ra',184,'Chang-Hoo Son','Manhwa',32,1.22),('100000000000006','MARUHAN IL MERCENARIO 009',7.2,10,'Direttamente dal duo creativo KIM Sung-jae, KIM Byung-jin, che ha dato vita al manhwa coreano più amato e venduto nel mondo, Chonchu, arriva un nuovo capitolo del fantasy che ha stracciato molti record di vendita in Corea e in Francia: Maruhan, il Mercenario! Nell’antica era del supercontinente, dove non esistevano barriere tra Est e Ovest, la razza umana deve contrastare l’invasione delle Bestie Demoniache, che hanno rotto il secolare patto di non aggressione. Disperati, gli umani organizzano un esercito con lo scopo di uccidere Rhode, il Re delle Bestie Demoniache. Il destino degli uomini è in mano a Maruhan, il mercenario dell’Oscurità! Sangue e onore in un manga disegnato magistralmente, e altrettanto magistralmente sceneggiato! Un titolo intenso, che piacerà a tutti gli amanti dei fantasy drammatici come Berserk o l’Attacco dei Giganti!','Sung-jae Kim',184,'Byung-jin Kim','Manga',40,1.22),('100000000000007','MARUHAN IL MERCENARIO 001',4.5,10,'Direttamente dal duo creativo KIM Sung-jae, KIM Byung-jin, che ha dato vita al manhwa coreano più amato e venduto nel mondo, Chonchu, arriva un nuovo fantasy che ha stracciato molti record di vendita in Corea e in Francia: Maruhan, il Mercenario!!! Nell’antica era del supercontinente, dove non esistevano barriere tra Est e Ovest, la razza umana deve contrastare l’invasione delle Bestie Demoniache, che hanno rotto il secolare patto di non aggressione. Disperati, gli umani, quando la sconfitta finale sembra imminente, organizzano un esercito con lo scopo di uccidere Rhode, il Re delle Bestie Demoniache. Il destino degli uomini è in mano a Maruhan, il mercenario dell’Oscurità! Sangue e onore in un manga disegnato magistralmente, e altrettanto magistralmente sceneggiato! Un titolo intenso, che piacerà a tutti gli amanti dei fantasy drammatici come Berserk o l’Attacco dei Giganti!','Sung-jae Kim',184,'Byung-jin Kim','Manhwa',0,1.22),('100000000000008','KARAKURI CIRCUS 041',4.6,10,'Nuovo capitolo del capolavoro di Kazuhiro Fujita. Con l’umanità ormai sotto scacco delle terrificanti marionette e della micidiale e incontrollabile malattia Zonapha, le ultime, flebili speranze risiedono in Narumi, che ormai è diventato un formidabile combattente (ma a che prezzo?), in Shirogane, sempre più provata dal dolore delle battaglie, e in Masaru, su cui grava la maledizione della sua famiglia. Un’epopea che attraversa il tempo sta per arrivare alla sua cataclismatica conclusione.','Fujita Kazuhiro',192,'Fujita Kazuhiro','Manga',0,1.22),('100000000000009','CAFÉ OCCULT 001',5,10,'Il Café Occult, da fuori, può sembrare un locale come tanti, magari dal nome un po\' eccentrico. Ma, in realtà, non è affatto un locale come tanti: al suo interno, infatti, si incontrano e si incrociano gli esseri viventi e gli spiriti dei defunti. Su-Rin è una giovane e sfortunata ragazza che termina precocemente la sua vita a causa di un incidente proprio dopo essere casualmente entrata nel misterioso bar in cerca di riparo dalla pioggia. Eppure, anche dopo la morte continua a essere in pericolo: finita nelle mire di un\'organizzazione specializzata nel traffico degli spiriti a causa degli straordinari poteri di cui è divenuta portatrice, trova un inatteso salvatore nell\'oscuro e scontroso Young, frequentatore abituale del Café Occult, che, brandendo un\'oscura pistola a forma di croce, si oppone agli \"anima\", spiriti che grazie a un patto infernale sono entrati in possesso di poteri demoniaci. Ma Young è anche alla ricerca di una persona molto particolare, che come lui… Un nuovo manhwa fantasy a sfondo soprannaturale pronto a soddisfare tutti i lettori, e sono tanti, rimasti \"orfani\" di Ragnarok e Rebirth!','Oraebalgeum',196,'An No-Eun','Manhwa',0,1.22),('100000000000010','CALLED GAME 003',5.3,10,'La corte scintillante è il campo di battaglia delle regine! La principessa Aruna ha scoperto nel peggiore dei modi quanto può essere spietato il mondo delle corti reali, con donne crudeli disposto a tutto pur di sedersi sul trono. Inoltre, il rapporto con Arthur sembra sempre più compromesso…','Izumi Kaneyoshi',192,'Izumi Kaneyoshi','Manga',0,1.22),('100000000000011','DEMON KING 001',5,10,'C\'è una grave frattura tra l\'Inferno ed il mondo dei mortali... Le anime perdute dei combattenti maledetti sono scappate dagli Inferi per tormentare tutti i Viventi. Il Sovrano dell\'Inferno decide quindi di inviare sulla Terra MAJEH, il più potente spadaccino dell\'aldilà, per contrastare la furia delle anime maledette. Anche se MAJEH ha l\'aspetto di un giovane ragazzo, è un messaggero di morte dotato di incredibile poteri di guerriero. DEMON KING pesca a piene mani dalla mitologia asiatica e occidentale, regalandoci un\'opera misteriosa ed avvincente, incentrata sul suo carismatico protagonista, che ci accompagna tra scene estreme di lotta e momenti di esilarante humour. DEMON KING è uno dei manhwa più famosi dell\'era moderna, e sicuramente uno dei più conosciuti all\'estero, potendo contare su uno sterminato numero di traduzioni (USA, Francia, Germania e adesso Italia).','In-Soo Ra',200,'Jae-Hwan Kim','Manhwa',0,1.22),('100000000000012','ZERO MAN 001',5,10,'Immaginate una specie intelligente, parallela a quella umana, che si è evoluta dagli scoiattoli anziché dalle scimmie. Una specie di esseri super-intelligenti, che aspettano nell’ombra e tramano per prendere il controllo dalle “scimmie evolute, esseri inferiori dediti alla guerra e alla violenza. Ma due eventi cambieranno tutto: prima la decisione di uno degli “0 Men” di iniziare una massiccia invasione contro gli umani, e, a opporsi a questa follia, il coraggio del giovane Ricky, uno “0 Man” che è stato cresciuto come un umano. Una nuova, straordinaria avventura del Dio dei Manga, Osamu Tezuka, in un’edizione “GX”, integrale di grandissimo pregio.','Tezuka Osamu',410,'Tezuka Osamu','Manga',36,1.22),('100000000000013','DEMON KING 002',5,10,'C\'è una grave frattura tra l\'Inferno ed il mondo dei mortali... Le anime perdute dei combattenti maledetti sono scappate dagli Inferi per tormentare tutti i Viventi. Il Sovrano dell\'Inferno decide quindi di inviare sulla Terra MAJEH, il più potente spadaccino dell\'aldilà, per contrastare la furia delle anime maledette. Anche se MAJEH ha l\'aspetto di un giovane ragazzo, è un messaggero di morte dotato di incredibile poteri di guerriero. DEMON KING pesca a piene mani dalla mitologia asiatica e occidentale, regalandoci un\'opera misteriosa ed avvincente, incentrata sul suo carismatico protagonista, che ci accompagna tra scene estreme di lotta e momenti di esilarante humour. DEMON KING è uno dei manhwa più famosi dell\'era moderna, e sicuramente uno dei più conosciuti all\'estero, potendo contare su uno sterminato numero di traduzioni (USA, Francia, Germania e adesso Italia).','In-Soo Ra',200,'Jae-Hwan Kim','Manhwa',0,1.22),('100000000000014','KASANE 012',9,10,'Grazie al potere del rossetto reditato dalla adr che le permette rubare il volto delle persone, e al bellissimo viso della sorella minore Nogiku, Kasane è diventata una stella del teatro, La sua carriera, però, si è interrotta dopo che Iku Igarash ha permesso a Nogiku di fuggire. Qunado ricompare davanti a Habuta, Nagiku e Iku, Kasane consegna alla sorella minore il rossetto. Ha così inizio per loro il cammino verso finale...','Daruma Matsuura',192,'Daruma Matsuura','Manga',0,1.22),('100000000000015','DEMON KING 003',5,10,'C\'è una grave frattura tra l\'Inferno ed il mondo dei mortali... Le anime perdute dei combattenti maledetti sono scappate dagli Inferi per tormentare tutti i Viventi. Il Sovrano dell\'Inferno decide quindi di inviare sulla Terra MAJEH, il più potente spadaccino dell\'aldilà, per contrastare la furia delle anime maledette. Anche se MAJEH ha l\'aspetto di un giovane ragazzo, è un messaggero di morte dotato di incredibile poteri di guerriero. DEMON KING pesca a piene mani dalla mitologia asiatica e occidentale, regalandoci un\'opera misteriosa ed avvincente, incentrata sul suo carismatico protagonista, che ci accompagna tra scene estreme di lotta e momenti di esilarante humour. DEMON KING è uno dei manhwa più famosi dell\'era moderna, e sicuramente uno dei più conosciuti all\'estero, potendo contare su uno sterminato numero di traduzioni (USA, Francia, Germania e adesso Italia).','In-Soo Ra',200,'Jae-Hwan Kim','Manhwa',0,1.22),('100000000000016','MISSION: YOZAKURA FAMILY 005',3.8,10,'Per scoprire di più sulla morte dei suoi familiari, Taiyo si reca alla cosiddetta \'Biblioteca dei defunti\'. Il problema è che la responsabile della struttura è una persona piuttosto stravagante... Lì viene a conoscenza dell\'esistenza di una misteriosa organizzazione di nome \'Tanpopo\'! Taiyo cerca allora di infiltrarsi con Mutsumi in una delle filiali del gruppo, ma... riuscirà nell\'intento?','Hitsuji Gondaira',192,'Hitsuji Gondaira','Manga',41,1.22),('100000000000017','DEMON KING 004',4.5,10,'C\'è una grave frattura tra l\'Inferno ed il mondo dei mortali... Le anime perdute dei combattenti maledetti sono scappate dagli Inferi per tormentare tutti i Viventi. Il Sovrano dell\'Inferno decide quindi di inviare sulla Terra MAJEH, il più potente spadaccino dell\'aldilà, per contrastare la furia delle anime maledette. Anche se MAJEH ha l\'aspetto di un giovane ragazzo, è un messaggero di morte dotato di incredibile poteri di guerriero. DEMON KING pesca a piene mani dalla mitologia asiatica e occidentale, regalandoci un\'opera misteriosa ed avvincente, incentrata sul suo carismatico protagonista, che ci accompagna tra scene estreme di lotta e momenti di esilarante humour. DEMON KING è uno dei manhwa più famosi dell\'era moderna, e sicuramente uno dei più conosciuti all\'estero, potendo contare su uno sterminato numero di traduzioni (USA, Francia, Germania e adesso Italia).','In-Soo Ra',200,'Jae-Hwan Kim','Manhwa',0,1.22),('100000000000018','GAME OF FAMILIA 006',6.35,10,'Hinana, presa per mano da Mira, viene a conoscenza della vera natura dei Dead Male. Determinata ad addentrarsi negli abissi di Reichnel per svelarne i misteri, si convince a entrare nell\'aula segreta di Ode Seeker dove però, vedendo le torture a cui è sottoposta Mira, scoprirà solo fino a che punto può spingersi la crudeltà umana. Nel frattempo, non vedendo tornare Hinana, Sasae sta per andare a cercarla ma viene fermato da Ode. Anche questa volta, per sconfiggere il nemico servirà un piano dei suoi.','Mikoto Yamaguchi',200,'D.P.','Manga',0,1.22);
/*!40000 ALTER TABLE `fumetti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grafica`
--

DROP TABLE IF EXISTS `grafica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grafica` (
  `seriale` varchar(15) NOT NULL,
  `titolo` varchar(45) NOT NULL,
  `prezzo` double NOT NULL,
  `quantità` int NOT NULL,
  `descrizione` varchar(2000) DEFAULT NULL,
  `categoria` enum('Opera','Moderna') NOT NULL,
  `numVendite` int NOT NULL DEFAULT '0',
  `iva` double NOT NULL,
  PRIMARY KEY (`seriale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grafica`
--

LOCK TABLES `grafica` WRITE;
/*!40000 ALTER TABLE `grafica` DISABLE KEYS */;
INSERT INTO `grafica` VALUES ('200000000000000','YU-GI-OH! Limited Edition Fan-Cel',47.69,4,'L\'omaggio di Fanattik all\'era dell\'animazione classica. Questo Fan-cel è concesso in licenza ufficiale, limitato a soli 995 in tutto il mondo e prodotto nello studio Fanattik in Inghilterra. Misura 35,56 x 27,95 cm e viene fornito con un certificato di autenticità numerato individualmente e una custodia protettiva. L\'opera d\'arte è stampata su acetato, che viene poi posizionato a mano su uno sfondo stampato e poi in una custodia protettiva. Cornice non inclusa.','Moderna',0,1.22),('200000000000001','YU-GI-OH! Limited Edition Art Print',14.3,9,'Questa stampa è limitata a soli 5.000 esemplari in tutto il mondo, è prodotta su carta d\'arte 300gsm, è imbustata con cartone di supporto e viene fornita con un certificato di autenticità. Questo oggetto da collezione con licenza ufficiale misura 35,56 x 27,94 cm ed è prodotto nel Regno Unito.','Moderna',0,1.22),('200000000000002','Dr. STONE - Boxed Poster Set',14.99,9,'Da Abysse America. Attraverso un\'attenta manipolazione della sua struttura molecolare e dei protocolli di incollaggio dei poster migliorati, i geni della cultura geek di ABYstyle hanno ancora una volta sfruttato il fantastico potere della scienza per creare il set di poster perfetto per i fan del Dr. Stone ovunque. Con due poster con Senku, Chrome, Kohaku e altri, è il modo perfetto per riportare il tuo arredamento all\'età della pietra.','Moderna',0,1.22),('200000000000003','GOBLIN SLAYER - Boxed Poster Set',14.99,9,'Gli avventurieri a caccia di goblin e di argento raramente hanno il tempo di concentrarsi sul loro lato artistico. Ringraziamo gli dei e ABYstyle per aver evocato questo poster 20 x 15 pollici 2-pack. E tutto senza l\'uso di alcuna magia nera!','Moderna',0,1.22),('200000000000004','Dragon Ball Z - Heroes Poster Set',7.5,25,'I Guerrieri Z si sono materializzati su due poster. Riusciranno le vostre pareti a sopportare le onde d\'urto? Misurano 20 x 15 pollici, arrivano arrotolati in una scatola di cartone. Buona fortuna a spiegare i fulmini scoppiettanti ai tuoi vicini.','Moderna',0,1.22),('200000000000005','Harry Potter Art Print - Gryffindor Crest',9.99,15,'Una stampa d\'arte ufficiale di Harry Potter, prodotta nel Regno Unito su carta d\'arte 300gsm, imbustata con cartone di supporto, misura 35,56 x 27,94cm.','Opera',58,1.22),('200000000000006','Harry Potter Art Print - Ravenclaw Crest',8.99,15,'Una stampa d\'arte ufficiale di Harry Potter, prodotta nel Regno Unito su carta d\'arte 300gsm, imbustata con cartone di supporto, misura 35,56 x 27,94cm.','Opera',0,1.22),('200000000000007','Harry Potter Art Print - Hufflepuff Crest',8.99,15,'Una stampa d\'arte ufficiale di Harry Potter, prodotta nel Regno Unito su carta d\'arte 300gsm, imbustata con cartone di supporto, misura 35,56 x 27,94cm.','Opera',0,1.22),('200000000000008','Harry Potter Art Print - Slytherin Crest',8.99,15,'Una stampa d\'arte ufficiale di Harry Potter, prodotta nel Regno Unito su carta d\'arte 300gsm, imbustata con cartone di supporto, misura 35,56 x 27,94cm','Opera',52,1.22),('200000000000009','Funimation Con Print - Spot UV Treatment',14.99,3,'Paesaggio urbano appositamente commissionato per il FunimationCon 2020 dal talentuoso illustratore giapponese Rokuban, questa stampa esclusiva misura 11\" x 17\" e ha un trattamento Spot UV!','Opera',0,1.22),('200000000000010','SNK 40th Anniversary Poster Set',25.5,2,'Aggiungi un po\' di nostalgia alle tue pareti mentre celebri i 40 anni di SNK con questo set di poster dell\'anniversario! Sono inclusi cinque poster a colori in formato B2 con i personaggi preferiti dai fan di classici come Samurai Shodown, Metal Slug, Fatal Fury e altri. Originariamente venduto al Tokyo Game Show 2018, è ora disponibile per i fan d\'oltreoceano! Non perdetevelo!','Opera',0,1.22),('200000000000011','Naruto Team 7 Poster',4.1,5,'CARTA LAMINATA DIMENSIONI: 52 X 38 CM.','Moderna',0,1.22),('200000000000012','Cardcaptor Sakura Group Poster',4.1,10,'DIMENSIONI: 52 X 38 CM.','Moderna',0,1.22),('200000000000013','Mandalorian Baby Yoda Wanted Poster',5.4,10,'Poster in carta laminata di alta qualità. Dimensioni: 91,5 x 61 cm','Moderna',0,1.22),('200000000000014','Dr.stone Senku,kohaku,chrome Poster',4.05,10,'Carta laminata Dimensioni: 52 x 38 cm.','Moderna',0,1.22),('200000000000015','One Piece Poster Wanted Chopper New',6.3,10,'LA COLLEZIONE WANTED CONTINUA IN GRANDE FORMATO CON QUESTO POSTER DEDICATO A CHOPPER. CARTA LAMINATA, CON UNO SPESSORE SUPERIORE A QUELLO STANDARD: 170 G / M². STAMPA CON PROCESSO OFFSET. DIMENSIONI: 91,5 X 61 CM','Moderna',47,1.22),('200000000000016','My Little Pony Movie Chase Poster',6.1,30,'MY LITTLE PONY CHASE YOUR DREAMS POSTER','Moderna',35,1.22),('200000000000017','Sao Asuna & Kirito 2 Poster 52 X 38',4.05,40,'CARTA LAMINATA IN ALTA QUALITÀ DIMENSIONI: 52 X 38 CM.','Moderna',0,1.22),('200000000000018','Pokemon Detective Pikachu Maxi Post',5,40,'Poster - formato verticale - 61 x 91,5 cm','Moderna',50,1.22);
/*!40000 ALTER TABLE `grafica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indirizzofatturazione`
--

DROP TABLE IF EXISTS `indirizzofatturazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `indirizzofatturazione` (
  `utente` varchar(15) NOT NULL,
  `ordine` varchar(10) NOT NULL,
  `indirizzo` varchar(100) NOT NULL,
  `stato` varchar(30) NOT NULL,
  `città` varchar(100) NOT NULL,
  `CAP` varchar(5) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `cognome` varchar(45) NOT NULL,
  PRIMARY KEY (`utente`,`ordine`),
  KEY `ordine_idx` (`ordine`),
  CONSTRAINT `ordine` FOREIGN KEY (`ordine`) REFERENCES `ordine` (`codice`),
  CONSTRAINT `utente` FOREIGN KEY (`utente`) REFERENCES `utente` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indirizzofatturazione`
--

LOCK TABLES `indirizzofatturazione` WRITE;
/*!40000 ALTER TABLE `indirizzofatturazione` DISABLE KEYS */;
INSERT INTO `indirizzofatturazione` VALUES ('francesco1','AA00000004','Via SSSS 14','Italia','Milano','82019','Fra','FR'),('lenny97','AA00000002','Via Perna 14','Italia','Milano','82019','Lenny','Skiavo'),('lenny97','AA00000003','Via ddd 14','Italia','Napoli','82019','Lenny','Skiavo'),('lenny97','AA00000005','Via DDD 23','Italia','Milano','82019','Lenny','Skiavo'),('lenny97','AA00000007','Via Perna 14','Italia','Milano','82019','Nicola','Frugieri'),('marisuzc','AA00000006','Via AAA 24','Italia','Napoli','34567','Marisa','La Sorda');
/*!40000 ALTER TABLE `indirizzofatturazione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indirizzospedizione`
--

DROP TABLE IF EXISTS `indirizzospedizione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `indirizzospedizione` (
  `utente` varchar(15) NOT NULL,
  `ordine` varchar(10) NOT NULL,
  `indirizzo` varchar(100) NOT NULL,
  `stato` varchar(30) NOT NULL,
  `città` varchar(100) NOT NULL,
  `CAP` varchar(5) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `cognome` varchar(45) NOT NULL,
  PRIMARY KEY (`utente`,`ordine`),
  KEY `ordine_idx` (`ordine`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indirizzospedizione`
--

LOCK TABLES `indirizzospedizione` WRITE;
/*!40000 ALTER TABLE `indirizzospedizione` DISABLE KEYS */;
INSERT INTO `indirizzospedizione` VALUES ('francesco1','AA00000004','Via SSSS 14','Italia','Milano','82019','Fra','FR'),('lenny97','AA00000002','Via Perna 14','Italia','Milano','82019','Lenny','Skiavo'),('lenny97','AA00000003','Via ddd 14','Italia','Napoli','82019','Lenny','Skiavo'),('lenny97','AA00000005','Via DDD 23','Italia','Milano','82019','Lenny','Skiavo'),('lenny97','AA00000007','Via Perna 14','Italia','Milano','82019','Nicola','Frugieri'),('marisuzc','AA00000006','Via AAA 24','Italia','Napoli','34567','Marisa','La Sorda');
/*!40000 ALTER TABLE `indirizzospedizione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modellino`
--

DROP TABLE IF EXISTS `modellino`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modellino` (
  `seriale` varchar(15) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `prezzo` double NOT NULL,
  `franchise` varchar(30) NOT NULL,
  `descrizione` varchar(2000) DEFAULT NULL,
  `dimensioni` double DEFAULT NULL,
  `quantità` int NOT NULL,
  `categoria` enum('Funko Pop!','Action Figure') NOT NULL,
  `numVendite` int NOT NULL DEFAULT '0',
  `iva` double NOT NULL,
  PRIMARY KEY (`seriale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modellino`
--

LOCK TABLES `modellino` WRITE;
/*!40000 ALTER TABLE `modellino` DISABLE KEYS */;
INSERT INTO `modellino` VALUES ('300000000000000','MARVEL: HAWKEYE - POP FUNKO VINYL FIGURE 1212 KATE BISHOP W/ LUCKY THE PIZZA DOG 9 CM',17.9,'Marvel Hawkeye','Marvel: Hawkeye - Pop Funko Vinyl Figure 1212 Kate Bishop W/ Lucky The Pizza Dog 9 Cm',9,10,'Funko Pop!',0,1.22),('300000000000001','SQUID GAME - POP FUNKO VINYL FIGURE 1226 RED SOLDIER (MASK) 9CM',17.9,'Squid Game','Squid Game - Pop Funko Vinyl Figure 1226 Red Soldier (Mask) 9cm',9,10,'Funko Pop!',0,1.22),('300000000000002','MY HERO ACADEMIA - POP FUNKO VINYL FIGURE 1008 INFINITE DEKU W/ ERI 9CM',19.9,'My Hero Academia','My Hero Academia - Pop Funko Vinyl Figure 1008 Infinite Deku W/ Eri 9cm',9,10,'Funko Pop!',0,1.22),('300000000000003','DC COMICS: THE BATMAN - POP FUNKO VINYL FIGURE 1190 SELINA KYLE 9CM - REGULAR',17.9,'DC Comics The Batman','Dc Comics: The Batman - Pop Funko Vinyl Figure 1190 Selina Kyle W/Chase 9cm - Regular',9,10,'Funko Pop!',0,1.22),('300000000000004','DC COMICS: THE BATMAN - POP FUNKO VINYL KEYCHAIN THE BATMAN 4CM',9,'DC Comics The Batman','Dc Comics: The Batman - Pop Funko Vinyl Keychain The Batman 4cm',4,10,'Funko Pop!',0,1.22),('300000000000005','DISNEY: HOLIDAY 2021 - POP FUNKO VINYL FIGURE 1127 DAISY DUCK 9CM',17.9,'Disney','Disney: Holiday 2021 - Pop Funko Vinyl Figure 1127 Daisy Duck 9cm',9,10,'Funko Pop!',0,1.22),('300000000000006','DEMON SLAYER - FIGUARTS MINI - AKAZA 10CM',36.9,'Demon Slayer','Demon Slayer - Tamashi Nation - Himejima Gyomei 10cm',10,10,'Action Figure',0,1.22),('300000000000007','FORTNITE - ACTION FIGURE CUDDLE TEAM LEADER 18 CM',29.95,'Fortnite','Fortnite - Action Figure Cuddle Team Leader 18 Cm',18,10,'Action Figure',0,1.22),('300000000000008','GAME OF THRONES - JON SNOW - ACTION FIGURE 18CM',29.9,'Game Of Thrones','Game Of Thrones - Jon Snow - Action Figure 18cm',18,10,'Action Figure',0,1.22),('300000000000009','78045 - NARUTO - SH FIGUARTS - NARUTO UZUMAKI BEST SELECTION 14CM',38.9,'Naruto','78045 - Naruto - Sh Figuarts - Naruto Uzumaki Best Selection 14cm',14,10,'Action Figure',0,1.22),('300000000000010','GAME OF THRONES - DROGON - ACTION FIGURE',48.9,'Game Of Thrones','Game Of Thrones – Drogon - Action Figure',33,10,'Action Figure',0,1.22),('300000000000011','PIKACHU SITTING - POKÉMON',12,'Pokémon','Il tuo sogno di diventare un allenatore non è fuori portata! Cattura questo sorridente Pop! Pikachu da aggiungere alla tua collezione di Pokémon.',9,20,'Funko Pop!',36,1.22),('300000000000012','LEAFEON - POKÉMON',12,'Pokémon','Il tuo sogno di diventare allenatore non è fuori portata! Cattura questo Pop! Leafeon da aggiungere alla tua collezione di Pokémon.',10,20,'Funko Pop!',48,1.22),('300000000000013','COGSWORTH IN COBBLER PAN - BEAUTY AND THE BEAST',15,'Disney','Festeggia il 30° anniversario dell\'uscita del film Disney La Bella e la Bestia con l\'esclusiva Pop! Cogsworth nel cobbler. Cambia le carte in tavola e fai in modo che tutta la collezione Pop! de La Bella e la Bestia 30° Anniversario sia ospite della tua esposizione Disney. C\'è una possibilità su 6 di trovare il Pop! Cogsworth nel cobbler bruciato. ',11,20,'Funko Pop!',50,1.22),('300000000000014','SORCERER MICKEY - FANTASIA',12,'Disney','Acclamato come una \"stravaganza di vista e di suono\", Fantasia di Disney è un film che incanta ed emoziona oggi come quando uscì nel 1941. Portate lo stupore e la magia nella vostra collezione con Pop! Sorcerer Mickey',11.4,20,'Funko Pop!',45,1.22),('300000000000015','TOTALLY MINNIE - DISNEY ARCHIVES',12,'Disney','Ispirato ai disegni degli archivi Walt Disney, Pop! Totally Minnie è qui per \"preservare la magia\" nella vostra collezione di classici Disney. Come intendete preservare la magia di Disney nella vostra collezione?',11.2,20,'Funko Pop!',0,1.22),('300000000000016','CAPTAIN CARTER - DOCTOR STRANGE IN THE MULTIVERSE OF MADNESS',12,'Marvel Doctor Strange','Proteggi la tua collezione Marvel con il potente Pop! Captain Carter. Aggiungete Pop! Captain Carver per rafforzare l\'intera collezione Marvel.',10.1,20,'Funko Pop!',0,1.22),('300000000000017','WONDER WOMAN THE FALL OF SINESTRO - WW80',12,'Marvel Wonder Woman','I Sinestro Corps sono in movimento e Pop! Wonder Woman è pronta a entrare in guerra nella tua collezione DC per proteggere gli innocenti e sostenere la giustizia. Colleziona il Pop! Wonder Woman (Fall of Sinestro) per completare la tua collezione Wonder Woman 80th Anniversary.',10.1,20,'Funko Pop!',36,1.22),('300000000000018','CONCEPT SERIES STORMTROOPER WITH SHIELD AND LIGHTSABER - STAR WARS',12,'Star Wars Concept Series','Questa serie speciale di Star Wars Pops! è basata sulla concept art dei personaggi di Ralph McQuarrie. Portate a casa un pezzo della saga stellare con l\'esclusivo Pop! Stormtrooper!',10.4,20,'Funko Pop!',0,1.22),('300000000000019','DARTH VADER LIGHTS & SOUND - STAR WARS',15,'Star Wars','Festeggia il fandom più stellare di tutti con le luci e i suoni di Pop! Darth Vader',9.5,20,'Funko Pop!',0,1.22);
/*!40000 ALTER TABLE `modellino` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordine`
--

DROP TABLE IF EXISTS `ordine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordine` (
  `codice` varchar(10) NOT NULL,
  `utente` varchar(15) NOT NULL,
  `totale` double NOT NULL,
  `data` date NOT NULL,
  PRIMARY KEY (`codice`),
  KEY `usernameUtente_idx` (`utente`),
  CONSTRAINT `usernameUtente` FOREIGN KEY (`utente`) REFERENCES `utente` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordine`
--

LOCK TABLES `ordine` WRITE;
/*!40000 ALTER TABLE `ordine` DISABLE KEYS */;
INSERT INTO `ordine` VALUES ('AA00000000','mr234',35,'2022-05-26'),('AA00000001','nicola1',38.2,'2022-05-28'),('AA00000002','lenny97',36,'2022-07-04'),('AA00000003','lenny97',36,'2022-07-04'),('AA00000004','francesco1',36,'2022-07-04'),('AA00000005','lenny97',25,'2022-07-07'),('AA00000006','marisuzc',36,'2022-07-07'),('AA00000007','mr234',24,'2022-07-09');
/*!40000 ALTER TABLE `ordine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prodottiordine`
--

DROP TABLE IF EXISTS `prodottiordine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prodottiordine` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codiceordine` varchar(10) NOT NULL,
  `serialeFumetti` varchar(15) DEFAULT NULL,
  `serialeGrafiche` varchar(15) DEFAULT NULL,
  `serialeModellini` varchar(15) DEFAULT NULL,
  `quantità` int NOT NULL,
  `prezzo` double NOT NULL,
  PRIMARY KEY (`id`,`codiceordine`),
  KEY `serialeFumetti_idx` (`serialeFumetti`),
  KEY `serialeGrafiche_idx` (`serialeGrafiche`),
  KEY `serialeModellini_idx` (`serialeModellini`),
  CONSTRAINT `prodottiordine_chk_1` CHECK (((((case when (`serialeFumetti` is null) then 0 else 1 end) + (case when (`serialeGrafiche` is null) then 0 else 1 end)) + (case when (`serialeModellini` is null) then 0 else 1 end)) = 1))
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prodottiordine`
--

LOCK TABLES `prodottiordine` WRITE;
/*!40000 ALTER TABLE `prodottiordine` DISABLE KEYS */;
INSERT INTO `prodottiordine` VALUES (7,'AA00000001','100000000000014',NULL,NULL,1,5),(8,'AA00000001','100000000000016',NULL,NULL,1,3.76),(9,'AA00000001','100000000000018',NULL,NULL,1,8.54),(14,'AA00000002',NULL,NULL,'300000000000011',1,5),(15,'AA00000002',NULL,NULL,'300000000000014',1,5),(16,'AA00000003',NULL,NULL,'300000000000010',1,5),(17,'AA00000003',NULL,NULL,'300000000000012',1,5),(18,'AA00000003',NULL,NULL,'300000000000017',1,5),(19,'AA00000004',NULL,NULL,'300000000000002',1,5),(20,'AA00000004',NULL,NULL,'300000000000003',1,5),(21,'AA00000004',NULL,NULL,'300000000000005',1,5),(22,'AA00000005','100000000000004',NULL,NULL,5,5),(23,'AA00000006',NULL,NULL,'300000000000008',1,5),(24,'AA00000006',NULL,NULL,'300000000000004',1,5),(25,'AA00000006',NULL,NULL,'300000000000009',1,5),(26,'AA00000007',NULL,NULL,'300000000000017',1,5.05),(27,'AA00000007',NULL,NULL,'300000000000011',1,5.05);
/*!40000 ALTER TABLE `prodottiordine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recensione`
--

DROP TABLE IF EXISTS `recensione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recensione` (
  `idrecensione` int NOT NULL AUTO_INCREMENT,
  `punteggio` int NOT NULL,
  `testo` varchar(5000) NOT NULL,
  `serialeFumetti` varchar(15) DEFAULT NULL,
  `serialeGrafiche` varchar(15) DEFAULT NULL,
  `serialeModellini` varchar(15) DEFAULT NULL,
  `usernameUtente` varchar(15) NOT NULL,
  PRIMARY KEY (`idrecensione`,`usernameUtente`),
  KEY `serialeFumetti_idx` (`serialeFumetti`),
  KEY `serialeGrafiche_idx` (`serialeGrafiche`),
  KEY `serialeModellini_idx` (`serialeModellini`),
  KEY `usernameUtente_idx` (`usernameUtente`),
  KEY `usernameUser_idx` (`usernameUtente`),
  CONSTRAINT `usernameUser` FOREIGN KEY (`usernameUtente`) REFERENCES `utente` (`username`),
  CONSTRAINT `recensione_chk_1` CHECK (((((case when (`serialeFumetti` is null) then 0 else 1 end) + (case when (`serialeGrafiche` is null) then 0 else 1 end)) + (case when (`serialeModellini` is null) then 0 else 1 end)) = 1))
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recensione`
--

LOCK TABLES `recensione` WRITE;
/*!40000 ALTER TABLE `recensione` DISABLE KEYS */;
INSERT INTO `recensione` VALUES (10,4,'È molto bello',NULL,NULL,'300000000000013','nicola1'),(11,5,'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa','100000000000004',NULL,NULL,'nicola1'),(12,2,'bvbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb',NULL,'200000000000008',NULL,'lenny97'),(13,5,'Prodotto ottimo, ve lo consiglio!',NULL,NULL,'300000000000013','marisuzc'),(14,4,'Questo Funko pop merita tantissimo, acquistatelo!',NULL,NULL,'300000000000013','mr234'),(15,5,'L\'ho acquistato per mio nipote Mi Fu che viene dalla Cina, ne è rimasto veramente soddisfatto',NULL,NULL,'300000000000013','rickyfer2'),(16,4,'Ciao e davvero molto bello cuesto cosi detto Fanco pop mi piacie molto ve lo consiglio grazie a rivederci',NULL,NULL,'300000000000013','lenny97'),(17,5,'Bellissimo','100000000000006',NULL,NULL,'lenny97'),(18,1,'Questo fumetto è stato stampato al contrario, l\'ho dovuto leggere da destra verso sinistra, 1 stella.','100000000000000',NULL,NULL,'lenny97'),(19,3,'\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"',NULL,NULL,'300000000000012','lenny97'),(20,5,'Molto bello',NULL,NULL,'300000000000014','lenny97'),(21,4,'Davvero fantastico, ve lo consiglio!!!!!',NULL,NULL,'300000000000017','lenny97'),(22,4,'Molto bello','100000000000012',NULL,NULL,'lenny97'),(23,4,'Davvero molto ma molto ma molto ma molto ma molto bello',NULL,NULL,'300000000000011','lenny97'),(24,4,'BELSLISSMSOBELSLISSMSOBELSLISSMSOBELSLISSMSOBELSLISSMSOBELSLISSMSOBELSLISSMSOBELSLISSMSOBELSLISSMSOBELSLISSMSOBELSLISSMSOBELSLISSMSOBELSLISSMSOBELSLISSMSOBELSLISSMSOBELSLISSMSOBELSLISSMSOBELSLISSMSOBELSLISSMSOBELSLISSMSOBELSLISSMSO',NULL,'200000000000016',NULL,'lenny97'),(25,5,'BELSLISSMSOBELSLISSMSOBELSLISSMSOBELSLISSMSOBELSLISSMSOBELSLISSMSOBELSLISSMSOBELSLISSMSOBELSLISSMSOBELSLISSMSOBELSLISSMSOBELSLISSMSOBELSLISSMSOBELSLISSMSOBELSLISSMSOBELSLISSMSOBELSLISSMSOBELSLISSMSOBELSLISSMSOBELSLISSMSOBELSLISSMSOBELSLISSMSOBELSLISSMSOBELSLISSMSOBELSLISSMSOBELSLISSMSOBELSLISSMSOBELSLISSMSOBELSLISSMSOBELSLISSMSOBELSLISSMSOBELSLISSMSOBELSLISSMSOBELSLISSMSOBELSLISSMSOBELSLISSMSOBELSLISSMSOBELSLISSMSO','100000000000005',NULL,NULL,'lenny97'),(26,5,'BELLISSIMO BELLISSIMO BELLISSIMO BELLISSIMO BELLISSIMO BELLISSIMO BELLISSIMO BELLISSIMO BELLISSIMO BELLISSIMO BELLISSIMO BELLISSIMO BELLISSIMO BELLISSIMO BELLISSIMO BELLISSIMO BELLISSIMO BELLISSIMO BELLISSIMO BELLISSIMO BELLISSIMO BELLISSIMO BELLISSIMO BELLISSIMO BELLISSIMO BELLISSIMO BELLISSIMO BELLISSIMO BELLISSIMO BELLISSIMO BELLISSIMO BELLISSIMO BELLISSIMO BELLISSIMO BELLISSIMO BELLISSIMO BELLISSIMO BELLISSIMO BELLISSIMO BELLISSIMO BELLISSIMO BELLISSIMO BELLISSIMO BELLISSIMO BELLISSIMO BELLISSIMO BELLISSIMO BELLISSIMO BELLISSIMO BELLISSIMO ',NULL,'200000000000015',NULL,'lenny97'),(27,5,'Davvero molto bello mi è  piaciuto moltissimo fantastico okokok','100000000000001',NULL,NULL,'lenny97');
/*!40000 ALTER TABLE `recensione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utente`
--

DROP TABLE IF EXISTS `utente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utente` (
  `username` varchar(15) NOT NULL,
  `password` varchar(25) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(20) NOT NULL,
  `ruolo` enum('admin','user') DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`username`,`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente`
--

LOCK TABLES `utente` WRITE;
/*!40000 ALTER TABLE `utente` DISABLE KEYS */;
INSERT INTO `utente` VALUES ('CarFul','carmine123','Carmine','Fulgieri','user','carminefulgieri@gmail.com'),('francesco1','fra123','Francesco','Rossi','user','francescorossi@gmail.com'),('lenny97','pass321','Leonardo','Schiavo','user','lennyschiavo@gmail.com'),('marisuzc','marisa23','Marisa','La Sorda','user','marisalasorda@gmail.com'),('mr234','mario234','Mario','Verdi','user','marioverdi@gmail.com'),('nicola1','nicola123','Nicola','Frugieri','admin','nicolafrugieri@gmail.com'),('rickyfer2','ricky123','Riccardo','Ferraris','admin','rickyferraris@gmail.com');
/*!40000 ALTER TABLE `utente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-16 10:33:58
