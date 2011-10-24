<?php
	if ($_REQUEST["new_user"] != "" && $_REQUEST["email"] != "" && $_REQUEST["v_email"] == $_REQUEST["email"] && $_REQUEST["new_pass"] != "" && $_REQUEST["v_pass"] == $_REQUEST["new_pass"]) {
		echo '<p>You have successfully registered to FMN.<!-- You should recieve an email shortly to confirm your registration.--> We hope you enjoy our service.</p>';
	}
	else {
		echo '
		<aside id="registration">
			<form id="signup" name="signup" method="post" action="./" onsubmit="return validate_registration();">
				<header>
					<h1>Forget-Me-Not Sign Up</h1>
					<p>Register and share lists with your friends!</p>
				</header>

				<div class="field">
					<label for="new_user">Username <small>Enter a username</small></label>
					<div><input type="text" name="new_user" id="new_user" required="required" value="'.$_REQUEST['new_user'].'" /></div>
				</div>

				<div class="field">
					<label for="email">Email <small>Enter an email address</small></label>
					<div><input type="email" name="email" id="email" required="required" value="'.$_REQUEST['email'].'" /></div>
				</div>

				<div class="field">
					<label for="v_email">Confirm Email <small>Confirm the above email</small></label>
					<div><input type="email" name="v_email" id="v_email" required="required" /></div>
				</div>

				<div class="field">
					<label for="new_pass">Password <small>Min. size 6 chars</small></label>
					<div><input type="password" name="new_pass" id="new_pass" required="required" /></div>
				</div>

				<div class="field">
					<label for="v_pass">Confirm Password <small>Min. size 6 chars</small></label>
					<div><input type="password" name="v_pass" id="v_pass" required="required" /></div>
				</div>

				<input type="submit" value="Sign Up" />
			</form>
		</aside>
';
	}
?>
