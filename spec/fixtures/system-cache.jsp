



















<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">


<html>
<head>
    <title>Openfire Admin Console: Cache Summary</title>
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
    <meta name="pageID" content="system-cache"/>
        <script language="JavaScript" type="text/javascript">
        var selected = false;
        var cbstate = '';
        function handleCBClick(el) {
            var theform = el.form;
            for (var i=0; i<theform.elements.length; i++) {
                var theel = theform.elements[i];
                if (theel.name == 'cacheID') {
                    theel.checked = !selected;
                    toggleHighlight(theel);
                }
            }
            el.checked = !selected;
            selected = !selected;
            updateControls(theform);
        }
        function setCBState(theform) {
            for (var i=0; i<theform.elements.length; i++) {
                var theel = theform.elements[i];
                if (theel.name == 'cacheID') {
                    cbstate += theel.checked;
                }
            }
        }
        function clearCBs(theform) {
            for (var i=0; i<theform.elements.length; i++) {
                var theel = theform.elements[i];
                if (theel.name == 'cacheID') {
                    theel.checked = false;
                }
            }
        }
        function updateControls(theform) {
            var currentState = '';
            for (var i=0; i<theform.elements.length; i++) {
                var theel = theform.elements[i];
                if (theel.name == 'cacheID') {
                    currentState += theel.checked;
                }
            }
            if (currentState != cbstate) {
                theform.clear.disabled = false;
            }
            else {
                theform.clear.disabled = true;
            }
        }
        function toggleHighlight(el) {
            var r = null;
            if (el.parentNode && el.parentNode.parentNode) {
                r = el.parentNode.parentNode;
            }
            else if (el.parentElement && el.parentElement.parentElement) {
                r = el.parentElement.parentElement;
            }
            if (r) {
                if (el.checked) {
                    r.className = "jive-row-sel";
                }
                else {
                    r.className = "jive-row";
                }
            }
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
                                 
                            </li><li class="">
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
                                 
                            </li><li class="currentlink">
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
                    Cache Summary
                </h1>

                <div id="jive-main-content">
                    <p>
The server relies on its cache to run efficiently. Below is a summary of all existing caches. To clear out the contents of a cache, click the checkbox next to the cache you want to clear and click "Clear Selected" below.
</p>



<form action="system-cache.jsp" method="post" name="cacheForm">

<div class="jive-table">
<table cellpadding="0" cellspacing="0" border="0" width="100%">
<thead>
    <tr>
        <th width="39%" nowrap>Cache Name</th>
        <th width="10%" nowrap>Max Size</th>
        <th width="10%" nowrap>Current Size</th>
        <th width="20%" nowrap>Percent Used</th>
        <th width="20%" nowrap>Effectiveness*</th>
        <th width="1%" class="c5"><input type="checkbox" name="" value="" onclick="handleCBClick(this);"></th>
    </tr>
</thead>
<tbody>


    <tr class="">
        <td class="c1">
            <table cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td class="icon"><img src="images/cache-16x16.gif" width="16" height="16" alt="" border="0"></td>
                <td>Clearspace SSO Nonce</td>
            </tr>
            </table>
        </td>
        <td class="c2">
            
                Unlimited
            
        </td>
        <td class="c3">
            0.00 MB
        </td>
        <td class="c3">
            
                N/A
            
        </td>
        <td class="c4">
            N/A
        </td>

        <td width="1%" class="c5"><input type="checkbox" name="cacheID" value="0" onclick="updateControls(this.form);toggleHighlight(this);"></td>
    </tr>


    <tr class="">
        <td class="c1">
            <table cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td class="icon"><img src="images/cache-16x16.gif" width="16" height="16" alt="" border="0"></td>
                <td>Client Session Info Cache</td>
            </tr>
            </table>
        </td>
        <td class="c2">
            
                0.25 MB
            
        </td>
        <td class="c3">
            0.35 MB
        </td>
        <td class="c3">
            
                138.7%
            
        </td>
        <td class="c4">
            N/A
        </td>

        <td width="1%" class="c5"><input type="checkbox" name="cacheID" value="1" onclick="updateControls(this.form);toggleHighlight(this);"></td>
    </tr>


    <tr class="">
        <td class="c1">
            <table cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td class="icon"><img src="images/cache-16x16.gif" width="16" height="16" alt="" border="0"></td>
                <td>Components Sessions</td>
            </tr>
            </table>
        </td>
        <td class="c2">
            
                Unlimited
            
        </td>
        <td class="c3">
            0.00 MB
        </td>
        <td class="c3">
            
                N/A
            
        </td>
        <td class="c4">
            N/A
        </td>

        <td width="1%" class="c5"><input type="checkbox" name="cacheID" value="2" onclick="updateControls(this.form);toggleHighlight(this);"></td>
    </tr>


    <tr class="">
        <td class="c1">
            <table cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td class="icon"><img src="images/cache-16x16.gif" width="16" height="16" alt="" border="0"></td>
                <td>Connection Managers Sessions</td>
            </tr>
            </table>
        </td>
        <td class="c2">
            
                Unlimited
            
        </td>
        <td class="c3">
            0.00 MB
        </td>
        <td class="c3">
            
                N/A
            
        </td>
        <td class="c4">
            N/A
        </td>

        <td width="1%" class="c5"><input type="checkbox" name="cacheID" value="3" onclick="updateControls(this.form);toggleHighlight(this);"></td>
    </tr>


    <tr class="">
        <td class="c1">
            <table cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td class="icon"><img src="images/cache-16x16.gif" width="16" height="16" alt="" border="0"></td>
                <td>Directed Presences</td>
            </tr>
            </table>
        </td>
        <td class="c2">
            
                Unlimited
            
        </td>
        <td class="c3">
            0.03 MB
        </td>
        <td class="c3">
            
                N/A
            
        </td>
        <td class="c4">
            100.0%
        </td>

        <td width="1%" class="c5"><input type="checkbox" name="cacheID" value="4" onclick="updateControls(this.form);toggleHighlight(this);"></td>
    </tr>


    <tr class="">
        <td class="c1">
            <table cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td class="icon"><img src="images/cache-16x16.gif" width="16" height="16" alt="" border="0"></td>
                <td>Disco Server Features</td>
            </tr>
            </table>
        </td>
        <td class="c2">
            
                Unlimited
            
        </td>
        <td class="c3">
            0.03 MB
        </td>
        <td class="c3">
            
                N/A
            
        </td>
        <td class="c4">
            32.6%
        </td>

        <td width="1%" class="c5"><input type="checkbox" name="cacheID" value="5" onclick="updateControls(this.form);toggleHighlight(this);"></td>
    </tr>


    <tr class="">
        <td class="c1">
            <table cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td class="icon"><img src="images/cache-16x16.gif" width="16" height="16" alt="" border="0"></td>
                <td>Disco Server Items</td>
            </tr>
            </table>
        </td>
        <td class="c2">
            
                Unlimited
            
        </td>
        <td class="c3">
            0.00 MB
        </td>
        <td class="c3">
            
                N/A
            
        </td>
        <td class="c4">
            0.0%
        </td>

        <td width="1%" class="c5"><input type="checkbox" name="cacheID" value="6" onclick="updateControls(this.form);toggleHighlight(this);"></td>
    </tr>


    <tr class="">
        <td class="c1">
            <table cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td class="icon"><img src="images/cache-16x16.gif" width="16" height="16" alt="" border="0"></td>
                <td>Entity Capabilities</td>
            </tr>
            </table>
        </td>
        <td class="c2">
            
                Unlimited
            
        </td>
        <td class="c3">
            0.00 MB
        </td>
        <td class="c3">
            
                N/A
            
        </td>
        <td class="c4">
            100.0%
        </td>

        <td width="1%" class="c5"><input type="checkbox" name="cacheID" value="7" onclick="updateControls(this.form);toggleHighlight(this);"></td>
    </tr>


    <tr class="">
        <td class="c1">
            <table cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td class="icon"><img src="images/cache-16x16.gif" width="16" height="16" alt="" border="0"></td>
                <td>Entity Capabilities Users</td>
            </tr>
            </table>
        </td>
        <td class="c2">
            
                Unlimited
            
        </td>
        <td class="c3">
            0.00 MB
        </td>
        <td class="c3">
            
                N/A
            
        </td>
        <td class="c4">
            100.0%
        </td>

        <td width="1%" class="c5"><input type="checkbox" name="cacheID" value="8" onclick="updateControls(this.form);toggleHighlight(this);"></td>
    </tr>


    <tr class="">
        <td class="c1">
            <table cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td class="icon"><img src="images/cache-16x16.gif" width="16" height="16" alt="" border="0"></td>
                <td>Favicon Hits</td>
            </tr>
            </table>
        </td>
        <td class="c2">
            
                0.12 MB
            
        </td>
        <td class="c3">
            0.00 MB
        </td>
        <td class="c3">
            
                0.0%
            
        </td>
        <td class="c4">
            N/A
        </td>

        <td width="1%" class="c5"><input type="checkbox" name="cacheID" value="9" onclick="updateControls(this.form);toggleHighlight(this);"></td>
    </tr>


    <tr class="">
        <td class="c1">
            <table cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td class="icon"><img src="images/cache-16x16.gif" width="16" height="16" alt="" border="0"></td>
                <td>Favicon Misses</td>
            </tr>
            </table>
        </td>
        <td class="c2">
            
                0.12 MB
            
        </td>
        <td class="c3">
            0.00 MB
        </td>
        <td class="c3">
            
                0.0%
            
        </td>
        <td class="c4">
            N/A
        </td>

        <td width="1%" class="c5"><input type="checkbox" name="cacheID" value="10" onclick="updateControls(this.form);toggleHighlight(this);"></td>
    </tr>


    <tr class="">
        <td class="c1">
            <table cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td class="icon"><img src="images/cache-16x16.gif" width="16" height="16" alt="" border="0"></td>
                <td>File Transfer</td>
            </tr>
            </table>
        </td>
        <td class="c2">
            
                Unlimited
            
        </td>
        <td class="c3">
            0.00 MB
        </td>
        <td class="c3">
            
                N/A
            
        </td>
        <td class="c4">
            N/A
        </td>

        <td width="1%" class="c5"><input type="checkbox" name="cacheID" value="11" onclick="updateControls(this.form);toggleHighlight(this);"></td>
    </tr>


    <tr class="">
        <td class="c1">
            <table cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td class="icon"><img src="images/cache-16x16.gif" width="16" height="16" alt="" border="0"></td>
                <td>File Transfer Cache</td>
            </tr>
            </table>
        </td>
        <td class="c2">
            
                0.12 MB
            
        </td>
        <td class="c3">
            0.00 MB
        </td>
        <td class="c3">
            
                0.0%
            
        </td>
        <td class="c4">
            N/A
        </td>

        <td width="1%" class="c5"><input type="checkbox" name="cacheID" value="12" onclick="updateControls(this.form);toggleHighlight(this);"></td>
    </tr>


    <tr class="">
        <td class="c1">
            <table cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td class="icon"><img src="images/cache-16x16.gif" width="16" height="16" alt="" border="0"></td>
                <td>Incoming Server Sessions</td>
            </tr>
            </table>
        </td>
        <td class="c2">
            
                Unlimited
            
        </td>
        <td class="c3">
            0.00 MB
        </td>
        <td class="c3">
            
                N/A
            
        </td>
        <td class="c4">
            N/A
        </td>

        <td width="1%" class="c5"><input type="checkbox" name="cacheID" value="13" onclick="updateControls(this.form);toggleHighlight(this);"></td>
    </tr>


    <tr class="">
        <td class="c1">
            <table cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td class="icon"><img src="images/cache-16x16.gif" width="16" height="16" alt="" border="0"></td>
                <td>Last Activity Cache</td>
            </tr>
            </table>
        </td>
        <td class="c2">
            
                0.12 MB
            
        </td>
        <td class="c3">
            0.01 MB
        </td>
        <td class="c3">
            
                5.0%
            
        </td>
        <td class="c4">
            N/A
        </td>

        <td width="1%" class="c5"><input type="checkbox" name="cacheID" value="14" onclick="updateControls(this.form);toggleHighlight(this);"></td>
    </tr>


    <tr class="">
        <td class="c1">
            <table cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td class="icon"><img src="images/cache-16x16.gif" width="16" height="16" alt="" border="0"></td>
                <td>Locked Out Accounts</td>
            </tr>
            </table>
        </td>
        <td class="c2">
            
                1.00 MB
            
        </td>
        <td class="c3">
            0.00 MB
        </td>
        <td class="c3">
            
                0.0%
            
        </td>
        <td class="c4">
            0.0%
        </td>

        <td width="1%" class="c5"><input type="checkbox" name="cacheID" value="15" onclick="updateControls(this.form);toggleHighlight(this);"></td>
    </tr>


    <tr class="">
        <td class="c1">
            <table cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td class="icon"><img src="images/cache-16x16.gif" width="16" height="16" alt="" border="0"></td>
                <td>Multicast Service</td>
            </tr>
            </table>
        </td>
        <td class="c2">
            
                0.12 MB
            
        </td>
        <td class="c3">
            0.00 MB
        </td>
        <td class="c3">
            
                0.0%
            
        </td>
        <td class="c4">
            N/A
        </td>

        <td width="1%" class="c5"><input type="checkbox" name="cacheID" value="16" onclick="updateControls(this.form);toggleHighlight(this);"></td>
    </tr>


    <tr class="">
        <td class="c1">
            <table cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td class="icon"><img src="images/cache-16x16.gif" width="16" height="16" alt="" border="0"></td>
                <td>Offline Message Size</td>
            </tr>
            </table>
        </td>
        <td class="c2">
            
                0.10 MB
            
        </td>
        <td class="c3">
            0.00 MB
        </td>
        <td class="c3">
            
                0.0%
            
        </td>
        <td class="c4">
            N/A
        </td>

        <td width="1%" class="c5"><input type="checkbox" name="cacheID" value="17" onclick="updateControls(this.form);toggleHighlight(this);"></td>
    </tr>


    <tr class="">
        <td class="c1">
            <table cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td class="icon"><img src="images/cache-16x16.gif" width="16" height="16" alt="" border="0"></td>
                <td>Offline Presence Cache</td>
            </tr>
            </table>
        </td>
        <td class="c2">
            
                0.50 MB
            
        </td>
        <td class="c3">
            0.01 MB
        </td>
        <td class="c3">
            
                1.3%
            
        </td>
        <td class="c4">
            N/A
        </td>

        <td width="1%" class="c5"><input type="checkbox" name="cacheID" value="18" onclick="updateControls(this.form);toggleHighlight(this);"></td>
    </tr>


    <tr class="">
        <td class="c1">
            <table cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td class="icon"><img src="images/cache-16x16.gif" width="16" height="16" alt="" border="0"></td>
                <td>PEPServiceManager</td>
            </tr>
            </table>
        </td>
        <td class="c2">
            
                10.00 MB
            
        </td>
        <td class="c3">
            0.00 MB
        </td>
        <td class="c3">
            
                0.0%
            
        </td>
        <td class="c4">
            N/A
        </td>

        <td width="1%" class="c5"><input type="checkbox" name="cacheID" value="19" onclick="updateControls(this.form);toggleHighlight(this);"></td>
    </tr>


    <tr class="">
        <td class="c1">
            <table cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td class="icon"><img src="images/cache-16x16.gif" width="16" height="16" alt="" border="0"></td>
                <td>Privacy Lists</td>
            </tr>
            </table>
        </td>
        <td class="c2">
            
                0.50 MB
            
        </td>
        <td class="c3">
            0.00 MB
        </td>
        <td class="c3">
            
                0.0%
            
        </td>
        <td class="c4">
            N/A
        </td>

        <td width="1%" class="c5"><input type="checkbox" name="cacheID" value="20" onclick="updateControls(this.form);toggleHighlight(this);"></td>
    </tr>


    <tr class="">
        <td class="c1">
            <table cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td class="icon"><img src="images/cache-16x16.gif" width="16" height="16" alt="" border="0"></td>
                <td>Published Items</td>
            </tr>
            </table>
        </td>
        <td class="c2">
            
                10.00 MB
            
        </td>
        <td class="c3">
            0.00 MB
        </td>
        <td class="c3">
            
                0.0%
            
        </td>
        <td class="c4">
            N/A
        </td>

        <td width="1%" class="c5"><input type="checkbox" name="cacheID" value="21" onclick="updateControls(this.form);toggleHighlight(this);"></td>
    </tr>


    <tr class="">
        <td class="c1">
            <table cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td class="icon"><img src="images/cache-16x16.gif" width="16" height="16" alt="" border="0"></td>
                <td>Remote Users Existence</td>
            </tr>
            </table>
        </td>
        <td class="c2">
            
                0.50 MB
            
        </td>
        <td class="c3">
            0.00 MB
        </td>
        <td class="c3">
            
                0.0%
            
        </td>
        <td class="c4">
            N/A
        </td>

        <td width="1%" class="c5"><input type="checkbox" name="cacheID" value="22" onclick="updateControls(this.form);toggleHighlight(this);"></td>
    </tr>


    <tr class="">
        <td class="c1">
            <table cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td class="icon"><img src="images/cache-16x16.gif" width="16" height="16" alt="" border="0"></td>
                <td>Roster</td>
            </tr>
            </table>
        </td>
        <td class="c2">
            
                0.25 MB
            
        </td>
        <td class="c3">
            0.11 MB
        </td>
        <td class="c3">
            
                45.6%
            
        </td>
        <td class="c4">
            100.0%
        </td>

        <td width="1%" class="c5"><input type="checkbox" name="cacheID" value="23" onclick="updateControls(this.form);toggleHighlight(this);"></td>
    </tr>


    <tr class="">
        <td class="c1">
            <table cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td class="icon"><img src="images/cache-16x16.gif" width="16" height="16" alt="" border="0"></td>
                <td>Routing AnonymousUsers Cache</td>
            </tr>
            </table>
        </td>
        <td class="c2">
            
                Unlimited
            
        </td>
        <td class="c3">
            0.00 MB
        </td>
        <td class="c3">
            
                N/A
            
        </td>
        <td class="c4">
            N/A
        </td>

        <td width="1%" class="c5"><input type="checkbox" name="cacheID" value="24" onclick="updateControls(this.form);toggleHighlight(this);"></td>
    </tr>


    <tr class="">
        <td class="c1">
            <table cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td class="icon"><img src="images/cache-16x16.gif" width="16" height="16" alt="" border="0"></td>
                <td>Routing Components Cache</td>
            </tr>
            </table>
        </td>
        <td class="c2">
            
                Unlimited
            
        </td>
        <td class="c3">
            0.00 MB
        </td>
        <td class="c3">
            
                N/A
            
        </td>
        <td class="c4">
            100.0%
        </td>

        <td width="1%" class="c5"><input type="checkbox" name="cacheID" value="25" onclick="updateControls(this.form);toggleHighlight(this);"></td>
    </tr>


    <tr class="">
        <td class="c1">
            <table cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td class="icon"><img src="images/cache-16x16.gif" width="16" height="16" alt="" border="0"></td>
                <td>Routing Servers Cache</td>
            </tr>
            </table>
        </td>
        <td class="c2">
            
                Unlimited
            
        </td>
        <td class="c3">
            0.00 MB
        </td>
        <td class="c3">
            
                N/A
            
        </td>
        <td class="c4">
            N/A
        </td>

        <td width="1%" class="c5"><input type="checkbox" name="cacheID" value="26" onclick="updateControls(this.form);toggleHighlight(this);"></td>
    </tr>


    <tr class="">
        <td class="c1">
            <table cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td class="icon"><img src="images/cache-16x16.gif" width="16" height="16" alt="" border="0"></td>
                <td>Routing User Sessions</td>
            </tr>
            </table>
        </td>
        <td class="c2">
            
                Unlimited
            
        </td>
        <td class="c3">
            0.06 MB
        </td>
        <td class="c3">
            
                N/A
            
        </td>
        <td class="c4">
            100.0%
        </td>

        <td width="1%" class="c5"><input type="checkbox" name="cacheID" value="27" onclick="updateControls(this.form);toggleHighlight(this);"></td>
    </tr>


    <tr class="">
        <td class="c1">
            <table cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td class="icon"><img src="images/cache-16x16.gif" width="16" height="16" alt="" border="0"></td>
                <td>Routing Users Cache</td>
            </tr>
            </table>
        </td>
        <td class="c2">
            
                Unlimited
            
        </td>
        <td class="c3">
            0.06 MB
        </td>
        <td class="c3">
            
                N/A
            
        </td>
        <td class="c4">
            100.0%
        </td>

        <td width="1%" class="c5"><input type="checkbox" name="cacheID" value="28" onclick="updateControls(this.form);toggleHighlight(this);"></td>
    </tr>


    <tr class="">
        <td class="c1">
            <table cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td class="icon"><img src="images/cache-16x16.gif" width="16" height="16" alt="" border="0"></td>
                <td>Sessions by Hostname</td>
            </tr>
            </table>
        </td>
        <td class="c2">
            
                Unlimited
            
        </td>
        <td class="c3">
            0.00 MB
        </td>
        <td class="c3">
            
                N/A
            
        </td>
        <td class="c4">
            N/A
        </td>

        <td width="1%" class="c5"><input type="checkbox" name="cacheID" value="29" onclick="updateControls(this.form);toggleHighlight(this);"></td>
    </tr>


    <tr class="">
        <td class="c1">
            <table cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td class="icon"><img src="images/cache-16x16.gif" width="16" height="16" alt="" border="0"></td>
                <td>User</td>
            </tr>
            </table>
        </td>
        <td class="c2">
            
                0.50 MB
            
        </td>
        <td class="c3">
            0.02 MB
        </td>
        <td class="c3">
            
                4.7%
            
        </td>
        <td class="c4">
            100.0%
        </td>

        <td width="1%" class="c5"><input type="checkbox" name="cacheID" value="30" onclick="updateControls(this.form);toggleHighlight(this);"></td>
    </tr>


    <tr class="">
        <td class="c1">
            <table cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td class="icon"><img src="images/cache-16x16.gif" width="16" height="16" alt="" border="0"></td>
                <td>Validated Domains</td>
            </tr>
            </table>
        </td>
        <td class="c2">
            
                Unlimited
            
        </td>
        <td class="c3">
            0.00 MB
        </td>
        <td class="c3">
            
                N/A
            
        </td>
        <td class="c4">
            N/A
        </td>

        <td width="1%" class="c5"><input type="checkbox" name="cacheID" value="31" onclick="updateControls(this.form);toggleHighlight(this);"></td>
    </tr>


    <tr class="">
        <td class="c1">
            <table cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td class="icon"><img src="images/cache-16x16.gif" width="16" height="16" alt="" border="0"></td>
                <td>VCard</td>
            </tr>
            </table>
        </td>
        <td class="c2">
            
                0.50 MB
            
        </td>
        <td class="c3">
            0.04 MB
        </td>
        <td class="c3">
            
                7.7%
            
        </td>
        <td class="c4">
            N/A
        </td>

        <td width="1%" class="c5"><input type="checkbox" name="cacheID" value="32" onclick="updateControls(this.form);toggleHighlight(this);"></td>
    </tr>



<tr bgcolor="#eeeeee">
    <td align="right" class="c1">
        Total:
    </td>
    <td class="c2">
        24.72 MB
    </td>
    <td align="right" colspan="4">
        <input type="submit" name="clear" value="Clear Selected" disabled>
    </td>
</tr>
</tbody>
</table>
</div>

<p class="jive-description">
* Effectiveness measures how well your cache is working. If the effectiveness is low, that usually means that the cache is too small. Caches for which this may be the case are specially flagged.
</p>

    <script language="JavaScript" type="text/javascript">
    clearCBs(document.cacheForm);
    setCBState(document.cacheForm);
    </script>

    </form>
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
