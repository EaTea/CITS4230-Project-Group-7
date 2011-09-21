<!DOCTYPE HTML>
<html lang="en-AU">
<head>
	<meta charset="utf-8" />
	<title>XYZ: <?php echo $title; ?></title>
	<meta name="no-email-collection" content="http://www.unspam.com/noemailcollection" />
	<!-- global externals -->
	<link rel="icon" type="image/png" href="<?php echo $top_level; ?>/global/images/favicon.png"/>
	<link rel="stylesheet" type="text/css" href="<?php echo $top_level; ?>/global/style.css" />
	<script type="application/ecmascript" src="<?php echo $top_level; ?>/global/script.es"></script>
	<!-- local externals -->
	<link rel="stylesheet" type="text/css" href="style.css" />
	<script type="application/ecmascript" src="script.es"></script>
</head>
<body onload="load()">
	<!-- header -->
	<header>
		<!-- accessibility access -->
		<nav hidden="hidden" id="accessibility_access">
			<a href="#main" accesskey="c">Go to page body</a>
			<a href="#top_bar" accesskey="m">Go to main menu</a>
			<a href="#bottom_bar" accesskey="i">Go to content info</a>
			<!--<a href="#s" accesskey="s" onclick="$('#s').focus(); return false;">Go to the search field</a>-->
		</nav>
		<!-- domain bar -->
		<div id="domain_bar">
			<div>
				<a href="<?php echo $top_level; ?>"><strong><?php echo $top_host; ?></strong><?php echo ucwords(str_replace("_"," ", str_replace("/", " › ", $current_path))); ?></a>
			</div>
		</div>
	</header>
	<!-- top navbar -->
	<nav id="top_bar">
		<ul>
			<li><a href="<?php echo $top_level; ?>" title="Home">Home</a></li>
		</ul>
	</nav>
	<!-- page body -->
	<section id="main">
