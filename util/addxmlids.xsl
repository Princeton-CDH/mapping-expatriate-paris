<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:math="http://www.w3.org/2005/xpath-functions/math"
	xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
	xmlns:tei="http://www.tei-c.org/ns/1.0"
	exclude-result-prefixes="xs math xd tei"
	version="3.0">
	<xd:doc scope="stylesheet">
		<xd:desc>
			<xd:p><xd:b>Created on:</xd:b> Oct 20, 2015</xd:p>
			<xd:p><xd:b>Author:</xd:b> cwulfman</xd:p>
			<xd:p></xd:p>
		</xd:desc>
	</xd:doc>
	
	<xsl:template match="/">
		<xsl:apply-templates />
	</xsl:template>
	
	<xsl:template match="tei:person">
		<xsl:variable name="lastname" select="tei:persName[1]/tei:surname"/>
		<xsl:variable name="firstname" select="tei:persName[1]/tei:forename[1]" />
		<xsl:element name="person" inherit-namespaces="yes" namespace="http://www.tei-c.org/ns/1.0">
			<xsl:attribute name="xml:id">
				<xsl:choose>
					<xsl:when test="@xml:id">
						<xsl:copy select="@xml:id" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat(lower-case(substring($lastname,1,4)), '.', lower-case(substring($firstname,1,2)))"></xsl:value-of>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<xsl:apply-templates />
		</xsl:element>
	</xsl:template>
	
	<!-- Identity transform -->
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>
</xsl:stylesheet>