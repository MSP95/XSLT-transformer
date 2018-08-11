<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:java="http://xml.apache.org/xalan/java"
   xmlns:xalan="http://xml.apache.org/xslt">

  <xsl:output method="html" encoding="UTF-8" indent="yes" xalan:indent-amount="4"/>
<xsl:strip-space elements="*"/>

  <xsl:template match="/website">
    <html>
    <head>
    <style>
      table, th, td {
        border: 1px solid black;
        border-spacing: 0;
        }
    </style>
    </head>
    <body>
    <h1>Website</h1>
    <h2>Pages</h2>
    <ol>
      <xsl:apply-templates select="page"/>
    </ol>
    <h2>Widgets</h2>
    <TABLE>
      <THEAD>
        <TR>
          <TH>id</TH> <TH>type</TH>
          <TH>text</TH> <TH>src</TH>
          <TH>url</TH> <TH>label</TH>
        </TR>
      </THEAD>
      <TBODY>

        <xsl:for-each-group select="page/widget" group-by="@id">
          <TR>
            <TD><xsl:value-of select="@id"/></TD>
            <TD><xsl:value-of select="@type"/></TD>
            <TD><xsl:value-of select="text"/></TD>
            <TD><xsl:value-of select="@src"/></TD>
            <TD><xsl:value-of select="@url"/></TD>
            <TD><xsl:value-of select="@label"/></TD>

          </TR>

      </xsl:for-each-group>
      </TBODY>
    </TABLE>
  </body>
  </html>
  </xsl:template>
  <xsl:template match="page">
    <li><xsl:value-of select="@name"/>, <xsl:value-of select="description"/></li>
  </xsl:template>



</xsl:stylesheet>
