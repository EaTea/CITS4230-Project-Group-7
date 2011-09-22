<?php
	$title = "Site-Map";
	if(empty($_SERVER["HTTPS"])) $s = '';
	else if($_SERVER["HTTPS"] == "on") $s = 's';
	else $s = '';
	$top_host = $_SERVER['SERVER_NAME'].dirname($_SERVER['PHP_SELF']);
	$top_rpath = dirname(__FILE__);
	while(!file_exists($top_rpath."/global")) {
		$top_host = dirname($top_host);
		$top_rpath = dirname($top_rpath);
	}
	$top_level = "http".$s."://".$top_host;
	$current_path = substr(dirname(__FILE__), strlen($top_rpath));
	$rel_path = preg_replace('/\/[a-z]*/', "../", $current_path);
	include($top_rpath."/global/header.php");
	include("content.php");
	include($top_rpath."/global/footer.php");
?>
