<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xt="http://iuclid6.echa.europa.eu/namespaces/manifest/v1"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xlink="http://www.w3.org/1999/xlink"
				version="1.0">
	<xsl:template match="/">
		<html>
			<head>
				<link href="iuclid6_style.css" rel="stylesheet" type="text/css"/>
			</head>
			<body>
				<h2>
					<xsl:value-of select="xt:manifest/xt:general-information/xt:title"/>
				</h2>

				<h3>General Information</h3>
				<table border="0" cellsapacing="2" cellpadding="2">
					<tr>
						<td>Created:</td>
						<td>
							<xsl:value-of select="xt:manifest/xt:general-information/xt:created"/>
						</td>
					</tr>
					<tr>
						<td>Author:</td>
						<td>
							<xsl:value-of select="xt:manifest/xt:general-information/xt:author"/>
						</td>
					</tr>
					<tr>
						<td>Application:</td>
						<td>
							<xsl:value-of select="xt:manifest/xt:general-information/xt:application"/>
						</td>
					</tr>
					<tr>
						<td>Submission type:</td>
						<td>
							<xsl:value-of select="xt:manifest/xt:general-information/xt:submission-type"/>
						</td>
					</tr>
					<tr>
						<td>Archive type:</td>
						<td>
							<xsl:value-of select="xt:manifest/xt:general-information/xt:archive-type"/>
						</td>
					</tr>
					<tr>
						<td>Legislations:</td>
						<td>
							<xsl:for-each select="xt:manifest/xt:general-information/xt:legislations-info/xt:legislation[last()-1]">
								<xsl:value-of select="xt:id"/> (<xsl:value-of select="xt:version"/>),
							</xsl:for-each>
							<xsl:value-of select="xt:manifest/xt:general-information/xt:legislations-info/xt:legislation[last()]/xt:id"/> (<xsl:value-of select="xt:manifest/xt:general-information/xt:legislations-info/xt:legislation[last()]/xt:version"/>)
						</td>
					</tr>
				</table>

				<h3>Comment</h3>
				<span id="comment">
					<xsl:value-of select="xt:manifest/xt:comment"/>
				</span>

				<h3>Base document uuid</h3>
				<span id="comment">
					<xsl:value-of select="xt:manifest/xt:base-document-uuid"/>
				</span>

				<h3>Contained documents</h3>
				<xsl:for-each select="xt:manifest/xt:contained-documents/xt:document">
					<table border="0" cellsapacing="2" cellpadding="2" bgcolor="#d3d3d3" width="80%">
						<tr>
							<td width="20%">
								<strong><xsl:value-of select="xt:type"/>:
								</strong>
							</td>
							<td colspan="3">
								<strong>
									<xsl:if test="xt:sub-type">
										<xsl:value-of select="xt:sub-type"/>:
									</xsl:if>
									<a href="{xt:name/@xlink:href}">
										<xsl:value-of select="xt:name"/>
									</a>
								</strong>
							</td>
						</tr>
						<tr>
							<td>First modification date:</td>
							<td>
								<xsl:value-of select="xt:first-modification-date"/>
							</td>
							<td>Last modification date:</td>
							<td><xsl:value-of select="xt:last-modification-date"/>:
							</td>
						</tr>
						<tr>
							<td>UUID:</td>
							<td colspan="3">
								<xsl:value-of select="xt:uuid"/>
							</td>
						</tr>
						<xsl:if test="xt:links/xt:link">
							<tr>
								<td colspan="4">
									<h5>Links</h5>
									<ul>
										<xsl:for-each select="xt:links/xt:link">
											<li>
												<xsl:value-of select="xt:ref-uuid"/>
											</li>
										</xsl:for-each>
									</ul>
								</td>
							</tr>
						</xsl:if>
					</table>
					<p/>
				</xsl:for-each>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>