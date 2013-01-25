<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href='../utilities/html5.xsl'/>

<xsl:template match="data">
	<div class="row">
		<div class="span12 clearfix">
			<div class="largecontainer relative graybox">
				<!-- if the sessionmonster param isn't its initial value, or empty, show the 'VIEW PDF' link -->
				<xsl:choose>
					<xsl:when test="$sessionmonster-add != ',0,' and $sessionmonster-add != ''">
						<a style="position:absolute;top:-30px;right:-20px;" class="viewpdf" href="{$root}/pdf">VIEW PDF</a>
					</xsl:when>
					<xsl:otherwise test="$sessionmonster-add != ',0,' and $sessionmonster-add != ''">
						<a style="position:absolute;top:-30px;right:-20px;display:none;" class="viewpdf" href="{$root}/pdf">VIEW PDF</a>
					</xsl:otherwise>
				</xsl:choose>
				<div class="innercontent">
					<h3>Terms &amp; Conditions</h3>
					<xsl:copy-of select="terms/entry/body/node()" />				
				</div>
			</div>
		</div>
	</div>
</xsl:template>

</xsl:stylesheet>