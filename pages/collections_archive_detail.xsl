<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href='../utilities/html5.xsl'/>
<xsl:import href='../utilities/stickybuttons.xsl'/>

<xsl:template match="data">
	<div class="row">
	
		<xsl:call-template name="stickybuttons">
			<xsl:with-param name="backto">
				<xsl:value-of select="$root" /><xsl:text>/collections/archive</xsl:text>
			</xsl:with-param>
		</xsl:call-template>
	
		<div class="span12 clearfix">
			<div class="largecontainer relative">

				<!-- phone back and pdf buttons -->
				<div class="visible-phone">
					<a style="position:absolute;top:-30px;left:-20px;" class="backbutton" href="{$root}/collections/archive">BACK</a>
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
				<!-- end phone and pdf buttons -->	
							
			</div>
			<xsl:apply-templates select="archivedetail/entry/main-images/item" />
			<div class="largecontainer">
				<h3><xsl:value-of select="archivedetail/entry/title" /></h3>
			</div>
		</div>
	</div>
</xsl:template>

<xsl:template match="archivedetail/entry/main-images/item">
	<div class="largecontainer hasoverlay margintop20 relative">
		<img src="{$root}/image/2/800/530/5/0/assets/images/{image/filename}"	 />
		<div class="overlayouter">
			<div class="overlayinner">
				<div class="innerright" style="float:right">
					<p>

						<!-- share modal link -->
						<a href="#modal-{./@id}" data-toggle="modal">Share</a>
						<!-- end share modal link -->

						<xsl:text> </xsl:text>
						<!-- add to Pdf -->
						<xsl:variable name="currentid">
							<xsl:text>&#44;</xsl:text><xsl:value-of select="./@id" /><xsl:text>&#44;</xsl:text>
						</xsl:variable>
						<xsl:choose>
							<!-- if the entry id is already in the sessionmonster-add param 
								don't add anything to the get request (leave it as it is)
								and add an 'added' class to the anchor tag for styling -->
							<xsl:when test="contains($sessionmonster-add, $currentid)">
								<a style="margin-left:20px;" class="added" href="?add={$sessionmonster-add}">+Pdf</a><br />
							</xsl:when>
							<!-- otherwise add the current id and a comma to the get request -->
							<xsl:otherwise>
								<a class="addlink" style="margin-left:20px;" href="{./@id}&#44;">+Pdf</a><br />
							</xsl:otherwise>
						</xsl:choose>
						<!-- end add to Pdf -->
					</p>
				</div>
			</div>
		</div>
	</div>

	<!-- share modal window -->
	<div class="modal hide fade" id="modal-{./@id}" tabindex="-1">
	  <div class="modal-header">
	    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&#215;</button>
	    <h3 id="myModalLabel-{./@id}">
	    	<xsl:choose>
	    		<xsl:when test="../../title !=''">
	    			<xsl:value-of select="../../title" />
	    		</xsl:when>
	    		<xsl:otherwise>
	    			<xsl:text>Archive</xsl:text>
	    		</xsl:otherwise>
	    	</xsl:choose>
	    </h3>
	  </div>
	  <div class="modal-body">
		<div class='sharebuttons'>
			<div class='twitter' data-url='{$current-url}' data-text='{../../title}' data-title='Tweet'></div>
			<div class='facebook' data-url='{$current-url}' data-text='{../../title}' data-title='Like'></div>
		</div>
	  </div>
	</div>		
	<!-- end modal window -->	
	
</xsl:template>

</xsl:stylesheet>