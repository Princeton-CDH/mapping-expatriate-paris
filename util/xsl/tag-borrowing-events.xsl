<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" 
    xmlns:tei="http://www.tei-c.org/ns/1.0"

    exclude-result-prefixes="xd tei" version="2.0"
    
    >
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Oct 15, 2016</xd:p>
            <xd:p><xd:b>Author:</xd:b> cwulfman</xd:p>
            <xd:p/>
        </xd:desc>x
    </xd:doc>

    <xsl:variable name="personid" select="//tei:person[@role='cardholder']/@ana"/>
    <xsl:variable name="borrowed-titles"
        select="document('/Users/cwulfman/repos/github/cwulfman/mapping-expatriate-paris/borrowed-titles.xml')//row[borrowerid=$personid]"/>


 
    <xsl:template match="tei:bibl">
        <xsl:variable name="id" select="$borrowed-titles[title = current()/tei:title/text()][1]/titleid/text()"/>
        <bibl>
            <xsl:attribute name="ana">
                <xsl:text>#borrowedItem</xsl:text>
            </xsl:attribute>
            <xsl:if test="$id">
            <xsl:attribute name="corresp">
                <xsl:value-of select="$id"/>
            </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates select="@*"></xsl:apply-templates>
            <xsl:apply-templates />
        </bibl>
    </xsl:template>
    
    <xsl:template match="tei:date">
        <date>
            <xsl:choose>
                <xsl:when test="(current()/following-sibling::*[1][self::tei:bibl])">
                    <xsl:attribute name="ana">#checkedOut</xsl:attribute>
                </xsl:when>
                <xsl:when test="(current()/preceding-sibling::*[1][self::tei:bibl])">
                    <xsl:attribute name="ana">#returned</xsl:attribute>
                </xsl:when>
            </xsl:choose>
            <xsl:apply-templates select="@*" />
            <xsl:apply-templates />
        </date>
    </xsl:template>

    <xsl:template match="@anchored|@default|@status|@part|@instant|@org"></xsl:template>

    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>
