<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href='../utilities/html5.xsl'/>

<xsl:template match="data">
	<div class="row">
		<div class="span12 clearfix">
			<div class="largecontainer cyclethis">
				<xsl:apply-templates select="showcaseimages/entry" />
			</div>
		</div>
	</div>
</xsl:template>

<xsl:template match="showcaseimages/entry">
	<xsl:choose>
		<xsl:when test="link-url != ''">
			<a style="display:block;width:100%;border-bottom:none;" href="{link-url}" target="_blank"><img src="{$root}/image/2/800/530/5/0/{image/@path}/{image/filename}" /></a>
		</xsl:when>
		<xsl:otherwise>
			<img src="{$root}/image/2/800/530/5/0/{image/@path}/{image/filename}" />
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

</xsl:stylesheet>