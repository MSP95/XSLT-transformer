<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:java="http://xml.apache.org/xalan/java"
   xmlns:xalan="http://xml.apache.org/xslt">

  <xsl:output method="xml" encoding="UTF-8" indent="yes" xalan:indent-amount="4"/>
<xsl:strip-space elements="*"/>
  <xsl:template match="/">
    <xsl:text>&#xa;</xsl:text>
    <xsl:apply-templates/>
  </xsl:template>
  <xsl:template match="site">
    <website>
      <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
      <xsl:attribute name="name"><xsl:value-of select="@name"/></xsl:attribute>
      <description>
        <xsl:value-of select="@description"/>
      </description>
      <xsl:apply-templates select="views/view"/>
    </website>
  </xsl:template>

  <xsl:template match="views/view">
    <page>
      <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
      <xsl:attribute name="name"><xsl:value-of select="@name"/></xsl:attribute>
      <description>
        <xsl:value-of select="description"/>
      </description>
      <xsl:apply-templates select="component"/>
    </page>

  </xsl:template>
  <xsl:template match="component">
    <widget>
      <xsl:attribute name="id"><xsl:value-of select="@ref"/></xsl:attribute>
      <xsl:apply-templates select="/site/components/component [@id=current()/@ref]"/>
    </widget>
  </xsl:template>

  <xsl:template match="/site/components/component">
    <xsl:attribute name="type"><xsl:value-of select="@type"/></xsl:attribute>
    <xsl:if test="text">
      <text>
        <xsl:value-of select="text"/>
      </text>
    </xsl:if>
    <xsl:if test="@type = 'IMG'">
      <xsl:attribute name="src"><xsl:value-of select="@src"/></xsl:attribute>
    </xsl:if>
    <xsl:if test="@type = 'YOUTUBE'">
      <xsl:attribute name="url"><xsl:value-of select="@url"/></xsl:attribute>
    </xsl:if>
    <xsl:if test="@type = 'BUTTON'">
      <xsl:attribute name="label"><xsl:value-of select="@label"/></xsl:attribute>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
