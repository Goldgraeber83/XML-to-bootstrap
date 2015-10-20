<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<!--~~~~~~~~~~~~~~~~~~~~
         Page footer
    ~~~~~~~~~~~~~~~~~~~~-->

  <xsl:template name="html.footer">

    <xsl:call-template name="element.separator">
      <xsl:with-param name="position">80px</xsl:with-param>
    </xsl:call-template>

    <!-- generate social links -->
    <xsl:call-template name="html.sociallinks" />

    <!-- generate footer -->
    <footer class="x2b-ftr">
      <div class="container">

        <p class="x2b-ftr-txt">Generated using <a href="//github.com/acch/XML-to-bootstrap">XML-to-Bootstrap</a> for your viewing pleasure.</p>
        <p class="x2b-ftr-txt">This site uses <a href="//getbootstrap.com">Bootstrap</a>, <a href="//fontawesome.io">Font Awesome</a> and <a href="//wicky.nillia.ms/headroom.js/">Headroom.js</a>.</p>

      </div><!-- /container -->
    </footer>

  </xsl:template>

  <!-- social links -->
  <xsl:template name="html.sociallinks">

    <div class="container text-center">

      <!-- iterate over all social links -->
      <xsl:for-each select="/site/options/option[@name = 'sociallinks']/sociallink">
        <a>

          <!-- copy attributes from XML directly -->
          <xsl:for-each select="@*">
            <xsl:copy />
          </xsl:for-each>

          <!-- generate icon -->
          <xsl:call-template name="element.icon">
            <xsl:with-param name="icon">
              <xsl:value-of select="." />
            </xsl:with-param>
            <xsl:with-param name="size">fa-2x</xsl:with-param>
          </xsl:call-template>

        </a>
      </xsl:for-each>

    </div><!-- /container -->

  </xsl:template>

</xsl:stylesheet>