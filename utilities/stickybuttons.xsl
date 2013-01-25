<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="stickybuttons">
	<xsl:param name="backto" select="$root" />
	<div class="span12 relative hidden-phone">
		<div class="row">
			<div class="fixit span12" data-spy="affix" data-offset-top="100">
				<div class="backdiv" style="position:absolute;left:0px;padding-left:52px;top:-30px;z-index:4;width:100%;background:#fff;height:30px;"><a class="backbutton" style="display:block;width:25px;height:25px;" href="{$backto}">BACK</a></div>
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
</xsl:template>

</xsl:stylesheet>