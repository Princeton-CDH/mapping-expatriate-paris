<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="tei xs xd"
    version="1.0">

  <!-- Simple transform to clean up persName tags within bibl:
      - convert bibl/persName to bibl/author
    -->

  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <!-- where a persName tag occurs inside a bibl, convert it to an author
  tag, and copy all other attributes and content under it -->
  <xsl:template match="tei:bibl/tei:persName">
    <author>
        <xsl:apply-templates select="@*|node()"/>
    </author>
  </xsl:template>

</xsl:stylesheet>