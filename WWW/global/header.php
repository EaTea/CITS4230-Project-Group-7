<?php $TOP_LEVEL = "http://student.csse.uwa.edu.au/~20503332/CITS4230/"; ?>
<!DOCTYPE HTML>
<html lang="en-AU">
<head>
	<meta charset="utf-8" />
	<title>XYZ: <?php echo $TITLE; ?></title>
	<link rel="icon" type="image/png" href="<?php echo $TOP_LEVEL; ?>images/favicon.png"/>
	<link rel="stylesheet" type="text/css" href="<?php echo $TOP_LEVEL; ?>global/style.css" />
	<script type="application/javascript" src="<?php echo $TOP_LEVEL; ?>global/script.js"></script>
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
				<a href="./"><strong><?php echo $_SERVER['SERVER_NAME']; ?></strong> <?php echo $_SERVER['PHP_SELF']; ?></a>
			</div>
		</div>
		<!-- top navbar -->
		<nav id="top_bar">
			<ul>
				<li><a href="./" title="Home">Home</a></li>
			</ul>
		</nav>
		<!-- home banner -->
		<div id="home_banner">
			<a href="./">
				<?php // Placeholder for now
				echo '<img src="images/banner.jpg" alt="XYZ: The Shared Todo List" title="XYZ: The Shared Todo List" />';
				?>
			</a>
		</div>
	</header>
	<!-- main contents -->
	<section id="main">
