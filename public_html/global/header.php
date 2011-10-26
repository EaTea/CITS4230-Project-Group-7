<!DOCTYPE HTML>
<html lang="en-AU">
<head>
	<meta charset="utf-8" />
	<title>FMN: <?php echo $title; ?></title>
	<!-- <meta name="no-email-collection" content="http://www.unspam.com/noemailcollection" /> -->
	<!-- global externals -->
	<link rel="icon" type="image/png" href="<?php echo $rel_path; ?>global/images/favicon.png"/>
	<link rel="stylesheet" type="text/css" href="<?php echo $rel_path; ?>global/style.css" />
	<script type="application/ecmascript" src="<?php echo $rel_path; ?>global/base.es"></script>
	<script type="application/ecmascript" src="<?php echo $rel_path; ?>global/script.es"></script>
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
				<a href="<?php echo $top_level; ?>"><strong>FMN</strong><?php echo " › ".$title; ?></a>
			</div>
		</div>
		<div id="logo">
			<?php if ($rel_path == "") echo '<img src="'.$rel_path.'global/images/fmn-logo.png" alt="" />'; ?>
			<a title="Go to home page" href="<?php echo $top_level; ?>">
				<h1>
					<?php if ($rel_path != "") echo '<img src="'.$rel_path.'global/images/fmn-logo.png" alt="FMN: The Shared To-do List Service" />'; ?>
					<strong><span>F</span>orget-<span>M</span>e-<span>N</span>ot</strong>
					<small>We still don't know the task we were supposed to do that day.</small>
				</h1>
			</a>
		</div>
	</header>
	<!-- top navbar -->
	<nav id="top_bar">
		<div>
			<ul id="main_nav_list" data-cp="<?php echo $current_path; ?>">
				<li><a href="<?php echo $rel_path; ?>" title="Home">Home</a></li>
				<li><a href="<?php echo $rel_path; ?>features" title="Features">Features</a></li>
				<li><a href="<?php echo $rel_path; ?>faq" title="FAQ">FAQ</a></li>
			</ul>
		</div>
		<div class="right">
			<form id="login" name="login" method="post" action="<?php echo $rel_path; ?>todo" onsubmit="return validate_login();">
				<input type="text" name="user" id="user" required="required" placeholder="Enter username" />
				<input type="password" name="pass" id="pass" required="required" placeholder="Enter password" />
				<input type="submit" value="Log In" />
			</form>
		</div>
	</nav>
	<!-- page body -->
	<section id="main">
