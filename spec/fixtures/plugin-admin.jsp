


















<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">


<html>
<head>
    <title>Openfire Admin Console: Plugins</title>
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
    <meta name="pageID" content="plugin-settings"/>
<meta name="helpPage" content="manage_system_plugins.html"/>
<script src="dwr/engine.js" type="text/javascript"></script>
<script src="dwr/util.js" type="text/javascript"></script>
<script src="dwr/interface/downloader.js" type="text/javascript"></script>

<script type="text/javascript" >
    DWREngine.setErrorHandler(handleError);

    function handleError(error) {
    }
</script>

<style type="text/css">

.textfield {
    font-size: 11px;
    font-family: verdana;
    padding: 3px 2px;
    background: #efefef;
}

.text {
    font-size: 11px;
    font-family: verdana, arial, helvetica, sans-serif;
}

.small-label {
    font-size: 11px;
    font-weight: bold;
    font-family: verdana, arial, helvetica, sans-serif;
}

.small-label-link {
    font-size: 11px;
    font-weight: bold;
    font-family: verdana;
    text-decoration: underline;
}

.light-gray-border {
    border-color: #ccc;
    border-style: solid;
    border-width: 1px 1px 1px 1px;
    padding: 5px;
	-moz-border-radius: 3px;
}

.light-gray-border-bottom {
    border-color: #dcdcdc;
    border-style: solid;
    border-width: 0px 0px 1px 0px;
}

.table-header {
    text-align: left;
    font-family: verdana, arial, helvetica, sans-serif;
    font-size: 8pt;
    font-weight: bold;
    border-color: #ccc;
    border-style: solid;
    border-width: 1px 0 1px 0;
    padding: 5px;
}

.table-header-left {
    text-align: left;
    font-family: verdana, arial, helvetica, sans-serif;
    font-size: 8pt;
    font-weight: bold;
    border-color: #ccc;
    border-style: solid;
    border-width: 1px 0 1px 1px;
    padding: 5px;

}

.table-header-right {
    text-align: left;
    font-family: verdana, arial, helvetica, sans-serif;
    font-size: 8pt;
    font-weight: bold;
    border-color: #ccc;
    border-style: solid;
    border-width: 1px 1px 1px 0;
    padding: 5px;
}

.table-font {
    font-family: verdana, arial, helvetica, sans-serif;
    font-size: 8pt;
}

.update {
    font-family: verdana, arial, helvetica, sans-serif;
    font-size: 8pt;
    background: #E7FBDE;
    border-color: #73CB73;
    border-style: solid;
    border-width: 0 1px 1px 1px;
    padding: 5px;
}

.update-bottom {
    text-align: left;
    font-family: verdana, arial, helvetica, sans-serif;
    font-size: 8pt;
    font-weight: bold;
    background: #E7FBDE;
    border-color: #73CB73;
    border-style: solid;
    border-width: 0 0 1px 0;
    padding: 5px;
}

.update-bottom-left {
    text-align: left;
    font-family: verdana, arial, helvetica, sans-serif;
    font-size: 8pt;
    font-weight: bold;
    background: #E7FBDE;
    border-color: #73CB73;
    border-style: solid;
    border-width: 0 0 1px 1px;
    padding: 5px;
}

.update-bottom-right {
    text-align: left;
    font-family: verdana, arial, helvetica, sans-serif;
    font-size: 8pt;
    font-weight: bold;
    background: #E7FBDE;
    border-color: #73CB73;
    border-style: solid;
    border-width: 0 1px 1px 0;
    padding: 5px;
}

.update-top {
    text-align: left;
    font-family: verdana, arial, helvetica, sans-serif;
    font-size: 9pt;
    background: #E7FBDE;
    border-color: #73CB73;
    border-style: solid;
    border-width: 1px 0px 0px 0px;
    padding: 5px;
}

.update-right {
    text-align: left;
    font-family: verdana, arial, helvetica, sans-serif;
    font-size: 8pt;
    font-weight: bold;
    background: #E7FBDE;
    border-color: #73CB73;
    border-style: solid;
    border-width: 1px 1px 0px 0px;
    padding: 5px;
}

