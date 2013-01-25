<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="removefrompdf">
	<a class="removelink">
		<xsl:variable name="revisedpdf">
			<!-- current id within commas - e.g. ',4,' -->
			<xsl:variable name="currentid">
				<xsl:text>&#44;</xsl:text><xsl:value-of select="./@id" /><xsl:text>&#44;</xsl:text>
			</xsl:variable>
			<xsl:call-template name="string-replace-all">
				<xsl:with-param name="text" select="$sessionmonster-add" />
				<xsl:with-param name="replace" select="$currentid" />
				<xsl:with-param name="by" select="','" /> <!-- replace e.g. ',4,' with just ',' -->
			</xsl:call-template>
		</xsl:variable>
		<!-- make a get request to overwrite the sessionmonster-add param with the revised string (with the selected entry id removed) -->
		<xsl:attribute name="href">
			<xsl:text>?add=</xsl:text>
			<!-- check if there's a comma at the beginning of the revisedpdf variable; if not, add one -->
			<xsl:choose>
				<xsl:when test="starts-with($revisedpdf,',')">
					<xsl:value-of select="$revisedpdf" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>,</xsl:text><xsl:value-of select="$revisedpdf" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
		<h2 class="remove">REMOVE</h2>
	</a>
</xsl:template>

</xsl:stylesheet>