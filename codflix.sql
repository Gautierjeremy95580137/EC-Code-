-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jun 25, 2020 at 01:59 PM
-- Server version: 5.7.26
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `codflix`
--

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`id`, `name`) VALUES
(1, 'Action'),
(2, 'Horreur'),
(3, 'Science-Fiction'),
(4, 'comedie'),
(5, 'documentaire'),
(6, 'thriller'),
(7, 'western');

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  `start_date` datetime NOT NULL,
  `finish_date` datetime DEFAULT NULL,
  `watch_duration` int(11) NOT NULL DEFAULT '0' COMMENT 'in seconds'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `release_date` date NOT NULL,
  `summary` longtext NOT NULL,
  `trailer_url` varchar(100) NOT NULL,
  `duration` time NOT NULL,
  `movie_url` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `genre_id`, `title`, `type`, `status`, `release_date`, `summary`, `trailer_url`, `duration`, `movie_url`) VALUES
(1, 1, 'heat', 'action', 'sorti', '1996-03-03', 'film de braquage', 'https://www.youtube.com/embed/Xl7X4Pf3PTY', '02:52:00', 'https://www.youtube.com/embed/Xl7X4Pf3PTY'),
(2, 2, 'massacre a la tronconeuse', 'horreur', 'sorti', '2000-05-05', 'un film nul', 'https://www.youtube.com/embed/S0ptrWpSZ4g', '01:38:00', 'https://www.youtube.com/embed/S0ptrWpSZ4g'),
(3, 1, 'TOP GUN', 'film', 'sorti', '1986-08-11', 'Pete Maverick Mitchell, un jeune prodige du pilotage peu apprécié par sa hiérarchie, rejoint la très réputée école de l\'aéronavale américaine, Top Gun,pour perfectionner ses techniques de combat aérien. Tous les étudiants concourent pour le titre de meilleur pilote.', 'https://www.youtube.com/embed/i8sEGppZX-s', '01:50:00', 'https://www.youtube.com/embed/i8sEGppZX-s'),
(4, 3, 'Les gardiens de la galaxie', 'film', 'sorti', '2014-02-14', 'Peter Quill est un aventurier traqué par tous les chasseurs de primes pour avoir volé un mystérieux globe convoité par le puissant Ronan, dont les agissements menacent l\'univers tout entier. Lorsqu\'il découvre le véritable pouvoir de ce globe et la menace qui pèse sur la galaxie, il conclut une alliance fragile avec quatre extraterrestres disparates.', 'https://www.youtube.com/embed/ry19UYQoAro', '02:05:00', 'https://www.youtube.com/embed/ry19UYQoAro'),
(5, 1, 'Midway', 'film', 'sorti', '2019-11-05', 'Après la débâcle de Pearl Harbor qui a laissé la flotte américaine dévastée, la marine impériale japonaise prépare une nouvelle attaque qui devrait éliminer définitivement les forces aéronavales restantes de son adversaire. La campagne du Pacifique va se jouer dans un petit atoll isolé du Pacifique nord : Midway.', 'https://www.youtube.com/embed/1c6Q_dBhNbE', '02:18:00', 'https://www.youtube.com/embed/1c6Q_dBhNbE'),
(6, 1, 'The town', 'film', 'sorti', '2010-08-23', 'Doug MacRay et James Coughlin sont deux amis d\'enfance ayant grandi dans l\'arrière-cour de Boston. A la tête d\'un groupe de braqueurs de banques, ils prennent en otage une jeune femme au cours d\'un hold-up. Après l\'avoir relâchée, Doug tombe sous son charme, la suit et entame une relation avec elle. Pris dans un étau entre sa famille criminelle et celle qu\'il pourrait fonder auprès de Claire, Doug va devoir faire un choix.', 'https://www.youtube.com/embed/FMfVh1H6Q3U', '02:05:00', 'https://www.youtube.com/embed/FMfVh1H6Q3U'),
(7, 1, 'American sniper', 'film', 'sorti', '2015-02-15', 'Bouleversé par l\'attaque de l\'ambassade américaine en Tanzanie et au Kenya en 1998, Chris Kyle, star du rodéo, choisit de changer le cours de sa vie. À 30 ans, il quitte son Texas natal et s\'engage chez les Navy Seals. Le jeune homme devient l\'un des meilleurs snipers de son unité. Au lendemain des attentats du 11 septembre, Kyle est envoyé en Irak.', 'https://www.youtube.com/embed/v4ig1Hxdmj4', '02:14:00', 'https://www.youtube.com/embed/v4ig1Hxdmj4'),
(8, 4, 'Date limite', 'film', 'sorti', '2010-10-11', 'Cinq jours séparent Peter Highman du jour où il sera père pour la première fois, au terme de la grossesse de sa femme. Tandis qu\'il se dépêche de prendre un vol d\'Atlanta pour être à ses côtés pour la naissance, ses meilleures intentions s\'en vont à vau-l\'eau.', 'https://www.youtube.com/embed/cWxKqHboquU', '01:35:00', 'https://www.youtube.com/embed/cWxKqHboquU'),
(9, 3, 'Aquaman', 'film', 'sorti', '2018-11-19', 'Les origines d\'un héros malgré lui, dont le destin est d\'unir deux mondes opposés, la terre et la mer. Cette histoire épique est celle d\'un homme ordinaire destiné à devenir le roi des Sept Mers : Aquaman.', 'https://www.youtube.com/embed/ivvOKs7B-Vw', '02:22:00', 'https://www.youtube.com/embed/ivvOKs7B-Vw'),
(10, 3, 'La MOMIE', 'film', 'sorti', '1999-03-23', '1719 avant J.-C. Pour avoir osé ravir sa fiancée au Pharaon, le grand prêtre Imhotep est momifié vivant et enseveli dans une crypte secrète d\'Hamunaptra, mais son coeur bat toujours et la Momie attend l\'heure de sa libération. En 1923, l\'aventurier O\'Connell découvre les ruines d\'Hamunaptra. La malédiction d\'Imhotep va pouvoir se réaliser.', 'https://www.youtube.com/embed/oGzBFDoIyn4', '02:05:00', 'https://www.youtube.com/embed/oGzBFDoIyn4'),
(11, 4, 'TAXI 5', 'film', 'sorti', '2018-07-15', 'Sylvain Marot, super flic parisien et pilote d\'exception, est muté contre son gré à la Police Municipale de Marseille. L\'ex-commissaire Gibert, devenu maire de la ville et au plus bas dans les sondages, va alors lui confier la mission de stopper le redoutable `Gang des Italiens\', qui écume des bijouteries à l\'aide de puissantes Ferrari. Pour y parvenir, Marot n\'aura pas d\'autre choix que de collaborer avec le petit-neveu du célèbre Daniel, Eddy Maklouf, le pire chauffeur VTC de Marseille.', 'https://www.youtube.com/embed/6fmUv6tVWf8', '01:43:00', 'https://www.youtube.com/embed/6fmUv6tVWf8'),
(12, 1, 'Tyler Rake', 'film', 'sorti', '2020-04-07', 'Tyler Rake est un mercenaire intrépide qui travaille dans l\'ombre. Il a été envoyé au Bangladesh par un puissant caïd mafieux incarcéré, pour sauver son fils qui a été enlevé. Bien qu\'il soit un guerrier d\'expérience, il réalise rapidement à quel point sa mission est bouleversante et dangereuse.', 'https://www.youtube.com/embed/V95ZyU3QMic', '01:57:00', 'https://www.youtube.com/embed/V95ZyU3QMic'),
(13, 1, 'Hacker', 'film', 'sorti', '2015-08-17', 'À Hong Kong, la centrale nucléaire de Chai Wan a été hackée. Un logiciel malveillant a ouvert la porte à un autre malware plus puissant qui a détruit le système de refroidissement de la centrale, provoquant la fissure d\'un caisson de confinement et la fusion de son coeur. Un groupe de hauts gradés de l\'APL (Armée populaire de libération chinoise) charge le capitaine Dawai Chen, spécialiste de la défense contre les cyberattaques, de retrouver et de neutraliser l\'auteur de ce crime.', 'https://www.youtube.com/embed/JVOg0YfHSnU', '02:15:00', 'https://www.youtube.com/embed/JVOg0YfHSnU'),
(14, 1, 'Troie', 'film', 'sorti', '2012-09-04', 'Dans la Grèce antique, l\'enlèvement d\'Hélène, reine de Sparte, par Paris, prince de Troie, est une insulte que le roi Ménélas ne peut supporter. L\'honneur familial étant en jeu, Agamemnon, frère de Ménélas et puissant roi de Mycènes, réunit toutes les armées grecques afin de faire sortir Hélène de Troie. L\'issue de la guerre de Troie dépendra notamment d\'un homme, Achille. Arrogant, rebelle, et réputé invicible, celui-ci n\'a d\'attache pour rien ni personne si ce n\'est sa propre gloire.', 'https://www.youtube.com/embed/IeZrKyyXYjY', '03:16:00', 'https://www.youtube.com/embed/IeZrKyyXYjY'),
(15, 3, 'Harry Potter et les reliques de la mort-Partie 2', 'film', 'sorti', '2011-09-12', 'Dans la 2e Partie de cet épisode final, le combat entre les puissances du bien et du mal de l\'univers des sorciers se transforme en guerre sans merci. Les enjeux n\'ont jamais été si considérables et personne n\'est en sécurité. Mais c\'est Harry Potter qui peut être appelé pour l\'ultime sacrifice alors que se rapproche l\'ultime épreuve de force avec Voldemort.', 'https://www.youtube.com/embed/aiaIfICU-Tk', '02:10:00', 'https://www.youtube.com/embed/aiaIfICU-Tk'),
(16, 3, 'Terminator GENISYS', 'film', 'sorti', '2015-04-13', 'Le leader de la résistance John Connor envoie le sergent Kyle Reese dans le passé pour protéger sa mère, Sarah Connor et préserver l\'avenir de l\'humanité. Des événements inattendus provoquent une fracture temporelle et Sarah et Kyle se retrouvent dans une nouvelle version du passé. Ils y découvrent un allié inattendu : le Guardian. Ensemble, ils doivent faire face à un nouvel ennemi. La menace a changé de visage.', 'https://www.youtube.com/embed/TYytGTAjSlI', '02:06:00', 'https://www.youtube.com/embed/TYytGTAjSlI'),
(17, 4, 'NO PAIN NO GAIN', 'film', 'sorti', '2013-07-04', 'Daniel Lugo est coach sportif à Miami. Mais ce bon patriote veut plus : le top du rêve américain, des maisons de luxe, des voitures de course et des filles divines. Pour y parvenir, il projette d\'enlever l\'un de ses riches clients et lui voler sa fortune, sa vie. Pour l\'aider à monter son coup, il fait appel à deux culturistes qui partagent ses ambitions, l\'un très pieux, Paul Doyle, l\'autre obsédé par ses problèmes érectiles.', 'https://www.youtube.com/embed/QZZpRt77gEA', '02:09:00', 'https://www.youtube.com/embed/QZZpRt77gEA'),
(18, 2, 'World war Z', 'film', 'sorti', '2013-06-27', 'Un jour comme les autres, Gerry Lane et sa famille se retrouvent coincés dans un embouteillage monstre sur leur trajet quotidien. Ancien enquêteur des Nations Unies, Lane comprend immédiatement que la situation est inhabituelle. Tandis que les hélicoptères de la police sillonnent le ciel et que les motards quadrillent les rues, la ville bascule dans le chaos. Les gens s\'en prennent violemment les uns aux autres et un virus mortel semble se propager.', 'https://www.youtube.com/embed/t96s5N-kC_E', '02:03:00', 'https://www.youtube.com/embed/t96s5N-kC_E'),
(19, 1, 'Jack Reacher', 'film', 'sorti', '2012-10-18', 'Alors qu\'elles se trouvent tranquillement dans un parc, cinq personnes sont froidement abattues par un sniper posté dans un parking leur faisant face. Toutes les pistes mènent à James Barr. Les forces de police appréhendent le suspect numéro un et le placent immédiatement en détention. Alors qu\'il est entendu par les inspecteurs chargés de l\'enquête, Barr n\'avoue rien, mais écrit sur une feuille : \"Trouvez Jack Reacher\"...', 'https://www.youtube.com/embed/ZGFBa7Exr18', '02:10:00', 'https://www.youtube.com/embed/ZGFBa7Exr18'),
(20, 1, '13 hours', 'film', 'sorti', '2016-03-30', 'Le 11 septembre 2012, à Benghazi, dans une Libye en plein chaos, des milices islamistes extrémistes prennent d\'assaut l\'enceinte d\'un camp des Forces spéciales de l\'armée américaine dans laquelle se trouve l\'ambassadeur Chris Stevens. Une deuxième attaque est ensuite opérée sur une base de la CIA voisine. Engagés par l\'agence de renseignements, six agents de la sécurité et ex-soldats d\'élite organisent du mieux qu\'ils peuvent la résistance.', 'https://www.youtube.com/embed/x9jGRSNfaGg', '02:24:00', 'https://www.youtube.com/embed/x9jGRSNfaGg'),
(21, 6, 'The big short', 'film', 'sorti', '2015-12-23', 'Wall Street. 2005. Profitant de l\'aveuglement généralisé des grosses banques, des médias et du gouvernement, quatre outsiders anticipent l\'explosion de la bulle financière et mettent au point le casse du siècle ! Michael Burry, Mark Baum, Jared Vennett et Ben Rickert : des personnages visionnaires et hors du commun qui vont parier contre les banques et tenter de rafler la mise.', 'https://www.youtube.com/embed/lKOC_kmBsJU', '02:10:00', 'https://www.youtube.com/embed/lKOC_kmBsJU'),
(22, 3, 'Je suis une legende', 'film', 'sorti', '2012-09-04', 'Robert Neville était un brillant scientifique, mais même lui n\'a pu endiguer le terrible virus - créé de la main de l\'homme - qui a dévasté la race humaine. Pour une raison inconnue, Neville est immunisé et reste à ce jour le dernier être humain vivant dans ce qui reste de New York et peut-être du monde. Depuis trois ans, il envoie des messages de détresse à qui voudra bien l\'entendre.', 'https://www.youtube.com/embed/yTNKbLhVAQA', '01:44:00', 'https://www.youtube.com/embed/yTNKbLhVAQA'),
(23, 4, 'Very bad trip 3', 'film', 'sorti', '2013-04-25', 'Cela fait deux ans maintenant que Phil, Stu, Alan et Doug sont revenus de Thaïlande. Tout le monde a bien négocié le retour mais Alan, qui a cessé de prendre ses médicaments, peine à trouver son équilibre. Et la perte de son père, terrassé par une soudaine crise cardiaque, n\'arrange rien à son état. Sa soeur demande alors à ses amis Phil, Stu et Doug de le convaincre de suivre une thérapie en Arizona.', 'https://www.youtube.com/embed/ibq2kS7NRaU', '01:40:00', 'https://www.youtube.com/embed/ibq2kS7NRaU'),
(24, 4, 'Vive les vacances', 'film', 'sorti', '2015-07-20', 'Suivant l\'exemple de son père, dans l\'espoir de renouer des liens familiaux longtemps distendus, Rusty Griswold fait une surprise à sa femme Debbie et à leurs deux fils, en leur proposant de repartir à Walley World, réputé comme le parc d\'attraction préféré des familles américaines. Cependant, pour y parvenir, ils devront traverser le pays tout entier.', 'https://www.youtube.com/embed/3vQylb9YzVA', '01:39:00', 'https://www.youtube.com/embed/3vQylb9YzVA'),
(25, 6, 'Force et honneur S1-E1', 'serie', 'sorti', '2017-01-28', 'Le 2 février 2017, en vue de la sortie de son album, Lacrim dévoile sur YouTube la première épisode d\'une websérie, écrit par Jérémie Guez et réalisée par de Beat Bounce Entertainment, de quatre épisodes au total intitulée « Force & Honneur ». Le rappeur, qui joue son propre rôle dans cette série, s\'inspire de sa vie et y décrit sa sortie carcérale et son retour dans le rap game français. Parmi les acteurs, on retrouve notamment Moussa Maaskri, Afif Ben Badra, Pierre-Marie Mosconi, Michel Ferracci, Nassim Si Ahmed, Djibril Gueye, Jean-Pierre Kalfon, Caterina Murino ou encore le chanteur Maître Gims', 'https://www.youtube.com/embed/0p7J_G3vavM', '00:15:39', 'https://www.youtube.com/embed/CvtQkprxprI'),
(26, 1, 'Force et honneur S1-E2', 'serie', 'sorti', '2017-02-16', 'Le 2 février 2017, en vue de la sortie de son album, Lacrim dévoile sur YouTube la première épisode d\'une websérie, écrit par Jérémie Guez et réalisée par de Beat Bounce Entertainment, de quatre épisodes au total intitulée « Force & Honneur ». Le rappeur, qui joue son propre rôle dans cette série, s\'inspire de sa vie et y décrit sa sortie carcérale et son retour dans le rap game français. Parmi les acteurs, on retrouve notamment Moussa Maaskri, Afif Ben Badra, Pierre-Marie Mosconi, Michel Ferracci, Nassim Si Ahmed, Djibril Gueye, Jean-Pierre Kalfon, Caterina Murino ou encore le chanteur Maître Gims', 'https://www.youtube.com/embed/0p7J_G3vavM', '00:13:16', 'https://www.youtube.com/embed/kBj31rqR2j4'),
(27, 1, 'Force et honneur S1-E3', 'serie', 'sorti', '2017-02-17', ' Le 2 février 2017, en vue de la sortie de son album, Lacrim dévoile sur YouTube la première épisode d\'une websérie, écrit par Jérémie Guez et réalisée par de Beat Bounce Entertainment, de quatre épisodes au total intitulée « Force & Honneur ». Le rappeur, qui joue son propre rôle dans cette série, s\'inspire de sa vie et y décrit sa sortie carcérale et son retour dans le rap game français. Parmi les acteurs, on retrouve notamment Moussa Maaskri, Afif Ben Badra, Pierre-Marie Mosconi, Michel Ferracci, Nassim Si Ahmed, Djibril Gueye, Jean-Pierre Kalfon, Caterina Murino ou encore le chanteur Maître Gims\r\n', 'https://www.youtube.com/embed/0p7J_G3vavM', '00:14:06', 'https://www.youtube.com/embed/bBxqcOTk4qw'),
(28, 1, 'Force et honneur S1-E4', 'serie', 'sorti', '2017-02-18', 'Le 2 février 2017, en vue de la sortie de son album, Lacrim dévoile sur YouTube la première épisode d\'une websérie, écrit par Jérémie Guez et réalisée par de Beat Bounce Entertainment, de quatre épisodes au total intitulée « Force & Honneur ». Le rappeur, qui joue son propre rôle dans cette série, s\'inspire de sa vie et y décrit sa sortie carcérale et son retour dans le rap game français. Parmi les acteurs, on retrouve notamment Moussa Maaskri, Afif Ben Badra, Pierre-Marie Mosconi, Michel Ferracci, Nassim Si Ahmed, Djibril Gueye, Jean-Pierre Kalfon, Caterina Murino ou encore le chanteur Maître Gims\r\n', 'https://www.youtube.com/embed/0p7J_G3vavM', '00:12:52', 'https://www.youtube.com/embed/EPtegj63uHk'),
(29, 1, 'Force et honneur S1-E5', 'serie', 'sorti', '2017-02-19', ' Le 2 février 2017, en vue de la sortie de son album, Lacrim dévoile sur YouTube la première épisode d\'une websérie, écrit par Jérémie Guez et réalisée par de Beat Bounce Entertainment, de quatre épisodes au total intitulée « Force & Honneur ». Le rappeur, qui joue son propre rôle dans cette série, s\'inspire de sa vie et y décrit sa sortie carcérale et son retour dans le rap game français. Parmi les acteurs, on retrouve notamment Moussa Maaskri, Afif Ben Badra, Pierre-Marie Mosconi, Michel Ferracci, Nassim Si Ahmed, Djibril Gueye, Jean-Pierre Kalfon, Caterina Murino ou encore le chanteur Maître Gims', ' https://www.youtube.com/embed/0p7J_G3vavM', '00:11:15', 'https://www.youtube.com/embed/_BhYk_D6Bvk');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(80) NOT NULL,
  `Validation` int(11) DEFAULT NULL,
  `cle` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `Validation`, `cle`) VALUES
(1, 'coding@gmail.com', '123456', 1, ''),
(2, 'bobo@gmail.com', 'root', 1, 'e2a51e7943b6728db9a8af497dbc4eb8'),
(3, 'hh@gmail.com', 'root', 1, '72324ed98864d13494b324b5dbdceb28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `history_user_id_fk_media_id` (`user_id`),
  ADD KEY `history_media_id_fk_media_id` (`media_id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_genre_id_fk_genre_id` (`genre_id`) USING BTREE;

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_media_id_fk_media_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `history_user_id_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `media_genre_id_b1257088_fk_genre_id` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`);
