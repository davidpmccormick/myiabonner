<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href='../utilities/html5.xsl'/>
<xsl:import href='../utilities/string-replace.xsl'/>

<xsl:template match="data">
	<div class="row">
		<!-- page 1 -->
		<div class="span12 pdfpage">
			<img style="padding-top:25%;page-break-after:always;padding-bottom:25%;margin-left:28%;" src="{$workspace}/assets/images/pdflogo.svg" width="60%"/>
		</div>
		<!-- page 2 -->
		<div style="padding:20% 0 0 0">
			<h2 style="font-size:16px;margin:0;line-height:1;text-align:center;">A PDF FOR</h2>
			<h2 style="font-size:40px;text-transform:uppercase;margin:0;line-height:1;text-align:center;">
				<xsl:value-of select="$sessionmonster-namefield" />
			</h2>
		</div>
		
		<!-- ITEMS -->
		<xsl:apply-templates select="compilecollections/entry" />
		<xsl:apply-templates select="compilearchiveimages/entry" />
		<xsl:apply-templates select="compilecollectionitems/entry" />
		<xsl:apply-templates select="compilenews/entry" />
		<xsl:apply-templates select="compilenewsimages/entry" />
		<xsl:apply-templates select="compileabout/entry" />
		<xsl:apply-templates select="compilestockists/entry" />
		<!-- END ITEMS -->
		
		<!-- thank you page -->
		<div style="padding:24% 0 0 0">
			<h2 style="font-size:40px;margin:0;line-height:1;text-align:center;">THANK YOU</h2>
		</div>
		
	</div>
</xsl:template>

<xsl:template match="compilecollections/entry">
	<div class="span12 graybox" style="clear:both;margin-bottom:20px;margin-top:0;">
		<div class="innercontent">
			<blockquote>
				<h3 style="font-size:13px!important;"><xsl:value-of select="title" /></h3>
				<xsl:copy-of select="description/node()" />
			</blockquote>
		</div>
	</div>
</xsl:template>

<xsl:template match="compilearchiveimages/entry">
	<div class="span12 relative" style="clear:both;margin-bottom:20px;">
		<img src="{$root}/image/2/800/530/5/0/assets/images/{image}" width="100%" height="auto" />
	</div>
</xsl:template>

<xsl:template match="compilecollectionitems/entry">
	<div class="span12 relative" style="clear:both;margin-bottom:20px;">
		<img src="{$root}/image/2/800/530/5/0/assets/images/{main-image}" width="100%" height="auto" />
	</div>
</xsl:template>

<xsl:template match="compilenews/entry">
	<div class="span12 relative" style="clear:both;margin-bottom:20px;">
		<img src="{$root}/image/2/800/530/5/0/assets/images/{main-image}" width="100%" height="auto" />
	</div>
	<div class="span12 graybox" style="clear:both;margin-bottom:20px;margin-top:0;">
		<div class="innercontent">
			<blockquote>
				<h3 style="font-size:13px!important;"><xsl:value-of select="title" /></h3>
				<xsl:copy-of select="story/node()" />
			</blockquote>
		</div>
	</div>
</xsl:template>

<xsl:template match="compilenewsimages/entry">
	<div class="span12 relative" style="clear:both;margin-bottom:20px;">
		<img src="{$root}/image/2/800/530/5/0/assets/images/{image}" width="100%" height="auto" />
	</div>
</xsl:template>

<xsl:template match="compileabout/entry">
	<div class="span12 graybox" style="clear:both;margin-bottom:20px;margin-top:0;">
		<div class="innercontent">
			<blockquote>
				<h3 style="font-size:13px!important;">About</h3>
				<xsl:copy-of select="body/node()" />
			</blockquote>
		</div>
	</div>
</xsl:template>

<xsl:template match="compilestockists/entry">
	<div class="span12 graybox" style="clear:both;margin-bottom:20px;margin-top:0;">
		<div class="innercontent">
			<blockquote>
				<h3 style="font-size:13px!important;">Stockists</h3>
				<xsl:copy-of select="body/node()" />
			</blockquote>
		</div>
	</div>
</xsl:template>


</xsl:stylesheet>