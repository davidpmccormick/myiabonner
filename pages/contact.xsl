<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href='../utilities/html5.xsl'/>

<xsl:template match="data">
	<div class="row">
	
		<!-- Sticky back button and view pdf link -->
		<div class="span12 relative hidden-phone">
			<div class="row">
				<div class=" fixit span12" data-spy="affix" data-offset-top="110">
					<div class="backdiv" style="position:absolute;left:52px;top:-30px;z-index:4;width:100%;background:#fff;height:30px;"></div>
					<div class="pdfdiv" style="position:absolute;right:52px;top:-30px;z-index:4">
						<xsl:choose>
							<xsl:when test="$sessionmonster-add != ',0,' and $sessionmonster-add != ''">
								<a class="viewpdf" href="{$root}/pdf">VIEW PDF</a>
							</xsl:when>
							<xsl:otherwise test="$sessionmonster-add != ',0,' and $sessionmonster-add != ''">
								<a style="display:none;" class="viewpdf" href="{$root}/pdf">VIEW PDF</a>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
		</div>
		<!-- end sticky back button and view pdf link -->
	
		<div class="span12 clearfix">
			<div class="largecontainer relative graybox">
				<!-- if the sessionmonster param isn't its initial value, or empty, show the 'VIEW PDF' link -->
				<div class="visible-phone">
					<xsl:choose>
						<xsl:when test="$sessionmonster-add != ',0,' and $sessionmonster-add != ''">
							<a style="position:absolute;top:-30px;right:-20px;" class="viewpdf" href="{$root}/pdf">VIEW PDF</a>
						</xsl:when>
						<xsl:otherwise test="$sessionmonster-add != ',0,' and $sessionmonster-add != ''">
							<a style="position:absolute;top:-30px;right:-20px;display:none;" class="viewpdf" href="{$root}/pdf">VIEW PDF</a>
						</xsl:otherwise>
					</xsl:choose>
				</div>
				<div class="innercontent">
					<h3>Contact</h3>
					<xsl:copy-of select="contact/entry/body/node()" />				
				</div>
			</div>
		</div>
	</div>
</xsl:template>

</xsl:stylesheet>