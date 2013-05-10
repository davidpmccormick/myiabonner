<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href='../utilities/html5.xsl'/>
<xsl:import href='../utilities/string-replace.xsl'/>
<xsl:import href='../utilities/removefrompdf.xsl'/>

<xsl:template match="data">
	<div class="row relative">
		<xsl:choose>
			<xsl:when test="$sessionmonster-namefield != '' and $sessionmonster-add != ',0,' and $sessionmonster-add != ''">
				<a style="position:absolute;top:-30px;right:0px;" class="compilepdf" href="#">DOWNLOAD PDF</a>
			</xsl:when>
			<xsl:otherwise>
				<a style="position:absolute;top:-30px;right:0px;display:none;" class="compilepdf" href="#">DOWNLOAD PDF</a>
			</xsl:otherwise>
		</xsl:choose>
	</div>
	<div class="row">
		<xsl:choose>
			<!-- show name if already entered, with greyed Submit button -->
			<xsl:when test="$sessionmonster-namefield">
				<div class="span4 relative" style="margin-bottom:20px;">
					<img src="{$workspace}/assets/images/grey.png" width="100%" height="auto" />
					<form method="get" action="" style="position:absolute;top:10px;left:10px;">
						<input id="thenamefield" type="text" name="namefield" placeholder="Enter your name here" value="{$sessionmonster-namefield}" style="border:none;background:none;box-shadow:none;" /><br />
					    <input type="submit" class="submitbutton submitted" value="Submit" style="background:transparent;border:none;box-shadow:none;clear:both;"/>
					</form>
				</div>
			</xsl:when>
			<!-- otherwise show Enter your name form -->
			<xsl:otherwise>
				<div class="span4 relative" style="margin-bottom:20px;">
					<img src="{$workspace}/assets/images/grey.png" width="100%" height="auto" />
					<form method="get" action="" style="position:absolute;top:10px;left:10px;">
						<input id="thenamefield" type="text" name="namefield" placeholder="Enter your name here" value="" style="border:none;background:none;box-shadow:none;" /><br />
					    <input type="submit" class="submitbutton" value="Submit" style="background:transparent;border:none;box-shadow:none;clear:both;"/>
					</form>
				</div>
			</xsl:otherwise>
		</xsl:choose>
		<!-- end enter your name -->
		<xsl:apply-templates select="pdfcollections/entry" />
		<xsl:apply-templates select="pdfarchiveimages/entry" />
		<xsl:apply-templates select="pdfshowcaseimages/entry" />
		<xsl:apply-templates select="pdfcollectionitems/entry" />
		<xsl:apply-templates select="pdfnews/entry" />
		<xsl:apply-templates select="pdfnewsimages/entry" />
		<xsl:apply-templates select="pdfabout/entry" />
		<xsl:apply-templates select="pdfstockists/entry" />
	</div>
</xsl:template>

<!-- pdfcollections -->
<xsl:template match="pdfcollections/entry">
	<div class="span4" style="text-align:center;">
		<img src="{$root}/image/2/300/200/5/0/assets/images/{top-image/filename}" width="100%" height="auto" />
		<xsl:call-template name="removefrompdf" />
	</div>
</xsl:template>
<!-- end pdfcollections -->

<!-- pdfarchiveimages -->
<xsl:template match="pdfarchiveimages/entry">
	<div class="span4" style="text-align:center;">
		<img src="{$root}/image/2/300/200/5/0/assets/images/{image/filename}" width="100%" height="auto" />
		<xsl:call-template name="removefrompdf" />
	</div>
</xsl:template>
<!-- end pdfarchiveimages -->

<!-- pdfshowcaseimages -->
<xsl:template match="pdfshowcaseimages/entry">
	<div class="span4" style="text-align:center;">
		<img src="{$root}/image/2/300/200/5/0/assets/images/{image/filename}" width="100%" height="auto" />
		<xsl:call-template name="removefrompdf" />
	</div>
</xsl:template>
<!-- end pdfshowcaseimages -->

<!-- pdfcollectionitems -->
<xsl:template match="pdfcollectionitems/entry">
	<div class="span4" style="text-align:center;">
		<img src="{$root}/image/2/300/200/5/0/assets/images/{main-image/filename}" width="100%" height="auto" />
		<xsl:call-template name="removefrompdf" />
	</div>
</xsl:template>
<!-- end pdfcollectionitems -->

<!-- pdfnews -->
<xsl:template match="pdfnews/entry">
	<div class="span4" style="text-align:center;">
		<img src="{$root}/image/2/300/200/5/0/assets/images/{main-image/filename}" width="100%" height="auto" />
		<xsl:call-template name="removefrompdf" />
	</div>
</xsl:template>
<!-- end pdfnews -->

<!-- pdfnewsimages -->
<xsl:template match="pdfnewsimages/entry">
	<div class="span4" style="text-align:center;">
		<img src="{$root}/image/2/300/200/5/0/assets/images/{image/filename}" width="100%" height="auto" />
		<xsl:call-template name="removefrompdf" />
	</div>
</xsl:template>
<!-- end pdfnewsimages -->

<!-- pdfabout -->
<xsl:template match="pdfabout/entry">
	<div class="span4 relative" style="text-align:center;">
		<img src="{$workspace}/assets/images/grey.png" width="100%" height="auto" />
		<div style="position:absolute;top:10px;left:10px;">
			<p>About</p>
		</div>
		<xsl:call-template name="removefrompdf" />
	</div>
</xsl:template>
<!-- end pdfabout -->

<!-- pdfstockists -->
<xsl:template match="pdfstockists/entry">
	<div class="span4 relative" style="text-align:center;">
		<img src="{$workspace}/assets/images/grey.png" width="100%" height="auto" />
		<div style="position:absolute;top:10px;left:10px;">
			<p>Stockists</p>
		</div>
		<xsl:call-template name="removefrompdf" />
	</div>
</xsl:template>
<!-- end pdfstockists -->

</xsl:stylesheet>