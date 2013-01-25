<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href='../utilities/html5.xsl'/>

<xsl:template match="data">
	<div class="row">
		<div class="span12 clearfix">
			<div class="largecontainer relative graybox">
				<div class="row">
					<div class="backandpdf span12" data-spy="affix" data-offset-top="100">
						<a style="position:absolute;top:-30px;left:-20px;" class="backbutton" href="{$root}/info">BACK</a>
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
				</div>
				<div class="innercontent">
					<h3>Stockists</h3>
					<p><xsl:copy-of select="stockists/entry/body" /></p>
				</div>
				<div class="share">
					<p>
						<!-- add to Pdf -->
						<xsl:variable name="currentid">
							<xsl:text>&#44;</xsl:text><xsl:value-of select="stockists/entry/@id" /><xsl:text>&#44;</xsl:text>
						</xsl:variable>
						<xsl:choose>
							<!-- if the entry id is already in the sessionmonster-add param 
								don't add anything to the get request (leave it as it is)
								and add an 'added' class to the anchor tag for styling -->
							<xsl:when test="contains($sessionmonster-add, $currentid)">
								<a class="added" href="?add={$sessionmonster-add}">Add to Pdf</a>
							</xsl:when>
							<!-- otherwise add the current id and a comma to the get request -->
							<xsl:otherwise>
								<a class="addlink" href="{stockists/entry/@id}&#44;">Add to Pdf</a>
							</xsl:otherwise>
						</xsl:choose>
						<!-- end add to Pdf -->
						<!-- share -->
						<a style="margin-left:20px;" href="#" rel="popover" data-title="Stockists" data-content="&lt;div class='sharebuttons'>&lt;div class='twitter' data-url='{$current-url}' data-text='Myia Bonner Stockists' data-title='Tweet'>&lt;/div>&lt;div class='facebook' data-url='{$current-url}' data-text='Myia Bonner Stockists' data-title='Like'>&lt;/div>&lt;/div>" data-html="true" data-placement="top" data-trigger="click">Share</a>
						<!-- end share -->
					</p>
				</div>
			</div>
		</div>
	</div>
</xsl:template>

</xsl:stylesheet>