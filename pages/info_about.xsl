<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href='../utilities/html5.xsl'/>
<xsl:import href='../utilities/stickybuttons.xsl'/>

<xsl:template match="data">
	<div class="row">
	
		<xsl:call-template name="stickybuttons">
			<xsl:with-param name="backto">
				<xsl:value-of select="$root" /><xsl:text>/info</xsl:text>
			</xsl:with-param>
		</xsl:call-template>
	
		<div class="span12 clearfix">
			<div class="largecontainer relative graybox">
			
				<!-- mobile back and pdf links -->
				<div class="visible-phone">
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
				<!-- end mobile back and pdf links -->

				<div class="innercontent">
					<h3>About</h3>
					<xsl:copy-of select="about/entry/body/node()" />
				</div>
				<div class="share">
					<p>
						<!-- share link -->
						<a href="#modal-{about/entry/@id}" data-toggle="modal">Share</a>
						<!-- end share link -->
						
						<!-- add to Pdf -->
						<xsl:variable name="currentid">
							<xsl:text>&#44;</xsl:text><xsl:value-of select="about/entry/@id" /><xsl:text>&#44;</xsl:text>
						</xsl:variable>
						<xsl:choose>
							<!-- if the entry id is already in the sessionmonster-add param 
								don't add anything to the get request (leave it as it is)
								and add an 'added' class to the anchor tag for styling -->
							<xsl:when test="contains($sessionmonster-add, $currentid)">
								<a style="margin-left:20px;" class="added" href="?add={$sessionmonster-add}">+Pdf</a>
							</xsl:when>
							<!-- otherwise add the current id and a comma to the get request -->
							<xsl:otherwise>
								<a style="margin-left:20px;" class="addlink" href="{about/entry/@id}&#44;">+Pdf</a>
							</xsl:otherwise>
						</xsl:choose>
						<!-- end add to Pdf -->
						
						<!-- share modal window -->
						<div class="modal hide fade" id="modal-{about/entry/@id}" tabindex="-1">
						  <div class="modal-header">
						    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&#215;</button>
						    <h3 id="myModalLabel-{about/entry/@id}">About</h3>
						  </div>
						  <div class="modal-body">
							<div class='sharebuttons'>
							<div class='twitter' data-url='{$current-url}' data-text='About Myia Bonner' data-title='Tweet'></div>
								<div class='facebook' data-url='{$current-url}' data-text='About Myia Bonner' data-title='Like'></div>
							</div>
						  </div>
						</div>		
						<!-- end share modal window -->
						
					</p>
				</div>
			</div>
		</div>
	</div>
</xsl:template>

</xsl:stylesheet>