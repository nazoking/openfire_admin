


















<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">


<html>
<head>
    <title>Openfire Admin Console: System Properties</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="/style/global.css">
    <script language="JavaScript" type="text/javascript" src="/js/prototype.js"></script>
    <script language="JavaScript" type="text/javascript" src="/js/scriptaculous.js"></script>
    <script language="JavaScript" type="text/javascript" src="/js/cookies.js"></script>
    <script language="JavaScript" type="text/javascript">

    </script>
    <script type="text/javascript" src="/js/behaviour.js"></script>
    <script type="text/javascript">
    // Add a nice little rollover effect to any row in a jive-table object. This will help
    // visually link left and right columns.
    /*
    var myrules = {
        '.jive-table TBODY TR' : function(el) {
            el.onmouseover = function() {
                this.style.backgroundColor = '#ffffee';
            }
            el.onmouseout = function() {
                this.style.backgroundColor = '#ffffff';
            }
        }
    };
    Behaviour.register(myrules);
    */
    </script>
    <meta name="pageID" content="server-props"/>
        <meta name="helpPage" content="manage_system_properties.html"/>
</head>

<body id="jive-body">

<!-- BEGIN main -->
<div id="main">

    <div id="jive-header">
        <div id="jive-logo">
            <a href="/index.jsp"><img src="/images/login_logo.gif" alt="Openfire" width="179" height="53" /></a>
        </div>
        <div id="jive-userstatus">
            Openfire 3.8.2<br/>
            Logged in as <strong>nazoking</strong> - <a href="/index.jsp?logout=true">Logout</a>
        </div>
        <div id="jive-nav">
            <div id="jive-nav-left"></div>
            <ul><li class="currentlink">
            <a href="/index.jsp" title="Click to manage server settings" onmouseover="self.status='Click to manage server settings';return true;" onmouseout="self.status='';return true;">Server</a>
            </li><li class="">
            <a href="/user-summary.jsp" title="Click to manage users and groups" onmouseover="self.status='Click to manage users and groups';return true;" onmouseout="self.status='';return true;">Users/Groups</a>
            </li><li class="">
            <a href="/session-summary.jsp" title="Click to manage connected sessions" onmouseover="self.status='Click to manage connected sessions';return true;" onmouseout="self.status='';return true;">Sessions</a>
            </li><li class="">
            <a href="/muc-room-summary.jsp" title="Click to manage group chat settings" onmouseover="self.status='Click to manage group chat settings';return true;" onmouseout="self.status='';return true;">Group Chat</a>
            </li><li class="">
            <a href="/plugin-admin.jsp" title="Click to manage all plugins" onmouseover="self.status='Click to manage all plugins';return true;" onmouseout="self.status='';return true;">Plugins</a>
            </li></ul>
            <div id="jive-nav-right"></div>
        </div>
        <div id="jive-subnav">
            <ul><li class="current">
                <a href="/index.jsp" title=""
                  onmouseover="self.status='';return true;" onmouseout="self.status='';return true;"
                  >Server Manager</a>
            </li><li class="">
                <a href="/profile-settings.jsp" title=""
                  onmouseover="self.status='';return true;" onmouseout="self.status='';return true;"
                  >Server Settings</a>
            </li><li class="">
                <a href="/media-proxy.jsp" title=""
                  onmouseover="self.status='';return true;" onmouseout="self.status='';return true;"
                  >Media Services</a>
            </li><li class="">
                <a href="/plugins/monitoring/stats-dashboard.jsp" title="View overview of server statistics."
                  onmouseover="self.status='View overview of server statistics.';return true;" onmouseout="self.status='';return true;"
                  >Statistics</a>
            </li><li class="">
                <a href="/plugins/monitoring/archive-search.jsp" title="Archiving Settings"
                  onmouseover="self.status='Archiving Settings';return true;" onmouseout="self.status='';return true;"
                  >Archiving</a>
            </li></ul>
        </div>
    </div>

    <div id="jive-main">
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tbody>
        <tr valign="top">
            <td width="1%">
                <div id="jive-sidebar-container">
                    <div id="jive-sidebar-box">
                        <div id="jive-sidebar">
                            <ul><li class="">
                                <a href="/index.jsp" title="Click to view system information"
                                  onmouseover="self.status='Click to view system information';return true;" onmouseout="self.status='';return true;"
                                  >Server Information</a>
                                 
                            </li><li class="currentlink">
                                <a href="/server-properties.jsp" title="Click to manage server properties"
                                  onmouseover="self.status='Click to manage server properties';return true;" onmouseout="self.status='';return true;"
                                  >System Properties</a>
                                 
                            </li><li class="">
                                <a href="/server-locale.jsp" title="Click to set the language and time zone"
                                  onmouseover="self.status='Click to set the language and time zone';return true;" onmouseout="self.status='';return true;"
                                  >Language and Time</a>
                                 
                            </li><li class="">
                                <a href="/system-clustering.jsp" title="Click to manage clustering settings"
                                  onmouseover="self.status='Click to manage clustering settings';return true;" onmouseout="self.status='';return true;"
                                  >Clustering</a>
                                 
                            </li><li class="">
                                <a href="/system-cache.jsp" title="Click to manage data caches"
                                  onmouseover="self.status='Click to manage data caches';return true;" onmouseout="self.status='';return true;"
                                  >Cache Summary</a>
                                 
                            </li><li class="">
                                <a href="/server-db.jsp" title="Click to view database connection information"
                                  onmouseover="self.status='Click to view database connection information';return true;" onmouseout="self.status='';return true;"
                                  >Database</a>
                                 
                            </li><li class="">
                                <a href="/logviewer.jsp" title="Click to view server logs"
                                  onmouseover="self.status='Click to view server logs';return true;" onmouseout="self.status='';return true;"
                                  >Logs</a>
                                 
                            </li><li class="">
                                <a href="/system-email.jsp" title="Click to configure email settings"
                                  onmouseover="self.status='Click to configure email settings';return true;" onmouseout="self.status='';return true;"
                                  >Email Settings</a>
                                 
                            </li><li class="">
                                <a href="/security-audit-viewer.jsp" title="Click to view the security audit logs"
                                  onmouseover="self.status='Click to view the security audit logs';return true;" onmouseout="self.status='';return true;"
                                  >Security Audit Viewer</a>
                                 
                            </li></ul>
                            <br>
                            <img src="/images/blank.gif" width="150" height="1" border="0" alt="">
                        </div>
                    </div>
                </div>
            </td>
            <td width="99%" id="jive-content">


                

                <h1>
                    System Properties
                </h1>

                <div id="jive-main-content">
                    <p>
