<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:ext="http://exslt.org/common"
  extension-element-prefixes="ext">

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     Galleries overview page
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

     This file is part of XML-to-bootstrap.
     https://github.com/acch/XML-to-bootstrap

     Copyright 2016 Achim Christ
     Released under the MIT license
     (https://github.com/acch/XML-to-bootstrap/blob/master/LICENSE)

     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     Gallery overview page contents
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

  <xsl:template match="galleries">

    <!-- navigation breadcrumbs -->
    <xsl:call-template name="element.breadcrumbs">
      <xsl:with-param name="current" select="title" />
    </xsl:call-template>

    <!-- spacing -->
    <!--hr class="invisible my-1" /-->

    <!--p class="text-muted">
      Click on the title to view gallery&#8230;
    </p-->

    <!-- spacing -->
    <hr class="invisible my-1" />

    <xsl:choose>
      <xsl:when test="not(gallery)">

        <p><strong>
          There are no galleries, yet. Why don't you create one?
        </strong></p>

      </xsl:when>
      <xsl:otherwise>

        <!-- gallery cards -->
        <div class="row">

          <!-- iterate over all galleries -->
          <xsl:for-each select="gallery[not(@draft)]">
            <xsl:sort select="date" order="descending" />

            <!-- format filename -->
            <xsl:variable name="filename">
              <xsl:call-template name="format.filename">
                <xsl:with-param name="string" select="title" />
              </xsl:call-template>
            </xsl:variable>

            <!-- format date -->
            <xsl:variable name="date">
              <xsl:call-template name="format.date">
                <xsl:with-param name="date" select="date" />
              </xsl:call-template>
            </xsl:variable>

            <!-- responsive column -->
            <div class="{$grid.cardcolumn}">

              <!-- gallery card -->
              <!-- TODO: add semantic vocabulary/description -->
              <article class="card card-block">

                <!-- gallery title -->
                <h3 class="card-title">
                  <a class="x2b-alt-lnk" href="{$site.url}gallery/{$filename}.html">
                    <xsl:value-of select="title" />
                  </a>
                </h3>

                <a class="x2b-sbtl-lnk" href="{$site.url}gallery/{$filename}.html">

                  <!-- gallery description -->
                  <p class="card-text">
                    <xsl:value-of select="short" />

                    <xsl:text> </xsl:text>

                    <span class="text-muted">
                      //&#160;<xsl:value-of select="$date" />
                    </span>
                  </p>

                </a>

              </article><!-- /card -->

            </div><!-- /column -->

          </xsl:for-each>

        </div><!-- /gallery cards -->

      </xsl:otherwise>
    </xsl:choose>

  </xsl:template>

</xsl:stylesheet>
