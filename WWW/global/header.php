<?php
	if(empty($_SERVER["HTTPS"])) $s = '';
    else if($_SERVER["HTTPS"] == "on") $s = 's';
    else $s = '';
	$current_path = substr($_SERVER['PHP_SELF'],0,strrpos($_SERVER['PHP_SELF'],"/index."));
	$top_level = "http".$s."://".$_SERVER['SERVER_NAME'].$current_path;
?>
<!DOCTYPE HTML>
<html lang="en-AU">
<head>
	<meta charset="utf-8" />
	<title>XYZ: <?php echo $title; ?></title>
	<!-- global externals -->
	<link rel="icon" type="image/png" href="<?php echo $top_level; ?>/images/favicon.png"/>
	<link rel="stylesheet" type="text/css" href="<?php echo $top_level; ?>/global/style.css" />
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
		<!--<a href="#s" accesskey="s" onclick="$('#s').focus(); return false;">Go to the search field</a>-->
	</nav>
	<!-- header -->
	<header>
		<!-- global domain bar -->
		<div id="global_domain_bar">
			<div>
				<a href="<?php echo $top_level; ?>"><strong><?php echo $_SERVER['SERVER_NAME']; ?></strong><?php echo str_replace("/", " &gt; ", $current_path); ?></a>
			</div>
		</div>
		<!-- top navbar -->
		<nav id="top_bar">
			<ul>
				<li><a href="<?php echo $top_level; ?>" title="Home">Home</a></li>
			</ul>
		</nav>
		<!-- home banner -->
		<div id="home_banner">
			<a href="<?php echo $top_level; ?>">
				<?php // Placeholder for now
				echo '<img src="images/banner.jpg" alt="XYZ: The Shared Todo List" title="XYZ: The Shared Todo List" />';
				?>
			</a>
		</div>
	</header>
	<!-- main contents -->
	<section id="main">
