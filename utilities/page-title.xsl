<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="page-title">
	<xsl:text>MYIA</xsl:text>
	<xsl:text> &#8212; </xsl:text>
	<xsl:variable name="smallcase" select="'abcdefghijklmnopqrstuvwxyz'" />
	<xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />
	<xsl:choose>
		<!-- news view page -->
		<xsl:when test="$current-page-id = 12">
			<xsl:value-of select="translate(/data/newsview/entry/title, $smallcase, $uppercase)" />
		</xsl:when>
		<!-- collection detail page -->
		<xsl:when test="$current-page-id = 7">
			<xsl:value-of select="translate(/data/collection/entry/title, $smallcase, $uppercase)" />
		</xsl:when>
		<!-- archive detail page -->
		<xsl:when test="$current-page-id = 14">
			<xsl:value-of select="translate(/data/archivedetail/entry/title, $smallcase, $uppercase)" />
		</xsl:when>
		<!-- all other pages -->
		<xsl:otherwise>
			<xsl:value-of select="translate($page-title, $smallcase, $uppercase)" />
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

</xsl:stylesheet>