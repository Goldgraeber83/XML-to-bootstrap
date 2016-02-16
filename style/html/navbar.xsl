<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<!--~~~~~~~~~~~~~~~~~~~~~~~
    Animated navigation bar
    ~~~~~~~~~~~~~~~~~~~~~~~-->

  <xsl:template name="html.navbar">
    <xsl:param name="title" /><!-- string -->

    <!-- options -->
    <xsl:variable name="site.title" select="/site/options/option[@name = 'site.title']" />
    <xsl:variable name="site.author" select="/site/options/option[@name = 'site.author']" />

    <nav class="[ navbar navbar-fixed-top navbar-light ] x2b-nvbr js-nvbr [ sps sps--abv ] headroom--pinned">
      <div class="container">

        <button class="navbar-toggler hidden-sm-up" type="button" data-toggle="collapse" data-target="#collapsingNavbar">
          &#9776;
        </button>

        <div class="collapse navbar-toggleable-xs" id="collapsingNavbar">

          <!-- Title -->
          <a class="navbar-brand" href="/"><xsl:value-of select="$site.title" /></a>

          <ul class="nav navbar-nav">

            <!-- Articles -->
            <xsl:if test="$articles">
              <li class="nav-item">
                <xsl:if test="$title = /site/articles/title">
                  <xsl:attribute name="class">nav-item active</xsl:attribute>
                </xsl:if>
                <a class="nav-link" href="/articles.html">
                  <xsl:call-template name="element.icon">
                    <xsl:with-param name="icon">fa-newspaper-o</xsl:with-param>
                  </xsl:call-template>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:value-of select="/site/articles/title" />
                  <!--<span class="sr-only">(current)</span>-->
                </a>
              </li>
            </xsl:if>

            <!-- Projects -->
            <xsl:if test="$projects">
              <li class="nav-item">
                <xsl:if test="$title = /site/projects/title">
                  <xsl:attribute name="class">nav-item active</xsl:attribute>
                </xsl:if>
                <a class="nav-link" href="/projects.html">
                  <xsl:call-template name="element.icon">
                    <xsl:with-param name="icon">fa-rocket</xsl:with-param>
                  </xsl:call-template>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:value-of select="/site/projects/title" />
                  <!--<span class="sr-only">(current)</span>-->
                </a>
              </li>
            </xsl:if>

            <!-- Galleries -->
            <xsl:if test="$galleries">
              <li class="nav-item">
                <xsl:if test="$title = /site/galleries/title">
                  <xsl:attribute name="class">nav-item active</xsl:attribute>
                </xsl:if>
                <a class="nav-link" href="/galleries.html">
                  <xsl:call-template name="element.icon">
                    <xsl:with-param name="icon">fa-picture-o</xsl:with-param>
                  </xsl:call-template>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:value-of select="/site/galleries/title" />
                  <!--<span class="sr-only">(current)</span>-->
                </a>
              </li>
            </xsl:if>

            <!-- Author -->
            <li class="navbar-brand hidden-xs-down pull-sm-right">
              by <xsl:value-of select="$site.author" />
            </li>

          </ul>


        </div><!-- /navbar-collapse -->

      </div><!-- /container -->
    </nav>

  </xsl:template>

</xsl:stylesheet>