.line-bottom-border {
    text-align: left;
    font-family: verdana, arial, helvetica, sans-serif;
    font-size: 9pt;
    border-color: #e3e3e3;
    border-style: solid;
    border-width: 0px 0px 1px 0px;
    padding: 5px;
}
</style>


<script type="text/javascript">
    function download(url, hashCode) {
        document.getElementById(hashCode + "-row").style.display = 'none';
        document.getElementById(hashCode + "-update").style.display = '';
        downloader.downloadPlugin(downloadComplete, url);
    }

    function downloadComplete(update) {
        document.getElementById(update.hashCode + "-row").style.display = 'none';
        document.getElementById(update.hashCode + "-update").style.display = '';
        document.getElementById(update.hashCode + "-image").innerHTML = '<img src="images/success-16x16.gif" border="0" alt=""/>';
        document.getElementById(update.hashCode + "-text").innerHTML = 'Update Completed';
    }
</script>
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
            <ul><li class="">
            <a href="/index.jsp" title="Click to manage server settings" onmouseover="self.status='Click to manage server settings';return true;" onmouseout="self.status='';return true;">Server</a>
            </li><li class="">
            <a href="/user-summary.jsp" title="Click to manage users and groups" onmouseover="self.status='Click to manage users and groups';return true;" onmouseout="self.status='';return true;">Users/Groups</a>
            </li><li class="">
            <a href="/session-summary.jsp" title="Click to manage connected sessions" onmouseover="self.status='Click to manage connected sessions';return true;" onmouseout="self.status='';return true;">Sessions</a>
            </li><li class="">
            <a href="/muc-room-summary.jsp" title="Click to manage group chat settings" onmouseover="self.status='Click to manage group chat settings';return true;" onmouseout="self.status='';return true;">Group Chat</a>
            </li><li class="currentlink">
            <a href="/plugin-admin.jsp" title="Click to manage all plugins" onmouseover="self.status='Click to manage all plugins';return true;" onmouseout="self.status='';return true;">Plugins</a>
            </li></ul>
            <div id="jive-nav-right"></div>
        </div>
        <div id="jive-subnav">
            <ul><li class="current">
                <a href="/plugin-admin.jsp" title=""
                  onmouseover="self.status='';return true;" onmouseout="self.status='';return true;"
                  >Plugin Admin</a>
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
                            <ul><li class="currentlink">
                                <a href="/plugin-admin.jsp" title="Click to manage installed plugins"
                                  onmouseover="self.status='Click to manage installed plugins';return true;" onmouseout="self.status='';return true;"
                                  >Plugins</a>
                                 
                            </li><li class="">
                                <a href="/available-plugins.jsp" title="Click to browse available plugins"
                                  onmouseover="self.status='Click to browse available plugins';return true;" onmouseout="self.status='';return true;"
                                  >Available Plugins</a>
                                 
                            </li></ul>
                            <br>
                            <img src="/images/blank.gif" width="150" height="1" border="0" alt="">
                        </div>
                    </div>
                </div>
            </td>
            <td width="99%" id="jive-content">


                

                <h1>
                    Plugins
                </h1>

                <div id="jive-main-content">
                    <p>
    Plugins add new functionality to the server. The list of plugins currently installed is below. To download new plugins, please visit the <a href="available-plugins.jsp">Available Plugins</a> page.
</p>

<p>

<div class="light-gray-border" style="padding:10px;">
<table cellpadding="0" cellspacing="0" border="0" width="100%">
 <tr style="background:#eee;">

    <td nowrap colspan="3" class="table-header-left">Plugins</td>
    <td nowrap class="table-header">Description</td>
    <td nowrap class="table-header">Version</td>
    <td nowrap class="table-header">Author</td>
    <td nowrap class="table-header">Restart</td>
    <td nowrap class="table-header-right">Delete</td>
</tr>

<tbody>




