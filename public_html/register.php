<?php
	if ($_REQUEST["new_user"] != "" && $_REQUEST["email"] != "" && $_REQUEST["v_email"] == $_REQUEST["email"] && $_REQUEST["new_pass"] != "" && $_REQUEST["v_pass"] == $_REQUEST["new_pass"]) {
		echo '<p>You have successfully registered to FMN.<!-- You should recieve an email shortly to confirm your registration.--> We hope you enjoy our service.</p>';
	}
	else {
		echo '
		<aside id="registration">
			<form id="signup_form" name="signup" method="post" action="./" onsubmit="return validate_registration();">
				<h1>Forget-Me-Not Sign Up</h1>
				<p>Register and share lists with your friends!</p>

				<label for="new_user">Username
					<span class="highlight">Enter a username</span>
				</label>
				<input type="text" name="new_user" id="new_user" required="required" value="'.$_REQUEST['new_user'].'" />

				<label for="email">Email
					<span class="highlight">Enter an email address</span>
				</label>
				<input type="email" name="email" id="email" required="required" value="'.$_REQUEST['email'].'" />

				<label for="v_email">Confirm Email
					<span class="highlight">Confirm the above email</span>
				</label>
				<input type="email" name="v_email" id="v_email" required="required" />

				<label for="new_pass">Password
					<span class="highlight">Min. size 6 chars</span>
				</label>
				<input type="password" name="new_pass" id="new_pass" required="required" />

				<label for="v_pass">Confirm Password
					<span class="highlight">Min. size 6 chars</span>
				</label>
				<input type="password" name="v_pass" id="v_pass" required="required" />

				<button type="submit" value="Sign Up">Sign Up</button>
				<!--<input type="submit" value="Sign Up" />-->
			</form>
		</aside>
		';
	}
?>
