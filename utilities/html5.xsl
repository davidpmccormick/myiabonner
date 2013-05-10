<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/page-title.xsl"/>
<xsl:import href="../utilities/navigation.xsl"/>
<xsl:import href="../utilities/date-time.xsl"/>

<xsl:output method="html" omit-xml-declaration="yes" indent="no" />

<xsl:variable name="is-logged-in" select="/data/events/login-info/@logged-in"/>

<xsl:param name="sessionmonster-add"><xsl:text>&#44;0&#44;</xsl:text></xsl:param> <!-- initialise the pdf param for session monster -->
<xsl:param name="sessionmonster-namefield" /> <!-- initialise the pdf param for session monster -->
<xsl:template match="/">
	<xsl:text disable-output-escaping="yes">&lt;</xsl:text>!DOCTYPE html<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
	<html lang="en">
		<head>
			<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
			<meta charset="utf-8" />
			<meta name="title" content="{$page-title}" />
			<meta name="description" content="" />
			<meta name="tags" content="" />
			<title><xsl:call-template name="page-title"/></title>

			<link rel="shortcut icon" href="{$workspace}/assets/images/favicon.png" />
			<link rel="icon" type="images/png" href="{$workspace}/assets/images/favicon.png" />
			<link rel="stylesheet" media="screen" href="{$workspace}/css/myiabonner.css" />

			<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
			<script src="{$workspace}/js/master-ck.js"></script>

			<xsl:comment><![CDATA[[if lt IE 9]><script type="text/javascript" src="]]><xsl:value-of select="$root"/><![CDATA[/workspace/js/html5shiv.min.js"></script><![endif]]]></xsl:comment>
			<xsl:comment><![CDATA[[if (gte IE 6)&(lte IE 8)]><script type="text/javascript" src="]]><xsl:value-of select="$root"/><![CDATA[/workspace/js/selectivizr.min.js"></script><![endif]]]></xsl:comment>
		</head>
		
		<body id="{$current-page}-page" rel="{$workspace}">
			<div class="container">
				<!-- don't show the header on the PDF compile page -->
				<xsl:if test="$current-page-id != 15">
					<header class="header">
						<!-- navbar for phones only -->
						<div class="navbar navbar-fixed-top visible-phone">
						  <div class="navbar-inner">
						    <div class="container">
						      <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
						        <span style="font-size:10px;">MENU</span>
						      </button>
						      <div class="nav-collapse collapse" style="height: 0px; text-align:center;">
						        <xsl:apply-templates select="data/navigation"/>
						      </div>
						    </div>
						  </div>
						</div>
						<!-- end of phone navbar -->
						<div class="row clearfix hidden-phone ">
							<div style="position:fixed;top:0;left:0;right:0;height:10px;background:#fff;z-index:999;width:100%;"></div>
							<nav class="nav" style="background:#fff;z-index:999;margin-top:10px;padding-bottom:10px;position:fixed;" data-spy="affix" data-offset-top="0">
								<div class="span12">
									<xsl:apply-templates select="data/navigation"/>
								</div>
							</nav>
						</div>
						<div class="row">
							<div class="span12 logocontainer hidden-phone">
								<h1 class="logo">MYIA BONNER</h1>
							</div>
							<div class="span12 logocontainermobile visible-phone">
								<h1 class="logo">MYIA BONNER</h1>
							</div>
						</div>
					</header>
				</xsl:if>
				<div class="maincontent" rel="{$sessionmonster-add}">
					<xsl:apply-templates/>
				</div>
			</div> <!-- end .container -->
			<!-- show the footer on all bar the pdf compile page -->
			<xsl:if test="$current-page-id != 15">
				<footer class="footer" rel="{$root}">
					<div class="container">
						<div class="row">
							<div class="span12">
								<p style="margin-top:10px; font-size:16px;">&#169; Myia Bonner</p>
							</div>
							<div class="span3">
								<p style="margin-top:10px; font-size:16px;"><a href="{$root}/terms">Terms &amp; Conditions</a></p>
							</div>
							<div class="span3">
								<p style="margin-top:10px; margin-bottom:0; font-size:16px;line-height:1.2;"><a href="mailto:myia@myiabonner.co.uk">myia@myiabonner.co.uk</a></p>
								<p style="font-size:16px;margin-top:4px;">07855529975</p>
							</div>
							<div class="span3">
								<p style="margin-top:10px; margin-bottom:0; font-size:16px;line-height:1.2;"><a href="http://www.facebook.com/pages/Myia-Bonner-Jewellery/121368967907130">Facebook</a></p>
								<p style="margin-bottom:20px; font-size:16px;margin-top:4px;line-height:1.2;"><a href="https://twitter.com/myiabonner">Twitter</a></p>
							</div>
							<div class="span3">
								<p style="margin-top:10px; margin-bottom:0; font-size:16px;line-height:1.2; padding-bottom:20px; float:right;"><a href="http://eepurl.com/rkkfz">Newsletter</a></p>
							</div>					
						</div>
					</div>					
				</footer>
			</xsl:if>
			<script>
			  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
			  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
			  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
			  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
			
			  ga('create', 'UA-40838230-1', 'myiabonner.co.uk');
			  ga('send', 'pageview');
			</script>		
		</body>
	</html>
</xsl:template>

<xsl:strip-space elements="*"/>

</xsl:stylesheet>