<tr valign="top">
    <td width="1%" class="line-bottom-border">
        
        <img src="geticon?plugin=hazelcast&showIcon=true&decorator=none" width="16" height="16" alt="Plugin">
        
    </td>
    <td width="20%" nowrap valign="top" class="line-bottom-border">
        Hazelcast Clustering Plugin &nbsp;
        


    </td>
    <td nowrap valign="top" class="line-bottom-border">
        <p>
            <a href="plugin-admin.jsp?plugin=hazelcast&showReadme=true&decorator=none"
                    ><img src="images/doc-readme-16x16.gif" width="16" height="16" border="0" alt="README"></a>
            
            
            <a href="plugin-admin.jsp?plugin=hazelcast&showChangelog=true&decorator=none"
                    ><img src="images/doc-changelog-16x16.gif" width="16" height="16" border="0" alt="changelog"></a>
            </p>
    </td>
    <td width="60%" valign="top" class="line-bottom-border">
        Clustering support for Openfire, powered by Hazelcast.
    </td>
    <td width="5%" align="center" valign="top" class="line-bottom-border">
        <p>1.0.6</p>

    </td>
    <td width="15%" nowrap valign="top" class="line-bottom-border">
        Tom Evans  &nbsp;
    </td>
    <td width="1%" align="center" valign="top" class="line-bottom-border">
        <a href="plugin-admin.jsp?reloadplugin=hazelcast"
           title="Reload the plugin."
                ><img src="images/refresh-16x16.gif" width="16" height="16" border="0" alt="Refresh"></a>
    </td>
    <td width="1%" align="center" valign="top" class="line-bottom-border">
        <a href="#" onclick="if (confirm('Delete plugin?')) { location.replace('plugin-admin.jsp?deleteplugin=hazelcast'); } "
           title="Click to delete..."
                ><img src="images/delete-16x16.gif" width="16" height="16" border="0" alt="Delete"></a>
    </td>
</tr>


<tr><td></td></tr>

<!-- End of update section -->


<tr valign="top">
    <td width="1%" class="line-bottom-border">
        
        <img src="geticon?plugin=monitoring&showIcon=true&decorator=none" width="16" height="16" alt="Plugin">
        
    </td>
    <td width="20%" nowrap valign="top" class="line-bottom-border">
        Monitoring Service &nbsp;
        


    </td>
    <td nowrap valign="top" class="line-bottom-border">
        <p>
            <a href="plugin-admin.jsp?plugin=monitoring&showReadme=true&decorator=none"
                    ><img src="images/doc-readme-16x16.gif" width="16" height="16" border="0" alt="README"></a>
            
            
            <a href="plugin-admin.jsp?plugin=monitoring&showChangelog=true&decorator=none"
                    ><img src="images/doc-changelog-16x16.gif" width="16" height="16" border="0" alt="changelog"></a>
            </p>
    </td>
    <td width="60%" valign="top" class="line-bottom-border">
        Monitors conversations and statistics of the server.
    </td>
    <td width="5%" align="center" valign="top" class="line-bottom-border">
        <p>1.3.2-beta1</p>

    </td>
    <td width="15%" nowrap valign="top" class="line-bottom-border">
        Jive Software  &nbsp;
    </td>
    <td width="1%" align="center" valign="top" class="line-bottom-border">
        <a href="plugin-admin.jsp?reloadplugin=monitoring"
           title="Reload the plugin."
                ><img src="images/refresh-16x16.gif" width="16" height="16" border="0" alt="Refresh"></a>
    </td>
    <td width="1%" align="center" valign="top" class="line-bottom-border">
        <a href="#" onclick="if (confirm('Delete plugin?')) { location.replace('plugin-admin.jsp?deleteplugin=monitoring'); } "
           title="Click to delete..."
                ><img src="images/delete-16x16.gif" width="16" height="16" border="0" alt="Delete"></a>
    </td>
</tr>


<tr><td></td></tr>

<!-- End of update section -->


