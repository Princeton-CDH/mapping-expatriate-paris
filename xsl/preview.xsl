<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs xd"
    version="2.0">
    
    <xsl:output method="html" doctype-system="about:legacy-compat" />
    
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Jun 4, 2015</xd:p>
            <xd:p><xd:b>Author:</xd:b> cwulfman</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:variable name="scheme">http://</xsl:variable>
    <xsl:variable name="server" as="xs:string">libimages.princeton.edu</xsl:variable>
    <xsl:variable name="prefix">loris2</xsl:variable>
    <xsl:variable name="region">full</xsl:variable>
    <xsl:variable name="size">120,</xsl:variable>
    <xsl:variable name="rotation">0</xsl:variable>
    <xsl:variable name="quality">default</xsl:variable>
    <xsl:variable name="format">png</xsl:variable>
    
    <xsl:template match="/">
        <html>
            <head>
                <meta charset="utf-8"/>
            	<link rel="stylesheet" type="text/css" href="../css/preview.css"/>
                <title>Preview</title>
            		<style type="text/css">
            			
            			.date { color: red; }
            			.persName { background-color: yellow; }
            			.bibl { background-color: pink; }
            			.address { color: blue; }
            		</style>
            </head>
            <body>
                <div id="metadata">
                    <xsl:apply-templates select="tei:TEI/teiHeader" />
                </div>
                <div id="facsimile">
                <xsl:apply-templates select="tei:TEI/tei:facsimile" />
                </div>
                <div id="transcription">
                    <xsl:apply-templates select="tei:TEI/tei:text" />
                </div>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="tei:facsimile">
        <xsl:variable name="base" select="replace(@xml:base, '/', '%2F')"/>
        <ol>
        <xsl:for-each select=".//tei:graphic">
            <li><img>
                <xsl:attribute name="src">
                    <xsl:value-of select="string-join((string-join(($scheme,$server,$prefix,$base,./@url,$region,$size,$rotation,$quality), '/'),$format), '.')"/>
            
                </xsl:attribute>
            </img></li>
        </xsl:for-each>
        </ol>
    </xsl:template>
    
    <xsl:template match="tei:text">
        <xsl:apply-templates />
    </xsl:template>
    
    <xsl:template match="tei:body">
        <section>
            <header>The transcription</header>
            <xsl:apply-templates />
        </section>
    </xsl:template>
    
    <xsl:template match="tei:back">
<!--        <section>
            <header>Back Matter</header>
            <xsl:apply-templates />
        </section>
-->    </xsl:template>
    
    <xsl:template match="tei:div">
        <div>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:head">
        <h1><xsl:apply-templates/></h1>
    </xsl:template>
    
    <xsl:template match="tei:table">
        <table>
            <xsl:apply-templates />
        </table>
    </xsl:template>
    
    <xsl:template match="tei:row">
        <tr>
            <xsl:apply-templates/>
        </tr>
    </xsl:template>
    
    <xsl:template match="tei:cell">
        <td><xsl:apply-templates/></td>
    </xsl:template>
	
		<xsl:template match="tei:date">
			<span class="date"><xsl:apply-templates /></span>
		</xsl:template>
	
		<xsl:template match="tei:persName">
			<span class="persName"><xsl:apply-templates /></span>
		</xsl:template>
	
		<xsl:template match="tei:bibl">
			<span class="bibl"><xsl:apply-templates /></span>
		</xsl:template>
	
		<xsl:template match="tei:address">
			<div class="address">
				<xsl:apply-templates />
			</div>
		</xsl:template>
	
	
</xsl:stylesheet>