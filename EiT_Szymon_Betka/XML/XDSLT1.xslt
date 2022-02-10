<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>
  <xsl:template match="/">
    <html>
      <head>
        <meta charset="UTF-8" />
        <title>Foteczki Szymka</title>
        <link rel="stylesheet" href="style2.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      </head>
      <body>
        <div id="naglowek">
          <span id="p" class="intro">Foteczki Szymka</span>
        </div>
        <div id="strona">
          <div id="lewa">
            <div id="wybor">
              <xsl:call-template name="menu"/>
            </div>
          </div>
          <div id="prawa">
            <div id="tekst">
              <p> <xsl:call-template name="wstep"/> <xsl:apply-templates select="strona/media/obrazy/img"/></p>
              <xsl:apply-templates select="strona/podstrona[@xd='2']/temat[@nazwa='historia']"/>
              <xsl:apply-templates select="strona/podstrona[@xd='2']/temat[@nazwa='techniki']"/>
              <p><xsl:apply-templates select="strona/media/linki"/></p>
            </div>
          </div>
          <div id="stopka">
            <span id="animacja">
              <xsl:apply-templates select="strona/author"/>
            </span>
          </div>
        </div>
      </body>
    </html>
  </xsl:template>
  <xsl:template name="wstep">
    <xsl:for-each select="strona/podstrona[@xd='1']">
      <h1 id="h1" class="nag"><xsl:value-of select="tytul"/>
      </h1>
      <p class="tekst"><xsl:value-of select="tekst"/></p>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="strona/author">
    <xsl:value-of select="name"/><xsl:text> </xsl:text>
    <xsl:value-of select="surname"/>
  </xsl:template>
  <xsl:template match="strona/podstrona[@xd='2']/temat[@nazwa='historia']">
    <h2 id="h2" class="nag">
      <xsl:value-of select="tytul"/>
    </h2>
    <ul class="tekst">
     <xsl:for-each select="kontent">
       <li>
         <xsl:value-of select="."/>
       </li>
     </xsl:for-each>
    </ul>
  </xsl:template>
  <xsl:template name="menu">
    <nav>
      <ul>
        <li>
          <a href="#naglowek">Poczatek</a>
        </li>
        <li>
          <a href="#h2">Historia</a>
        </li>
        <li>
          <a href="#h3">Podzial technik</a>
        </li>
        <li>
          <a href="#linki">Linki</a>
        </li>
      </ul>
    </nav>
  </xsl:template>
  <xsl:template match="strona/podstrona[@xd='2']/temat[@nazwa='techniki']">
    <h3 id="h3" class="nag">
      <xsl:value-of select="tytul"/>
    </h3>
    <h4 id="h4" class="menu2">
      <xsl:value-of select="podtytul[@id='1']/naglowek"/>
    </h4>
    <p class="tekst">
      <xsl:value-of select="podtytul[@id='1']/kontent"/>
    </p>
    <h5 id="h5" class="menu2">
      <xsl:value-of select="podtytul[@id='2']/naglowek"/>
    </h5>
    <p class="tekst">
      <xsl:value-of select="podtytul[@id='2']/kontent"/>
    </p>
    <h6 id="h6" class="menu2">
      <xsl:value-of select="podtytul[@id='3']/naglowek"/>
    </h6>
    <p class="tekst">
      <xsl:value-of select="podtytul[@id='3']/kontent"/>
    </p>
  </xsl:template>
  <xsl:template name="powrot">
    <xsl:attribute name="class">right</xsl:attribute>
    <a href="#p" class="right">wroc na poczatek strony</a>
  </xsl:template>
  <xsl:template match="strona/media/linki">
    <h7 id="linki" class="nag">
      Linki
    </h7>
    <ul class="tekst">
      <xsl:for-each select="link">
          <li>
            <a>
              <xsl:attribute name="href">
                <xsl:value-of select="@source"/>
              </xsl:attribute>
              <xsl:value-of select="."/>
            </a>
          </li>
      </xsl:for-each>
    </ul>
  </xsl:template>
  <xsl:template match="media/obrazy/img">
    <xsl:if test="position()=1" >
      <img>
        <xsl:attribute name="src">
          <xsl:value-of select="@source"/>
        </xsl:attribute>
        <xsl:attribute name="class">
          right
        </xsl:attribute>
        <xsl:attribute name="title">
          <xsl:value-of select="."/>
        </xsl:attribute>
      </img>
    </xsl:if>
  </xsl:template>
  </xsl:stylesheet>