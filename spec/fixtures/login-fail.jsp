


























<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Openfire Admin Console</title>
	<script language="JavaScript" type="text/javascript">
		<!--
		// break out of frames
		if (self.parent.frames.length != 0) {
			self.parent.location=document.location;
		}
        function updateFields(el) {
            if (el.checked) {
                document.loginForm.username.disabled = true;
                document.loginForm.password.disabled = true;
            }
            else {
                document.loginForm.username.disabled = false;
                document.loginForm.password.disabled = false;
                document.loginForm.username.focus();
            }
        }
		//-->
	</script>
    <link rel="stylesheet" href="style/global.css" type="text/css">
    <link rel="stylesheet" href="style/login.css" type="text/css">
</head>

<body>

<form action="login.jsp" name="loginForm" method="post">



<input type="hidden" name="login" value="true">

<div align="center">
    <!-- BEGIN login box -->
    <div id="jive-loginBox">
        
        <div align="center" id="jive-loginTable">

            <span id="jive-login-header" style="background: transparent url(images/login_logo.gif) no-repeat left; padding: 29px 0 10px 205px;">
            Administration Console
            </span>

            <div style="text-align: center; width: 380px;">
            <table cellpadding="0" cellspacing="0" border="0" align="center">
                <tr>
                    <td align="right" class="loginFormTable">

                        <table cellpadding="2" cellspacing="0" border="0">
                        <noscript>
                            <tr>
                                <td colspan="3">
                                    <table cellpadding="0" cellspacing="0" border="0">
                                    <tr valign="top">
                                        <td><img src="images/error-16x16.gif" width="16" height="16" border="0" alt="" vspace="2"></td>
                                        <td><div class="jive-error-text" style="padding-left:5px; color:#cc0000;">Error: You don't have JavaScript enabled. This tool uses JavaScript and much of it will not work correctly without it enabled. Please turn JavaScript back on and reload this page.</div></td>
                                    </tr>
                                    </table>
                                </td>
                            </tr>
                        </noscript>
                        
                            <tr>
                                <td colspan="3">
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        
                                    <tr valign="top">
                                        <td><img src="images/error-16x16.gif" width="16" height="16" border="0" alt="" vspace="2"></td>
                                        <td><div class="jive-error-text" style="padding-left:5px; color:#cc0000;">Login failed: make sure your username and password are correct and that you're an admin or moderator.</div></td>
                                    </tr>
                                        
                                    </table>
                                </td>
                            </tr>
                        
                        <tr>
                            <td><input type="text" name="username" size="15" maxlength="50" id="u01" value="badusername"></td>
                            <td><input type="password" name="password" size="15" maxlength="50" id="p01"></td>
                            <td align="center"><input type="submit" value="&nbsp; Login &nbsp;"></td>
                        </tr>
                        <tr valign="top">
                            <td class="jive-login-label"><label for="u01">username</label></td>
                            <td class="jive-login-label"><label for="p01">password</label></td>
                            <td>&nbsp;</td>
                        </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <div align="right" id="jive-loginVersion">
                        Openfire, Version: 3.8.2
                        </div>
                    </td>
                </tr>
            </table>
            </div>
        </div>

    </div>
    <!-- END login box -->
</div>

</form>

<script language="JavaScript" type="text/javascript">
<!--
    if (document.loginForm.username.value == '')  {
	    document.loginForm.username.focus();
    } else {
        document.loginForm.password.focus();
    }
//-->
</script>

</body>
</html>
