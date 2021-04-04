-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 04, 2021 at 05:42 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.3.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dancenearme`
--

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `banner` varchar(255) NOT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title`, `banner`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Title', '4U2fHwz4hL.1608027492.jpeg', '1', '2020-12-15 11:18:12', NULL, NULL),
(2, 'Title 2', 'VYgkQzZMi4.1608027505.jpeg', '1', '2020-12-15 11:18:25', NULL, NULL),
(3, 'Title 3', 'ihNc5QXUJt.1608027516.jpeg', '1', '2020-12-15 11:18:36', '2020-12-15 10:38:33', NULL),
(4, 'Title 4', '2iVpwy9er7.1608027528.jpeg', '1', '2020-12-15 11:18:48', NULL, NULL),
(5, 'Title 5', 'CCbWmIgZEZ.1608027540.jpeg', '1', '2020-12-15 11:19:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `image`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Hipop', 'KR6G3VzaEU.1613407557.png', '1', '2021-02-15 22:15:57', NULL, NULL),
(2, 'Break Dance', 'vXVC2eVuEc.1613407573.png', '1', '2021-02-15 22:16:13', NULL, NULL),
(3, 'Classic', 'qFuAwX76LA.1613407617.png', '1', '2021-02-15 22:16:25', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `configs`
--

CREATE TABLE `configs` (
  `id` int(11) UNSIGNED NOT NULL,
  `key` varchar(250) NOT NULL,
  `value` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `type` varchar(250) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `configs`
--

INSERT INTO `configs` (`id`, `key`, `value`, `type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'privacy-policy', 'The standard Lorem Ipsum passage, used since the 1500s\r\n\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"\r\n\r\nSection 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\r\n\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"\r\n\r\n1914 translation by H. Rackham\r\n\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"\r\n\r\nSection 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\r\n\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"\r\n\r\n1914 translation by H. Rackham\r\n\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"', 'html', '2021-03-21 18:23:19', NULL, NULL),
(2, 'about', '<p>LOREM IPSUM IMAGES PLUGINS GENERATORS ENGLISH Privacy Policy The fine print INTRODUCTION We at Wasai LLC respect the privacy of your personal information and, as such, make every effort to ensure your information is protected and remains private. As the owner and operator of loremipsum.io (the &quot;Website&quot;) hereafter referred to in this Privacy Policy as &quot;Lorem Ipsum&quot;, &quot;us&quot;, &quot;our&quot; or &quot;we&quot;, we have provided this Privacy Policy to explain how we collect, use, share and protect information about the users of our Website (hereafter referred to as &ldquo;user&rdquo;, &ldquo;you&rdquo; or &quot;your&quot;). For the purposes of this Agreement, any use of the terms &quot;Lorem Ipsum&quot;, &quot;us&quot;, &quot;our&quot; or &quot;we&quot; includes Wasai LLC, without limitation. We will not use or share your personal information with anyone except as described in this Privacy Policy. This Privacy Policy will inform you about the types of personal data we collect, the purposes for which we use the data, the ways in which the data is handled and your rights with regard to your personal data. Furthermore, this Privacy Policy is intended to satisfy the obligation of transparency under the EU General Data Protection Regulation 2016/679 (&quot;GDPR&quot;) and the laws implementing GDPR. For the purpose of this Privacy Policy the Data Controller of personal data is Wasai LLC and our contact details are set out in the Contact section at the end of this Privacy Policy. Data Controller means the natural or legal person who (either alone or jointly or in common with other persons) determines the purposes for which and the manner in which any personal information are, or are to be, processed. For purposes of this Privacy Policy, &quot;Your Information&quot; or &quot;Personal Data&quot; means information about you, which may be of a confidential or sensitive nature and may include personally identifiable information (&quot;PII&quot;) and/or financial information. PII means individually identifiable information that would allow us to determine the actual identity of a specific living person, while sensitive data may include information, comments, content and other information that you voluntarily provide. Lorem Ipsum collects information about you when you use our Website to access our services, and other online products and services (collectively, the &ldquo;Services&rdquo;) and through other interactions and communications you have with us. The term Services includes, collectively, various applications, websites, widgets, email notifications and other mediums, or portions of such mediums, through which you have accessed this Privacy Policy. We may change this Privacy Policy from time to time. If we decide to change this Privacy Policy, we will inform you by posting the revised Privacy Policy on the Site. Those changes will go into effect on the &quot;Last updated&quot; date shown at the end of this Privacy Policy. By continuing to use the Site or Services, you consent to the revised Privacy Policy. We encourage you to periodically review the Privacy Policy for the latest information on our privacy practices. BY ACCESSING OR USING OUR SERVICES, YOU CONSENT TO THE COLLECTION, TRANSFER, MANIPULATION, STORAGE, DISCLOSURE AND OTHER USES OF YOUR INFORMATION (COLLECTIVELY, &quot;USE OF YOUR INFORMATION&quot;) AS DESCRIBED IN THIS PRIVACY POLICY. IF YOU DO NOT AGREE WITH OR CONSENT TO THIS PRIVACY POLICY YOU MAY NOT ACCESS OR USE OUR SERVICES. CHILDREN&#39;S PRIVACY Lorem Ipsum does not knowingly collect personally identifiable information (PII) from persons under the age of 13. If you are under the age of 13, please do not provide us with information of any kind whatsoever. If you have reason to believe that we may have accidentally received information from a child under the age of 13, please contact us immediately at legal@wasai.co. If we become aware that we have inadvertently received Personal Information from a person under the age of 13, we will delete such information from our records. INFORMATION PROVIDED DIRECTLY BY YOU We collect information you provide directly to us, such as when you request information, create or modify your personal account, request Services, subscribe to our Services, complete a Lorem Ipsum form, survey, quiz or application, contact customer support, join or enroll for an event or otherwise communicate with us in any manner. This information may include, without limitation: name, date of birth, e-mail address, physical address, business address, phone number, or any other personal information you choose to provide. INFORMATION COLLECTED THROUGH YOUR USE OF OUR SERVICES The following are situations in which you may provide Your Information to us: When you fill out forms or fields through our Services; When you register for an account with our Service; When you create a subscription for our newsletter or Services; When you provide responses to a survey; When you answer questions on a quiz; When you join or enroll in an event through our Services; When you order services or products from, or through our Service; When you provide information to us through a third-party application, service or Website; When you communicate with us or request information about us or our products or Services, whether via email or other means; and When you participate in any of our marketing initiatives, including, contests, events, or promotions. We also automatically collect information via the Website through the use of various technologies, including, but not limited to Cookies and Web Beacons (explained below). We may collect your IP address, browsing behavior and device IDs. This information is used by us in order to enable us to better understand how our Services are being used by visitors and allows us to administer and customize the Services to improve your overall experience. INFORMATION COLLECTED FROM OTHER SOURCES We may also receive information from other sources and combine that with information we collect through our Services. For example if you choose to link, create, or log in to your Lorem Ipsum account with a social media service, e.g. LinkedIn, Facebook or Twitter, or if you engage with a separate App or Website that uses our API, or whose API we use, we may receive information about you or your connections from that Site or App. This includes, without limitation, profile information, profile picture, gender, user name, user ID associated with your social media account, age range, language, country, friends list, and any other information you permit the social network to share with third parties. The data we receive is solely dependent upon your privacy settings with the social network. INFORMATION THIRD PARTIES PROVIDE We may collect information about you from sources other than you, such as from social media websites (i.e., Facebook, LinkedIn, Twitter or others), blogs, analytics providers, business affiliates and partners and other users. This includes, without limitation, identity data, contact data, marketing and communications data, behavioral data, technical data and content data. AGGREGATED DATA We may collect, use and share Aggregated Data such as statistical or demographic data for any purpose. Aggregated Data is de-identified or anonymized and does not constitute Personal Data for the purposes of the GDPR as this data does not directly or indirectly reveal your identity. If we ever combine Aggregated Data with your Personal Data so that it can directly or indirectly identify you, we treat the combined data as PII which will only be used in accordance with this Privacy Policy. COOKIES, LOG FILES AND ANONYMOUS IDENTIFIERS When you visit our Services, we may send one or more Cookies &ndash; small data files &ndash; to your computer to uniquely identify your browser and let us help you log in faster and enhance your navigation through the Sites. &ldquo;Cookies&rdquo; are text-only pieces of information that a website transfers to an individual&rsquo;s hard drive or other website browsing equipment for record keeping purposes. A Cookie may convey anonymous information about how you browse the Services to us so we can provide you with a more personalized experience, but does not collect personal information about you. Cookies allow the Sites to remember important information that will make your use of the site more convenient. A Cookie will typically contain the name of the domain from which the Cookie has come, the &ldquo;lifetime&rdquo; of the Cookie, and a randomly generated unique number or other value. Certain Cookies may be used on the Sites regardless of whether you are logged in to your account or not. Session Cookies are temporary Cookies that remain in the Cookie file of your browser until you leave the Site. Persistent Cookies remain in the Cookie file of your browser for much longer (though how long will depend on the lifetime of the specific Cookie). When we use session Cookies to track the total number of visitors to our Site, this is done on an anonymous aggregate basis (as Cookies do not in themselves carry any personal data). We may also employ Cookies so that we remember your computer when it is used to return to the Site to help customize your Lorem Ipsum web experience. We may associate personal information with a Cookie file in those instances. We use Cookies to help us know that you are logged on, provide you with features based on your preferences, understand when you are interacting with our Services, and compile other information regarding use of our Services. Third parties with whom we partner to provide certain features on our Site or to display advertising based upon your Web browsing activity use Cookies to collect and store information. Our Website may use remarketing services, to serve ads on our behalf across the internet on third party websites to previous visitors to our Sites. It could mean that we advertise to previous visitors who haven&rsquo;t completed a task on our site. This could be in the form of an advertisement on the Google search results page or a site in the Google Display Network. Third-party vendors, including Google, use Cookies to serve ads based on your past visits to our Website. Any data collected will be used in accordance with our own privacy policy, as well as Google&#39;s privacy policies. To learn more, or to opt-out of receiving advertisements tailored to your interests by our third parties, visit the Network Advertising Initiative at www.networkadvertising.org/choices. Lorem Ipsum may use third-party services such as Google Analytics to help understand use of the Services. These services typically collect the information sent by your browser as part of a web page request, including Cookies and your IP address. They receive this information and their use of it is governed by their respective privacy policies. You may opt-out of Google Analytics for Display Advertisers including AdWords and opt-out of customized Google Display Network ads by visiting the Google Ads Preferences Manager here . To provide website visitors more choice on how their data is collected by Google Analytics, Google has developed an Opt-out Browser add-on, which is available by visiting Google Analytics Opt-out Browser Add-on here . You can control the use of Cookies at the individual browser level. Use the options in your web browser if you do not wish to receive a Cookie or if you wish to set your browser to notify you when you receive a Cookie. You can easily delete and manage any Cookies that have been installed in the Cookie folder of your browser by following the instructions provided by your particular browser manufacturer. Consult the documentation that your particular browser manufacturer provides. You may also consult your mobile device documentation for information on how to disable Cookies on your mobile device. If you reject Cookies, you may still use our Website, but your ability to use some features or areas of our Service may be limited. Lorem Ipsum cannot control the use of Cookies by third parties (or the resulting information), and use of third party Cookies is not covered by this policy. We automatically collect information about how you interact with our Services, preferences expressed, and settings chosen and store it in Log Files. This information may include internet protocol (IP) addresses, browser type, internet service provider (ISP), referring/exit pages, operating system, date/time stamp, and/or clickstream data. We may combine this automatically collected log information with other information we collect about you. We do this to improve services we offer you, to improve marketing, analytics, or Website functionality, and to document your consent to receiving products, services or communications from us or our partners. If we link such information with personally identifiable information in a manner that identifies a particular individual, then we will treat all such information as PII for purposes of this Privacy Policy. When you use our Services, we may employ Web Beacons (also known as clear GIFs or tracking pixels) to anonymously track online usage patterns. No Personally Identifiable Information from your account is collected using these Web Beacons. DEVICE INFORMATION When you use our Services through your computer, mobile phone or other device, we may collect information regarding and related to your device, such as hardware models and IDs, device type, operating system version, the request type, the content of your request and basic usage information about your use of our Services, such as date and time. We may also collect and store information locally on your device using mechanisms such as browser web storage and application data caches. LOCATION INFORMATION When you use the Services we may collect your precise location data. We may also derive your approximate location from your IP address. PROTECTIVE MEASURES WE USE We protect your information using commercially reasonable technical and administrative security measures to reduce the risks of loss, misuse, unauthorized access, disclosure and alteration. Although we take measures to secure your information, we do not promise, and you should not expect, that your personal information, or searches, or other information will always remain secure. We cannot guarantee the security of our information storage, nor can we guarantee that the information you supply will not be intercepted while being transmitted to and from us over the Internet including, without limitation, email and text transmissions. In the event that any information under our control is compromised as a result of a breach of security, we will take reasonable steps to investigate the situation and where appropriate, notify those individuals whose information may have been compromised and take other steps, in accordance with any applicable laws and regulations. THE LEGAL BASIS FOR COLLECTION AND PROCESSING OF YOUR PERSONAL INFORMATION The legal basis upon which we rely for the collection and processing of your Personal Information under the GDPR are the following: When signing up subscribing to use our Services, you have given us explicit consent allowing Lorem Ipsum to provide you with our Services and generally to process your information in accordance with this Privacy Policy; and to the transfer of your personal data to other jurisdictions including, without limitation, the United States; It is necessary registering you as a user, managing your account and profile, and authenticating you when you log in. It is necessary for our legitimate interests in the proper administration of our website and business; analyzing the use of the website and our Services; assuring the security of our website and Services; maintaining back-ups of our databases; and communicating with you; To resolve technical issues you encounter, to respond to your requests for assistance, comments and questions, to analyze crash information, to repair and improve the Services and provide other customer support. To send communications via email and within the Services, including, for example, responding to your comments, questions and requests, providing customer support, and sending you technical notices, product updates, security alerts, and administrative and account management related messages. To send promotional communications that may be of specific interest to you. It is necessary for our legitimate interests in the protection and assertion of our legal rights, and the legal rights of others, including you; It is necessary for our compliance with certain legal provisions which may require us to process your personal data. By way of example, and without limitation, we may be required by law to disclose your personal data to law enforcement or a regulatory agency. HOW WE USE INFORMATION WE COLLECT Our primary purpose in collecting, holding, using and disclosing your Information is for our legitimate business purposes and to provide you with a safe, smooth, efficient, and customized experience. We will use this information in order to: Provide users with our Services and customer support including, but not limited to, confirming emails related to our services, reminders, confirmations, requests for information and transactions. Contact you and provide you with information. Analyze, improve and manage our Services and operations. Resolve problems and disputes, and engage in other legal and security matters. Enforce any terms and conditions of any subscription for our Services. Additionally, we may use the information we collect about you to: Send you communications we think will be of interest to you, including information about products, services, promotions, news, and events of Lorem Ipsum and other affiliated or sponsoring companies with whom we have established a relationship. Display advertising, including advertising that is targeted to you or other users based on your location, interests, as well as your activities on our Services. Verify your identity and prevent impersonation, spam or other unauthorized or illegal activity. We may transfer the information described in this Privacy Policy to, and process and store it in, the United States and other countries, some of which may have less protective data protection laws than the region in which you reside. Where this is the case, we will take appropriate measures to protect your personal information in accordance with this Privacy Policy. HOW WE SHARE INFORMATION WE COLLECT We may share the information we collect about you as described in this Privacy Policy or as described at the time of collection or sharing, including as follows: With third party Service Providers to enable them to provide the Services you request; With third parties with whom you choose to let us share information, for example other websites or apps that integrate with our API or Services, or those with an API or Service with which we integrate. With Lorem Ipsum subsidiaries and affiliated entities that provide services or conduct data processing on our behalf, or for data verification, data centralization and/or logistics purposes; With vendors, consultants, marketing partners, and other service providers who need access to such information to carry out work on our behalf; In response to a request for information by a competent authority if we believe disclosure is in accordance with, or is otherwise required by, any applicable law, regulation, or legal process; With law enforcement officials, government authorities, or other third parties if we believe your actions are inconsistent with our user agreements, Terms of Service, or policies, or to protect the rights, property, or safety of Lorem Ipsum or others; In connection with, or during negotiations of, any merger, sale of company assets, consolidation or restructuring, financing, or acquisition of all or a portion of our business by or into another company; If we otherwise notify you and you consent to the sharing; and In an aggregated and/or de-identified form which cannot reasonably be used to identify you. We only use such data in the aggregate form and our analytical services do not record any personal information. We may disclose Your Information: To any person who, in our reasonable judgment, is authorized to receive Your Information as your agent, including as a result of your business dealings with that person (for example, your attorney); To our third-party vendors and service providers so that they may provide support for our internal and business operations, including handling of data processing, data verification, data storage, surveys, research, internal marketing, delivery of promotional, marketing and transaction materials, and our Services maintenance and security. These companies are authorized to use Your Information only as necessary to provide these services to us and are contractually obligated to keep Your Information confidential; To third parties when you engage in certain activities through our Services that are sponsored by them, such as purchasing products or services offered by a third party, electing to receive information or communications from a third party, or electing to participate in contests, sweepstakes, games or other programs sponsored, in whole or in part, by a third party. When we disclose Your Information to these third parties, Your Information will become subject to the information use and sharing practices of the third party, and the third party will not be restricted by this Privacy Policy with respect to its use and further sharing of Your Information; As required by law or ordered by a court, regulatory, or administrative agency; As we deem necessary, in our sole discretion, if we believe that you are violating any applicable law, rule or regulation, or are otherwise interfering with another&#39;s rights or property, including, without limitation, our rights or property; To enforce this Privacy Policy, and any other applicable agreements and policies; To enforce or protect our legal rights. SHARING INFORMATION WITH LAW ENFORCEMENT Lorem Ipsum is committed to cooperating with law enforcement while respecting each individual&rsquo;s right to privacy. If Lorem Ipsum receives a request for user account information from a government agency investigating criminal activity, we will review the request to be certain that it satisfies all legal requirements before releasing information to the requesting agency. Furthermore, under 18 U.S.C. &sect;&sect; 2702(b)(8) and 2702(c)(4) (Voluntary Disclosure Of Customer Communications or Records), Lorem Ipsum may disclose user account information to law enforcement, without a subpoena, court order, or search warrant, in response to a valid emergency when we believe that doing so is necessary to prevent death or serious physical harm to someone. Lorem Ipsum will not release more information than it prudently believes is necessary to prevent harm in an emergency situation. SOCIAL MEDIA SHARING Our Services may now or in the future integrate with social sharing features and other related tools which let you share actions you take on our Services with other Apps, sites, or media, and vice versa. Your use of such features enables the sharing of information with your friends or the public, depending on the settings you establish with the social sharing service. Please refer to the privacy policies of those social sharing services for more information about how they handle the data you provide to or share through them. Any information or content that you voluntarily disclose for posting publicly to a social sharing service becomes available to the public, as controlled by any applicable privacy settings that you set with the social sharing service. Once you have shared User Content or made it public, that User Content may be re-shared by others. If you remove information that you posted to the social sharing service, copies may still remain viewable in cached and archived pages, or if other users or third parties, using the social sharing service, have re-shared, copied or saved that User Content. ANALYTIC SERVICES PROVIDED BY OTHERS We may allow others to provide audience measurement and analytics services for us, to serve advertisements on our behalf across the Internet, and to track and report on the performance of those advertisements. These entities may use Cookies, Web Beacons, software development kits (SDKs), and other technologies to identify your device when you visit our Site and use our Services, as well as when you visit other online sites and services. LINKS TO THIRD-PARTY WEBSITES Our Services, as well as the email messages sent with respect to our Services, may contain links or access to websites operated by third parties that are beyond our control. Links or access to third parties from our Services are not an endorsement by us of such third parties, or their websites, applications, products, services, or practices. We are not responsible for the privacy policy, terms and conditions, practices or the content of such third parties. These third-parties may send their own Cookies to you and independently collect data. If you visit or access a third-party Website, application or other property that is linked or accessed from our Services, we encourage you to read any privacy policies and terms and conditions of that third party before providing any personally identifiable information. If you have a question about the terms and conditions, privacy policy, practices or contents of a third party, please contact the third party directly. DO NOT TRACK SETTINGS Some web browsers may give you the ability to enable a &quot;do not track&quot; feature that sends signals to the websites you visit, indicating that you do not want your online activities tracked. We do not respond to &quot;do not track&quot; signals at this time; if we do so in the future, we will describe how in this Privacy Policy. INTERNATIONAL PRIVACY POLICIES In order to provide our products and services to you, we may send and store your personal information outside of the country where you reside or are located, including to the United States. Accordingly, if you reside or are located outside of the United States, your personal information may be transferred outside of the country where you reside or are located, including countries that may not, or do not, provide the same level of protection for your personal information. We are committed to protecting the privacy and confidentiality of personal information when it is transferred. If you reside or are located within the European Economic Area and such transfers occur, we take appropriate steps to provide the same level of protection for the processing carried out in any such countries as you would have within the European Economic Area to the extent feasible under applicable law. By using and accessing our products and services, users who reside or are located in countries outside of the United States agree and consent to the transfer to and processing of personal information on servers located outside of the country where they reside, and assume the risk that the protection of such information may be different and may be less protective than those required under the laws of their residence or location. ACCOUNT INFORMATION You may correct your account information at any time by logging into your online account. If you wish to cancel your account, please email us at legal@wasai.co Please note that in some cases we may retain certain information about you as required by law, or for legitimate business purposes to the extent permitted by law. PROMOTIONAL INFORMATION OPT OUT You may opt out of receiving our newsletters or any other promotional messages from us at any time by following the instructions in those messages sent to you and the link provided therein, or by contacting us at any time using the Contact Us information at the end of this Privacy Policy. If you opt out, we may still send you non-promotional communications, such as those about your account, about Services you have requested, or our ongoing business relations. YOUR ACCESS AND RIGHTS TO YOUR PERSONAL INFORMATION You have certain rights in relation to Personal Information we hold about you. You can exercise any of the following rights by contacting us using any of the methods in the Contact section below. We may need to request specific information from you to help us confirm your identity and ensure your right to access your Personal Data (or to exercise any of your other rights). This is a security measure to ensure that Personal Data is not disclosed to any person who has no right to receive it. We try to respond to all legitimate requests within one month. Occasionally it may take us longer than a month if your request is particularly complex or you have made a number of requests. In this case, we will notify you and keep you updated. Right to Access Your Personal Data. You have the right to access information held about you for the purpose of viewing and in certain cases updating or deleting such information. Furthermore, if you prefer that Lorem Ipsum does not share certain information as described in this Privacy Policy, you can direct Lorem Ipsum not to share that information. We will comply with an individual&rsquo;s requests regarding access, correction, sharing and/or deletion of the personal data we store in accordance with applicable law. To make changes to your account affecting your personal information contact us at the email address in our Contact section below. For any deletion, non-sharing or update request, we will make the changes as soon as practicable, however this information may stay in our backup files. If we cannot make the changes you want, we will let you know and explain why. Right of Correction or Completion of Your Personal Data. If personal information we hold about you is not accurate, out of date or incomplete, you have a right to have the data corrected or completed. To make corrections to your account please contact us at the email address in our Contact section below. Right of Erasure or Deletion of Your Personal Data. In certain circumstances, you have the right to request that personal information we hold about you is deleted. If we cannot delete the information you want, we will let you know and explain why. To request information deletion please contact us at the email address in our Contact section below. Right to Object to or Restrict Processing of Your Personal Data. In certain circumstances, you have the right to object to our processing of your personal information. For example, you have the right to object to use of your personal information for direct marketing purposes. Similarly, you have the right to object to use of your personal information if we are processing your information on the basis of our legitimate interests and there are no compelling legitimate grounds for our processing which supersede your rights and interests. You may also have the right to restrict our use of your personal information, such as in circumstances where you have challenged the accuracy of the information and during the period where we are verifying its accuracy. To object to or restrict processing please contact us at the email address in our Contact section below. Right to Data Portability or Transfer of Your Personal Data. You have the right to be provided with a copy of the information we maintain about you in a structured, machine-readable and commonly used format. To receive a copy of the information we maintain about you please contact us at the email address in our Contact section below. Right to Withdrawal of Consent. If you have given your consent to us to process and share your Personal Information after we have requested it, you have the right to withdraw your consent at any time. To withdraw your consent please contact us at the email address in our Contact section below. YOUR CALIFORNIA PRIVACY RIGHTS California Civil Code Section 1798.83 entitles California residents to request information concerning whether a business has disclosed Personal Information to any third parties for their direct marketing purposes. California residents may request and obtain from us once a year, free of charge, information about the personal information, if any, we disclosed to third parties for direct marketing purposes within the immediately preceding calendar year. If applicable, this information would include a list of the categories of personal information that was shared and the names and addresses of all third parties with which we shared information within the immediately preceding calendar year. If you are a California resident and would like to make such a request, please submit your request in writing to: legal@wasai.co OUR INFORMATION RETENTION POLICY Unless you request that we delete certain information, we retain the information we collect for as long as your account is active or as needed to provide you services. Following termination or deactivation of your account, we will retain information for at least 3 years and may retain the information for as long as needed for our business and legal purposes. We will only retain your Personal Data for so long as we reasonably need to unless a longer retention period is required by law (for example for regulatory purposes). CONTACT US If you have any questions or if you would like to contact us about our processing of your personal information, including exercising your rights as outlined above, please contact us by any of the methods below. When you contact us, we will ask you to verify your identity. Contact: Privacy Officer Email: legal@wasai.co Office: 165 11th St, San Francisco, CA 94103 &copy; 2015 &mdash; 2020 PRIVACY POLICY SITEMAP IMAGES PLUGINS GENERATORS SHARE THE LOREM WA SAI Close X The standard Lorem Ipsum passage, used since the 1500s &quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&quot; Section 1.10.32 of &quot;de Finibus Bonorum et Malorum&quot;, written by Cicero in 45 BC &quot;Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?&quot; 1914 translation by H. Rackham &quot;But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?&quot; Section 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot;, written by Cicero in 45 BC &quot;At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.&quot; 1914 translation by H. Rackham &quot;On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.&quot;</p>', 'html', '2021-03-21 18:26:58', '2021-03-21 16:19:54', NULL);
INSERT INTO `configs` (`id`, `key`, `value`, `type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 'term-condition', '\r\nLOREM IPSUM\r\nIMAGES\r\nPLUGINS\r\nGENERATORS\r\nENGLISH\r\nPrivacy Policy\r\nThe fine print\r\n\r\nINTRODUCTION\r\nWe at Wasai LLC respect the privacy of your personal information and, as such, make every effort to ensure your information is protected and remains private. As the owner and operator of loremipsum.io (the \"Website\") hereafter referred to in this Privacy Policy as \"Lorem Ipsum\", \"us\", \"our\" or \"we\", we have provided this Privacy Policy to explain how we collect, use, share and protect information about the users of our Website (hereafter referred to as “user”, “you” or \"your\"). For the purposes of this Agreement, any use of the terms \"Lorem Ipsum\", \"us\", \"our\" or \"we\" includes Wasai LLC, without limitation. We will not use or share your personal information with anyone except as described in this Privacy Policy.\r\n\r\nThis Privacy Policy will inform you about the types of personal data we collect, the purposes for which we use the data, the ways in which the data is handled and your rights with regard to your personal data. Furthermore, this Privacy Policy is intended to satisfy the obligation of transparency under the EU General Data Protection Regulation 2016/679 (\"GDPR\") and the laws implementing GDPR.\r\n\r\nFor the purpose of this Privacy Policy the Data Controller of personal data is Wasai LLC and our contact details are set out in the Contact section at the end of this Privacy Policy. Data Controller means the natural or legal person who (either alone or jointly or in common with other persons) determines the purposes for which and the manner in which any personal information are, or are to be, processed.\r\n\r\nFor purposes of this Privacy Policy, \"Your Information\" or \"Personal Data\" means information about you, which may be of a confidential or sensitive nature and may include personally identifiable information (\"PII\") and/or financial information. PII means individually identifiable information that would allow us to determine the actual identity of a specific living person, while sensitive data may include information, comments, content and other information that you voluntarily provide.\r\n\r\nLorem Ipsum collects information about you when you use our Website to access our services, and other online products and services (collectively, the “Services”) and through other interactions and communications you have with us. The term Services includes, collectively, various applications, websites, widgets, email notifications and other mediums, or portions of such mediums, through which you have accessed this Privacy Policy.\r\n\r\nWe may change this Privacy Policy from time to time. If we decide to change this Privacy Policy, we will inform you by posting the revised Privacy Policy on the Site. Those changes will go into effect on the \"Last updated\" date shown at the end of this Privacy Policy. By continuing to use the Site or Services, you consent to the revised Privacy Policy. We encourage you to periodically review the Privacy Policy for the latest information on our privacy practices.\r\n\r\nBY ACCESSING OR USING OUR SERVICES, YOU CONSENT TO THE COLLECTION, TRANSFER, MANIPULATION, STORAGE, DISCLOSURE AND OTHER USES OF YOUR INFORMATION (COLLECTIVELY, \"USE OF YOUR INFORMATION\") AS DESCRIBED IN THIS PRIVACY POLICY. IF YOU DO NOT AGREE WITH OR CONSENT TO THIS PRIVACY POLICY YOU MAY NOT ACCESS OR USE OUR SERVICES.\r\n\r\nCHILDREN\'S PRIVACY\r\nLorem Ipsum does not knowingly collect personally identifiable information (PII) from persons under the age of 13. If you are under the age of 13, please do not provide us with information of any kind whatsoever. If you have reason to believe that we may have accidentally received information from a child under the age of 13, please contact us immediately at legal@wasai.co. If we become aware that we have inadvertently received Personal Information from a person under the age of 13, we will delete such information from our records.\r\n\r\nINFORMATION PROVIDED DIRECTLY BY YOU\r\nWe collect information you provide directly to us, such as when you request information, create or modify your personal account, request Services, subscribe to our Services, complete a Lorem Ipsum form, survey, quiz or application, contact customer support, join or enroll for an event or otherwise communicate with us in any manner. This information may include, without limitation: name, date of birth, e-mail address, physical address, business address, phone number, or any other personal information you choose to provide.\r\n\r\nINFORMATION COLLECTED THROUGH YOUR USE OF OUR SERVICES\r\nThe following are situations in which you may provide Your Information to us:\r\n\r\nWhen you fill out forms or fields through our Services;\r\n\r\nWhen you register for an account with our Service;\r\n\r\nWhen you create a subscription for our newsletter or Services;\r\n\r\nWhen you provide responses to a survey;\r\n\r\nWhen you answer questions on a quiz;\r\n\r\nWhen you join or enroll in an event through our Services;\r\n\r\nWhen you order services or products from, or through our Service;\r\n\r\nWhen you provide information to us through a third-party application, service or Website;\r\n\r\nWhen you communicate with us or request information about us or our products or Services, whether via email or other means; and\r\n\r\nWhen you participate in any of our marketing initiatives, including, contests, events, or promotions.\r\n\r\nWe also automatically collect information via the Website through the use of various technologies, including, but not limited to Cookies and Web Beacons (explained below). We may collect your IP address, browsing behavior and device IDs. This information is used by us in order to enable us to better understand how our Services are being used by visitors and allows us to administer and customize the Services to improve your overall experience.\r\n\r\nINFORMATION COLLECTED FROM OTHER SOURCES\r\nWe may also receive information from other sources and combine that with information we collect through our Services. For example if you choose to link, create, or log in to your Lorem Ipsum account with a social media service, e.g. LinkedIn, Facebook or Twitter, or if you engage with a separate App or Website that uses our API, or whose API we use, we may receive information about you or your connections from that Site or App. This includes, without limitation, profile information, profile picture, gender, user name, user ID associated with your social media account, age range, language, country, friends list, and any other information you permit the social network to share with third parties. The data we receive is solely dependent upon your privacy settings with the social network.\r\n\r\nINFORMATION THIRD PARTIES PROVIDE\r\nWe may collect information about you from sources other than you, such as from social media websites (i.e., Facebook, LinkedIn, Twitter or others), blogs, analytics providers, business affiliates and partners and other users. This includes, without limitation, identity data, contact data, marketing and communications data, behavioral data, technical data and content data.\r\n\r\nAGGREGATED DATA\r\nWe may collect, use and share Aggregated Data such as statistical or demographic data for any purpose. Aggregated Data is de-identified or anonymized and does not constitute Personal Data for the purposes of the GDPR as this data does not directly or indirectly reveal your identity. If we ever combine Aggregated Data with your Personal Data so that it can directly or indirectly identify you, we treat the combined data as PII which will only be used in accordance with this Privacy Policy.\r\n\r\nCOOKIES, LOG FILES AND ANONYMOUS IDENTIFIERS\r\nWhen you visit our Services, we may send one or more Cookies – small data files – to your computer to uniquely identify your browser and let us help you log in faster and enhance your navigation through the Sites. “Cookies” are text-only pieces of information that a website transfers to an individual’s hard drive or other website browsing equipment for record keeping purposes. A Cookie may convey anonymous information about how you browse the Services to us so we can provide you with a more personalized experience, but does not collect personal information about you. Cookies allow the Sites to remember important information that will make your use of the site more convenient. A Cookie will typically contain the name of the domain from which the Cookie has come, the “lifetime” of the Cookie, and a randomly generated unique number or other value. Certain Cookies may be used on the Sites regardless of whether you are logged in to your account or not.\r\n\r\nSession Cookies are temporary Cookies that remain in the Cookie file of your browser until you leave the Site.\r\n\r\nPersistent Cookies remain in the Cookie file of your browser for much longer (though how long will depend on the lifetime of the specific Cookie).\r\n\r\nWhen we use session Cookies to track the total number of visitors to our Site, this is done on an anonymous aggregate basis (as Cookies do not in themselves carry any personal data).\r\n\r\nWe may also employ Cookies so that we remember your computer when it is used to return to the Site to help customize your Lorem Ipsum web experience. We may associate personal information with a Cookie file in those instances.\r\n\r\nWe use Cookies to help us know that you are logged on, provide you with features based on your preferences, understand when you are interacting with our Services, and compile other information regarding use of our Services.\r\n\r\nThird parties with whom we partner to provide certain features on our Site or to display advertising based upon your Web browsing activity use Cookies to collect and store information.\r\n\r\nOur Website may use remarketing services, to serve ads on our behalf across the internet on third party websites to previous visitors to our Sites. It could mean that we advertise to previous visitors who haven’t completed a task on our site. This could be in the form of an advertisement on the Google search results page or a site in the Google Display Network. Third-party vendors, including Google, use Cookies to serve ads based on your past visits to our Website. Any data collected will be used in accordance with our own privacy policy, as well as Google\'s privacy policies. To learn more, or to opt-out of receiving advertisements tailored to your interests by our third parties, visit the Network Advertising Initiative at www.networkadvertising.org/choices.\r\n\r\nLorem Ipsum may use third-party services such as Google Analytics to help understand use of the Services. These services typically collect the information sent by your browser as part of a web page request, including Cookies and your IP address. They receive this information and their use of it is governed by their respective privacy policies. You may opt-out of Google Analytics for Display Advertisers including AdWords and opt-out of customized Google Display Network ads by visiting the Google Ads Preferences Manager here . To provide website visitors more choice on how their data is collected by Google Analytics, Google has developed an Opt-out Browser add-on, which is available by visiting Google Analytics Opt-out Browser Add-on here .\r\n\r\nYou can control the use of Cookies at the individual browser level. Use the options in your web browser if you do not wish to receive a Cookie or if you wish to set your browser to notify you when you receive a Cookie. You can easily delete and manage any Cookies that have been installed in the Cookie folder of your browser by following the instructions provided by your particular browser manufacturer. Consult the documentation that your particular browser manufacturer provides. You may also consult your mobile device documentation for information on how to disable Cookies on your mobile device. If you reject Cookies, you may still use our Website, but your ability to use some features or areas of our Service may be limited.\r\n\r\nLorem Ipsum cannot control the use of Cookies by third parties (or the resulting information), and use of third party Cookies is not covered by this policy.\r\n\r\nWe automatically collect information about how you interact with our Services, preferences expressed, and settings chosen and store it in Log Files. This information may include internet protocol (IP) addresses, browser type, internet service provider (ISP), referring/exit pages, operating system, date/time stamp, and/or clickstream data. We may combine this automatically collected log information with other information we collect about you. We do this to improve services we offer you, to improve marketing, analytics, or Website functionality, and to document your consent to receiving products, services or communications from us or our partners. If we link such information with personally identifiable information in a manner that identifies a particular individual, then we will treat all such information as PII for purposes of this Privacy Policy.\r\n\r\nWhen you use our Services, we may employ Web Beacons (also known as clear GIFs or tracking pixels) to anonymously track online usage patterns. No Personally Identifiable Information from your account is collected using these Web Beacons.\r\n\r\nDEVICE INFORMATION\r\nWhen you use our Services through your computer, mobile phone or other device, we may collect information regarding and related to your device, such as hardware models and IDs, device type, operating system version, the request type, the content of your request and basic usage information about your use of our Services, such as date and time. We may also collect and store information locally on your device using mechanisms such as browser web storage and application data caches.\r\n\r\nLOCATION INFORMATION\r\nWhen you use the Services we may collect your precise location data. We may also derive your approximate location from your IP address.\r\n\r\nPROTECTIVE MEASURES WE USE\r\nWe protect your information using commercially reasonable technical and administrative security measures to reduce the risks of loss, misuse, unauthorized access, disclosure and alteration. Although we take measures to secure your information, we do not promise, and you should not expect, that your personal information, or searches, or other information will always remain secure. We cannot guarantee the security of our information storage, nor can we guarantee that the information you supply will not be intercepted while being transmitted to and from us over the Internet including, without limitation, email and text transmissions. In the event that any information under our control is compromised as a result of a breach of security, we will take reasonable steps to investigate the situation and where appropriate, notify those individuals whose information may have been compromised and take other steps, in accordance with any applicable laws and regulations.\r\n\r\nTHE LEGAL BASIS FOR COLLECTION AND PROCESSING OF YOUR PERSONAL INFORMATION\r\nThe legal basis upon which we rely for the collection and processing of your Personal Information under the GDPR are the following:\r\n\r\nWhen signing up subscribing to use our Services, you have given us explicit consent allowing Lorem Ipsum to provide you with our Services and generally to process your information in accordance with this Privacy Policy; and to the transfer of your personal data to other jurisdictions including, without limitation, the United States;\r\n\r\nIt is necessary registering you as a user, managing your account and profile, and authenticating you when you log in.\r\n\r\nIt is necessary for our legitimate interests in the proper administration of our website and business; analyzing the use of the website and our Services; assuring the security of our website and Services; maintaining back-ups of our databases; and communicating with you;\r\n\r\nTo resolve technical issues you encounter, to respond to your requests for assistance, comments and questions, to analyze crash information, to repair and improve the Services and provide other customer support.\r\n\r\nTo send communications via email and within the Services, including, for example, responding to your comments, questions and requests, providing customer support, and sending you technical notices, product updates, security alerts, and administrative and account management related messages.\r\n\r\nTo send promotional communications that may be of specific interest to you.\r\n\r\nIt is necessary for our legitimate interests in the protection and assertion of our legal rights, and the legal rights of others, including you;\r\n\r\nIt is necessary for our compliance with certain legal provisions which may require us to process your personal data. By way of example, and without limitation, we may be required by law to disclose your personal data to law enforcement or a regulatory agency.\r\n\r\nHOW WE USE INFORMATION WE COLLECT\r\nOur primary purpose in collecting, holding, using and disclosing your Information is for our legitimate business purposes and to provide you with a safe, smooth, efficient, and customized experience.\r\n\r\nWe will use this information in order to:\r\n\r\nProvide users with our Services and customer support including, but not limited to, confirming emails related to our services, reminders, confirmations, requests for information and transactions.\r\n\r\nContact you and provide you with information.\r\n\r\nAnalyze, improve and manage our Services and operations.\r\n\r\nResolve problems and disputes, and engage in other legal and security matters.\r\n\r\nEnforce any terms and conditions of any subscription for our Services.\r\n\r\nAdditionally, we may use the information we collect about you to:\r\n\r\nSend you communications we think will be of interest to you, including information about products, services, promotions, news, and events of Lorem Ipsum and other affiliated or sponsoring companies with whom we have established a relationship.\r\n\r\nDisplay advertising, including advertising that is targeted to you or other users based on your location, interests, as well as your activities on our Services.\r\n\r\nVerify your identity and prevent impersonation, spam or other unauthorized or illegal activity.\r\n\r\nWe may transfer the information described in this Privacy Policy to, and process and store it in, the United States and other countries, some of which may have less protective data protection laws than the region in which you reside. Where this is the case, we will take appropriate measures to protect your personal information in accordance with this Privacy Policy.\r\n\r\nHOW WE SHARE INFORMATION WE COLLECT\r\nWe may share the information we collect about you as described in this Privacy Policy or as described at the time of collection or sharing, including as follows:\r\n\r\nWith third party Service Providers to enable them to provide the Services you request;\r\n\r\nWith third parties with whom you choose to let us share information, for example other websites or apps that integrate with our API or Services, or those with an API or Service with which we integrate.\r\n\r\nWith Lorem Ipsum subsidiaries and affiliated entities that provide services or conduct data processing on our behalf, or for data verification, data centralization and/or logistics purposes;\r\n\r\nWith vendors, consultants, marketing partners, and other service providers who need access to such information to carry out work on our behalf;\r\n\r\nIn response to a request for information by a competent authority if we believe disclosure is in accordance with, or is otherwise required by, any applicable law, regulation, or legal process;\r\n\r\nWith law enforcement officials, government authorities, or other third parties if we believe your actions are inconsistent with our user agreements, Terms of Service, or policies, or to protect the rights, property, or safety of Lorem Ipsum or others;\r\n\r\nIn connection with, or during negotiations of, any merger, sale of company assets, consolidation or restructuring, financing, or acquisition of all or a portion of our business by or into another company;\r\n\r\nIf we otherwise notify you and you consent to the sharing; and\r\n\r\nIn an aggregated and/or de-identified form which cannot reasonably be used to identify you. We only use such data in the aggregate form and our analytical services do not record any personal information.\r\n\r\nWe may disclose Your Information:\r\n\r\nTo any person who, in our reasonable judgment, is authorized to receive Your Information as your agent, including as a result of your business dealings with that person (for example, your attorney);\r\n\r\nTo our third-party vendors and service providers so that they may provide support for our internal and business operations, including handling of data processing, data verification, data storage, surveys, research, internal marketing, delivery of promotional, marketing and transaction materials, and our Services maintenance and security. These companies are authorized to use Your Information only as necessary to provide these services to us and are contractually obligated to keep Your Information confidential;\r\n\r\nTo third parties when you engage in certain activities through our Services that are sponsored by them, such as purchasing products or services offered by a third party, electing to receive information or communications from a third party, or electing to participate in contests, sweepstakes, games or other programs sponsored, in whole or in part, by a third party. When we disclose Your Information to these third parties, Your Information will become subject to the information use and sharing practices of the third party, and the third party will not be restricted by this Privacy Policy with respect to its use and further sharing of Your Information;\r\n\r\nAs required by law or ordered by a court, regulatory, or administrative agency;\r\n\r\nAs we deem necessary, in our sole discretion, if we believe that you are violating any applicable law, rule or regulation, or are otherwise interfering with another\'s rights or property, including, without limitation, our rights or property;\r\n\r\nTo enforce this Privacy Policy, and any other applicable agreements and policies;\r\n\r\nTo enforce or protect our legal rights.\r\n\r\nSHARING INFORMATION WITH LAW ENFORCEMENT\r\nLorem Ipsum is committed to cooperating with law enforcement while respecting each individual’s right to privacy. If Lorem Ipsum receives a request for user account information from a government agency investigating criminal activity, we will review the request to be certain that it satisfies all legal requirements before releasing information to the requesting agency.\r\n\r\nFurthermore, under 18 U.S.C. §§ 2702(b)(8) and 2702(c)(4) (Voluntary Disclosure Of Customer Communications or Records), Lorem Ipsum may disclose user account information to law enforcement, without a subpoena, court order, or search warrant, in response to a valid emergency when we believe that doing so is necessary to prevent death or serious physical harm to someone. Lorem Ipsum will not release more information than it prudently believes is necessary to prevent harm in an emergency situation.\r\n\r\nSOCIAL MEDIA SHARING\r\nOur Services may now or in the future integrate with social sharing features and other related tools which let you share actions you take on our Services with other Apps, sites, or media, and vice versa. Your use of such features enables the sharing of information with your friends or the public, depending on the settings you establish with the social sharing service. Please refer to the privacy policies of those social sharing services for more information about how they handle the data you provide to or share through them.\r\n\r\nAny information or content that you voluntarily disclose for posting publicly to a social sharing service becomes available to the public, as controlled by any applicable privacy settings that you set with the social sharing service. Once you have shared User Content or made it public, that User Content may be re-shared by others. If you remove information that you posted to the social sharing service, copies may still remain viewable in cached and archived pages, or if other users or third parties, using the social sharing service, have re-shared, copied or saved that User Content.\r\n\r\nANALYTIC SERVICES PROVIDED BY OTHERS\r\nWe may allow others to provide audience measurement and analytics services for us, to serve advertisements on our behalf across the Internet, and to track and report on the performance of those advertisements. These entities may use Cookies, Web Beacons, software development kits (SDKs), and other technologies to identify your device when you visit our Site and use our Services, as well as when you visit other online sites and services.\r\n\r\nLINKS TO THIRD-PARTY WEBSITES\r\nOur Services, as well as the email messages sent with respect to our Services, may contain links or access to websites operated by third parties that are beyond our control. Links or access to third parties from our Services are not an endorsement by us of such third parties, or their websites, applications, products, services, or practices. We are not responsible for the privacy policy, terms and conditions, practices or the content of such third parties. These third-parties may send their own Cookies to you and independently collect data.\r\n\r\nIf you visit or access a third-party Website, application or other property that is linked or accessed from our Services, we encourage you to read any privacy policies and terms and conditions of that third party before providing any personally identifiable information. If you have a question about the terms and conditions, privacy policy, practices or contents of a third party, please contact the third party directly.\r\n\r\nDO NOT TRACK SETTINGS\r\nSome web browsers may give you the ability to enable a \"do not track\" feature that sends signals to the websites you visit, indicating that you do not want your online activities tracked. We do not respond to \"do not track\" signals at this time; if we do so in the future, we will describe how in this Privacy Policy.\r\n\r\nINTERNATIONAL PRIVACY POLICIES\r\nIn order to provide our products and services to you, we may send and store your personal information outside of the country where you reside or are located, including to the United States. Accordingly, if you reside or are located outside of the United States, your personal information may be transferred outside of the country where you reside or are located, including countries that may not, or do not, provide the same level of protection for your personal information. We are committed to protecting the privacy and confidentiality of personal information when it is transferred. If you reside or are located within the European Economic Area and such transfers occur, we take appropriate steps to provide the same level of protection for the processing carried out in any such countries as you would have within the European Economic Area to the extent feasible under applicable law. By using and accessing our products and services, users who reside or are located in countries outside of the United States agree and consent to the transfer to and processing of personal information on servers located outside of the country where they reside, and assume the risk that the protection of such information may be different and may be less protective than those required under the laws of their residence or location.\r\n\r\nACCOUNT INFORMATION\r\nYou may correct your account information at any time by logging into your online account. If you wish to cancel your account, please email us at legal@wasai.co Please note that in some cases we may retain certain information about you as required by law, or for legitimate business purposes to the extent permitted by law.\r\n\r\nPROMOTIONAL INFORMATION OPT OUT\r\nYou may opt out of receiving our newsletters or any other promotional messages from us at any time by following the instructions in those messages sent to you and the link provided therein, or by contacting us at any time using the Contact Us information at the end of this Privacy Policy. If you opt out, we may still send you non-promotional communications, such as those about your account, about Services you have requested, or our ongoing business relations.\r\n\r\nYOUR ACCESS AND RIGHTS TO YOUR PERSONAL INFORMATION\r\nYou have certain rights in relation to Personal Information we hold about you. You can exercise any of the following rights by contacting us using any of the methods in the Contact section below. We may need to request specific information from you to help us confirm your identity and ensure your right to access your Personal Data (or to exercise any of your other rights). This is a security measure to ensure that Personal Data is not disclosed to any person who has no right to receive it. We try to respond to all legitimate requests within one month. Occasionally it may take us longer than a month if your request is particularly complex or you have made a number of requests. In this case, we will notify you and keep you updated.\r\n\r\nRight to Access Your Personal Data. You have the right to access information held about you for the purpose of viewing and in certain cases updating or deleting such information. Furthermore, if you prefer that Lorem Ipsum does not share certain information as described in this Privacy Policy, you can direct Lorem Ipsum not to share that information. We will comply with an individual’s requests regarding access, correction, sharing and/or deletion of the personal data we store in accordance with applicable law. To make changes to your account affecting your personal information contact us at the email address in our Contact section below. For any deletion, non-sharing or update request, we will make the changes as soon as practicable, however this information may stay in our backup files. If we cannot make the changes you want, we will let you know and explain why.\r\n\r\nRight of Correction or Completion of Your Personal Data. If personal information we hold about you is not accurate, out of date or incomplete, you have a right to have the data corrected or completed. To make corrections to your account please contact us at the email address in our Contact section below.\r\n\r\nRight of Erasure or Deletion of Your Personal Data. In certain circumstances, you have the right to request that personal information we hold about you is deleted. If we cannot delete the information you want, we will let you know and explain why. To request information deletion please contact us at the email address in our Contact section below.\r\n\r\nRight to Object to or Restrict Processing of Your Personal Data. In certain circumstances, you have the right to object to our processing of your personal information. For example, you have the right to object to use of your personal information for direct marketing purposes. Similarly, you have the right to object to use of your personal information if we are processing your information on the basis of our legitimate interests and there are no compelling legitimate grounds for our processing which supersede your rights and interests. You may also have the right to restrict our use of your personal information, such as in circumstances where you have challenged the accuracy of the information and during the period where we are verifying its accuracy. To object to or restrict processing please contact us at the email address in our Contact section below.\r\n\r\nRight to Data Portability or Transfer of Your Personal Data. You have the right to be provided with a copy of the information we maintain about you in a structured, machine-readable and commonly used format. To receive a copy of the information we maintain about you please contact us at the email address in our Contact section below.\r\n\r\nRight to Withdrawal of Consent. If you have given your consent to us to process and share your Personal Information after we have requested it, you have the right to withdraw your consent at any time. To withdraw your consent please contact us at the email address in our Contact section below.\r\n\r\nYOUR CALIFORNIA PRIVACY RIGHTS\r\nCalifornia Civil Code Section 1798.83 entitles California residents to request information concerning whether a business has disclosed Personal Information to any third parties for their direct marketing purposes. California residents may request and obtain from us once a year, free of charge, information about the personal information, if any, we disclosed to third parties for direct marketing purposes within the immediately preceding calendar year. If applicable, this information would include a list of the categories of personal information that was shared and the names and addresses of all third parties with which we shared information within the immediately preceding calendar year.\r\n\r\nIf you are a California resident and would like to make such a request, please submit your request in writing to: legal@wasai.co\r\n\r\nOUR INFORMATION RETENTION POLICY\r\nUnless you request that we delete certain information, we retain the information we collect for as long as your account is active or as needed to provide you services. Following termination or deactivation of your account, we will retain information for at least 3 years and may retain the information for as long as needed for our business and legal purposes. We will only retain your Personal Data for so long as we reasonably need to unless a longer retention period is required by law (for example for regulatory purposes).\r\n\r\nCONTACT US\r\nIf you have any questions or if you would like to contact us about our processing of your personal information, including exercising your rights as outlined above, please contact us by any of the methods below. When you contact us, we will ask you to verify your identity.\r\n\r\nContact: Privacy Officer\r\nEmail: legal@wasai.co\r\nOffice: 165 11th St, San Francisco, CA 94103\r\n\r\n© 2015 — 2020\r\nPRIVACY POLICY\r\nSITEMAP\r\nIMAGES\r\nPLUGINS\r\nGENERATORS\r\nSHARE THE LOREM\r\nWA\r\nSAI\r\nClose X\r\nThe standard Lorem Ipsum passage, used since the 1500s\r\n\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"\r\n\r\nSection 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\r\n\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"\r\n\r\n1914 translation by H. Rackham\r\n\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"\r\n\r\nSection 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\r\n\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"\r\n\r\n1914 translation by H. Rackham\r\n\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"', 'html', '2021-03-21 18:26:58', NULL, NULL),
(4, 'how-it-work', 'The standard Lorem Ipsum passage, used since the 1500s\r\n\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"\r\n\r\nSection 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\r\n\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"\r\n\r\n1914 translation by H. Rackham\r\n\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"\r\n\r\nSection 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\r\n\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"\r\n\r\n1914 translation by H. Rackham\r\n\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"', 'html', '2021-03-21 18:26:58', NULL, NULL),
(5, 'join-us-pro', 'The standard Lorem Ipsum passage, used since the 1500s\r\n\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"\r\n\r\nSection 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\r\n\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"\r\n\r\n1914 translation by H. Rackham\r\n\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"\r\n\r\nSection 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\r\n\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"\r\n\r\n1914 translation by H. Rackham\r\n\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"', 'html', '2021-03-21 18:26:58', NULL, NULL);
INSERT INTO `configs` (`id`, `key`, `value`, `type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(6, 'pro-guide', 'The standard Lorem Ipsum passage, used since the 1500s\r\n\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"\r\n\r\nSection 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\r\n\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"\r\n\r\n1914 translation by H. Rackham\r\n\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"\r\n\r\nSection 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\r\n\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"\r\n\r\n1914 translation by H. Rackham\r\n\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"', 'html', '2021-03-21 18:26:58', NULL, NULL),
(7, 'safety', 'The standard Lorem Ipsum passage, used since the 1500s\r\n\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"\r\n\r\nSection 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\r\n\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"\r\n\r\n1914 translation by H. Rackham\r\n\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"\r\n\r\nSection 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\r\n\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"\r\n\r\n1914 translation by H. Rackham\r\n\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"', 'html', '2021-03-21 18:26:58', NULL, NULL),
(8, 'cost-guide', 'The standard Lorem Ipsum passage, used since the 1500s\r\n\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"\r\n\r\nSection 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\r\n\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"\r\n\r\n1914 translation by H. Rackham\r\n\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"\r\n\r\nSection 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\r\n\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"\r\n\r\n1914 translation by H. Rackham\r\n\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"', 'html', '2021-03-21 18:26:58', NULL, NULL),
(9, 'lessons-near-me', 'The standard Lorem Ipsum passage, used since the 1500s\r\n\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"\r\n\r\nSection 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\r\n\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"\r\n\r\n1914 translation by H. Rackham\r\n\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"\r\n\r\nSection 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\r\n\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"\r\n\r\n1914 translation by H. Rackham\r\n\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"', 'html', '2021-03-21 18:26:58', NULL, NULL),
(10, 'faq', 'The standard Lorem Ipsum passage, used since the 1500s\r\n\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"\r\n\r\nSection 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\r\n\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"\r\n\r\n1914 translation by H. Rackham\r\n\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"\r\n\r\nSection 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\r\n\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"\r\n\r\n1914 translation by H. Rackham\r\n\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"', 'html', '2021-03-21 18:26:58', NULL, NULL),
(11, 'teaching-jobs', 'The standard Lorem Ipsum passage, used since the 1500s\r\n\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"\r\n\r\nSection 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\r\n\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"\r\n\r\n1914 translation by H. Rackham\r\n\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"\r\n\r\nSection 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\r\n\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"\r\n\r\n1914 translation by H. Rackham\r\n\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"', 'html', '2021-03-21 18:56:12', NULL, NULL),
(12, 'You-tube', 'http://www.youtube.com', 'string', '2021-03-21 19:34:23', '2021-03-21 14:10:23', NULL),
(13, 'facebook', 'http://www.facebook.com', 'string', '2021-03-21 19:35:07', NULL, NULL),
(14, 'instagram', 'http://www.instagram.com', 'string', '2021-03-21 19:35:07', NULL, NULL),
(15, 'twitter', 'http://www.twitter.com', 'string', '2021-03-21 19:35:07', NULL, NULL),
(16, 'email', 'support@dancenearme.com', 'string', '2021-03-21 19:35:07', NULL, NULL),
(17, 'phone', '9999999999', 'string', '2021-03-21 19:35:07', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `credits`
--

CREATE TABLE `credits` (
  `id` int(11) NOT NULL,
  `credit` int(11) NOT NULL,
  `contact_student` int(11) NOT NULL,
  `cost` decimal(8,2) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `credits`
--

INSERT INTO `credits` (`id`, `credit`, `contact_student`, `cost`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 20, 10, '23.32', '2021-03-26 22:07:05', NULL, NULL),
(2, 30, 15, '34.99', '2021-03-26 22:07:17', NULL, NULL),
(3, 40, 20, '46.65', '2021-03-26 22:07:17', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `gigs`
--

CREATE TABLE `gigs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `price` double(11,2) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(250) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gigs`
--

INSERT INTO `gigs` (`id`, `user_id`, `title`, `price`, `description`, `image`, `created_at`, `updated_at`, `deleted_at`) VALUES
(16, 48, 'Gig Title', 100.00, 'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generato', 'CalcJg8Tos.1616325906.jfif', '2021-03-21 11:25:06', '2021-03-21 11:25:06', NULL),
(17, 48, 'Gig Title 2', 200.00, 'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generato', 'MmFQIlavsI.1616325929.jfif', '2021-03-21 11:25:29', '2021-03-21 11:25:29', NULL),
(18, 48, 'Gig Title 3', 300.00, 'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generato', 'oVVzL9HMUg.1616325950.jfif', '2021-03-21 11:25:50', '2021-03-21 11:25:50', NULL),
(19, 48, 'Gig Title 4', 400.00, 'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generato', '2W94lvFKju.1616325972.jfif', '2021-03-21 11:26:12', '2021-03-21 11:26:12', NULL),
(20, 48, 'Gig Title 5', 500.00, 'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generato', 'YJrXNpjY83.1616325992.jfif', '2021-03-21 11:26:32', '2021-03-21 11:26:32', NULL),
(21, 48, 'Gig Title 5', 500.00, 'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generato', 'zSc3G15Xbc.1616325992.jfif', '2021-03-21 11:26:32', '2021-03-21 11:26:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `dancer_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `dance_id` int(11) DEFAULT NULL,
  `age` varchar(50) DEFAULT NULL,
  `experience` varchar(50) DEFAULT NULL,
  `instructor` text DEFAULT NULL,
  `zip_code` varchar(10) DEFAULT NULL,
  `status` enum('0','1','2','3') NOT NULL DEFAULT '0',
  `accept_date` datetime DEFAULT NULL,
  `complete_date` datetime NOT NULL DEFAULT current_timestamp(),
  `cancel_date` datetime DEFAULT NULL,
  `cancel_reason` longtext DEFAULT NULL,
  `cance_user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `user_id`, `dancer_id`, `service_id`, `dance_id`, `age`, `experience`, `instructor`, `zip_code`, `status`, `accept_date`, `complete_date`, `cancel_date`, `cancel_reason`, `cance_user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(7, 47, 48, 3, 2, '6 or yunger', 'No experience', 'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.', '452010', '0', '2021-03-28 00:00:00', '2021-03-28 19:07:11', '2021-03-28 00:00:00', 'cancel job', 47, '2021-03-28 17:31:47', '2021-03-28 19:08:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `meta_keys`
--

CREATE TABLE `meta_keys` (
  `id` int(11) UNSIGNED NOT NULL,
  `key` varchar(250) NOT NULL,
  `value` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `meta_keys`
--

INSERT INTO `meta_keys` (`id`, `key`, `value`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'name', 'dancenearme', '2021-03-22 22:16:28', '2021-03-22 17:36:19', NULL),
(3, 'description', 'best online dancer near you', '2021-03-22 23:06:57', NULL, NULL),
(4, 'charset', 'UTF-8', '2021-03-22 23:09:31', NULL, NULL),
(5, 'keywords', 'dancenearme', '2021-03-22 23:09:51', NULL, NULL),
(6, 'author', 'Dance near me', '2021-03-22 23:10:08', '2021-03-22 17:46:02', NULL),
(7, 'url', 'http://www.codezens.com/dancenearme', '2021-03-22 23:10:35', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `body` text DEFAULT NULL,
  `sender_id` int(11) UNSIGNED NOT NULL,
  `receiver_id` bigint(20) DEFAULT NULL,
  `is_read` enum('0','1') NOT NULL DEFAULT '0',
  `notification_id` bigint(20) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `meta_data` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `title`, `body`, `sender_id`, `receiver_id`, `is_read`, `notification_id`, `type`, `meta_data`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Your product like byRakesh Purohit', 'POCO X3 (Shadow Gray, 128 GB)  (6 GB RAM)', 3, 0, '0', NULL, NULL, 'a:0:{}', '2020-12-18 08:21:43', NULL, NULL),
(2, 'Your product like byRakesh Purohit', 'POCO X3 (Shadow Gray, 128 GB)  (6 GB RAM)', 3, 0, '0', NULL, NULL, 'a:1:{s:2:\"id\";s:1:\"9\";}', '2020-12-18 08:23:50', NULL, NULL),
(3, 'New order place byRakesh Purohit', 'emutz Pink Teddy Bear With Cap - 12 Inch (Pink) - 12 inch  (Pink)', 3, 0, '0', NULL, NULL, 'a:1:{s:2:\"id\";s:2:\"14\";}', '2020-12-18 08:39:48', NULL, NULL),
(4, 'New order place byRakesh Purohit', 'emutz Pink Teddy Bear With Cap - 12 Inch (Pink) - 12 inch  (Pink)', 3, 0, '0', NULL, NULL, 'a:1:{s:2:\"id\";i:15;}', '2020-12-18 08:40:38', NULL, NULL),
(5, 'Successfully accepted byTony Stark', 'emutz Pink Teddy Bear With Cap - 12 Inch (Pink) - 12 inch  (Pink)', 2, 0, '0', NULL, NULL, 'a:1:{s:2:\"id\";s:1:\"3\";}', '2020-12-18 09:01:35', NULL, NULL),
(6, 'Order accepted byTony Stark', 'emutz Pink Teddy Bear With Cap - 12 Inch (Pink) - 12 inch  (Pink)', 2, 0, '0', NULL, NULL, 'a:1:{s:2:\"id\";s:1:\"3\";}', '2020-12-18 09:05:33', NULL, NULL),
(7, 'Order declined byTony Stark', 'emutz Pink Teddy Bear With Cap - 12 Inch (Pink) - 12 inch  (Pink)', 2, 0, '0', NULL, NULL, 'a:1:{s:2:\"id\";s:1:\"3\";}', '2020-12-18 09:07:37', NULL, NULL),
(8, 'Order accepted byTony Stark', 'emutz Pink Teddy Bear With Cap - 12 Inch (Pink) - 12 inch  (Pink)', 2, 0, '0', NULL, NULL, 'a:1:{s:2:\"id\";s:1:\"3\";}', '2020-12-18 09:07:57', NULL, NULL),
(9, 'Order accepted', 'Order accepted byA One Technology', 2, 0, '0', NULL, NULL, 'a:1:{s:2:\"id\";s:1:\"3\";}', '2020-12-18 09:23:34', NULL, NULL),
(10, 'Order accepted', 'Order accepted byA One Technology', 2, 0, '0', NULL, NULL, 'a:1:{s:2:\"id\";s:1:\"3\";}', '2020-12-18 10:44:04', NULL, NULL),
(11, 'Order accepted', 'Order accepted byA One Technology', 2, 0, '0', NULL, NULL, 'a:1:{s:2:\"id\";s:1:\"3\";}', '2020-12-18 10:54:34', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('wstkpeng@gmail.com', '$2y$10$PKZLjOGFgSjkqrzjSn4XKO6fgcPNeG2o7uAUeZpe0Z/fPrdx7y9Yy', '2020-12-12 09:39:48'),
('ivan.grceo@gmail.com', '$2y$10$D6Rcdrz7iuRRuztlFjkfV.E7KgxwKEtCGWA1sSYjI1xIldopSV4VG', '2020-12-14 05:19:55'),
('dcy89@hotmail.my', '$2y$10$2zmmHGAe/jPo4r9sX3rc/OKyGa.pkX.s5hA2EWQzr/8SpuQL2NoAi', '2020-12-14 06:07:53'),
('ericshim8688@gmail.com', '$2y$10$WFKx1n49BEskOPhqeLF7Yet1pZP/6zeRfHGTI1GZ63oYTgNcyb0GG', '2020-12-14 06:21:08'),
('ericshim1988@gmail.com', '$2y$10$5/gWKACnNGpLLjKpZv8OreclwlJvCRgWcEouj7nlZx0TYQZ/1mDtq', '2020-12-14 06:21:29'),
('tony.stark@gmail.com', '$2y$10$nKo8CWznfRETW/jKl2QQjOnegtJsQHY4hT.creKfhutWpsmhW8Swa', '2020-12-25 12:58:34'),
('shivamyadav8959@gmail.com', '$2y$10$Z55XyLBOPg4Xrqt6QA1Zz.qs.9fX2EuimjpMK/8F3CnBoFP0l5cpy', '2021-03-05 11:58:56');

-- --------------------------------------------------------

--
-- Table structure for table `rating_reviews`
--

CREATE TABLE `rating_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `gig_id` int(11) DEFAULT NULL,
  `rating` enum('1','2','3','4','5') NOT NULL DEFAULT '1',
  `review` text CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rating_reviews`
--

INSERT INTO `rating_reviews` (`id`, `user_id`, `teacher_id`, `job_id`, `gig_id`, `rating`, `review`, `created_at`, `updated_at`, `deleted_at`) VALUES
(16, 47, NULL, 7, NULL, '3', 'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.', '2021-03-28 17:57:01', '2021-03-28 17:57:01', NULL),
(17, 48, NULL, 48, NULL, '5', 'lorem ipsum', '2021-04-01 18:11:45', '2021-04-01 18:11:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1',
  `image` varchar(250) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `user_id`, `title`, `description`, `is_active`, `image`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 24, 'Acting', 'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.', '1', NULL, '2021-03-07 22:14:13', NULL, NULL),
(2, 24, 'Film Direction', 'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.', '1', NULL, '2021-03-07 22:15:27', NULL, NULL),
(3, 24, 'Film Acting', 'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.', '1', NULL, '2021-03-07 22:15:27', NULL, NULL),
(4, 24, 'Film And TV Acting', 'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.', '1', NULL, '2021-03-07 22:15:27', NULL, NULL),
(5, 24, 'Film Production', 'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.', '1', NULL, '2021-03-07 22:15:27', NULL, NULL),
(7, 1, 'title 3', 'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.', '1', 'GO4Pqtbjmr.1616352273.jpg', '2021-03-22 00:05:00', '2021-03-21 18:39:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `teacher_services`
--

CREATE TABLE `teacher_services` (
  `id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teacher_services`
--

INSERT INTO `teacher_services` (`id`, `teacher_id`, `service_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 48, 4, '2021-03-21 23:27:49', NULL, NULL),
(4, 48, 2, '2021-03-21 23:27:49', NULL, NULL),
(5, 48, 5, '2021-03-21 23:27:49', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `pack_id` int(11) NOT NULL,
  `credit` int(11) NOT NULL,
  `contact_student` int(11) NOT NULL,
  `cost` double(8,2) NOT NULL,
  `transaction_id` varchar(250) DEFAULT NULL,
  `transaction_amount` double(8,2) DEFAULT NULL,
  `transaction_status` enum('pending','success','failure','') NOT NULL DEFAULT 'pending',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `teacher_id`, `pack_id`, `credit`, `contact_student`, `cost`, `transaction_id`, `transaction_amount`, `transaction_status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(8, 48, 2, 30, 15, 34.99, 'PAYID-MBPQEMI1A020750A94495300', NULL, 'success', '2021-03-27 15:30:51', NULL, NULL),
(12, 48, 1, 20, 10, 23.32, 'PAYID-MBPQMEA7TC14314EP630645A', NULL, 'success', '2021-03-27 15:49:03', NULL, NULL),
(13, 48, 2, 30, 15, 34.99, 'PAYID-MBPQNOA1WS3240952137571X', NULL, 'success', '2021-03-27 15:50:13', NULL, NULL),
(14, 48, 1, 20, 10, 23.32, 'PAYID-MBPRGPI6VP82204SS168234S', NULL, 'success', '2021-03-27 16:43:41', NULL, NULL),
(15, 48, 3, 40, 20, 46.65, 'PAYID-MBPRHFY9KB78405HK3836617', NULL, 'success', '2021-03-27 16:45:25', NULL, NULL),
(16, 48, 1, 20, 10, 23.32, 'PAYID-MBPRLNA6GS469825Y3954243', NULL, 'success', '2021-03-27 16:54:12', NULL, NULL),
(17, 48, 1, 20, 10, 23.32, 'PAYID-MBPRR3I63S77986710208052', NULL, 'success', '2021-03-27 18:34:19', NULL, NULL),
(18, 48, 1, 20, 10, 23.32, 'PAYID-MBQN2XY1YW91155KP9001134', NULL, 'success', '2021-03-29 01:18:35', NULL, NULL),
(19, 48, 1, 20, 10, 23.32, 'ch_1Ib8TxKgSxBKk9IIaIWXiImj', NULL, 'success', '2021-03-31 23:39:42', NULL, NULL),
(20, 48, 1, 20, 10, 23.32, 'ch_1Ib8V3KgSxBKk9IIlYbuTJPi', NULL, 'success', '2021-03-31 23:40:49', NULL, NULL),
(21, 48, 1, 20, 10, 23.32, 'ch_1Ib8cIKgSxBKk9IIODDmt9OU', NULL, 'success', '2021-03-31 23:48:19', NULL, NULL),
(22, 48, 1, 20, 10, 23.32, 'ch_1Ib8ccKgSxBKk9IIVHZ9LoSp', NULL, 'success', '2021-03-31 23:48:39', NULL, NULL),
(23, 48, 1, 20, 10, 23.32, 'ch_1Ib8eWKgSxBKk9IIJA0MbYBJ', NULL, 'success', '2021-03-31 23:50:36', NULL, NULL),
(24, 48, 1, 20, 10, 23.32, 'ch_1Ib8gYKgSxBKk9II6rez9bIT', NULL, 'success', '2021-03-31 23:52:44', NULL, NULL),
(25, 48, 1, 20, 10, 23.32, 'ch_1Ib8hKKgSxBKk9II7y8KaIIs', NULL, 'success', '2021-03-31 23:53:31', NULL, NULL),
(26, 48, 1, 20, 10, 23.32, 'ch_1Ib8irKgSxBKk9IIGZJlPYDC', NULL, 'success', '2021-03-31 23:55:06', NULL, NULL),
(27, 48, 1, 20, 10, 23.32, 'ch_1IbUhPKgSxBKk9IIutpJ5l8i', NULL, 'success', '2021-04-01 23:23:05', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '3' COMMENT '1 for admin, 2 for Vendor, 3 for User',
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `phone_verified_at` datetime DEFAULT NULL,
  `location_verified_at` datetime DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` int(10) DEFAULT NULL,
  `device_type` enum('0','1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '1 for android, 2 for IOS',
  `device_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `bio` text CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `social_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_type` enum('web','andoid','ios','') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_notify` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `deleted_reason` text CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `deactive_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `travel_distance` int(11) DEFAULT NULL,
  `business_info` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lng` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `credit_points` decimal(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `first_name`, `last_name`, `name`, `email`, `phone`, `profile_image`, `email_verified_at`, `phone_verified_at`, `location_verified_at`, `password`, `city`, `address`, `zip_code`, `device_type`, `device_token`, `is_active`, `bio`, `social_id`, `login_type`, `remember_token`, `is_notify`, `deleted_reason`, `deactive_reason`, `travel_distance`, `business_info`, `country`, `lat`, `lng`, `is_featured`, `credit_points`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1', 'Dance', 'Nearme', 'Dance Near Me', 'admin@gmail.com', '999999999', NULL, NULL, NULL, NULL, '$2y$10$BoVK0DNAtHkUAusrDPnLoeCJ0AhvtzHFJShAHc8cdcmVGxBn.hao2', 'Indore', NULL, 452010, '0', NULL, '1', 'Lorem ipsum', '', NULL, 'FQktH83x3ekJIAGvwXvQKFxtAyAyYDZBtmLqdPYmQu9Sz9k6L9fCzBlm0IxR', '1', NULL, NULL, NULL, '', 'India', NULL, NULL, '1', '0.00', NULL, '2021-03-05 12:51:24', NULL),
(47, '3', 'Rahul', 'Yadav', 'Rahul Yadav', 'rahul@gmail.com', '8959070299', 'abCFfF5m99.1616324937.jfif', NULL, NULL, NULL, '$2y$10$AN.fpVMhrEnbO76HeVoDN.IloI9QIWHvwCGSJvEwiVSQveh9i64Re', NULL, NULL, NULL, '0', NULL, '1', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0.00', '2021-03-21 11:04:43', NULL, NULL),
(48, '2', 'Shivam', 'Yadav', 'Shivam Yadav', 'shivam@gmail.com', '4395345343', 'IBwnaeqzrb.1616325165.jpg', NULL, NULL, NULL, '$2y$10$OM8y4Dww/RN3Ysfr8vSrgOyJcI2Wea/DfsMO.a0uWHlOvpBj.lPkS', NULL, NULL, NULL, '0', NULL, '1', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book.', NULL, NULL, 'cofnOiI0W8lgMVhMN5t1Rk7tA11xO6pKQf2DEF9LON8GSi2jByzLzM1xLR4e', '1', NULL, NULL, NULL, 'My Profile\r\n\r\nShivam Yadav\r\n     0.0\r\n 5 hours from now in bussiness\r\n\r\n,\r\n\r\nCredentials\r\n Location Verified   Mail Verified   Number Verified \r\nAbout\r\n\r\nLorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book.', NULL, NULL, NULL, '1', '20460.00', '2021-03-21 11:10:06', '2021-03-21 05:47:13', NULL),
(49, '2', 'krishna', 'Yadav', 'krishna Yadav', 'krishnayaduwanshi7@gmail.com', '5435345435', NULL, NULL, NULL, NULL, '$2y$10$9RVv9OFGMmtqcKvAa2ANwel5vaRgGiJ8NKwlXfuHXmNXPxtzOUJFy', NULL, NULL, NULL, '0', NULL, '1', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, '22.9734229', '78.6568942', '1', '0.00', '2021-03-27 15:34:15', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_dances`
--

CREATE TABLE `user_dances` (
  `id` int(11) NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `dance_id` int(11) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_dances`
--

INSERT INTO `user_dances` (`id`, `user_id`, `dance_id`, `created_at`, `update_at`, `deleted_at`) VALUES
(20, 48, 2, '2021-03-21 23:06:42', NULL, NULL),
(21, 48, 3, '2021-03-21 23:06:42', NULL, NULL),
(22, 48, 1, '2021-03-21 23:06:42', NULL, NULL),
(23, 49, 2, '2021-03-27 21:04:15', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_portfolios`
--

CREATE TABLE `user_portfolios` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `image` varchar(250) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_portfolios`
--

INSERT INTO `user_portfolios` (`id`, `user_id`, `image`, `created_at`, `update_at`, `deleted_at`) VALUES
(60, 48, 'RvsSkNwXQl.1616325722.jfif', '2021-03-21 16:52:02', NULL, NULL),
(61, 48, '6k68e2LoYC.1616325728.jfif', '2021-03-21 16:52:08', NULL, NULL),
(62, 48, 'JNtTdvEs2W.1616325733.jfif', '2021-03-21 16:52:13', NULL, NULL),
(63, 48, '6zPnz5Cvym.1616325740.jfif', '2021-03-21 16:52:20', NULL, NULL),
(64, 48, 'D3dGuzc4nw.1616325744.jfif', '2021-03-21 16:52:24', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_question_answers`
--

CREATE TABLE `user_question_answers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_question_answers`
--

INSERT INTO `user_question_answers` (`id`, `user_id`, `question`, `answer`, `created_at`, `updated_at`, `deleted_at`) VALUES
(9, 48, 'question 1', 'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generato', '2021-03-21 11:21:38', '2021-03-21 11:21:38', NULL),
(10, 48, 'question2', 'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generato', '2021-03-21 11:21:46', '2021-03-21 11:21:46', NULL),
(11, 48, 'question 3', 'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generato', '2021-03-21 11:21:53', '2021-03-21 11:21:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_service_types`
--

CREATE TABLE `user_service_types` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `service_type` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_service_types`
--

INSERT INTO `user_service_types` (`id`, `user_id`, `service_type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 35, 1, '2021-02-27 16:11:25', NULL, NULL),
(2, 35, 2, '2021-02-27 16:11:25', NULL, NULL),
(3, 36, 1, '2021-02-27 16:14:47', NULL, NULL),
(4, 37, 1, '2021-02-27 16:25:26', NULL, NULL),
(5, 37, 3, '2021-02-27 16:25:26', NULL, NULL),
(6, 38, 2, '2021-02-27 16:42:54', NULL, NULL),
(7, 39, 1, '2021-02-27 16:54:11', NULL, NULL),
(8, 39, 2, '2021-02-27 16:54:11', NULL, NULL),
(9, 39, 3, '2021-02-27 16:54:11', NULL, NULL),
(10, 40, 1, '2021-02-27 16:56:40', NULL, NULL),
(11, 40, 3, '2021-02-27 16:56:40', NULL, NULL),
(12, 41, 1, '2021-02-27 17:08:11', NULL, NULL),
(13, 41, 3, '2021-02-27 17:08:11', NULL, NULL),
(14, 42, 2, '2021-03-03 22:52:55', NULL, NULL),
(15, 43, 1, '2021-03-05 23:39:28', NULL, NULL),
(16, 44, 2, '2021-03-07 15:21:29', NULL, NULL),
(17, 48, 1, '2021-03-21 16:40:06', NULL, NULL),
(18, 48, 2, '2021-03-21 16:40:06', NULL, NULL),
(19, 48, 3, '2021-03-21 16:40:06', NULL, NULL),
(20, 49, 2, '2021-03-27 21:04:15', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_social_links`
--

CREATE TABLE `user_social_links` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `link` varchar(250) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_social_links`
--

INSERT INTO `user_social_links` (`id`, `user_id`, `title`, `link`, `created_at`, `updated_at`, `deleted_at`) VALUES
(17, 48, 'Facebook', 'www.facebook.com', '2021-03-21 11:20:23', '2021-03-21 11:20:23', NULL),
(18, 48, 'Instagram', 'www.instagram.com', '2021-03-21 11:20:38', '2021-03-21 11:20:38', NULL),
(19, 48, 'You Tube', 'www.youtube.com', '2021-03-21 11:20:51', '2021-03-21 11:20:51', NULL),
(20, 48, 'Twitter', 'www.twitter.com', '2021-03-21 11:21:08', '2021-03-21 11:21:08', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `configs`
--
ALTER TABLE `configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `credits`
--
ALTER TABLE `credits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gigs`
--
ALTER TABLE `gigs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meta_keys`
--
ALTER TABLE `meta_keys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`(191));

--
-- Indexes for table `rating_reviews`
--
ALTER TABLE `rating_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teacher_services`
--
ALTER TABLE `teacher_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_dances`
--
ALTER TABLE `user_dances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_portfolios`
--
ALTER TABLE `user_portfolios`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_question_answers`
--
ALTER TABLE `user_question_answers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_service_types`
--
ALTER TABLE `user_service_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_social_links`
--
ALTER TABLE `user_social_links`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `configs`
--
ALTER TABLE `configs`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `credits`
--
ALTER TABLE `credits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `gigs`
--
ALTER TABLE `gigs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `meta_keys`
--
ALTER TABLE `meta_keys`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `rating_reviews`
--
ALTER TABLE `rating_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `teacher_services`
--
ALTER TABLE `teacher_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `user_dances`
--
ALTER TABLE `user_dances`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `user_portfolios`
--
ALTER TABLE `user_portfolios`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `user_question_answers`
--
ALTER TABLE `user_question_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user_service_types`
--
ALTER TABLE `user_service_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `user_social_links`
--
ALTER TABLE `user_social_links`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
