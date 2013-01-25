<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href='../utilities/html5.xsl'/>
<xsl:import href='../utilities/stickybuttons.xsl'/>

<xsl:template match="data">

	<div class="row relative">
	
		<xsl:call-template name="stickybuttons">
			<xsl:with-param name="backto">
				<xsl:value-of select="$root" /><xsl:text>/info</xsl:text>
			</xsl:with-param>
		</xsl:call-template>
		
		<div class="visible-phone">
			<a style="position:absolute;top:-30px;left:56px;" class="backbutton" href="{$root}/info">BACK</a>
			<!-- if the sessionmonster param isn't its initial value, or empty, show the 'VIEW PDF' link -->
			<xsl:choose>
				<xsl:when test="$sessionmonster-add != ',0,' and $sessionmonster-add != ''">
					<a style="position:absolute;top:-30px;right:30px;" class="viewpdf" href="{$root}/pdf">VIEW PDF</a>
				</xsl:when>
				<xsl:otherwise test="$sessionmonster-add != ',0,' and $sessionmonster-add != ''">
					<a style="position:absolute;top:-30px;right:41px;display:none;" class="viewpdf" href="{$root}/pdf">VIEW PDF</a>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</div>
	<div class="row collectionthumbnails relative">
		<xsl:apply-templates select="press/entry" />
	</div>
</xsl:template>

<xsl:template match="press/entry">
	<div class="span4">
	
	<xsl:choose>
		<xsl:when test="link-url != ''">
			<a href="{link-url}" target="_blank">
				<img class="mousemove" width="100%" height="auto">
					<xsl:attribute name="src">
						<xsl:value-of select="$root" />
						<xsl:text>/image/2/300/200/5/0/assets/images/</xsl:text>
						<xsl:value-of select="thumbnails/item/thumbnail-image/filename" />
					</xsl:attribute>
					<xsl:attribute name="rel">
						<xsl:for-each select="thumbnails/item">
							<xsl:value-of select="$root" />
							<xsl:text>/image/2/300/200/5/0/assets/images/</xsl:text>
							<xsl:value-of select="thumbnail-image/filename" />
							<xsl:if test="position() != last()"><xsl:text>,</xsl:text></xsl:if>
						</xsl:for-each>
					</xsl:attribute>
				</img>
				<div class="titlecontainer clearfix">
					<h2><xsl:value-of select="title" /></h2>
				</div>
			</a>
		</xsl:when>
		<xsl:otherwise>
				<img class="mousemove" width="100%" height="auto">
					<xsl:attribute name="src">
						<xsl:value-of select="$root" />
						<xsl:text>/image/2/300/200/5/0/assets/images/</xsl:text>
						<xsl:value-of select="thumbnails/item/thumbnail-image/filename" />
					</xsl:attribute>
					<xsl:attribute name="rel">
						<xsl:for-each select="thumbnails/item">
							<xsl:value-of select="$root" />
							<xsl:text>/image/2/300/200/5/0/assets/images/</xsl:text>
							<xsl:value-of select="thumbnail-image/filename" />
							<xsl:if test="position() != last()"><xsl:text>,</xsl:text></xsl:if>
						</xsl:for-each>
					</xsl:attribute>
				</img>
			<div class="titlecontainer clearfix">
				<h2><xsl:value-of select="title" /></h2>
			</div>
		</xsl:otherwise>
	</xsl:choose>

	</div>
</xsl:template>

</xsl:stylesheet>