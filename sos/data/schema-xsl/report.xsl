<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0"
  xmlns="http://www.w3.org/1999/xhtml"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xi="http://www.w3.org/2001/XInclude"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:vc="http://www.w3.org/2007/XMLSchema-versioning"
  exclude-result-prefixes="xsl xi xs vc"
  >

  <xsl:output
      method="xml"
      omit-xml-declaration="yes"
      />

  <!--
      - construct global variables for all top-level xs:complexType and xs:element elements
      - we expect the very first xs:element to be ScienceEcosystemMessages, which contains a
      complexType/choice list of elements. These are the message subclasses of ScienceEcosystemMessages
      - for each of these, we output the structure of each message
      - either before this list or after, we produce a "glossary" of all the top-level elements
      referred to in the ScienceEcosystemMessages elaboration
  -->
  
  <xsl:variable name="elements" select="//xs:element" />
  <xsl:variable name="complex-types"  select="//xs:complexType" />
  <xsl:variable name="SEM-types" select="xs:element[@name='ScienceEcosystemMessages']/xs:complexType/xs:choice/xs:element" />


  <xsl:template match="xs:choice" mode="instance">
    <xsl:text>Start Choice</xsl:text>
    <xsl:apply-templates mode="instance" />
    <xsl:text>End Choice</xsl:text>
  </xsl:template>

  <xsl:template match="xs:choice" mode="schema">
    <xsl:text>&lt;xs:choice&gt;</xsl:text>
    <xsl:apply-templates mode="schema" />
    <xsl:text>&lt;/xs:choice&gt;</xsl:text>
  </xsl:template>


  <xsl:template match="xs:element" mode="schema">
    <xsl:copy-of copy-namespaces="no" select="."/>
  </xsl:template>

  <xsl:template match="xs:element" mode="instance">
    <xsl:text disable-output-escaping="yes">&lt;</xsl:text><xsl:value-of select="@name" /><xsl:text>&gt;</xsl:text>
    <xsl:value-of select="@type" />
    <xsl:text>&lt;/</xsl:text><xsl:value-of select="@name" /><xsl:text>&gt;</xsl:text>
  </xsl:template>

  <xsl:template match="xs:element[@name='ScienceEcosystemMessages']">
    <xsl:text>&lt;</xsl:text><xsl:value-of select="@name" /><xsl:text>&gt;</xsl:text>
    <xsl:value-of select="@name" />
    <xsl:value-of select="xs:annotation/xs:documentation" />
    <xsl:apply-templates mode="instance" />
    <xsl:text>&lt;/</xsl:text><xsl:value-of select="@name" /><xsl:text>&gt;</xsl:text>

    <xsl:text>&lt;</xsl:text><xsl:value-of select="@name" /><xsl:text>&gt;</xsl:text>
    <xsl:value-of select="@name" />
    <xsl:value-of select="xs:annotation/xs:documentation" />
    <xsl:apply-templates mode="schema" />
    <xsl:text>&lt;/</xsl:text><xsl:value-of select="@name" /><xsl:text>&gt;</xsl:text>

  </xsl:template>

  <xsl:template match="xs:sequence" mode="instance">
    <xsl:apply-templates mode="#current"/>
  </xsl:template>

  <xsl:template match="xs:sequence" mode="schema">
    <xs:sequence>
      <xsl:apply-templates mode="schema"/>
    </xs:sequence>
  </xsl:template>

  <xsl:template match="xs:complexType" mode="instance">
    <xsl:text>&lt;...&gt;</xsl:text>
    <xsl:apply-templates mode="instance" select="xs:sequence/xs:element"/>
    <xsl:text>&lt;/...&gt;</xsl:text>
  </xsl:template>


  <xsl:template match="//xs:complexType">

    Complex Type: <xsl:value-of select="@name" />
    
    XML Instance Representation
    
    <xsl:apply-templates mode="instance" />

    Schema Component Representation
    
    <xsl:copy copy-namespaces="no">
      <xsl:copy-of copy-namespaces="no" select="@name" />
      <xsl:copy-of copy-namespaces="no" select="child::* except child::xs:annotation"/>
    </xsl:copy>

    </xsl:template>
  
  <xsl:template match="/">

      Schema Document Properties

      Declared Namespaces

      Global Declarations

    <xsl:apply-templates select="$complex-types" />

      Global Definitions

  </xsl:template>
  
</xsl:stylesheet>