Below is a list of the system properties. Values for password sensitive fields are hidden. Long property names and values are clipped. Hold your mouse over the property name to see the full value or to see both the full name and value, click the edit icon next to the property.
</p>

<p><b>System Properties</b></p>







<script language="JavaScript" type="text/javascript">
function doedit(propName) {
    document.propform.propName.value = propName;
    document.propform.edit.value = 'true';
    document.propform.action = document.propform.action + '#edit';
    document.propform.submit();
}
function dodelete(propName) {
    var dodelete = confirm('Are you sure you want to delete this property?');
    if (dodelete) {
        document.propform.propName.value = propName;
        document.propform.del.value = 'true';
        document.propform.submit();
        return true;
    }
    else {
        return false;
    }
}
</script>

<form action="server-properties.jsp" method="post" name="propform">
<input type="hidden" name="edit" value="">
<input type="hidden" name="del" value="">
<input type="hidden" name="propName" value="">

<style type="text/css">
.hidebox {
    text-overflow : ellipsis;
    overflow : hidden;
    white-space : nowrap;
}
</style>

<div class="jive-table">
<table cellpadding="0" cellspacing="0" border="0" width="100%">
<thead>
    <tr>
        <th nowrap>Property Name</th>
        <th nowrap>Property Value</th>
        <th style="text-align:center;">Edit</th>
        <th style="text-align:center;">Delete</th>
    </tr>
