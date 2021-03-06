<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    
    exclude-result-prefixes="xs xd"
    version="2.0">
    <xsl:output 
        method="html"
        version="5.0"
        doctype-system="about:legacy-compat"
        indent="yes" 
        encoding="UTF-8"  />
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Oct 18, 2016</xd:p>
            <xd:p><xd:b>Author:</xd:b> cwulfman</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:param name="borrowed-titles" select="document('../../borrowed-titles.xml')"></xsl:param>
    
    <xsl:key name="regtitle" match="/root/row" use="titleid" />
    
    <xsl:template match="/">
        <html>
            <head>
                <title>proofing output</title>
                <style>
                    table, th, td {
                    border: 1px solid black;
                    }
                </style>
            </head>
            <body>
                <table>
                    <tr>
                        <th>checkout as written</th>
                        <th>checkout machine date</th>
                        <th>borrowed item id</th>
                        <th>borrowed item as written</th>
                        <th>borrowed item regularized</th>
                        <th>returned as written</th>
                        <th>returned machine date</th>                        
                    </tr>
                <xsl:apply-templates select="//tei:ab[@ana='#borrowingEvent']" />
                </table>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="tei:ab[@ana='#borrowingEvent']">
       
            <tr>
                <td>
                    <xsl:if test="tei:date[@ana='#checkedOut']">
                        <xsl:value-of select="tei:date[@ana='#checkedOut']"/>
                    </xsl:if>
                </td>
                
                <td>
                    <xsl:if test="tei:date[@ana='#checkedOut']">
                        <xsl:apply-templates select="tei:date[@ana='#checkedOut']" mode="machine" />
                    </xsl:if>
                </td>

                
                <td>
                    <xsl:if test="tei:bibl[@ana='#borrowedItem']/@corresp">
                        <xsl:value-of select="tei:bibl[@ana='#borrowedItem']/@corresp"/>
                    </xsl:if>
                </td>
                
                <td>
                    <xsl:if test="tei:bibl[@ana='#borrowedItem']">
                        <xsl:value-of select="tei:bibl[@ana='#borrowedItem']"/>
                    </xsl:if>
                </td>

                <td><xsl:apply-templates select="tei:bibl[@ana='#borrowedItem']" /></td>
 
                <td>
                    <xsl:if test="tei:date[@ana='#returned']">
                        <xsl:value-of select="tei:date[@ana='#returned']"/>
                    </xsl:if>
                </td>
                
                <td>
                    <xsl:if test="tei:date[@ana='#returned']">
                        <xsl:apply-templates select="tei:date[@ana='#returned']" mode="machine"></xsl:apply-templates>
                    </xsl:if>
                </td>
                
                
            </tr>
       
        
    </xsl:template>
    
    <xsl:template match="tei:date" mode="machine">
        <xsl:choose>
            <xsl:when test="@when">
                <xsl:value-of select="@when"/>
            </xsl:when>
            <xsl:when test="@notBefore">
                <xsl:value-of select="concat('not before ', @notBefore)"/>
            </xsl:when>
            <xsl:when test="@notAfter">
                <xsl:value-of select="concat('not after ', @notAfter)"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="tei:bibl">
        <xsl:variable name="id">
            <xsl:value-of select="xs:string(current()/@corresp)"/>
        </xsl:variable>
        <!--<xsl:value-of select="$borrowed-titles//row[titleid = $id][1]/regularized_title"/>-->
        <xsl:for-each select="$borrowed-titles">
        <xsl:value-of select="key('regtitle',$id)[1]/regularized_title"/>
        </xsl:for-each>
    </xsl:template>
   
    
    <xsl:template match="tei:teiHeader"></xsl:template>
    
</xsl:stylesheet>