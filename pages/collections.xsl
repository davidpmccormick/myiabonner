<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href='../utilities/html5.xsl'/>

<xsl:template match="data">
	<div class="row collectionthumbnails">
		<xsl:apply-templates select="collections/entry" /> <!-- below -->
		<div class="span4">
			<a href="{$root}/collections/archive">
				<img class="mousemove" width="100%" height="auto">
					<xsl:attribute name="src">
						<xsl:value-of select="$root" />
						<xsl:text>/image/2/300/200/5/0/assets/images/</xsl:text>
						<xsl:value-of select="archivethumbnails/entry/thumbnail-image/filename" />
					</xsl:attribute>
					<xsl:attribute name="rel">
						<xsl:for-each select="archivethumbnails/entry">
							<xsl:value-of select="$root" />
							<xsl:text>/image/2/300/200/5/0/assets/images/</xsl:text>
							<xsl:value-of select="thumbnail-image/filename" />
							<xsl:if test="position() != last()"><xsl:text>,</xsl:text></xsl:if>
						</xsl:for-each>
					</xsl:attribute>
				</img>
				<div class="titlecontainer clearfix">
					<h2>Archive</h2>
				</div>
			</a>
		</div>
	</div>
</xsl:template>

<xsl:template match="collections/entry">
	<div class="span4">
		<a href="{$root}/collections/detail/{title/@handle}">
			<img class="mousemove" width="100%" height="auto">
				<xsl:attribute name="src">
					<xsl:value-of select="$root" />
					<xsl:text>/image/2/300/200/5/0/assets/images/</xsl:text>
					<xsl:value-of select="items/item[position()=1]/thumbnail-image/filename" />
				</xsl:attribute>
				<xsl:attribute name="rel">
					<xsl:for-each select="items/item">
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
	</div>
</xsl:template>

</xsl:stylesheet>