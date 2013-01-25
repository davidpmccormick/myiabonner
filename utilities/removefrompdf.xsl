<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="removefrompdf">
	<a class="removelink">
		<xsl:attribute name="href">
			<xsl:text>&#44;</xsl:text><xsl:value-of select="./@id" /><xsl:text>&#44;</xsl:text>
		</xsl:attribute>
		<h2 class="remove">REMOVE</h2>
	</a>
</xsl:template>

</xsl:stylesheet>