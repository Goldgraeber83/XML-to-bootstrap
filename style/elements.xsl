<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:ext="http://exslt.org/common"
  extension-element-prefixes="ext">

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     Reusable page elements
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

     This file is part of XML-to-bootstrap.
     https://github.com/acch/XML-to-bootstrap

     Copyright 2016 Achim Christ
     Released under the MIT license
     (https://github.com/acch/scrollpos-styler/blob/master/LICENSE)

     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

<!-- Currently includes:
     - Breadcrumps
     - Pager
     - Icons (normal / on circle / in box) -->

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     Breadcrumps
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
  <xsl:template name="element.breadcrumps">
    <xsl:param name="parent" /><!-- node-set (page) -->
    <xsl:param name="current" /><!-- string -->

    <!-- convert parent parameter to node-set -->
    <xsl:variable name="parent.page" select="ext:node-set($parent)/page" />

    <!-- bootstrap breadcrumps -->
    <ol class="breadcrumb">

      <li>
        <a href="/">Home</a>
      </li>

      <xsl:if test="$parent.page">
        <li>
          <a href="{$parent.page/@href}">
            <xsl:value-of select="$parent.page/@title" />
          </a>
        </li>
      </xsl:if>

      <li class="active">
        <xsl:value-of select="$current" />
      </li>

    </ol><!-- /breadcrump -->

  </xsl:template>


<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     Pager
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
  <xsl:template name="element.pager">
    <xsl:param name="next" /><!-- node-set (page) -->
    <xsl:param name="prev" /><!-- node-set (page) -->

    <!-- convert parameters to node-sets -->
    <xsl:variable name="next.page" select="ext:node-set($next)/page" />
    <xsl:variable name="prev.page" select="ext:node-set($prev)/page" />

    <!-- check if there is a next page -->
    <xsl:variable name="next.disabled">
      <xsl:if test="not($next.page)"> disabled</xsl:if>
    </xsl:variable>

    <!-- check if there is a previous page -->
    <xsl:variable name="prev.disabled">
      <xsl:if test="not($prev.page)"> disabled</xsl:if>
    </xsl:variable>

    <!-- bootstrap pager component -->
    <nav>
      <ul class="pager">

        <li class="pager-prev{$prev.disabled}">
          <a rel="prev">
            <xsl:if test="$prev.page">
              <xsl:attribute name="title">
                <xsl:value-of select="$prev.page/@title" />
              </xsl:attribute>
              <xsl:attribute name="href">
                <xsl:value-of select="$prev.page/@href" />
              </xsl:attribute>
            </xsl:if>
            <xsl:call-template name="element.icon">
              <xsl:with-param name="icon">fa-arrow-left</xsl:with-param>
            </xsl:call-template>
            Previous
          </a>
        </li><!-- /previous -->

        <li class="pager-next{$next.disabled}">
          <a rel="next">
            <xsl:if test="$next.page">
              <xsl:attribute name="title">
                <xsl:value-of select="$next.page/@title" />
              </xsl:attribute>
              <xsl:attribute name="href">
                <xsl:value-of select="$next.page/@href" />
              </xsl:attribute>
            </xsl:if>
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            Next
            <xsl:call-template name="element.icon">
              <xsl:with-param name="icon">fa-arrow-right</xsl:with-param>
            </xsl:call-template>
          </a>
        </li><!-- /next -->

      </ul><!-- /pager -->
    </nav>

  </xsl:template>


<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     Icons
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

  <!-- normal icon (fixed-width) -->
  <xsl:template name="element.icon">
    <xsl:param name="icon" /><!-- string-->
    <xsl:param name="size" select="fa-lg" /><!-- string -->

    <span class="fa {$icon} {$size} fa-fw" aria-hidden="true">
      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
    </span>

  </xsl:template>

  <!-- icon on circle (inverted) -->
  <xsl:template name="element.icon.circled">
    <xsl:param name="icon" /><!-- string-->
    <xsl:param name="size" select="fa-lg" /><!-- string -->

    <span class="fa-stack {$size}" aria-hidden="true">
      <span class="fa fa-circle fa-stack-2x">
        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      </span>
      <span class="fa {$icon} fa-stack-1x fa-inverse">
        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      </span>
    </span>

  </xsl:template>

  <!-- icon in squared box -->
  <xsl:template name="element.icon.squared">
    <xsl:param name="icon" /><!-- string-->
    <xsl:param name="size" select="fa-lg" /><!-- string -->
    <xsl:param name="disabled" select="false()" /><!-- boolean -->

    <xsl:variable name="disabled.class">
       <xsl:if test="$disabled"> dsbld</xsl:if>
    </xsl:variable>

    <span class="[ fa {$icon} {$size} ] x2b-sqrd{$disabled.class}" aria-hidden="true">
      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
    </span>

  </xsl:template>

</xsl:stylesheet>