<tr valign="top">
    <td width="1%" class="line-bottom-border">
        
        <img src="geticon?plugin=presence&showIcon=true&decorator=none" width="16" height="16" alt="Plugin">
        
    </td>
    <td width="20%" nowrap valign="top" class="line-bottom-border">
        Presence Service &nbsp;
        


    </td>
    <td nowrap valign="top" class="line-bottom-border">
        <p>
            <a href="plugin-admin.jsp?plugin=presence&showReadme=true&decorator=none"
                    ><img src="images/doc-readme-16x16.gif" width="16" height="16" border="0" alt="README"></a>
            
            
            <a href="plugin-admin.jsp?plugin=presence&showChangelog=true&decorator=none"
                    ><img src="images/doc-changelog-16x16.gif" width="16" height="16" border="0" alt="changelog"></a>
            </p>
    </td>
    <td width="60%" valign="top" class="line-bottom-border">
        Exposes presence information through HTTP.
    </td>
    <td width="5%" align="center" valign="top" class="line-bottom-border">
        <p>1.5.1</p>

    </td>
    <td width="15%" nowrap valign="top" class="line-bottom-border">
        Jive Software  &nbsp;
    </td>
    <td width="1%" align="center" valign="top" class="line-bottom-border">
        <a href="plugin-admin.jsp?reloadplugin=presence"
           title="Reload the plugin."
                ><img src="images/refresh-16x16.gif" width="16" height="16" border="0" alt="Refresh"></a>
    </td>
    <td width="1%" align="center" valign="top" class="line-bottom-border">
        <a href="#" onclick="if (confirm('Delete plugin?')) { location.replace('plugin-admin.jsp?deleteplugin=presence'); } "
           title="Click to delete..."
                ><img src="images/delete-16x16.gif" width="16" height="16" border="0" alt="Delete"></a>
    </td>
</tr>


<tr><td></td></tr>

<!-- End of update section -->


<tr valign="top">
    <td width="1%" class="line-bottom-border">
        
        <img src="geticon?plugin=search&showIcon=true&decorator=none" width="16" height="16" alt="Plugin">
        
    </td>
    <td width="20%" nowrap valign="top" class="line-bottom-border">
        Search &nbsp;
        


    </td>
    <td nowrap valign="top" class="line-bottom-border">
        <p>
            <a href="plugin-admin.jsp?plugin=search&showReadme=true&decorator=none"
                    ><img src="images/doc-readme-16x16.gif" width="16" height="16" border="0" alt="README"></a>
            
            
            <a href="plugin-admin.jsp?plugin=search&showChangelog=true&decorator=none"
                    ><img src="images/doc-changelog-16x16.gif" width="16" height="16" border="0" alt="changelog"></a>
            </p>
    </td>
    <td width="60%" valign="top" class="line-bottom-border">
        Provides support for Jabber Search (XEP-0055)
    </td>
    <td width="5%" align="center" valign="top" class="line-bottom-border">
        <p>1.5.1</p>

    </td>
    <td width="15%" nowrap valign="top" class="line-bottom-border">
        Ryan Graham  &nbsp;
    </td>
    <td width="1%" align="center" valign="top" class="line-bottom-border">
        <a href="plugin-admin.jsp?reloadplugin=search"
           title="Reload the plugin."
                ><img src="images/refresh-16x16.gif" width="16" height="16" border="0" alt="Refresh"></a>
    </td>
    <td width="1%" align="center" valign="top" class="line-bottom-border">
        <a href="#" onclick="if (confirm('Delete plugin?')) { location.replace('plugin-admin.jsp?deleteplugin=search'); } "
           title="Click to delete..."
                ><img src="images/delete-16x16.gif" width="16" height="16" border="0" alt="Delete"></a>
    </td>
</tr>


<tr><td></td></tr>

<!-- End of update section -->

</tbody>
</table>
</div>


<br /><br />

<div>
    <h3>Upload Plugin</h3>
    <p>Plugin files (.jar) can be uploaded directly by using the form below.</p>
    <form action="plugin-admin.jsp?uploadplugin" enctype="multipart/form-data" method="post">
        <input type="file" name="uploadfile" />
        <input type="submit" value="Upload Plugin" />
    </form>
</div>
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

