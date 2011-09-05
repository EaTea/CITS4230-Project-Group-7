<!DOCTYPE HTML>
<html lang="en-AU">
<head>
	<meta charset="utf-8" />
	<title>XYZ: <?php echo $title; ?></title>
	<!-- global externals -->
	<link rel="icon" type="image/png" href="<?php echo $top_level; ?>/global/images/favicon.png"/>
	<link rel="stylesheet" type="text/css" href="<?php echo $top_level; ?>/global/style.css" />
        <link rel="stylesheet" type="text/css" href="<?php echo $top_level; ?>/home-style.css" />
	<script type="application/javascript" src="<?php echo $top_level; ?>/global/script.js"></script>
	<!-- local externals -->
	<link rel="stylesheet" type="text/css" href="style.css" />
	<script type="application/javascript" src="script.js"></script>
</head>
<body>
	<!-- accessibility access -->
	<nav hidden="hidden" id="accessibility_access">
		<a href="#main" accesskey="c">Go to page content</a>
		<a href="#top_bar" accesskey="m">Go to main menu</a>
		<a href="#bottom_bar" accesskey="i">Go to content info</a>
		<!--<a href="#s" accesskey="s" onclick="$('#s').focus(); return false;">Go to the search field</a>-->
	</nav>
	<!-- header -->
	<header>
		<!-- domain bar -->
		<div id="domain_bar">
			<div>
				<a href="<?php echo $top_level; ?>"><strong><?php echo $top_host; ?></strong><?php echo ucwords(str_replace("_"," ", str_replace("/", " › ", $current_path))); ?></a>
			</div>
		</div>
		<!-- top navbar -->
		<nav id="top_bar">
			<ul>
				<li><a href="<?php echo $top_level; ?>" title="Home">Home</a></li>
			</ul>
		</nav>
	</header>
	<!-- main contents -->
	<section id="main">
