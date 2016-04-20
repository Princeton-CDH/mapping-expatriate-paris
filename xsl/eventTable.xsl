<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
	xmlns:tei="http://www.tei-c.org/ns/1.0"
	xmlns="http://www.w3.org/1999/xhtml"
	exclude-result-prefixes="xs xd tei">
	<xd:doc scope="stylesheet">
		<xd:desc>
			<xd:p><xd:b>Created on:</xd:b> Oct 8, 2015</xd:p>
			<xd:p><xd:b>Author:</xd:b> cwulfman</xd:p>
			<xd:p></xd:p>
		</xd:desc>
	</xd:doc>
	
	<xsl:output method="html" doctype-system="about:legacy-compat"></xsl:output>

	<xsl:template match="/">
		<html>
			<head>
				<title>Event Table</title>
			</head>
			<body>
				<table>
					<thead>
						<tr>
							<th>date</th>
							<th>name</th>
							<th>duration</th>
							<th>frequency</th>
							<th>price</th>
							<th>deposit</th>
						</tr>
					</thead>
					<xsl:apply-templates select="//tei:event" />
				</table>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="tei:event">
		<tr>
			<td> <!-- date -->
				<xsl:value-of select="ancestor::tei:div[@type='day']/tei:head/tei:date/text()"  />
			</td>
			<td> <!-- name -->
				<xsl:value-of select="tei:p/tei:persName" />
			</td>
			<td> <!-- duration -->
				<xsl:value-of select="tei:p/tei:measure[@type='duration']/@quantity" />
			</td>
			<td> <!-- frequency -->
				<xsl:value-of select="tei:p/tei:measure[@type='frequency']/@quantity" />
			</td>
			<td> <!-- price -->
				<xsl:value-of select="tei:p/tei:measure[@type='price']/@quantity" />
			</td>
			<td> <!-- deposit -->
				<xsl:value-of select="tei:p/tei:measure[@type='deposit']/@quantity" />
			</td>
		</tr>
	</xsl:template>
	
</xsl:stylesheet>