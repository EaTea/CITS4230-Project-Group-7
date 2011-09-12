        <article id="ex_main">
        <header>
        <h1>Shared TO-DO List lets you to connect and share Lists with your Friends!</h1>
        </header>
        <div class="front_image">
        </div>
        <footer>
        <p><a href="#">Learn more...</a></p>
        </footer>
        </article>

        <aside id="registration">
        <!--<div id="reg_form_container">
        <h3>Sign Up to Share List:</h3>
        <form id="reg_form">
            <div id="reg_form_box" class="general_form">
             <table class="inputs" cellspacing="0" cellpadding="1">
               <tbody>
                <tr>
                   <td class="label"><label for="first_name">First Name:</label></td>
                   <td><div class="field_container"><input id="first_name" name="first_name" type="text" placeholder="Your Given Names"></div></td>
                </tr>
                <tr>
                   <td class="label"><label for="last_name">Last Name:</label></td>
                   <td><div class="field_container"><input id="last_name" name="last_name" type="text" placeholder="Your Surname"/></div></td>
                </tr>
                <tr>
                   <td class="label"><label for="email">Email address:</label></td> 
                   <td><div class="field_container"><input id="email" name="email" type="email"/></div></td>
                </tr>
                <tr>
                   <td class="label"><label for="email_confirm">Confirm Email:</label></td> 
                   <td><div class="field_container"><input id="email_confirm" name="email_confirm" type="email"/></div></td>
                </tr>
                <tr>
                   <td class="passwd"><label for="passpwd">New Password:</label></td> 
                   <td><div class="field_container"><input id="passwd" name="passwd" type="password" required /></div></td>
                </tr>
                <tr>
                    <td class="label">Gender:</td>
                    <td>
                        <div class="field_container">
                          <select id="gender" class="select" name="gender">
                            <option value="0">Select Sex:</option>
                            <option value="1">Female</option>
                            <option value="2">Male</option>
                          </select>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="reg_button">
                          <input id="sign_up" type="submit" value="Register"/>
                        </div>
                    </td>
                </tr>
               </tbody>
             </table>
           </div>
        </form>
        </div>-->
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
                <input type="password" name="password" id="password" required />
 
                <button  type="submit">Sign Up</button>
                <div class="spacer"></div>
 
            </form>
            </div>
        </aside>

