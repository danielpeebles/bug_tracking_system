-- --------------------------------------------------------
-- Host:                         192.168.12.19
-- Server version:               5.5.54-0ubuntu0.12.04.1 - (Ubuntu)
-- Server OS:                    debian-linux-gnu
-- HeidiSQL Version:             9.5.0.5277
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for bugs
CREATE DATABASE IF NOT EXISTS `bugs` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `bugs`;

-- Dumping structure for table bugs.ASSIGNEE
CREATE TABLE IF NOT EXISTS `ASSIGNEE` (
  `index` int(11) NOT NULL,
  `developer` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='who website issues are assigned to in the it dept';

-- Dumping data for table bugs.ASSIGNEE: ~5 rows (approximately)
/*!40000 ALTER TABLE `ASSIGNEE` DISABLE KEYS */;
INSERT INTO `ASSIGNEE` (`index`, `developer`, `email`, `username`) VALUES
	(0, 'Mitch Rings', 'mrings@name_of_my_old_company.com', 'mrings');
INSERT INTO `ASSIGNEE` (`index`, `developer`, `email`, `username`) VALUES
	(1, 'Dan Peebles', 'dpeebles@name_of_my_old_company.com', 'dpeebles');
INSERT INTO `ASSIGNEE` (`index`, `developer`, `email`, `username`) VALUES
	(2, 'Larry Pennington', 'lpennington@name_of_my_old_company.com', 'lpennington');
INSERT INTO `ASSIGNEE` (`index`, `developer`, `email`, `username`) VALUES
	(3, 'Chris Anderson', 'canderson@name_of_my_old_company.com', 'canderson');
INSERT INTO `ASSIGNEE` (`index`, `developer`, `email`, `username`) VALUES
	(4, 'Jason Gabbard', 'jgabbard@name_of_my_old_company.com', 'jgabbard');
/*!40000 ALTER TABLE `ASSIGNEE` ENABLE KEYS */;

-- Dumping structure for table bugs.bug_notes
CREATE TABLE IF NOT EXISTS `bug_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bug_id` int(11) NOT NULL,
  `bug_note` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reporter` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bug_id` (`bug_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;

-- Dumping data for table bugs.bug_notes: ~17 rows (approximately)
/*!40000 ALTER TABLE `bug_notes` DISABLE KEYS */;
INSERT INTO `bug_notes` (`id`, `bug_id`, `bug_note`, `created`, `reporter`) VALUES
	(30, 43, 'a new note', '2017-10-02 15:09:12', NULL);
INSERT INTO `bug_notes` (`id`, `bug_id`, `bug_note`, `created`, `reporter`) VALUES
	(31, 43, 'another note', '2017-10-02 15:09:18', NULL);
INSERT INTO `bug_notes` (`id`, `bug_id`, `bug_note`, `created`, `reporter`) VALUES
	(32, 43, ' Four score and seven years ago our fathers brought forth on this continent, a new nation, conceived in Liberty, and dedicated to the proposition that all men are created equal.\r\n\r\nNow we are engaged in a great civil war, testing whether that nation, or any nation so conceived and so dedicated, can long endure. We are met on a great battle-field of that war. We have come to dedicate a portion of that field, as a final resting place for those who here gave their lives that that nation might live. It is altogether fitting and proper that we should do this.\r\n\r\nBut, in a larger sense, we can not dedicate -- we can not consecrate -- we can not hallow -- this ground. The brave men, living and dead, who struggled here, have consecrated it, far above our poor power to add or detract. The world will little note, nor long remember what we say here, but it can never forget what they did here. It is for us the living, rather, to be dedicated here to the unfinished work which they who fought here have thus far so nobly advanced. It is rather for us to be here dedicated to the great task remaining before us -- that from these honored dead we take increased devotion to that cause for which they gave the last full measure of devotion -- that we here highly resolve that these dead shall not have died in vain -- that this nation, under God, shall have a new birth of freedom -- and that government of the people, by the people, for the people, shall not perish from the earth.', '2017-10-02 15:19:49', NULL);
INSERT INTO `bug_notes` (`id`, `bug_id`, `bug_note`, `created`, `reporter`) VALUES
	(33, 43, 'testing a gain', '2017-10-02 15:33:19', 'dpeebles');
INSERT INTO `bug_notes` (`id`, `bug_id`, `bug_note`, `created`, `reporter`) VALUES
	(34, 43, 'just checking', '2017-10-02 15:33:56', 'dpeebles');
INSERT INTO `bug_notes` (`id`, `bug_id`, `bug_note`, `created`, `reporter`) VALUES
	(35, 44, '\r\n\r\n    I am happy to join with you today in what will go down in history as the greatest demonstration for freedom in the history of our nation.\r\n\r\n    Five score years ago, a great American, in whose symbolic shadow we stand today, signed the Emancipation Proclamation. This momentous decree came as a great beacon light of hope to millions of Negro slaves who had been seared in the flames of withering injustice. It came as a joyous daybreak to end the long night of their captivity.\r\n\r\n    But one hundred years later, the Negro still is not free. One hundred years later, the life of the Negro is still sadly crippled by the manacles of segregation and the chains of discrimination. One hundred years later, the Negro lives on a lonely island of poverty in the midst of a vast ocean of material prosperity. One hundred years later, the Negro is still languishing in the corners of American society and finds himself an exile in his own land. So we have come here today to dramatize a shameful condition.\r\n\r\n    In a sense we have come to our nationâ€™s capital to cash a check. When the architects of our republic wrote the magnificent words of the Constitution and the Declaration of Independence, they were signing a promissory note to which every American was to fall heir. This note was a promise that all men, yes, black men as well as white men, would be guaranteed the unalienable rights of life, liberty, and the pursuit of happiness.\r\n\r\n    It is obvious today that America has defaulted on this promissory note insofar as her citizens of color are concerned. Instead of honoring this sacred obligation, America has given the Negro people a bad check, a check which has come back marked â€œinsufficient funds.â€ But we refuse to believe that the bank of justice is bankrupt. We refuse to believe that there are insufficient funds in the great vaults of opportunity of this nation. So we have come to cash this check â€” a check that will give us upon demand the riches of freedom and the security of justice. We have also come to this hallowed spot to remind America of the fierce urgency of now. This is no time to engage in the luxury of cooling off or to take the tranquilizing drug of gradualism. Now is the time to make real the promises of democracy. Now is the time to rise from the dark and desolate valley of segregation to the sunlit path of racial justice. Now is the time to lift our nation from the quick sands of racial injustice to the solid rock of brotherhood. Now is the time to make justice a reality for all of Godâ€™s children.\r\n\r\n    It would be fatal for the nation to overlook the urgency of the moment. This sweltering summer of the Negroâ€™s legitimate discontent will not pass until there is an invigorating autumn of freedom and equality. Nineteen sixty-three is not an end, but a beginning. Those who hope that the Negro needed to blow off steam and will now be content will have a rude awakening if the nation returns to business as usual. There will be neither rest nor tranquility in America until the Negro is granted his citizenship rights. The whirlwinds of revolt will continue to shake the foundations of our nation until the bright day of justice emerges.\r\n\r\n    But there is something that I must say to my people who stand on the warm threshold which leads into the palace of justice. In the process of gaining our rightful place we must not be guilty of wrongful deeds. Let us not seek to satisfy our thirst for freedom by drinking from the cup of bitterness and hatred.\r\n\r\n    We must forever conduct our struggle on the high plane of dignity and discipline. We must not allow our creative protest to degenerate into physical violence. Again and again we must rise to the majestic heights of meeting physical force with soul force. The marvelous new militancy which has engulfed the Negro community must not lead us to a distrust of all white people, for many of our white brothers, as evidenced by their presence here today, have come to realize that their destiny is tied up with our destiny. They have come to realize that their freedom is inextricably bound to our freedom. We cannot walk alone.\r\n\r\n    As we walk, we must make the pledge that we shall always march ahead. We cannot turn back. There are those who are asking the devotees of civil rights, â€œWhen will you be satisfied?â€ We can never be satisfied as long as the Negro is the victim of the unspeakable horrors of police brutality. We can never be satisfied, as long as our bodies, heavy with the fatigue of travel, cannot gain lodging in the motels of the highways and the hotels of the cities. We cannot be satisfied as long as the Negroâ€™s basic mobility is from a smaller ghetto to a larger one. We can never be satisfied as long as our children are stripped of their selfhood and robbed of their dignity by signs stating â€œFor Whites Onlyâ€. We cannot be satisfied as long as a Negro in Mississippi cannot vote and a Negro in New York believes he has nothing for which to vote. No, no, we are not satisfied, and we will not be satisfied until justice rolls down like waters and righteousness like a mighty stream.\r\n\r\n    I am not unmindful that some of you have come here out of great trials and tribulations. Some of you have come fresh from narrow jail cells. Some of you have come from areas where your quest for freedom left you battered by the storms of persecution and staggered by the winds of police brutality. You have been the veterans of creative suffering. Continue to work with the faith that unearned suffering is redemptive.\r\n\r\n    Go back to Mississippi, go back to Alabama, go back to South Carolina, go back to Georgia, go back to Louisiana, go back to the slums and ghettos of our northern cities, knowing that somehow this situation can and will be changed. Let us not wallow in the valley of despair.\r\n\r\n    I say to you today, my friends, so even though we face the difficulties of today and tomorrow, I still have a dream. It is a dream deeply rooted in the American dream.\r\n\r\n    I have a dream that one day this nation will rise up and live out the true meaning of its creed: â€œWe hold these truths to be self-evident: that all men are created equal.â€\r\n\r\n    I have a dream that one day on the red hills of Georgia the sons of former slaves and the sons of former slave owners will be able to sit down together at the table of brotherhood.\r\n\r\n    I have a dream that one day even the state of Mississippi, a state sweltering with the heat of injustice, sweltering with the heat of oppression, will be transformed into an oasis of freedom and justice.\r\n\r\n    I have a dream that my four little children will one day live in a nation where they will not be judged by the color of their skin but by the content of their character.\r\n\r\n    I have a dream today.\r\n\r\n    I have a dream that one day, down in Alabama, with its vicious racists, with its governor having his lips dripping with the words of interposition and nullification; one day right there in Alabama, little black boys and black girls will be able to join hands with little white boys and white girls as sisters and brothers.\r\n\r\n    I have a dream today.\r\n\r\n    I have a dream that one day every valley shall be exalted, every hill and mountain shall be made low, the rough places will be made plain, and the crooked places will be made straight, and the glory of the Lord shall be revealed, and all flesh shall see it together.\r\n\r\n    This is our hope. This is the faith that I go back to the South with. With this faith we will be able to hew out of the mountain of despair a stone of hope. With this faith we will be able to transform the jangling discords of our nation into a beautiful symphony of brotherhood. With this faith we will be able to work together, to pray together, to struggle together, to go to jail together, to stand up for freedom together, knowing that we will be free one day.\r\n\r\n    This will be the day when all of Godâ€™s children will be able to sing with a new meaning, â€œMy country, â€˜tis of thee, sweet land of liberty, of thee I sing. Land where my fathers died, land of the pilgrimâ€™s pride, from every mountainside, let freedom ring.â€\r\n\r\n    And if America is to be a great nation this must become true. So let freedom ring from the prodigious hilltops of New Hampshire. Let freedom ring from the mighty mountains of New York. Let freedom ring from the heightening Alleghenies of Pennsylvania!\r\n\r\n    Let freedom ring from the snowcapped Rockies of Colorado!\r\n\r\n    Let freedom ring from the curvaceous slopes of California!\r\n\r\n    But not only that; let freedom ring from Stone Mountain of Georgia!\r\n\r\n    Let freedom ring from Lookout Mountain of Tennessee!\r\n\r\n    Let freedom ring from every hill and molehill of Mississippi. From every mountainside, let freedom ring.\r\n\r\n    And when this happens, when we allow freedom to ring, when we let it ring from every village and every hamlet, from every state and every city, we will be able to speed up that day when all of Godâ€™s children, black men and white men, Jews and Gentiles, Protestants and Catholics, will be able to join hands and sing in the words of the old Negro spiritual, â€œFree at last! free at last! thank God Almighty, we are free at last!â€\r\n', '2017-10-02 15:36:51', 'dpeebles');
INSERT INTO `bug_notes` (`id`, `bug_id`, `bug_note`, `created`, `reporter`) VALUES
	(36, 44, '\r\n\r\n    I am happy to join with you today in what will go down in history as the greatest demonstration for freedom in the history of our nation.\r\n\r\n    Five score years ago, a great American, in whose symbolic shadow we stand today, signed the Emancipation Proclamation. This momentous decree came as a great beacon light of hope to millions of Negro slaves who had been seared in the flames of withering injustice. It came as a joyous daybreak to end the long night of their captivity.\r\n\r\n... etc...\r\n\r\n    This is our hope. This is the faith that I go back to the South with. With this faith we will be able to hew out of the mountain of despair a stone of hope. With this faith we will be able to transform the jangling discords of our nation into a beautiful symphony of brotherhood. With this faith we will be able to work together, to pray together, to struggle together, to go to jail together, to stand up for freedom together, knowing that we will be free one day.\r\n\r\n    This will be the day when all of Godâ€™s children will be able to sing with a new meaning, â€œMy country, â€˜tis of thee, sweet land of liberty, of thee I sing. Land where my fathers died, land of the pilgrimâ€™s pride, from every mountainside, let freedom ring.â€\r\n\r\n    And if America is to be a great nation this must become true. So let freedom ring from the prodigious hilltops of New Hampshire. Let freedom ring from the mighty mountains of New York. Let freedom ring from the heightening Alleghenies of Pennsylvania!\r\n\r\n    Let freedom ring from the snowcapped Rockies of Colorado!\r\n\r\n    Let freedom ring from the curvaceous slopes of California!\r\n\r\n    But not only that; let freedom ring from Stone Mountain of Georgia!\r\n\r\n    Let freedom ring from Lookout Mountain of Tennessee!\r\n\r\n    Let freedom ring from every hill and molehill of Mississippi. From every mountainside, let freedom ring.\r\n\r\n    And when this happens, when we allow freedom to ring, when we let it ring from every village and every hamlet, from every state and every city, we will be able to speed up that day when all of Godâ€™s children, black men and white men, Jews and Gentiles, Protestants and Catholics, will be able to join hands and sing in the words of the old Negro spiritual, â€œFree at last! free at last! thank God Almighty, we are free at last!â€\r\n', '2017-10-02 15:37:20', 'dpeebles');
INSERT INTO `bug_notes` (`id`, `bug_id`, `bug_note`, `created`, `reporter`) VALUES
	(37, 45, 'The Lord is my shepherd; I shall not want.\r\n2 He makes me lie down in green pastures.\r\nHe leads me beside still waters.\r\n3 He restores my soul.\r\nHe leads me in paths of righteousness\r\nfor his name\'s sake.\r\n4 Even though I walk through the valley of the shadow of death,\r\nI will fear no evil,\r\nfor you are with me;\r\nyour rod and your staff,\r\nthey comfort me.\r\n5 You prepare a table before me\r\nin the presence of my enemies;\r\nyou anoint my head with oil;\r\nmy cup overflows.\r\n6 Surely goodness and mercy shall follow me\r\nall the days of my life,\r\nand I shall dwell in the house of the Lord\r\nforever.', '2017-10-02 15:53:37', 'dpeebles');
INSERT INTO `bug_notes` (`id`, `bug_id`, `bug_note`, `created`, `reporter`) VALUES
	(38, 45, 'this is a new note request "Cause Chris Anderson Rules!"', '2017-10-02 16:01:56', 'lpennington');
INSERT INTO `bug_notes` (`id`, `bug_id`, `bug_note`, `created`, `reporter`) VALUES
	(39, 46, 'images are on spiceworks here: http://name_of_my_old_company-management:9675/tickets/v2#unassigned_tickets/6397\r\n', '2017-10-04 08:27:59', 'dpeebles');
INSERT INTO `bug_notes` (`id`, `bug_id`, `bug_note`, `created`, `reporter`) VALUES
	(40, 47, 'This info may be out of date. Larry seems to have addressed the issue yesterday afternoon by logging into the back end of the forums software and disabling and re-enabling the FMCA SSO (Single Sign On) plugin.\r\n\r\nThis issue was very strange as it only appeared on specific accounts and spread to other accounts over time. It also began to appear around the same time as issues with a sign-in button appearing at the bottom of the forums and a series of emails suggesting that an unauthorized party was attempting to modify the forums sidebar.', '2017-10-04 10:37:53', 'canderson');
INSERT INTO `bug_notes` (`id`, `bug_id`, `bug_note`, `created`, `reporter`) VALUES
	(41, 48, 'Username: 	JPMBUTTERFLY8@GMAIL.COM\r\nPassword:		coach123\r\n', '2017-10-04 15:50:14', 'dpeebles');
INSERT INTO `bug_notes` (`id`, `bug_id`, `bug_note`, `created`, `reporter`) VALUES
	(42, 51, 'Nothing can be done about this because the magazine is a pdf and pdf\'s are not responsive.', '2017-10-06 09:45:29', 'lpennington');
INSERT INTO `bug_notes` (`id`, `bug_id`, `bug_note`, `created`, `reporter`) VALUES
	(43, 48, 'I have changed the code to display the message differently. And all should be resolved.', '2017-10-06 09:52:47', 'lpennington');
INSERT INTO `bug_notes` (`id`, `bug_id`, `bug_note`, `created`, `reporter`) VALUES
	(44, 49, 'this is a bad idea, not going to do.', '2017-10-06 09:55:50', 'lpennington');
INSERT INTO `bug_notes` (`id`, `bug_id`, `bug_note`, `created`, `reporter`) VALUES
	(45, 46, 'I tried to help this guy and he seemed to have issues as well.  I directed him to call the 1-800 number if he was still having issues.\r\n\r\nI dont think you want me as a member ðŸ˜€. I did everything you said, but it doesn\'t allow me to go anywhere. \r\nPhil\r\nSent from my iPhone. \r\n\r\nOn Oct 4, 2017, at 7:21 AM, Dan Peebles <dpeebles@name_of_my_old_company.com> wrote:\r\nMr.  Munguia,\r\n \r\nHello again,\r\n \r\nMy Senior programmer gave me the run down on this:\r\n \r\nWhat you saw happened because your online account had been created; however, you were not yet a full member.\r\n \r\nIf you log into to your account (right hand corner of FMCA.com says â€œMember log inâ€)\r\n<image002.png>\r\n \r\nWith your user name and password:\r\n \r\nusername:     bestdl1\r\npassword:     Urijah123\r\n \r\nthen start the join process by clicking â€œBecome FMCA Memberâ€\r\nmost of the information you already filled out, so you just have to finish from there.\r\n \r\nThanks once again!\r\n \r\n-Dan\r\n \r\n \r\n \r\nFrom: Dan Peebles \r\nSent: Wednesday, October 4, 2017 9:23 AM\r\nTo: \'Phil Munguia\' <beatdeal@me.com>\r\nCc: Larry Pennington <lpennington@name_of_my_old_company.com>\r\nSubject: RE: membership\r\n', '2017-10-06 15:15:00', 'dpeebles');
INSERT INTO `bug_notes` (`id`, `bug_id`, `bug_note`, `created`, `reporter`) VALUES
	(46, 52, 'The issue seems to be specific to this member.\r\n\r\nF418980\r\n\r\nusername\r\nwmbarryd\r\n\r\nWILLIAM B DAVIS\r\n\r\nI am able to advance past the first registration page on my test account but it does indeed appear that this member is being stopped at the first page by the validation despite having all of the required values entered.', '2017-10-06 15:16:07', 'canderson');
INSERT INTO `bug_notes` (`id`, `bug_id`, `bug_note`, `created`, `reporter`) VALUES
	(47, 52, 'The registration is failing because of the coach length input. I have selected a valid length in the dropdown but the validation still will not accept it. Perhaps the problem is with the data that is being pulled and populated for the coach length?', '2017-10-06 15:44:05', 'canderson');
INSERT INTO `bug_notes` (`id`, `bug_id`, `bug_note`, `created`, `reporter`) VALUES
	(48, 52, 'This member\'s name ID is 684059.', '2017-10-06 15:59:59', 'canderson');
INSERT INTO `bug_notes` (`id`, `bug_id`, `bug_note`, `created`, `reporter`) VALUES
	(49, 52, 'The problem is that the validation is retrieving the value of a hidden Coach Length field instead of the actual coach length field. This is due to the fact that the first page of the registration form has a separate block of inputs that is normally hidden and is switched out visually for the regular coach inputs when the member already has both length and make on their membership profile.', '2017-10-06 16:19:33', 'canderson');
INSERT INTO `bug_notes` (`id`, `bug_id`, `bug_note`, `created`, `reporter`) VALUES
	(50, 53, 'Larry updated the web service.  It appears this was an old call center tool, it is obsolete.\r\n\r\nI\'ll see if we can remove it from the drop down menu when he finishes his current task.\r\n\r\n\r\n\r\n', '2017-10-09 09:38:17', '');
INSERT INTO `bug_notes` (`id`, `bug_id`, `bug_note`, `created`, `reporter`) VALUES
	(51, 54, 'I answered the ticket.  Larry fixed the typo.', '2017-10-09 11:15:47', 'dpeebles');
INSERT INTO `bug_notes` (`id`, `bug_id`, `bug_note`, `created`, `reporter`) VALUES
	(52, 55, 'I tested the form.  It works correctly with chrome and IE.  It works correctly with firefox, however it\'s a little slower than I would have expected.\r\n\r\nMy thinking is the website must have gotten temporarily unresponsive on 10/8\r\n\r\n', '2017-10-09 11:55:44', 'dpeebles');
INSERT INTO `bug_notes` (`id`, `bug_id`, `bug_note`, `created`, `reporter`) VALUES
	(53, 58, 'ah, so I can\'t copy and paste html.\r\n\r\nwill repaste.', '2017-10-13 10:05:00', 'dpeebles');
INSERT INTO `bug_notes` (`id`, `bug_id`, `bug_note`, `created`, `reporter`) VALUES
	(54, 58, 'Can we make these changes to the website before 10/26/17 when the letters will be mailed and the secretaries will be advised where to find Chapter Certification online?\r\n\r\nChapter Updates - Change to Chapter Certification\r\n\r\n* Chapter Officer Form<https://www.name_of_my_old_company.com/index.php?option=com_name_of_my_old_companyforms&view=name_of_my_old_companyforms&layout=chapter_officer_form&gt; (ONLINE)\r\n* Chapter Officer Form<https://www.name_of_my_old_company.com/images/stories/pdf/chapters/Chapter_Officer_Form.pdf&gt; (PDF)\r\n* Chapter Meeting Verification (Online)\r\n* Chapter Meeting Verification (PDF)\r\n* Chapter Roster Updates<https://www.name_of_my_old_company.com/index.php?option=com_name_of_my_old_companyforms&view=name_of_my_old_companyforms&layout=chapter_meeting_verification&layout=chapter_roster_change&gt; (ONLINE)\r\n* Chapter Monthly New And Past Due Report<https://www.name_of_my_old_company.com/index.php?option=com_name_of_my_old_companyforms&view=name_of_my_old_companyforms&layout=chapter_meeting_verification&layout=chapter_monthly_information&gt; (ONLINE)\r\n* Chapter Monthly New And Past Due Report<https://www.name_of_my_old_company.com/images/stories/pdf/chapters/New_And_Past_Due.pdf&gt; (PDF)\r\n\r\nChristy Budai\r\nFMCA Store Associate\r\nChapter Services Coordinator', '2017-10-13 10:05:32', 'dpeebles');
INSERT INTO `bug_notes` (`id`, `bug_id`, `bug_note`, `created`, `reporter`) VALUES
	(55, 58, 'links are on spiceworks.', '2017-10-13 10:06:27', 'dpeebles');
INSERT INTO `bug_notes` (`id`, `bug_id`, `bug_note`, `created`, `reporter`) VALUES
	(56, 61, 'I had this problem before, I had to add a reference for bootstrap because joomla is bringing in an out-dated version of it.  some of our stuff works, like the buttons, but not everything, so you have to reference bootstrap again for things like glyphs.\r\n\r\n', '2017-10-27 08:55:39', 'dpeebles');
INSERT INTO `bug_notes` (`id`, `bug_id`, `bug_note`, `created`, `reporter`) VALUES
	(57, 73, 'We\'re on the case. It looks like the automatic job that runs every morning to rebuild the campgrounds listing is having trouble again.\r\n\r\nThe job drops an awful lot of warning messages but Dan and I took a look at the web service and it doesn\'t appear that anything relating to the web service or data retrieval has changed.\r\n\r\nI believe in the past when we had problems with this it was because the job was running out of resources in some way and never completing the "rebuild" part of "destroy and rebuild the table." Was it after Jason installed the new SAN that these problems stopped?\r\n\r\nI wonder if one of the new hosts or something that was moved on Saturday is imposing a resource restriction that is preventing this script from completing again.\r\n\r\n', '2017-12-05 09:42:48', 'canderson');
INSERT INTO `bug_notes` (`id`, `bug_id`, `bug_note`, `created`, `reporter`) VALUES
	(58, 73, 'Posting one of the errors here for recordkeeping. This was what I got on my first run of the script but not on any successive runs.\r\n\r\nFatal error: Uncaught SoapFault exception: [HTTP] Error Fetching http headers in /home/name_of_my_old_company4196/public_html/crons/cron_update_campsearch.php:266 Stack trace: #0 [internal function]: SoapClient->__doRequest(\'<?xml version="...\', \'https://securen...\', \'http://www.name_of_my_old_company...\', 1, 0) #1 /home/name_of_my_old_company4196/public_html/crons/cron_update_campsearch.php(266): SoapClient->__call(\'GetCommercialBS...\', Array) #2 /home/name_of_my_old_company4196/public_html/crons/cron_update_campsearch.php(266): SoapClient->GetCommercialBSDServices(Array) #3 /home/name_of_my_old_company4196/public_html/crons/cron_update_campsearch.php(175): pullOptions(\'C013372\', \'4\') #4 {main} thrown in /home/name_of_my_old_company4196/public_html/crons/cron_update_campsearch.php on line 266', '2017-12-05 10:02:06', 'canderson');
INSERT INTO `bug_notes` (`id`, `bug_id`, `bug_note`, `created`, `reporter`) VALUES
	(59, 74, 'I noticed you used the file uploader, cool beans.\r\n\r\ndid the following:\r\n\r\non Michelin benefit page:\r\nchanged mentions of Michelin website to appropriate links (one in step 2, one in step 6)\r\nchanged Text only phone numbers to be cell phone number hyperlinks.  I tried to add smart phone glyphicon, but joomla will not retain that content.', '2017-12-14 11:07:32', 'dpeebles');
INSERT INTO `bug_notes` (`id`, `bug_id`, `bug_note`, `created`, `reporter`) VALUES
	(60, 71, 'high security settings set in place by Chris Lay or Todd,  should be solved with move to new website.', '2018-01-22 15:01:54', 'dpeebles');
INSERT INTO `bug_notes` (`id`, `bug_id`, `bug_note`, `created`, `reporter`) VALUES
	(61, 61, 'this is not a problem on the current website, just the old one.', '2018-01-25 08:42:34', 'dpeebles');
INSERT INTO `bug_notes` (`id`, `bug_id`, `bug_note`, `created`, `reporter`) VALUES
	(62, 71, 'This is not a problem with the current website, but the old one.\r\n', '2018-01-25 08:43:10', 'dpeebles');
INSERT INTO `bug_notes` (`id`, `bug_id`, `bug_note`, `created`, `reporter`) VALUES
	(63, 75, 'Currently they are under quick links.  not sure of the timing of this ticket, but I did talk to Alex and Kathy about it.  \r\n\r\nin my opinion, I agree with the need to put them under the tire pages, but we were told not to put it there, but to quicklinks, membership needs to talk to their boss about it.\r\n\r\n', '2018-01-25 08:45:05', 'dpeebles');
/*!40000 ALTER TABLE `bug_notes` ENABLE KEYS */;

-- Dumping structure for table bugs.bug_reports
CREATE TABLE IF NOT EXISTS `bug_reports` (
  `bug_id` int(11) NOT NULL AUTO_INCREMENT,
  `priority` varchar(50) NOT NULL,
  `web_area` varchar(50) NOT NULL,
  `specific_area` varchar(50) NOT NULL,
  `reported_by` varchar(50) NOT NULL,
  `assigned_to` varchar(50) NOT NULL,
  `created_date` date NOT NULL,
  `closed_date` date DEFAULT '0000-00-00',
  `brief_description` varchar(200) NOT NULL,
  `detailed_description` mediumtext NOT NULL,
  `attachment_id` int(11) DEFAULT NULL,
  `file_upload1` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`bug_id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=latin1 COMMENT='the actual bug reports will be saved here';

-- Dumping data for table bugs.bug_reports: ~41 rows (approximately)
/*!40000 ALTER TABLE `bug_reports` DISABLE KEYS */;
INSERT INTO `bug_reports` (`bug_id`, `priority`, `web_area`, `specific_area`, `reported_by`, `assigned_to`, `created_date`, `closed_date`, `brief_description`, `detailed_description`, `attachment_id`, `file_upload1`) VALUES
	(46, 'p1', 'Home', '', 'dpeebles', 'lpennington\r\n', '2017-10-04', '2017-12-04', 'Possible Join issue reported on spice works.', 'Dan P has images from Noah/spiceworks.\r\n\r\nFrom: gwilcox [mailto:gwilcox@ix.netcom.com]\r\nSent: Saturday, September 30, 2017 5:47 PM\r\nTo: Noah Soudrette <nsoudrette@name_of_my_old_company.com>\r\nSubject: Re: Do You Have Additional Questions About FMCA?\r\n\r\nHello Noah,\r\n\r\nFigured out how to fill everything, was going to a different screen that greyed out. Also, after logging in, the FName and Initial are incorrect. After three tries it says there is a problem with the payment information - while I clicked one year the amount shows as 0 so apparently a variable isnâ€™t being carried over to the next screen\r\n\r\nmacOS High Sierra 10.13\r\nSafari Version 11.0 (13604.1.38.1.6)\r\n\r\nI give up, tried multiple times and ways from my iPad as well and canâ€™t get anything to work - still shows $0 transaction.\r\n\r\nWhen you have this fixed, please ease all information, send me a promo code (Iâ€™ve spent over an hour trying to get this to work) and Iâ€™ll try again.\r\n\r\nThank you\r\n\r\n\r\nOn Sep 26, 2017, at 12:15 PM, Noah Soudrette <nsoudrette@name_of_my_old_company.com<mailto:nsoudrette@name_of_my_old_company.com>> wrote:\r\n\r\n<image001.png>\r\nFAMILY MOTOR COACH ASSOCIATION\r\n<image002.jpg><https://www.name_of_my_old_company.com/><image003.jpg><https://www.fmcmagazine.com/><image004.jpg><https://store.name_of_my_old_company.com/><image005.jpg><https://community.name_of_my_old_company.com/&gt;\r\nGreetings Gerald,\r\nWe noticed on 9/24/2017 you started to fill out our online membership enrollment form, but didnâ€™t finish. First, thank you for your interest in FMCA. Second, did you have additional questions that caused you to pause? If so, weâ€™re happy to answer any lingering questions you may have about the numerous benefits of FMCA membership.\r\nPlease feel free to give us a call anytime 8:00am â€“ 5:00pm, Monday through Friday at 800-543-3622 or respond directly to this email. In addition, of course, you can always use the following login credentials to complete the enrollment process.\r\nUsername: gwilcox\r\nPassword: sacred12\r\nSimply log into your account and select the â€œMy Membershipâ€ link in the top right hand side of the page. On your â€œMy Membershipâ€ page, youâ€™ll see a button marked â€œBecome FMCA Member.â€ This will help you complete the membership enrollment.\r\nP..S. â€“ If you encountered some kind of error while attempting to enroll, please respond back with any details so that we can troubleshoot and improve the enrollment process.\r\nSincerely,\r\n<image006.jpg>\r\nAaron White\r\nMembership Services Manager\r\nFamily Motor Coach Association\r\n8291 Clough Pike\r\nCincinnati, OH 45244\r\n800-543-3622 or 513-388-5221\r\nawhite@name_of_my_old_company.com<mailto:awhite@name_of_my_old_company.com>', 0, NULL);
INSERT INTO `bug_reports` (`bug_id`, `priority`, `web_area`, `specific_area`, `reported_by`, `assigned_to`, `created_date`, `closed_date`, `brief_description`, `detailed_description`, `attachment_id`, `file_upload1`) VALUES
	(47, 'p1', 'Home', '', 'dpeebles', 'canderson', '2017-10-04', '2017-10-04', 'Several spiceworks tickets open on forum redirect', 'Apparently if you aren\'t already signed into the forums, it redirects you back to the FMCA home page when you try to log in.\r\n\r\nThere are about a dozen spiceworks tickets open on this already.\r\n\r\n', 0, NULL);
INSERT INTO `bug_reports` (`bug_id`, `priority`, `web_area`, `specific_area`, `reported_by`, `assigned_to`, `created_date`, `closed_date`, `brief_description`, `detailed_description`, `attachment_id`, `file_upload1`) VALUES
	(48, 'p0', 'Magazine', '', 'nsoudrette', 'lpennington', '2017-10-04', '2017-10-06', 'Error on login at fmcmagazine.com', 'Name ID 842578, Username:JPMBUTTERFLY8@GMAIL.COM, Subscriber, when trying to log into fmcmagazine.com, receives the following error:\r\n\r\n"This page is limited to members only. If you feel that this is in error, please contact webmaster@name_of_my_old_company.com"\r\n\r\nAlso, anytime you try to revisit the site thereafter, all you see is the error. ', 0, NULL);
INSERT INTO `bug_reports` (`bug_id`, `priority`, `web_area`, `specific_area`, `reported_by`, `assigned_to`, `created_date`, `closed_date`, `brief_description`, `detailed_description`, `attachment_id`, `file_upload1`) VALUES
	(49, 'p4', 'Other', '', 'dpeebles', 'dpeebles', '2017-10-05', '2017-10-06', 'From spiceworks: we have some very old online accounts we could consider deleting them', 'From spiceworks:\r\n\r\nSubmitted by Alex Murphy on 2017-09-28 at 04:55 PM\r\n\r\nHello,\r\n\r\nMitch helped me find all the members who haven\'t logged online in x. amount of time. Is there a way to use the list to do a mass deletion of these online accounts? Please let me know!\r\n\r\nThank you,\r\nAlex Murphy\r\nCall Center Supervisor\r\n\r\n\r\n.....\r\n\r\nNotes, we would need to take some care before unnecessarily deleting online accounts.\r\non the contrary, we may have some very old online accounts owned by people who are no longer members, we should eventually have some clean up mechanism to handle this.\r\n\r\n', 0, NULL);
INSERT INTO `bug_reports` (`bug_id`, `priority`, `web_area`, `specific_area`, `reported_by`, `assigned_to`, `created_date`, `closed_date`, `brief_description`, `detailed_description`, `attachment_id`, `file_upload1`) VALUES
	(50, 'p4', 'Other', '', 'dpeebles', 'dpeebles', '2017-10-05', '2017-10-31', 'TO DO:// add attachment capability to bug_reports', 'add attachment capability to bug_reports, probably using "blob" type in SQL and file-upload class in PHP.\r\n\r\nassign to Dan P', 0, NULL);
INSERT INTO `bug_reports` (`bug_id`, `priority`, `web_area`, `specific_area`, `reported_by`, `assigned_to`, `created_date`, `closed_date`, `brief_description`, `detailed_description`, `attachment_id`, `file_upload1`) VALUES
	(51, 'p4', 'Magazine', '', 'amurphy', 'lpennington', '2017-10-06', '2017-10-06', 'Digital formatting for mobile devices', 'Hello,\r\n\r\nI just got an email from a member who is complaining that the digital issue of the magazine is impossible to read on his phone. I thought I would just pass it along to you.\r\n\r\nEverything important is digital and goes thru the internet. \r\nMagazines are difficult to read on the phone because they are in paper format, so till you get the magazine reformatted into a readable digital format that is easily read on a smart phone, that info should come via a printed magazine. Reading the magazine on line with a smart phone in the current wide format is difficult to impossible.\r\nI donâ€™t know how you handle this with others, but Iâ€™m sure there is a procedure.\r\nThanks\r\nChris Wrzenski â€“ On the road in a Wal-Mart parking lot in  Southern IL, and headed Southwest. F223560\r\n', 0, NULL);
INSERT INTO `bug_reports` (`bug_id`, `priority`, `web_area`, `specific_area`, `reported_by`, `assigned_to`, `created_date`, `closed_date`, `brief_description`, `detailed_description`, `attachment_id`, `file_upload1`) VALUES
	(52, 'p1', 'Conventions', '', 'dpeebles', 'lpennignton', '2017-10-06', '2017-10-11', ' [Conventions] Online Registration for Perry not working', '\r\n\r\nFrom: webmaster@name_of_my_old_company.com [mailto:webmaster@name_of_my_old_company.com] \r\nSent: Friday, October 6, 2017 2:32 PM\r\nTo: convention@name_of_my_old_company.com\r\nSubject: [Conventions] Online Registration for Perry not working\r\n\r\nSender details:\r\n________________________________________\r\nName: William Davis\r\nE-mail: wmbarryd@hotmail.com\r\nIP address: 173.236.90.59\r\nBrowser: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36\r\n________________________________________\r\n\r\nI am unable to register for Perry. The first page gives me the message "Be Sure All Required Fields are Filled." They are but I can\'t proceed to next page. I\'ve tried using 2 different browsers and 2 different devices. What is the issue? \r\n', 0, NULL);
INSERT INTO `bug_reports` (`bug_id`, `priority`, `web_area`, `specific_area`, `reported_by`, `assigned_to`, `created_date`, `closed_date`, `brief_description`, `detailed_description`, `attachment_id`, `file_upload1`) VALUES
	(53, 'p3', 'Other', '', 'dpeebles', 'dpeebles', '2017-10-09', '2017-10-13', 'intranet: IT/Member follow up giving errors', 'If you go to: http://intranet.name_of_my_old_company.com/\r\nthen click on IT>\r\nthen click on "Member Follow up"\r\nit gives a SOAP error (below)\r\n\r\nhttp://intranet.name_of_my_old_company.com/index.php?option=com_name_of_my_old_companymemberfollowup&view=display&Itemid=142\r\n\r\n500\r\nSOAP-ERROR: Parsing WSDL: Couldn\'t load from \'https://secure.name_of_my_old_company.com/V2/FMCAWebService/FMCAWebService_secure.asmx?wsdl\' : failed to load external entity "https://secure.name_of_my_old_company.com/V2/FMCAWebService/FMCAWebService_secure.asmx?wsdl"\r\n\r\nYou may not be able to visit this page because of:\r\n\r\n    an out-of-date bookmark/favourite\r\n    a search engine that has an out-of-date listing for this site\r\n    a mistyped address\r\n    you have no access to this page\r\n    The requested resource was not found.\r\n    An error has occurred while processing your request.\r\n', 0, NULL);
INSERT INTO `bug_reports` (`bug_id`, `priority`, `web_area`, `specific_area`, `reported_by`, `assigned_to`, `created_date`, `closed_date`, `brief_description`, `detailed_description`, `attachment_id`, `file_upload1`) VALUES
	(54, 'p3', 'Chapters', '', 'dpeebles', 'lpennington', '2017-10-09', '2017-10-09', 'possibly a typo in chapter officer form', 'I might not understand this, but I believe that there is a typo in the explanation of "custom titles" for chapter officers on this form:\r\ncannot vs can is the typo\r\n\r\nhttps://www.name_of_my_old_company.com/index.php?option=com_name_of_my_old_companyforms&view=name_of_my_old_companyforms&layout=chapter_officer_form\r\n\r\n\r\nIf we are telling people they can not clarify a custom title, then it wouldn\'t make since for us to provide that as a field.\r\nbut if we are telling people they CAN then, that would make since.\r\n\r\n\r\n\r\n', 0, NULL);
INSERT INTO `bug_reports` (`bug_id`, `priority`, `web_area`, `specific_area`, `reported_by`, `assigned_to`, `created_date`, `closed_date`, `brief_description`, `detailed_description`, `attachment_id`, `file_upload1`) VALUES
	(55, 'p1', 'Join', '', 'dpeebles', 'lpennington', '2017-10-09', '2017-10-13', 'Noah reports customer tried to join, selected country:CAN, but province of Ontario wasn\'t found, just US states', 'Noah Soudrette\r\nMembership Assistant\r\nFamily Motor Coach Association\r\n8291 Clough Pike\r\nCincinnati, OH 45244\r\n800-543-3622 or 513-388-5221\r\nnsoudrette@name_of_my_old_company.com<mailto:nsoudrette@name_of_my_old_company.com>\r\n\r\nFrom: Colin Barfoot [mailto:colinbarfoot@gmail.com]\r\nSent: Monday, October 9, 2017 10:20 AM\r\nTo: Noah Soudrette <nsoudrette@name_of_my_old_company.com>\r\nSubject: Re: Family Motor Coach Association\r\n\r\nI tried to sign up but it would not let me enter the province of Ontario...the form insisted on a state even though the country selected was Canada.\r\nRegards Colin Barfoot', 0, NULL);
INSERT INTO `bug_reports` (`bug_id`, `priority`, `web_area`, `specific_area`, `reported_by`, `assigned_to`, `created_date`, `closed_date`, `brief_description`, `detailed_description`, `attachment_id`, `file_upload1`) VALUES
	(56, 'p3', 'Conventions', '', 'arohrich', 'lpennignton', '2017-10-10', '2017-10-11', 'User Issue Using Online Registration Form', 'Just an FYI... call from a member.  Couldn\'t register online.  She said she had all the fields filled out on the page but it wouldn\'t go to the next page.  It kept telling her to fill in all the pertinent fields.  She was very adamant that all the fields were correctly filled out.  \r\n\r\nMember # F412713 - Michael and Tena Keith', 0, NULL);
INSERT INTO `bug_reports` (`bug_id`, `priority`, `web_area`, `specific_area`, `reported_by`, `assigned_to`, `created_date`, `closed_date`, `brief_description`, `detailed_description`, `attachment_id`, `file_upload1`) VALUES
	(57, 'p1', 'Magazine', '', 'dpeebles', 'lpennington', '2017-10-12', '2017-10-13', 'new Member can not log in to the magazine', 'credentials:\r\n\r\nUsername: 	blandry29\r\nPassword:		Landnd29\r\nEmail: 	BLANDRY29@COMCAST.NET\r\nIs Approved: 	Yes\r\nIs Locked Out: 	No\r\nAccount Created: 	10/05/2017 14:56:52\r\nLast Login Date: 	10/05/2017 15:07:03\r\nLast Activity Date: 	10/06/2017 15:02:23\r\nLast Password Change Date: 	10/06/2017 15:02:23\r\n\r\n\r\n\r\n Log in errors\r\n\r\nâ€“ Submitted by blandry29@comcast.net on 2017-10-06 at 02:15 PM\r\n\r\nMy member number is F475117. My login is blandry29, and my profile says it has been linked to my membership. I can log onto the main site without any issues. When I try to open the magazine, it tells me I am not logged in. When I log in on the magazine site using the same username and password, it tells me my password is incorrect. When I try to reset my password, It says an e-mail has been sent, but displays the following error message: Mailer Error: SMTP connect() failed, and I do not receive the password reset e-mail.\r\n\r\nCan you help?\r\n\r\nThanks,\r\n\r\nBob Landry=\r\n', 0, NULL);
INSERT INTO `bug_reports` (`bug_id`, `priority`, `web_area`, `specific_area`, `reported_by`, `assigned_to`, `created_date`, `closed_date`, `brief_description`, `detailed_description`, `attachment_id`, `file_upload1`) VALUES
	(58, 'p1', 'Chapters', '', 'dpeebles', 'lpennington', '2017-10-13', '2017-10-13', 'deadline: 10/26, need updates to chapters links -Christy Budai', 'Can we make these changes to the website before 10/26/17 when the letters will be mailed and the secretaries will be advised where to find Chapter Certification online?\r\n\r\nChapter Updates - Change to Chapter Certification\r\n\r\n* Chapter Officer Form<https://www.name_of_my_old_company.com/index.php?option=com_name_of_my_old_companyforms&view=name_of_my_old_companyforms&layout=chapter_officer_form&gt; (ONLINE)\r\n* Chapter Officer Form<https://www.name_of_my_old_company.com/images/stories/pdf/chapters/Chapter_Officer_Form.pdf&gt; (PDF)\r\n* Chapter Meeting Verification (Online)\r\n* Chapter Meeting Verification (PDF)\r\n* Chapter Roster Updates<https://www.name_of_my_old_company.com/index.php?option=com_name_of_my_old_companyforms&view=name_of_my_old_companyforms&layout=chapter_meeting_verification&layout=chapter_roster_change&gt; (ONLINE)\r\n* Chapter Monthly New And Past Due Report<https://www.name_of_my_old_company.com/index.php?option=com_name_of_my_old_companyforms&view=name_of_my_old_companyforms&layout=chapter_meeting_verification&layout=chapter_monthly_information&gt; (ONLINE)\r\n* Chapter Monthly New And Past Due Report<https://www.name_of_my_old_company.com/images/stories/pdf/chapters/New_And_Past_Due.pdf&gt; (PDF)\r\n\r\nChristy Budai\r\nFMCA Store Associate\r\nChapter Services Coordinator\r\ncbudai@name_of_my_old_company.com ', 0, NULL);
INSERT INTO `bug_reports` (`bug_id`, `priority`, `web_area`, `specific_area`, `reported_by`, `assigned_to`, `created_date`, `closed_date`, `brief_description`, `detailed_description`, `attachment_id`, `file_upload1`) VALUES
	(59, 'p1', 'Magazine', '', 'dpeebles', 'lpennington', '2017-10-17', '2017-12-04', 'Free sample of digital magazine not working', 'Pamela reported that someone was complaining that they couldn\'t see the free sample of the digital magazine without having a log in.  when I loaded it up to investigate, I couldn\'t even log in to the digital sample of the magazine even though I was logged in.  May be trouble with the digital sample, unless it is just a temporary issue.\r\n\r\nhttps://www.fmcmagazine.com/digital-edition-39178/sample-digital-issue.html', 0, NULL);
INSERT INTO `bug_reports` (`bug_id`, `priority`, `web_area`, `specific_area`, `reported_by`, `assigned_to`, `created_date`, `closed_date`, `brief_description`, `detailed_description`, `attachment_id`, `file_upload1`) VALUES
	(60, 'p3', 'Conventions', '', 'arohrich', 'lpennignton', '2017-10-18', '2018-01-22', 'Online registration issue', 'Just letting you know...   Larry Roberts F455444 tried to register online for the Western Area Rally (WEA18).  Said he got all the way through it, put in his credit card info and then got an error message that it didn\'t complete.  \r\nThanks!', 0, NULL);
INSERT INTO `bug_reports` (`bug_id`, `priority`, `web_area`, `specific_area`, `reported_by`, `assigned_to`, `created_date`, `closed_date`, `brief_description`, `detailed_description`, `attachment_id`, `file_upload1`) VALUES
	(61, 'p3', 'Motor Homing / Education', '', 'dpeebles', 'canderson', '2017-10-27', '2018-01-25', 'glyphicon not rendering on \'get directions\' button for campground search', 'I think this is what Jen was talking about.  the glyphicon isn\'t rendoring for the \'get directions\' button for the campground search.\r\nI had this problem with some of my stuff before and it was easy to fix.\r\n\r\nhttps://www.name_of_my_old_company.com/motorhome/name_of_my_old_company-campgrounds.html\r\n\r\n', NULL, NULL);
INSERT INTO `bug_reports` (`bug_id`, `priority`, `web_area`, `specific_area`, `reported_by`, `assigned_to`, `created_date`, `closed_date`, `brief_description`, `detailed_description`, `attachment_id`, `file_upload1`) VALUES
	(67, 'p4', 'Home', '', 'dpeebles', 'lpennington\r\n', '2017-10-30', '2017-12-04', 'test', 'test', NULL, 'AlloQuebec.jpg');
INSERT INTO `bug_reports` (`bug_id`, `priority`, `web_area`, `specific_area`, `reported_by`, `assigned_to`, `created_date`, `closed_date`, `brief_description`, `detailed_description`, `attachment_id`, `file_upload1`) VALUES
	(68, 'p4', 'Home', '', 'dpeebles', 'lpennington\r\n', '2017-10-31', '2017-12-04', 'test file upload function', 'test file upload funciton', NULL, 'AlloQuebec_name_of_my_old_company.jpg');
INSERT INTO `bug_reports` (`bug_id`, `priority`, `web_area`, `specific_area`, `reported_by`, `assigned_to`, `created_date`, `closed_date`, `brief_description`, `detailed_description`, `attachment_id`, `file_upload1`) VALUES
	(69, 'p3', 'Membership', '', 'amurphy', 'lpennington', '2017-11-13', '0000-00-00', 'Payment Screen Being Blocked by Kapersky', 'Hello,\r\n\r\nI am sure that you are well aware that members who have Kapersky cannot renew online. It says that we are a virus and our members will not input Credit Card information online when this pops up. \r\n\r\nI have had three people since Friday say that their Kapersky is stopping them from paying online. ', NULL, '');
INSERT INTO `bug_reports` (`bug_id`, `priority`, `web_area`, `specific_area`, `reported_by`, `assigned_to`, `created_date`, `closed_date`, `brief_description`, `detailed_description`, `attachment_id`, `file_upload1`) VALUES
	(70, 'p2', 'Join', '', 'NSoudrette', 'lpennington', '2017-11-22', '2018-01-22', 'Coach Info Questions do Not Match Revised Requirements', 'When a new member pays, they are currently asked a set of questions about their motorhome. As they stand, they need to be changed to be brought into line with the revised demo information. Until 5th launch, they should ask:\r\n\r\nMake:\r\nModel:\r\nLength:\r\nYear:', NULL, '');
INSERT INTO `bug_reports` (`bug_id`, `priority`, `web_area`, `specific_area`, `reported_by`, `assigned_to`, `created_date`, `closed_date`, `brief_description`, `detailed_description`, `attachment_id`, `file_upload1`) VALUES
	(71, 'p3', 'Home', '', 'amurphy', 'lpennington\r\n', '2017-11-28', '2018-01-25', 'Login Password Save on Firefox browser', 'Hello,\r\n\r\nI had a member bring this up, and when I tested it I got the same result. When I log into www.name_of_my_old_company.com using Firefox as my browser, it will ask if I want to save my password. If I click on \'SHOW PASSWORD\' it does not bring up the password being used, but instead shows the password as FMCA - this does not work if you want to log on to someone\'s account. What I would like to know is does Firefox save FMCA as the password, and then because of this does it use that to try to log on to name_of_my_old_company and then fail? \r\n\r\nOr does it say that it\'s saving the password as FMCA but then use the real password to log in? If so that is very confusing. \r\n\r\nI wanted to let you know about this, and see if this is something that can be fixed. If you have questions about this please let me know.\r\n\r\nThank you,\r\n\r\nAlex ', NULL, '');
INSERT INTO `bug_reports` (`bug_id`, `priority`, `web_area`, `specific_area`, `reported_by`, `assigned_to`, `created_date`, `closed_date`, `brief_description`, `detailed_description`, `attachment_id`, `file_upload1`) VALUES
	(72, 'p3', 'Forums/Blogs\r\n', '', 'dpeebles', 'canderson', '2017-12-04', '2017-12-04', 'no one\'s signatures are displayed', 'minor issue, no one\'s signatures are displayed on the forum posts, saw some folks complained on forum, I\'m not too worried about it, but I couldn\'t get mine to show simply by updating it, I\'m not sure I have access to these type of settings.\r\n\r\n\r\n\r\n', NULL, '');
INSERT INTO `bug_reports` (`bug_id`, `priority`, `web_area`, `specific_area`, `reported_by`, `assigned_to`, `created_date`, `closed_date`, `brief_description`, `detailed_description`, `attachment_id`, `file_upload1`) VALUES
	(73, 'p1', 'Motor Homing / Education', '', 'amurphy', 'canderson', '2017-12-05', '2018-01-22', 'Campground Search Not Allowing Country Selection', 'Hello,\r\n\r\nI am trying to look up Campgrounds using the FMCA campground & resort search tool. It is not allowing me to pick a country, which means I can search anything. ', NULL, '');
INSERT INTO `bug_reports` (`bug_id`, `priority`, `web_area`, `specific_area`, `reported_by`, `assigned_to`, `created_date`, `closed_date`, `brief_description`, `detailed_description`, `attachment_id`, `file_upload1`) VALUES
	(74, 'p3', 'Benefits', '', 'NSoudrette', 'lpennington', '2017-12-14', '2017-12-14', 'Need Link Added on Michelin Benfit Page', 'On the step by step Michelin processes (step 2) on benefits, the web address of the dealer locator is typed out. I had two calls yesterday from people who don\'t know how to copy and paste. Could we simply change that into a link to: http://www.michelinrvtires.com/dealer-locator/#/\r\n\r\nThanks,', NULL, 'Capture.JPG');
INSERT INTO `bug_reports` (`bug_id`, `priority`, `web_area`, `specific_area`, `reported_by`, `assigned_to`, `created_date`, `closed_date`, `brief_description`, `detailed_description`, `attachment_id`, `file_upload1`) VALUES
	(75, 'p1', 'Benefits', '', 'amurphy', 'lpennington', '2018-01-23', '2018-01-25', 'Michelin instructions missing', 'The instructions for how to do the Michelin program are not there any more. Itâ€™s just the pricing tool. Please put the instructions somewhere on the site for members who are logged in can see\r\n', NULL, '');
INSERT INTO `bug_reports` (`bug_id`, `priority`, `web_area`, `specific_area`, `reported_by`, `assigned_to`, `created_date`, `closed_date`, `brief_description`, `detailed_description`, `attachment_id`, `file_upload1`) VALUES
	(76, 'p2', 'Membership', '', 'rjochem', 'lpennington', '2018-01-24', '0000-00-00', 'Redirect Member directory', 'Please redirect the old member directory page: https://www.name_of_my_old_company.com/component/name_of_my_old_companymemberdirectory/?view=display\r\n\r\nto this page: https://site.name_of_my_old_company.com/member-help-search\r\n\r\nShanks!', NULL, '');
INSERT INTO `bug_reports` (`bug_id`, `priority`, `web_area`, `specific_area`, `reported_by`, `assigned_to`, `created_date`, `closed_date`, `brief_description`, `detailed_description`, `attachment_id`, `file_upload1`) VALUES
	(77, 'p3', 'Join', '', 'dpeebles', 'lpennington', '2018-01-25', '0000-00-00', 'we will eventually have to change logo on this promo page, this is the top find on google.', 'http://join.name_of_my_old_company.com/save10now/', NULL, '');
INSERT INTO `bug_reports` (`bug_id`, `priority`, `web_area`, `specific_area`, `reported_by`, `assigned_to`, `created_date`, `closed_date`, `brief_description`, `detailed_description`, `attachment_id`, `file_upload1`) VALUES
	(78, 'p1', 'My Membership Profile', '', 'rjochem', 'lpennington', '2018-01-26', '0000-00-00', 'Cannot save email address when change', 'Two reports of people\'s email address changes not saving in their Profiles. ', NULL, '');
INSERT INTO `bug_reports` (`bug_id`, `priority`, `web_area`, `specific_area`, `reported_by`, `assigned_to`, `created_date`, `closed_date`, `brief_description`, `detailed_description`, `attachment_id`, `file_upload1`) VALUES
	(79, 'p1', 'Other', '', 'christyb', 'dpeebles', '2018-01-31', '0000-00-00', 'Store Checkout Issue', 'If the member logins to their account during an order, after they\'re logged in it loops them back to the home page.  There have been many issue with members ordering multiples of the same items unintentionally.  Not sure if this is part of the issue.', NULL, '');
INSERT INTO `bug_reports` (`bug_id`, `priority`, `web_area`, `specific_area`, `reported_by`, `assigned_to`, `created_date`, `closed_date`, `brief_description`, `detailed_description`, `attachment_id`, `file_upload1`) VALUES
	(80, 'p3', 'Conventions', '', 'pam', 'lpennignton', '2018-02-09', '0000-00-00', 'Suggestion: add hyperlink to mention of Media Room in Events, About Events Media section', 'Suggestion and a minor minor issue: add hyperlink to mention of Media Room in Events, About Events Media section -- https://site.name_of_my_old_company.com/name_of_my_old_company-about-events \r\nWhile you\'re there, my title technically is Director of Communications, Publishing. ', NULL, '');
INSERT INTO `bug_reports` (`bug_id`, `priority`, `web_area`, `specific_area`, `reported_by`, `assigned_to`, `created_date`, `closed_date`, `brief_description`, `detailed_description`, `attachment_id`, `file_upload1`) VALUES
	(81, 'p1', 'My Membership Profile', '', 'dpeebles', 'lpennington', '2018-02-19', '0000-00-00', 'someone messed with member profile page/RV-Type', 'I was trying to investigate an issue from spiceworks, I didn\'t see the issue the member was talking about, but I did see this on member-profile page:\r\nsteps to reproduce:\r\n1. log in to name_of_my_old_company.com\r\n2. go to your profile page\r\n3. switch between rv-type motorhome and towable (this used to have fifth-wheel and travel trailers)\r\n4. try to save as towable.\r\n5. observe...\r\nSomeone messed with the RV-Type.  instead of giving options fifth-wheel and trailer along with motorhome, it just says motorhome or towable.  so the fifth wheel codes and trailer codes never load when it is switched to towable (which we never planned for) and it just gives you a list of coach-codes.   Since "Towable" is not a valid RV-type in elan it won\'t save as the rv-type.\r\n\r\nI guess elan was messing with it, but we\'ll have to fix it more than likely.\r\n\r\n', NULL, '');
/*!40000 ALTER TABLE `bug_reports` ENABLE KEYS */;

-- Dumping structure for table bugs.Users
CREATE TABLE IF NOT EXISTS `Users` (
  `user_id` int(11) NOT NULL,
  `user_handle` varchar(50) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user name` varchar(50) NOT NULL,
  `user phone` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='People who submit bug reports, are the luckiest people in the world.';

-- Dumping data for table bugs.Users: ~45 rows (approximately)
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` (`user_id`, `user_handle`, `user_email`, `user name`, `user phone`) VALUES
	(1, 'awhite', 'awhilte@name_of_my_old_company.com', 'Aaron White', '310');
INSERT INTO `Users` (`user_id`, `user_handle`, `user_email`, `user name`, `user phone`) VALUES
	(2, 'amurphy', 'amurphy@name_of_my_old_company.com', '', '');
INSERT INTO `Users` (`user_id`, `user_handle`, `user_email`, `user name`, `user phone`) VALUES
	(3, 'ajermer', 'ajermer@name_of_my_old_company.com', '', '');
INSERT INTO `Users` (`user_id`, `user_handle`, `user_email`, `user name`, `user phone`) VALUES
	(4, 'arohrich', 'arohrich@name_of_my_old_company.com', '', '');
INSERT INTO `Users` (`user_id`, `user_handle`, `user_email`, `user name`, `user phone`) VALUES
	(5, 'aluney', 'aluney@name_of_my_old_company.com', '', '');
INSERT INTO `Users` (`user_id`, `user_handle`, `user_email`, `user name`, `user phone`) VALUES
	(6, 'bfeiler', 'bfeiler@name_of_my_old_company.com', '', '');
INSERT INTO `Users` (`user_id`, `user_handle`, `user_email`, `user name`, `user phone`) VALUES
	(7, 'bettyjo', 'bettyjo@name_of_my_old_company.com', '', '');
INSERT INTO `Users` (`user_id`, `user_handle`, `user_email`, `user name`, `user phone`) VALUES
	(8, 'bthornton', 'bthornton@name_of_my_old_company.com', '', '');
INSERT INTO `Users` (`user_id`, `user_handle`, `user_email`, `user name`, `user phone`) VALUES
	(9, 'bbacik', 'bbacik@name_of_my_old_company.com', '', '');
INSERT INTO `Users` (`user_id`, `user_handle`, `user_email`, `user name`, `user phone`) VALUES
	(10, 'blynn', 'blynn@name_of_my_old_company.com', '', '');
INSERT INTO `Users` (`user_id`, `user_handle`, `user_email`, `user name`, `user phone`) VALUES
	(11, 'canderson', 'canderson@name_of_my_old_company.com', '', '');
INSERT INTO `Users` (`user_id`, `user_handle`, `user_email`, `user name`, `user phone`) VALUES
	(12, 'csmith', 'csmith@name_of_my_old_company.com', '', '');
INSERT INTO `Users` (`user_id`, `user_handle`, `user_email`, `user name`, `user phone`) VALUES
	(13, 'cbudai', 'cbudai@name_of_my_old_company.com', '', '');
INSERT INTO `Users` (`user_id`, `user_handle`, `user_email`, `user name`, `user phone`) VALUES
	(14, 'dball', 'dball@name_of_my_old_company.com', '', '');
INSERT INTO `Users` (`user_id`, `user_handle`, `user_email`, `user name`, `user phone`) VALUES
	(15, 'dpeebles', 'dpeebles@name_of_my_old_company.com', '', '');
INSERT INTO `Users` (`user_id`, `user_handle`, `user_email`, `user name`, `user phone`) VALUES
	(16, 'dwulfeck', 'dwulfeck@name_of_my_old_company.com', '', '');
INSERT INTO `Users` (`user_id`, `user_handle`, `user_email`, `user name`, `user phone`) VALUES
	(17, 'dwood', 'dwood@name_of_my_old_company.com', '', '');
INSERT INTO `Users` (`user_id`, `user_handle`, `user_email`, `user name`, `user phone`) VALUES
	(18, 'dmitts', 'dmitts@name_of_my_old_company.com', '', '');
INSERT INTO `Users` (`user_id`, `user_handle`, `user_email`, `user name`, `user phone`) VALUES
	(19, 'duhlenbrock', 'duhlenbock@name_of_my_old_company.com', '', '');
INSERT INTO `Users` (`user_id`, `user_handle`, `user_email`, `user name`, `user phone`) VALUES
	(20, 'gkasselmann', 'gkasselmann@name_of_my_old_company.com', '', '');
INSERT INTO `Users` (`user_id`, `user_handle`, `user_email`, `user name`, `user phone`) VALUES
	(21, 'jgabbard', 'jgabbard@name_of_my_old_company.com', '', '');
INSERT INTO `Users` (`user_id`, `user_handle`, `user_email`, `user name`, `user phone`) VALUES
	(22, 'jeckles', 'jeckles@name_of_my_old_company.com', '', '');
INSERT INTO `Users` (`user_id`, `user_handle`, `user_email`, `user name`, `user phone`) VALUES
	(23, 'jfriedhoff', 'jfriedhoff@name_of_my_old_company.com', '', '');
INSERT INTO `Users` (`user_id`, `user_handle`, `user_email`, `user name`, `user phone`) VALUES
	(24, 'jstaggenborg', 'jstaggenborg@name_of_my_old_company.com', '', '');
INSERT INTO `Users` (`user_id`, `user_handle`, `user_email`, `user name`, `user phone`) VALUES
	(25, 'jjohnston', 'jjohnson@name_of_my_old_company.com', '', '');
INSERT INTO `Users` (`user_id`, `user_handle`, `user_email`, `user name`, `user phone`) VALUES
	(26, 'jrenda', 'jrenda@name_of_my_old_company.com', '', '');
INSERT INTO `Users` (`user_id`, `user_handle`, `user_email`, `user name`, `user phone`) VALUES
	(27, 'kowen', 'kowen@name_of_my_old_company.com', '', '');
INSERT INTO `Users` (`user_id`, `user_handle`, `user_email`, `user name`, `user phone`) VALUES
	(28, 'kanderson', 'kanderson@name_of_my_old_company.com', '', '');
INSERT INTO `Users` (`user_id`, `user_handle`, `user_email`, `user name`, `user phone`) VALUES
	(29, 'kgebhart', 'kgebhart@name_of_my_old_company.com', '', '');
INSERT INTO `Users` (`user_id`, `user_handle`, `user_email`, `user name`, `user phone`) VALUES
	(30, 'kwhite', 'kwhite@name_of_my_old_company.com', '', '');
INSERT INTO `Users` (`user_id`, `user_handle`, `user_email`, `user name`, `user phone`) VALUES
	(31, 'krose', 'krose@name_of_my_old_company.com', '', '');
INSERT INTO `Users` (`user_id`, `user_handle`, `user_email`, `user name`, `user phone`) VALUES
	(32, 'lpennington', 'lpennington@name_of_my_old_company.com', '', '');
INSERT INTO `Users` (`user_id`, `user_handle`, `user_email`, `user name`, `user phone`) VALUES
	(33, 'lfrost', 'lfrost@name_of_my_old_company.com', '', '');
INSERT INTO `Users` (`user_id`, `user_handle`, `user_email`, `user name`, `user phone`) VALUES
	(34, 'mburwinkel', 'mburwinkel@name_of_my_old_company.com', '', '');
INSERT INTO `Users` (`user_id`, `user_handle`, `user_email`, `user name`, `user phone`) VALUES
	(35, 'mmesserschmitt', 'mmesserschmitt@name_of_my_old_company.com', '', '');
INSERT INTO `Users` (`user_id`, `user_handle`, `user_email`, `user name`, `user phone`) VALUES
	(36, 'mrings', 'mrings@name_of_my_old_company.com', '', '');
INSERT INTO `Users` (`user_id`, `user_handle`, `user_email`, `user name`, `user phone`) VALUES
	(37, 'nsoudrette', 'nsoudrette@name_of_my_old_company.com', '', '');
INSERT INTO `Users` (`user_id`, `user_handle`, `user_email`, `user name`, `user phone`) VALUES
	(38, 'pkay', 'pkay@name_of_my_old_company.com', '', '');
INSERT INTO `Users` (`user_id`, `user_handle`, `user_email`, `user name`, `user phone`) VALUES
	(39, 'pjordan', 'pjordan@name_of_my_old_company.com', '', '');
INSERT INTO `Users` (`user_id`, `user_handle`, `user_email`, `user name`, `user phone`) VALUES
	(40, 'pgortemiller', 'pgortemiller@name_of_my_old_company.com', '', '');
INSERT INTO `Users` (`user_id`, `user_handle`, `user_email`, `user name`, `user phone`) VALUES
	(41, 'rjochem', 'rjochem@name_of_my_old_company.com', '', '');
INSERT INTO `Users` (`user_id`, `user_handle`, `user_email`, `user name`, `user phone`) VALUES
	(42, 'rjones', 'rjones@name_of_my_old_company.com', '', '');
INSERT INTO `Users` (`user_id`, `user_handle`, `user_email`, `user name`, `user phone`) VALUES
	(43, 'rgould', 'rgould@name_of_my_old_company.com', '', '');
INSERT INTO `Users` (`user_id`, `user_handle`, `user_email`, `user name`, `user phone`) VALUES
	(44, 'sstolz', 'sstolz@name_of_my_old_company.com', '', '');
INSERT INTO `Users` (`user_id`, `user_handle`, `user_email`, `user name`, `user phone`) VALUES
	(45, 'thenry', 'thenry@name_of_my_old_company.com', '', '');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;

-- Dumping structure for table bugs.WebAreas
CREATE TABLE IF NOT EXISTS `WebAreas` (
  `section id` int(11) NOT NULL,
  `WebArea` varchar(50) NOT NULL,
  `owner` varchar(50) NOT NULL,
  PRIMARY KEY (`section id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='General Areas of the Website';

-- Dumping data for table bugs.WebAreas: ~15 rows (approximately)
/*!40000 ALTER TABLE `WebAreas` DISABLE KEYS */;
INSERT INTO `WebAreas` (`section id`, `WebArea`, `owner`) VALUES
	(0, 'Home', 'lpennington\r\n');
INSERT INTO `WebAreas` (`section id`, `WebArea`, `owner`) VALUES
	(1, 'Presidents Blog', 'mrings');
INSERT INTO `WebAreas` (`section id`, `WebArea`, `owner`) VALUES
	(2, 'Motor Homing / Education', 'canderson');
INSERT INTO `WebAreas` (`section id`, `WebArea`, `owner`) VALUES
	(3, 'Benefits', 'lpennington');
INSERT INTO `WebAreas` (`section id`, `WebArea`, `owner`) VALUES
	(4, 'Magazine', 'lpennington');
INSERT INTO `WebAreas` (`section id`, `WebArea`, `owner`) VALUES
	(5, 'Forums/Blogs\r\n', 'canderson');
INSERT INTO `WebAreas` (`section id`, `WebArea`, `owner`) VALUES
	(6, 'Conventions', 'lpennignton');
INSERT INTO `WebAreas` (`section id`, `WebArea`, `owner`) VALUES
	(7, 'Chapters', 'lpennington');
INSERT INTO `WebAreas` (`section id`, `WebArea`, `owner`) VALUES
	(8, 'Membership', 'lpennington');
INSERT INTO `WebAreas` (`section id`, `WebArea`, `owner`) VALUES
	(9, 'Join', 'lpennington');
INSERT INTO `WebAreas` (`section id`, `WebArea`, `owner`) VALUES
	(10, 'Contact', 'dpeebles');
INSERT INTO `WebAreas` (`section id`, `WebArea`, `owner`) VALUES
	(11, 'Events Calendar', 'lpennington');
INSERT INTO `WebAreas` (`section id`, `WebArea`, `owner`) VALUES
	(12, 'FMC University', 'canderson');
INSERT INTO `WebAreas` (`section id`, `WebArea`, `owner`) VALUES
	(13, 'Other', 'dpeebles');
INSERT INTO `WebAreas` (`section id`, `WebArea`, `owner`) VALUES
	(14, 'My Membership Profile', 'lpennington');
/*!40000 ALTER TABLE `WebAreas` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
