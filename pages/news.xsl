<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href='../utilities/html5.xsl'/>

<xsl:template match="data">
	<div class="row">
		<xsl:apply-templates select="newsindex/entry" />
	</div>
</xsl:template>

<xsl:template match="newsindex/entry">
	<div class="span12 clearfix">
		<div class="largecontainer relative newsitem">
			<div class="headsup" style="position:absolute;left:20px;top:20px;background-color:#f3f3f3; width:40%;">
				<div style="padding:20px 20px 50px;">
					<h3 style="margin:0 0 5px 0;padding:0;line-height:1.2;"><xsl:value-of select="title" /></h3>
					<h3 style="margin:0 0 20px 0;padding:0;line-height:1.2;">
						<xsl:call-template name="format-date">
							<xsl:with-param name="date" select="date" />
							<xsl:with-param name="format" select="'d.n.Y'" />
						</xsl:call-template>
					</h3>
					<div class="hidden-phone">
						<xsl:copy-of select="teaser/node()" />
					</div>
				</div>
				<div class="readmore" style="position:absolute;left:20px;bottom:20px;"><a href="{$root}/news/view/{title/@handle}">Read more</a></div>
				<div class="sharethis hidden-phone" style="position:absolute;right:20px;bottom:20px;">

				<!-- share modal window -->
				<a  style="margin-left:10px;" href="#modal-{./@id}" data-toggle="modal">Share</a>
				<div class="modal hide fade" id="modal-{./@id}" tabindex="-1">
				  <div class="modal-header">
				    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&#215;</button>
				    <h3 id="myModalLabel-{./@id}"><xsl:value-of select="./title" /></h3>
				  </div>
				  <div class="modal-body">
					<div class='sharebuttons'>
						<div class='twitter' data-url='{$current-url}/view/{./title/@handle}' data-text='{./title}' data-title='Tweet'></div>
						<div class='facebook' data-url='{$current-url}/view/{./title/@handle}' data-text='{./title}' data-title='Like'></div>
					</div>
				  </div>
				</div>		
				<!-- end share modal window -->

				</div>
			</div>
			<img src="{$root}/image/2/800/530/5/0/assets/images/{main-image}" />
		</div>
	</div>
</xsl:template>

</xsl:stylesheet>