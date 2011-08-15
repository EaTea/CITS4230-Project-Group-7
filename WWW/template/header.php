<!DOCTYPE HTML>
<html lang="en-AU">
<head>
	<meta charset="utf-8" />
	<title>XYZ: The Shared Todo List</title>
	<link rel="icon" type="image/png" href="logo-16.png"/>
	<link rel="stylesheet" type="text/css" href="style.css" />
	<script type="application/javascript" src="script.js"></script>
</head>
<body>
	<!-- accessibility access -->
	<nav hidden="hidden" id="accessibility_access">
		<a href="#main" accesskey="c">Go to page content</a>
		<a href="#top_bar" accesskey="m">Go to main menu</a>
		<a href="#s" accesskey="s" onclick="$('#s').focus(); return false;">Go to the search field</a>
	</nav>
	<!-- global domain bar -->
	<div id="global_domain_bar">
		<div>
			<a href="/"><strong>XYZ:</strong> The Shared Todo List</a>
		</div>
	</div>
	<!-- header -->
	<header>
		<!-- top navbar -->
		<nav id="top_bar">
			<ul>
				<li><a href="index.php" title="Home">Home</a></li>
			</ul>
		</nav>
		<!-- home banner -->
		<div id="home_banner">
			<a href="/">
				<?php // Placeholder for now
				echo '<img src="images/banner.jpg" alt="XYZ: The Shared Todo List" title="XYZ: The Shared Todo List" />';
				?>
			</a>
		</div>
	</header>
	<!-- main contents -->
	<section id="main">
