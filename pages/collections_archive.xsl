<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href='../utilities/html5.xsl'/>
<xsl:import href='../utilities/stickybuttons.xsl'/>

<xsl:template match="data">
	<div class="row">
		<xsl:call-template name="stickybuttons">
			<xsl:with-param name="backto">
				<xsl:value-of select="$root" /><xsl:text>/collections</xsl:text>
			</xsl:with-param>
		</xsl:call-template>
	</div>
	
	<div class="span12 clearfix visible-phone">
		<div class="largecontainer relative">
			<!-- phone back and pdf buttons -->
			<div>
				<a style="position:absolute;top:-30px;left:-20px;" class="backbutton" href="{$root}/collections">BACK</a>
				<!-- if the sessionmonster param isn't its initial value, or empty, show the 'VIEW PDF' link -->
				<xsl:choose>
					<xsl:when test="$sessionmonster-add != ',0,' and $sessionmonster-add != ''">
						<a style="position:absolute;top:-30px;right:-20px;" class="viewpdf" href="{$root}/pdf">VIEW PDF</a>
					</xsl:when>
					<xsl:otherwise test="$sessionmonster-add != ',0,' and $sessionmonster-add != ''">
						<a style="position:absolute;top:-30px;right:-20px;display:none;" class="viewpdf" href="{$root}/pdf">VIEW PDF</a>
					</xsl:otherwise>
				</xsl:choose>
			</div>
			<!-- end phone and pdf buttons -->
		</div>
	</div>
	
	<div class="row collectionthumbnails">
		<xsl:apply-templates select="archiveindex/entry" /> <!-- below -->		
	</div>
</xsl:template>

<xsl:template match="archiveindex/entry">
	<div class="span4">
		<a href="{$root}/collections/archive/detail/{title/@handle}">
			<img class="mousemove" width="100%" height="auto">
				<xsl:attribute name="src">
					<xsl:value-of select="$root" />
					<xsl:text>/image/2/300/200/5/0/assets/images/</xsl:text>
					<xsl:value-of select="thumbnail-image/filename" />
				</xsl:attribute>
			</img>
			<div class="titlecontainer clearfix">
				<h2><xsl:value-of select="title" /></h2>
			</div>
		</a>
	</div>
</xsl:template>

</xsl:stylesheet>