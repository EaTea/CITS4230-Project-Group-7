		<div id="main_content">
			<header>
				<h1>Shared TO-DO List lets you to connect and share Lists with your Friends!</h1>
			</header>
			<div class="front_image"></div>
			<footer>
				<p><a href="#">Learn more...</a></p>
			</footer>
		</div>

		<aside id="registration">
			<div id="reg_form" class="todo-form">
				<form id="form" name="form" method="post" action="#">
					<h1>To-Do List Sign Up</h1>
					<p>Register and share list with your friends!</p>

					<label>First Name
						<span class="highlight">Add your first names</span>
					</label>
					<input type="text" name="first_name" id="first_name" />

					<label>Last Name
						<span class="highlight">Add your surname</span>
					</label>
					<input type="text" name="last_name" id="last_name" />

					<label>Gender
						<span class="highlight">Select your sex</span>
					</label>
					<select id="gender" name="gender">
						<option value="0">-Select Sex-</option>
						<option value="1">Female</option>
						<option value="2">Male</option>
					</select>

					<label>Email
						<span class="highlight">Add a valid address</span>
					</label>
					<input type="email" name="email" id="email" />

					<label>Confirm Email
						<span class="highlight">Confirm your above email</span>
					</label>
					<input type="email" name="confirm_email" id="confirm_email" />

					<label>New Password
						<span class="highlight">Min. size 6 chars</span>
					</label>
					<input type="password" name="password" id="password" required="required" />

					<button  type="submit">Sign Up</button>
					<div class="spacer"></div>

				</form>
			</div>
		</aside>
