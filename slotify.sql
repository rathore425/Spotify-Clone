-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 25, 2020 at 10:13 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `slotify`
--

-- --------------------------------------------------------

--
-- Table structure for table `albums`
--

CREATE TABLE `albums` (
  `id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `artist` int(11) NOT NULL,
  `genre` int(11) NOT NULL,
  `artworkPath` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `albums`
--

INSERT INTO `albums` (`id`, `title`, `artist`, `genre`, `artworkPath`) VALUES
(1, 'Beerbongs & Bentleys', 1, 4, 'assets/images/artwork/Beerbongs.jpg'),
(2, 'Scorpion', 3, 4, 'assets/images/artwork/Scorpion.jpeg'),
(3, 'Evolve', 5, 1, 'assets/images/artwork/Evolve.jpeg'),
(4, 'Thank U, Next', 4, 2, 'assets/images/artwork/ThankUNext.jpg'),
(5, 'American Teen', 2, 5, 'assets/images/artwork/AmericanTeen.jpeg'),
(6, 'Divide', 6, 2, 'assets/images/artwork/Divide.jpeg'),
(7, 'Recovery', 7, 3, 'assets/images/artwork/Recovery.jpeg'),
(8, 'Reputation', 8, 2, 'assets/images/artwork/Reputation.jpeg'),
(9, 'Lemonade', 9, 2, 'assets/images/artwork/Lemonade.jpeg'),
(10, '24K Magic', 10, 5, 'assets/images/artwork/24K Magic.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `artists`
--

CREATE TABLE `artists` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `artists`
--

INSERT INTO `artists` (`id`, `name`) VALUES
(1, 'Post Malone'),
(2, 'Khalid'),
(3, 'Drake'),
(4, 'Ariana Grande'),
(5, 'Imagine Dragons'),
(6, 'Ed Sheeran'),
(7, 'Eminem'),
(8, 'Taylor Swift'),
(9, 'Beyonce'),
(10, 'Bruno Mars');

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`id`, `name`) VALUES
(1, 'Rock'),
(2, 'Pop'),
(3, 'Hip-Hop'),
(4, 'Rap'),
(5, 'R & B'),
(6, 'Classical'),
(7, 'Techno'),
(8, 'Jazz'),
(9, 'Folk'),
(10, 'Country');

-- --------------------------------------------------------

--
-- Table structure for table `playlists`
--

CREATE TABLE `playlists` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `owner` varchar(50) NOT NULL,
  `dateCreated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `playlists`
--

INSERT INTO `playlists` (`id`, `name`, `owner`, `dateCreated`) VALUES
(1, 'MyFirst', 'abhinav1703', '2019-11-12 00:00:00'),
(3, 'Fav', 'abhinav1703', '2019-11-15 00:00:00'),
(5, '', 'abhinav1703', '2019-12-07 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `playlistSongs`
--

CREATE TABLE `playlistSongs` (
  `id` int(11) NOT NULL,
  `songId` int(11) NOT NULL,
  `playlistId` int(11) NOT NULL,
  `playlistOrder` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `playlistSongs`
--

INSERT INTO `playlistSongs` (`id`, `songId`, `playlistId`, `playlistOrder`) VALUES
(1, 15, 1, 1),
(2, 30, 1, 2),
(4, 4, 1, 4),
(5, 15, 3, 1),
(6, 7, 3, 2),
(7, 2, 3, 3),
(8, 3, 3, 4),
(9, 9, 3, 5),
(10, 10, 3, 6),
(11, 17, 3, 7),
(12, 5, 3, 8),
(13, 11, 3, 9),
(14, 1, 3, 10),
(15, 4, 3, 11),
(16, 13, 3, 12),
(17, 51, 3, 13),
(19, 64, 3, 14),
(20, 55, 3, 15),
(21, 41, 3, 16),
(22, 57, 3, 17),
(23, 59, 3, 18),
(24, 49, 3, 19),
(31, 3, 1, 11),
(32, 60, 3, 20),
(33, 11, 3, 21),
(34, 12, 3, 22);

--
-- Triggers `playlistSongs`
--
DELIMITER $$
CREATE TRIGGER `Addition` AFTER INSERT ON `playlistSongs` FOR EACH ROW INSERT INTO RecentlyAdded(id,songID, playlistID) VALUES(NEW.id, New.songId, NEW.playlistId)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `RecentlyAdded`
--

CREATE TABLE `RecentlyAdded` (
  `id` int(11) NOT NULL,
  `songID` int(11) NOT NULL,
  `playlistID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `RecentlyAdded`
--

INSERT INTO `RecentlyAdded` (`id`, `songID`, `playlistID`) VALUES
(20, 55, 3),
(21, 41, 3),
(22, 57, 3),
(23, 59, 3),
(24, 49, 3),
(25, 2, 1),
(26, 2, 1),
(27, 2, 1),
(28, 2, 1),
(29, 2, 1),
(30, 2, 1),
(31, 3, 1),
(32, 60, 3),
(33, 11, 3),
(34, 12, 3),
(35, 13, 6);

-- --------------------------------------------------------

--
-- Table structure for table `Songs`
--

CREATE TABLE `Songs` (
  `id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `artist` int(11) NOT NULL,
  `album` int(11) NOT NULL,
  `genre` int(11) NOT NULL,
  `duration` varchar(8) NOT NULL,
  `path` varchar(500) NOT NULL,
  `albumOrder` int(11) NOT NULL,
  `plays` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Songs`
--

INSERT INTO `Songs` (`id`, `title`, `artist`, `album`, `genre`, `duration`, `path`, `albumOrder`, `plays`) VALUES
(1, 'Believer', 5, 3, 1, '03:23', 'assets/music/Believer.mp3', 1, 8),
(2, 'Location', 2, 5, 5, '03:34', 'assets/music/Location.mp3', 1, 4),
(3, 'Young Dumb & Broke', 2, 5, 5, '03:24', 'assets/music/Young Dumb & Broke.mp3', 2, 3),
(4, 'Thunder', 5, 3, 1, '03:23', 'assets/music/Thunder.mp3', 2, 2),
(5, '7 rings', 4, 4, 2, '03:05', 'assets/music/7 rings.mp3', 1, 6),
(6, 'Thank U, Next', 4, 4, 2, '03:27', 'assets/music/thank u, next.mp3', 2, 1),
(7, 'God\'s Plan', 3, 2, 4, '03:19', 'assets/music/God s Plan.mp3', 1, 6),
(8, 'In My Feelings', 3, 2, 4, '03:37', 'assets/music/In My Feelings.mp3', 2, 0),
(9, 'Rockstar', 1, 1, 4, '03:38', 'assets/music/Rockstar.mp3', 1, 3),
(10, 'Better Now', 1, 1, 4, '03:51', 'assets/music/Better Now.mp3', 2, 2),
(11, 'Ready For It', 8, 8, 2, '03:30', 'assets/music/Ready For It.mp3', 1, 3),
(12, 'Call It What You Want', 8, 8, 2, '03:26', 'assets/music/Call It What You Want.mp3', 2, 0),
(13, 'Won\'t Back Down', 7, 7, 3, '04:30', 'assets/music/Won t Back Down.mp3', 1, 4),
(14, 'No Love', 7, 7, 3, '05:01', 'assets/music/No Love.mp3', 2, 0),
(15, 'Perfect', 6, 6, 2, '04:28', 'assets/music/Perfect.mp3', 1, 6),
(16, 'Shape Of You', 6, 6, 2, '03:55', 'assets/music/Shape Of You.mp3', 2, 1),
(17, '24K Magic', 10, 10, 5, '03:46', 'assets/music/24K Magic.mp3', 1, 7),
(18, 'That\'s What I Like', 10, 10, 5, '03:30', 'assets/music/That’s What I Like.mp3', 2, 1),
(19, 'Hold Up', 9, 9, 2, '03:10', 'assets/music/Hold Up.mp3', 1, 1),
(20, 'All Night', 9, 9, 2, '05:20', 'assets/music/All Night.mp3', 2, 0),
(21, 'Paranoid', 1, 1, 4, '03:42', 'assets/music/Paranoid.mp3', 3, 0),
(22, 'Otherside', 1, 1, 4, '03:48', 'assets/music/Otherside.mp3', 4, 0),
(23, 'Stay', 1, 1, 4, '03:25', 'assets/music/Stay.mp3', 5, 0),
(24, 'Nonstop', 3, 2, 4, '03:59', 'assets/music/Nonstop.mp3', 3, 0),
(25, 'Can\'t Take A Joke', 3, 2, 4, '03:33', 'assets/music/Can t Take a Joke.mp3', 4, 0),
(26, 'After Dark', 3, 2, 4, '04:50', 'assets/music/After Dark.mp3', 5, 0),
(27, 'Jaded', 3, 2, 4, '04:23', 'assets/music/JADED.mp3', 6, 0),
(28, 'Dancing In The Dark', 5, 3, 1, '03:54', 'assets/music/Dancing in the Dark.mp3', 3, 0),
(29, 'Rise Up', 5, 3, 1, '03:52', 'assets/music/Rise Up.mp3', 4, 0),
(30, 'I Don\'t Know Why', 5, 3, 1, '03:10', 'assets/music/I Don t Know Why.mp3', 5, 0),
(31, 'Break Up With Your Girlfriend', 4, 4, 2, '03:10', 'assets/music/Break up with your girlfriend.mp3', 3, 2),
(32, 'Bad Idea', 4, 4, 2, '04:27', 'assets/music/bad idea.mp3', 4, 1),
(33, 'Hopeless', 2, 5, 5, '02:48', 'assets/music/Hopeless.mp3', 3, 1),
(34, 'Cold Blooded', 2, 5, 5, '03:28', 'assets/music/Cold Blooded.mp3', 4, 3),
(35, 'Therapy', 2, 5, 5, '04:18', 'assets/music/Therapy.mp3', 5, 1),
(36, 'Shot Down', 2, 5, 5, '03:27', 'assets/music/Shot Down.mp3', 6, 1),
(37, 'Winter', 2, 5, 5, '04:02', 'assets/music/Winter.mp3', 7, 1),
(38, 'Happier', 6, 6, 2, '03:28', 'assets/music/Happier.mp3', 3, 0),
(39, 'Dive', 6, 6, 2, '03:59', 'assets/music/Dive.mp3', 4, 0),
(40, 'What Do I Know?', 6, 6, 2, '03:57', 'assets/music/What Do I Know.mp3', 5, 0),
(41, 'Eraser', 6, 6, 2, '03:48', 'assets/music/Eraser.mp3', 6, 2),
(46, 'Cold Wind Blows', 7, 7, 3, '05:04', 'assets/music/Cold Wind Blows.mp3', 3, 0),
(47, 'On Fire', 7, 7, 3, '03:33', 'assets/music/On Fire.mp3', 4, 0),
(48, 'Love The Way You Lie', 7, 7, 3, '04:23', 'assets/music/Love the Way You Lie.mp3', 5, 0),
(49, 'Sorry', 9, 9, 2, '03:53', 'assets/music/Sorry.mp3', 3, 2),
(50, 'Forward', 9, 9, 2, '01:19', 'assets/music/Forward.mp3', 4, 0),
(51, 'Freedom', 9, 9, 2, '04:50', 'assets/music/Freedom.mp3', 5, 2),
(52, 'Our Song', 8, 8, 2, '01:42', 'assets/music/Our Song.mp3', 3, 0),
(53, 'Delicate', 8, 8, 2, '02:25', 'assets/music/DELICATE.mp3', 4, 0),
(54, 'Gorgeous', 8, 8, 2, '03:31', 'assets/music/Gorgeous.mp3', 5, 0),
(55, 'Don\'t Blame Me', 8, 8, 2, '04:15', 'assets/music/Don’t Blame Me.mp3', 6, 2),
(56, 'Chunky', 10, 10, 5, '03:06', 'assets/music/Chunky.mp3', 3, 1),
(57, 'Perm', 10, 10, 5, '03:30', 'assets/music/Perm.mp3', 4, 3),
(58, 'Too Good To Say Goodbye', 10, 10, 5, '04:41', 'assets/music/Too Good to Say Goodbye.mp3', 5, 0),
(59, 'Imagine', 4, 4, 2, '03:32', 'assets/music/Imagine.mp3', 5, 2),
(60, 'Needy', 4, 4, 2, '02:52', 'assets/music/Needy.mp3', 6, 2),
(64, 'I\'m Upset', 3, 2, 4, '03:34', 'assets/music/I\'m Upset.mp3', 7, 2),
(65, 'March 14', 3, 2, 4, '05:09', 'assets/music/March14.mp3', 8, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(32) NOT NULL,
  `signUpDate` datetime NOT NULL,
  `profilePic` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `firstName`, `lastName`, `email`, `password`, `signUpDate`, `profilePic`) VALUES
(1, 'abhinav1703', 'Abhinav', 'Rathore', 'Abhinavrathore1703@gmail.com', '315eb115d98fcbad39ffc5edebd669c9', '2019-11-08 00:00:00', 'assets/images/profile-pics/profile-icon-male-avatar-hipster-man-wear-headphones_48369-8728.jpg'),
(7, 'anw123', 'Anwesh', 'Harsh', 'Anwesh@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '2019-11-11 00:00:00', 'assets/images/profile-pics/204316.svg'),
(8, 'ash123', 'Ashutosh', 'Nair', 'Ashutosh@gmail.com', '025f50d3b143941c6ba8f8a1d4b5b7ca', '2019-11-11 00:00:00', 'assets/images/profile-pics/204316.svg'),
(9, 'aniketdawnfox2310', 'Aniket', 'Pandey', 'Pandey.aniket.2310@rediffmail.com', 'd79bd86c9566e3a42be22303a0df146f', '2019-11-11 00:00:00', 'assets/images/profile-pics/204316.svg'),
(10, 'harsh55', 'Harsh', 'Vardhan', 'Harsh@gmail.com', '3fc0a7acf087f549ac2b266baf94b8b1', '2019-11-26 00:00:00', 'assets/images/profile-pics/204316.svg'),
(15, 'aashish17', 'Aashish', 'Suman', 'aashish@gmail.com', '58b4e38f66bcdb546380845d6af27187', '2020-01-12 00:00:00', 'assets/images/profile-pics/204316.svg'),
(16, 'rathore12', 'Komal', 'Rathore', 'Rathorekomal142@gmail.com', 'fc3a395c90e3dfc6af43eff0ab8eb730', '2020-01-14 00:00:00', 'assets/images/profile-pics/204316.svg');

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `validation` AFTER INSERT ON `users` FOR EACH ROW BEGIN
    IF (NEW.username = "SELECT username FROM users WHERE username=NEW.username") THEN 
        SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Warning';
    END IF;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `albums`
--
ALTER TABLE `albums`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `artists`
--
ALTER TABLE `artists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `playlists`
--
ALTER TABLE `playlists`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `playlistSongs`
--
ALTER TABLE `playlistSongs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `RecentlyAdded`
--
ALTER TABLE `RecentlyAdded`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Songs`
--
ALTER TABLE `Songs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `albums`
--
ALTER TABLE `albums`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `artists`
--
ALTER TABLE `artists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `playlists`
--
ALTER TABLE `playlists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `playlistSongs`
--
ALTER TABLE `playlistSongs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `RecentlyAdded`
--
ALTER TABLE `RecentlyAdded`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `Songs`
--
ALTER TABLE `Songs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
