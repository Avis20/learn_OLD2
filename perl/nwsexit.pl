#!/usr/bin/perl
# Generate exit page
#
# Usage:
# 
# Form interface, two fields, "url", containing the URL of the
# target page and "blurb", containing the text to be used as the
# link target.
# 

# require 5.001;
# use strict;

use CGI qw( :standard);

MAIN:
{

    my $q= new CGI;
    my $url= $q->param('url');
    my $linktext= $q->param('blurb');

    srand(time|$$);
    $bannum = sprintf("%d",rand(13) + 1);
    $bannum = "0" . $bannum if length($bannum) == 1;
   
    unless ( defined $linktext ) {
        $linktext = $url;
    }
    print "Content-type: text/html\n\n<html>\n<head>\n",
        "<title>You are now leaving the National Weather Service</title>\n",
        "<META HTTP-EQUIV=\"Refresh\" CONTENT=\"10\; URL=$url\">\n",
        "</head>\n",
        "<body>\n"; 

        print <<ENDOFTEXT;
<link rel="STYLESHEET" type="text/css" href="/main.css">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta name="rating" content="general">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="author" content="National Weather Service Telecommunication Operations Center Web Team">
<meta name="robot" content="all">
<meta name="Content-Language" content="en-US">
<meta NAME="DESCRIPTION" CONTENT="Government Internet Service Home page. The starting point for official governemnt weather forecasts, warning, and meteorological products for forecasting the weather.">
<meta NAME="AUTHOR" CONTENT="NWS/Office of Systems Operations, Systems Operations Center, Silver Spring, MD; July 22, 1999">
<meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=iso-8859-1">
<meta NAME="KEYWORDS" CONTENT="Weather, Weather Warnings, Radar Graphics, Weather Forecasts, Model Products, Meteorological data, Facsimile Charts, Observations, Text Forecast Products">
<meta HTTP-EQUIV="Window-target" CONTENT="_top">
<base TARGET="_top">
 
<script TYPE="text/javascript" LANGUAGE="JAVASCRIPT">
<!--
function init() {
if (top.frames.length!=0)
top.location=self.document.location; 
}
//-->
</SCRIPT>
<script language="JavaScript">
function breadCrumbs(base, delStr, defp, cStyle, tStyle, dStyle, nl) {
    loc = window.location.toString();
    subs = loc.substr(loc.indexOf(base) + base.length + 1).split("/");
    document.write("<a href=\"" + getLoc(subs.length - 1) + defp + "\" class=\"" + cStyle + "\">Home</a>  " + "<span class=\"" + dStyle + "\">" + delStr + "</span> ");
    a = (loc.indexOf(defp) == -1) ? 1 : 2;
    for (i = 0; i < (subs.length - a); i++) {
        subs[i] = makeCaps(unescape(subs[i]));
        document.write("<a href=\"" + getLoc(subs.length - i - 2) + defp + "\" class=\"" + cStyle + "\">" + subs[i] + "</a>  " + "<span class=\"" + dStyle + "\">" + delStr + "</span> ");
    }
    if (nl == 1) {
        document.write("<br>");
    }
    document.write("<span class=\"" + tStyle + "\">" + document.title + "</span>");
}

function makeCaps(a) {
    g = a.split(" ");
    for (l = 0; l < g.length; l++) {
        g[l] = g[l].toUpperCase().slice(0, 1) + g[l].slice(1);
    }
    return g.join(" ");
}
 
function getLoc(c) {
    var d = "";
    if (c > 0) {
        for (k = 0; k < c; k++) {
            d = d + "../";
        }
    }
    return d;
}
 </script>
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" rightmargin="0" marginwidth="0" marginheight="0">
<table cellspacing="0" cellpadding="0" border="0" width="100%"
 background="/images/topbanner.jpg">
<tr>
<td align="right"><a href="#contents"><img src="/images/skipgraphic.gif"
 alt="Skip Navigation Link" width="1" height="1" border="0"></a><a
 href="http://www.nws.noaa.gov"><span
 class="nwslink">www.weather.gov</span></a>&nbsp;</td>
</tr>
</table>

<table cellspacing="0" cellpadding="0" border="0" width="100%">
<tr>
<td rowspan="2"><a href="http://www.noaa.gov"><img src="/images/noaaleft.jpg"
 alt="NOAA logo - Select to go to the NOAA homepage" width="85" height="78"
 border="0"></a></td>
<td align="left"><img src="/officenames/top_nws_title.jpg" alt="National Weather Service
 Headquarters Office" width="500" height="20" border="0"></td>
<td rowspan="2" width="100%" background="/images/wfo_bkgrnd.jpg">&nbsp;</td>
<td rowspan="2" align="right"><img src="/images/nwsright.jpg" alt="NWS logo"
 width="85" height="78" border="0"></td>
</tr>

<tr>
<td><img src="/officenames/iws_name.jpg" alt="NWS Office of the Chief Information Officer/Telecommunication Operations Center"
 width="500" height="58" border="0"></td>
</tr>
</table>

<table cellspacing="0" cellpadding="0" border="0"
 background="/images/navbkgrnd.gif" width="100%">
<tr>
<td align="left" valign="top" width="94"><img src="/images/navbarleft.jpg" alt="" width="94"
 height="23" border="0"></td>
<td class="nav" width="10%" align="center" id=menuitem><a href="http://weather.gov/sitemap.html">Site
 Map</a></td>

<td class="nav" width="10%" align="right" id=menuitem><a
 href="http://weather.gov/pa/">News</a></td>
<td class="nav" width="19%" align="right" id=menuitem><a
 href="http://www.nws.noaa.gov/organization.html">Organization</a></td>

<!-- Start NWS Search section -->
<td class="yellow" align="right" width="20%">
<form action="http://www.firstgov.gov/fgsearch/index.jsp" name="query">
<label for="search">Search</label>&nbsp;</td>
<td align="left" class="searchinput" width="20%" nowrap>
<input type="hidden" name="parsed" value="true">
<input type="hidden" name="rn" value="3">
<input type="hidden" name="in0" value="domain">
<input type="hidden" name="dom0" value="nws.noaa.gov, weather.gov, wrh.noaa.gov, srh.noaa.gov, crh.noaa.gov, prh.noaa.gov,
arh.noaa.gov, alaska.net/~nwsar, erh.noaa.gov, ncep.noaa.gov, spc.noaa.gov, nhc.noaa.gov, sec.noaa.gov, aviationweather.gov,
aviationweather.noaa.gov, weather.noaa.gov, roc.noaa.gov, nohrsc.nws.gov, nwstc.noaa.gov, wdtb.noaa.gov, npmoc.navy.mil,
ndbc.noaa.gov">
<input type="text" name="mw0" value="Enter Search Here" id="search" size="20" maxlength="256">&nbsp;<input type="submit"
name="Go2" value="Go"></td>
<td width="10%"></form>&nbsp;</td>

<td align="right" valign="bottom" width="24"><img src="/images/navbarendcap.jpg" alt="" width="24" height="23" border="0"></td>
</tr>
</table>
<!-- BEGIN LEFT MARGIN TEXT HERE -->
<table BORDER="0" CELLSPACING="0">
  <tr VALIGN="top"> 
    <td BGCOLOR="#0a2390" WIDTH="130" BORDERCOLOR="#003399"
			CLASS="white" ID="menuitem">
<br><br>
      <center>
<h3>IWS<br>Home</h3>

      <br>

      <A href="http://weather.gov">NWS Home</A><br><br>

      <br><A href="radar/">Radar Graphics</a><br><br>
            <br><A Href="fax/">Weather Maps</A>
	  <BR><br><br>
	  <A HREF="international.html">International<br>
Current<br>Conditions</A>

	  <br>
<br><br>
	  <A HREF="/weather/coded.html">Aviation Weather</A>
	  <br><br><br>
      <A HREF="http://www.nws.noaa.gov/om/marine/home.htm">Marine Weather</a>
	  </center>
    </td>
      
    
    <!-- END LEFT MARGIN TEXT HERE -->

	
<!-- START BREAD CRUMBSHERE -->
    
<td VALIGN="top" WIDTH="615"> 
<b> &nbsp; &nbsp;   </b>
<!-- END BREAD CRUMBS HERE -->
      
<!-- START BODY OF TEXT HERE -->
      
<table BORDER="0" CELLPADDING="5" width="598" >
        <tr>
          
<td height="90"> 

<BLOCKQUOTE>
<CENTER><H1>You are now leaving the National Weather Service</H1></CENTER>
<CENTER>
<P>
You are on your way to<BR>
<A HREF="$url"><H3> $linktext </H3></A><BR><BR>
<I>We hope your visit was informative and enjoyable.</I><BR>
</P>
</CENTER>
</BLOCKQUOTE><HR>

ENDOFTEXT

if ( $ENV{'HTTP_REFERER'} ne "" ) {
print "<a href=\"$ENV{'HTTP_REFERER'}\">";
}
else {
print;
}
print <<ENDOFTEXT;

    </tr>

      </table>
    </td>
  </tr>
</table>
<!-- END BODY OF TEXT HERE -->
<!-- footer -->
<table width="80%" cellspacing="2" cellpadding="2" border="0">
  <tr> 
    <td colspan="3"> 
      <HR>
    </td>
  </tr>

  <tr valign="TOP"> 
    <td class="gray"> <a href="http://www.doc.gov"><span class="gray">US Dept 
      of Commerce</span></a><br>
      <a href="http://www.noaa.gov"><span class="gray">National Oceanic and Atmospheric 
      Administration</span></a><br>
      National Weather Service<br>
      Office of the Chief Information Officer (OCIO13)<BR>
      1325 East West Highway<br>

      Silver Spring, MD 20910<br>
      Page last modified: March 31, 2005<br>
      Page Author: <a href="mailto:nws.isg@noaa.gov"><span class="gray">Internet 
      Services Group</span></a></td>
    <td><a href="http://weather.gov/disclaimer.html"><span class="gray">Disclaimer</span></a><br>
      <a href="http://weather.gov/feedback.shtml"><span class="gray">Feedback</span></a> </td>

    <td align="right"><a href="http://weather.gov/notice.html"><span class="gray">Privacy Policy</span></a><br>
      <a href="http://weather.gov/credits.html"><span class="gray">Credits</span></a> </td>
  </tr>
</table>

</body>
</html>


ENDOFTEXT




}




