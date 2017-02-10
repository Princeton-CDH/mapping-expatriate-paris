<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" 
    exclude-result-prefixes="tei xs xd"
    version="1.0">
  
  <!-- Simple transform to remove auto-tagging within notes:
      - remove ana attribute with value #checkedOut or #returned on dates within notes 
      - remove ana attribute with value #borrowedItem on bibl within notes
    -->
  
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>
  
  <!-- do not copy ana checked out or returned attribute on dates within notes -->
  <!-- NOTE: seem to be some variants with just 'returned' instead of '#returned' -->
  <xsl:template match="tei:note/tei:date/@ana[. = '#checkedOut' or . = '#returned' or . = 'returned']"/>  
    
  <!-- do not copy ana #borrowedItem attribute on bibl within notes -->
  <xsl:template match="tei:note/tei:bibl/@ana[. = '#borrowedItem']"/>  
  
  
</xsl:stylesheet>