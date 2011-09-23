		<article id="content">
			Shared to-do lists let you manage and share schedules with your friends!
			<figure id="slideshow">
				<div class="img_container">
					<img src="images/fmn-A.jpg" alt="A" title="FMN: the exciting shared To-Do List website! Read more <a href='./features'>here</a>!"/>
					<img src="images/fmn-B.jpg" alt="B" title="Are you feeling a little confused?<br />See our <a href='./faq'>FAQ</a> and we'll point you in the right direction!"/>
					<img src="images/fmn-C.jpg" alt="C" title="We do our utmost to ensure that your data is safely secured.<br />Read about our <a href='./privacy'>privacy policy</a>!"/>
					<img src="images/fmn-D.jpg" alt="D" title="Wanna join? It's easy!<br />Just fill in the form to your right and you're set!"/>
				</div>
				<nav>
					<ul></ul>
				</nav>
				<figcaption></figcaption>
			</figure>
			<a href="features">Learn more...</a>
		</article>

		<aside id="registration">
			<form id="signup_form" name="signup" method="post" action="./" onsubmit="return validate_registration();">
				<h1>Forget-Me-Not Sign Up</h1>
				<p>Register and share lists with your friends!</p>

				<label for="new_user">Username
					<span class="highlight">Enter a username</span>
				</label>
				<input type="text" name="new_user" id="new_user" required="required" value="<?php echo $_REQUEST['new_user']; ?>" />

				<label for="email">Email
					<span class="highlight">Enter an email address</span>
				</label>
				<input type="email" name="email" id="email" required="required" value="<?php echo $_REQUEST['email']; ?>" />

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

				<button type="submit">Sign Up</button>
				<!--<input type="submit" value="Sign Up" />-->
			</form>
		</aside>
