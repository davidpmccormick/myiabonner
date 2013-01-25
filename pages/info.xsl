<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href='../utilities/html5.xsl'/>

<xsl:template match="data">
	<div class="row collectionthumbnails">
		<div class="span4">
			<a href="{$root}/info/about">
				<img src="{$workspace}/assets/images/about.png" width="100%" height="auto" />
				<div class="titlecontainer clearfix">
					<h2>About</h2>
				</div>
			</a>
		</div>
		<div class="span4">
			<a href="{$root}/info/press">
				<img src="{$workspace}/assets/images/press.png" width="100%" height="auto" />
				<div class="titlecontainer clearfix">
					<h2>Press</h2>
				</div>
			</a>
		</div>		
		<div class="span4">
			<a href="{$root}/info/stockists">
				<img src="{$workspace}/assets/images/stockists.png" width="100%" height="auto" />
				<div class="titlecontainer clearfix">
					<h2>Stockists</h2>
				</div>
			</a>
		</div>
	</div>
</xsl:template>

</xsl:stylesheet>