</thead>
<tbody>

    

    
    <tr class="">

        <td>
            <div class="hidebox" style="width:200px;">
                <span title="clustering.enabled">
                clustering.enabled
                </span>
            </div>
        </td>
        <td>
            <div class="hidebox" style="width:300px;">
                
                <span title="true">true</span>
                
            </div>
        </td>
        <td align="center"><a href="#" onclick="doedit('clustering.enabled');"
                ><img src="images/edit-16x16.gif" width="16" height="16"
                      alt="Click to edit this property" border="0"></a
                >
        </td>
        <td align="center"><a href="#" onclick="return dodelete('clustering.enabled');"
                ><img src="images/delete-16x16.gif" width="16" height="16"
                      alt="Click to delete this property" border="0"></a
                >
        </td>
    </tr>

    
    <tr class="">

        <td>
            <div class="hidebox" style="width:200px;">
                <span title="conversation.idleTime">
                conversation.idleTime
                </span>
            </div>
        </td>
        <td>
            <div class="hidebox" style="width:300px;">
                
                <span title="10">10</span>
                
            </div>
        </td>
        <td align="center"><a href="#" onclick="doedit('conversation.idleTime');"
                ><img src="images/edit-16x16.gif" width="16" height="16"
                      alt="Click to edit this property" border="0"></a
                >
        </td>
        <td align="center"><a href="#" onclick="return dodelete('conversation.idleTime');"
                ><img src="images/delete-16x16.gif" width="16" height="16"
                      alt="Click to delete this property" border="0"></a
                >
        </td>
    </tr>


    <tr class="">

        <td>
            <div class="hidebox" style="width:200px;">
                <span title="jdbcAuthProvider.passwordSQL">
                jdbcAuthProvider.passwordSQL
                </span>
            </div>
        </td>
        <td>
            <div class="hidebox" style="width:300px;">
                
                <span style="color:#999;"><i>hidden</i></span>
                
            </div>
        </td>
        <td align="center"><a href="#" onclick="doedit('jdbcAuthProvider.passwordSQL');"
                ><img src="images/edit-16x16.gif" width="16" height="16"
                      alt="Click to edit this property" border="0"></a
                >
        </td>
        <td align="center"><a href="#" onclick="return dodelete('jdbcAuthProvider.passwordSQL');"
                ><img src="images/delete-16x16.gif" width="16" height="16"
                      alt="Click to delete this property" border="0"></a
                >
        </td>
    </tr>
    

    <tr class="">

        <td>
            <div class="hidebox" style="width:200px;">
                <span title="xmpp.session.conflict-limit">
                xmpp.session.conflict-limit
                </span>
            </div>
        </td>
        <td>
            <div class="hidebox" style="width:300px;">
                
                <span title="0">0</span>
                
            </div>
        </td>
        <td align="center"><a href="#" onclick="doedit('xmpp.session.conflict-limit');"
                ><img src="images/edit-16x16.gif" width="16" height="16"
                      alt="Click to edit this property" border="0"></a
                >
        </td>
        <td align="center"><a href="#" onclick="return dodelete('xmpp.session.conflict-limit');"
                ><img src="images/delete-16x16.gif" width="16" height="16"
                      alt="Click to delete this property" border="0"></a
                >
        </td>
    </tr>

    
    <tr class="">

        <td>
            <div class="hidebox" style="width:200px;">
                <span title="xmpp.socket.ssl.active">
                xmpp.socket.ssl.active
                </span>
            </div>
        </td>
        <td>
            <div class="hidebox" style="width:300px;">
                
                <span title="true">true</span>
                
            </div>
        </td>
        <td align="center"><a href="#" onclick="doedit('xmpp.socket.ssl.active');"
                ><img src="images/edit-16x16.gif" width="16" height="16"
                      alt="Click to edit this property" border="0"></a
                >
        </td>
        <td align="center"><a href="#" onclick="return dodelete('xmpp.socket.ssl.active');"
                ><img src="images/delete-16x16.gif" width="16" height="16"
                      alt="Click to delete this property" border="0"></a
                >
        </td>
    </tr>

    

</tbody>
</table>
</div>

</form>

<br><br>

<a name="edit"></a>
<form action="server-properties.jsp" method="post" name="editform">

<div class="jive-table">
<table cellpadding="0" cellspacing="0" border="0" width="100%">
<thead>
    <tr>
        <th colspan="2">
            
                Add new property
            
        </th>
    </tr>
</thead>
<tbody>
    <tr valign="top">
        <td>
            Property Name:
        </td>
        <td>
            

                <input type="text" name="propName" size="40" maxlength="100" value="">

                

            
        </td>
    </tr>
    <tr valign="top">
        <td>
            Property Value:
        </td>
        <td>
            <textarea cols="45" rows="5" name="propValue" wrap="virtual"></textarea>

            
        </td>
    </tr>
</tbody>
<tfoot>
    <tr>
        <td colspan="2">
            <input type="submit" name="save" value="Save Property">
            <input type="submit" name="cancel" value="Cancel">
        </td>
    </tr>
</tfoot>
</table>
</div>

</form>

<br><br><br><br><br><br>
<br><br><br><br><br><br>
<br><br><br><br><br><br>
<br><br><br><br><br><br>
                </div>
            </td>
        </tr>
    </tbody>
    </table>
    </div>

</div>
<!-- END main -->

<!-- BEGIN footer -->
	<div id="jive-footer">
        <div class="jive-footer-nav">
            
            <a href="/index.jsp" title="Click to manage server settings" onmouseover="self.status='Click to manage server settings';return true;" onmouseout="self.status='';return true;">Server</a>
             | 
            <a href="/user-summary.jsp" title="Click to manage users and groups" onmouseover="self.status='Click to manage users and groups';return true;" onmouseout="self.status='';return true;">Users/Groups</a>
             | 
            <a href="/session-summary.jsp" title="Click to manage connected sessions" onmouseover="self.status='Click to manage connected sessions';return true;" onmouseout="self.status='';return true;">Sessions</a>
             | 
            <a href="/muc-room-summary.jsp" title="Click to manage group chat settings" onmouseover="self.status='Click to manage group chat settings';return true;" onmouseout="self.status='';return true;">Group Chat</a>
             | 
            <a href="/plugin-admin.jsp" title="Click to manage all plugins" onmouseover="self.status='Click to manage all plugins';return true;" onmouseout="self.status='';return true;">Plugins</a>
            
        </div>
        <div class="jive-footer-copyright">
            Built by <a href="http://www.jivesoftware.com">Jive Software</a> and the <a href="http://www.igniterealtime.org">IgniteRealtime.org</a> community
        </div>
    </div>
<!-- END footer -->

</body>
</html>
