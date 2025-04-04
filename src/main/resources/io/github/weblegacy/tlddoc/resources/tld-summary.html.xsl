<?xml version="1.0" encoding="UTF-8"?>

<!--
  - <license>
  - Copyright (c) 2003-2004, Sun Microsystems, Inc.
  - Copyright (c) 2022-2024, Web-Legacy
  - All rights reserved.
  -
  - Redistribution and use in source and binary forms, with or without
  - modification, are permitted provided that the following conditions are met:
  -
  -     * Redistributions of source code must retain the above copyright
  -       notice, this list of conditions and the following disclaimer.
  -     * Redistributions in binary form must reproduce the above copyright
  -       notice, this list of conditions and the following disclaimer in the
  -       documentation and/or other materials provided with the distribution.
  -     * Neither the name of Sun Microsystems, Inc. nor the names of its
  -       contributors may be used to endorse or promote products derived from
  -       this software without specific prior written permission.
  -
  - THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
  - ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
  - WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  - DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
  - ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  - (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
  - LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
  - ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  - (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  - SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  - </license>
-->

<!--
    Document   : tld-summary.html.xsl
    Created on : December 18, 2002, 3:46 PM
    Author     : mroth
    Description:
        Creates the TLD summary (right frame), listing the tags
        and functions that are in this particular tag library and
        their descriptions.
-->

<xsl:stylesheet version="1.0" xmlns:jakartaee="https://jakarta.ee/xml/ns/jakartaee"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">

    <xsl:output method="html" indent="yes" />

    <xsl:param name="tlddoc-shortName">default</xsl:param>

    <!-- template rule matching source root element -->
    <xsl:template match="/">
        <xsl:apply-templates select="jakartaee:tlds/jakartaee:taglib" />
    </xsl:template>

    <xsl:template match="jakartaee:taglib">
        <xsl:if test="jakartaee:short-name=$tlddoc-shortName">
            <xsl:variable name="tldname">
                <xsl:choose>
                    <xsl:when test="jakartaee:display-name!=''">
                        <xsl:value-of select="jakartaee:display-name" />
                    </xsl:when>
                    <xsl:when test="jakartaee:short-name!=''">
                        <xsl:value-of select="jakartaee:short-name" />
                    </xsl:when>
                    <xsl:otherwise>
                        Unnamed TLD
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:variable name="title">
                <xsl:value-of select="$tldname" />
                (<xsl:value-of select="normalize-space(/jakartaee:tlds/jakartaee:config/jakartaee:window-title)" />)
            </xsl:variable>
            <html>
                <head>
                    <title>
                        <xsl:value-of select="normalize-space($title)" />
                    </title>
                    <link rel="stylesheet" type="text/css" href="../stylesheet.css"
                          title="styie" />
                </head>
                <script>
                    function asd()
                    {
                    parent.document.title="<xsl:value-of select="normalize-space($title)" />";
                    }
                </script>
                <body bgcolor="white" onload="asd();">
                    <!-- =========== START OF NAVBAR =========== -->
                    <a name="navbar_top"><!-- --></a>
                    <table border="0" width="100%" cellpadding="1" cellspacing="0">
                        <tr>
                            <td COLSPAN="3" BGCOLOR="#EEEEFF" CLASS="NavBarCell1">
                                <a NAME="navbar_top_firstrow"><!-- --></a>
                                <table BORDER="0" CELLPADDING="0" CELLSPACING="3">
                                    <tr ALIGN="center" VALIGN="top">
                                        <td BGCOLOR="#EEEEFF" CLASS="NavBarCell1">&#160;
                                            <a href="../overview-summary.html">
                                                <font CLASS="NavBarFont1">
                                                    <b>Overview</b>
                                                </font>
                                            </a>&#160;
                                        </td>
                                        <td BGCOLOR="#FFFFFF" CLASS="NavBarCell1Rev">&#160;
                                            <font CLASS="NavBarFont1Rev">&#160;Library&#160;</font>&#160;
                                        </td>
                                        <td BGCOLOR="#EEEEFF" CLASS="NavBarCell1">
                                            <font CLASS="NavBarFont1">&#160;Tag&#160;</font>
                                        </td>
                                        <td BGCOLOR="#EEEEFF" CLASS="NavBarCell1">&#160;
                                            <a HREF="../help-doc.html">
                                                <font CLASS="NavBarFont1">
                                                    <b>Help</b>
                                                </font>
                                            </a>&#160;
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td ALIGN="right" VALIGN="top" ROWSPAN="3">
                                <em>
                                </em>
                            </td>
                        </tr>
                        <tr>
                            <td BGCOLOR="white" CLASS="NavBarCell2">
                                <font SIZE="-2">
                                    <!--&#160;PREV TAGLIB&#160; -->
                                    <!--&#160;NEXT TAGLIB&#160; -->
                                </font>
                            </td>
                            <td BGCOLOR="white" CLASS="NavBarCell2">
                                <font SIZE="-2">
                                    &#160;
                                    <a HREF="../index.html" TARGET="_top">
                                        <b>FRAMES</b>
                                    </a>&#160;
                                    &#160;
                                    <a HREF="tld-summary.html" TARGET="_top">
                                        <b>NO FRAMES</b>
                                    </a>&#160;
                                    <script>
                                        <!--
                                        if(window==top) {
                                            document.writeln('<A HREF="alltags-noframe.html" TARGET=""><B>All Tags</B></A>');
                                        }
                                        // -->
                                    </script>
                                    <noscript>
                                        <a HREF="../alltags-noframe.html" TARGET="">
                                            <b>All Tags</b>
                                        </a>
                                    </noscript>
                                </font>
                            </td>
                        </tr>
                    </table>
                    <!-- =========== END OF NAVBAR =========== -->

                    <hr />
                    <h2>
                        <xsl:value-of select="$tldname" />
                    </h2>
                    <hr />
                    <xsl:if test="(jakartaee:uri!='') and (jakartaee:short-name!='')">
                        <b>Standard Syntax:</b>
                        <br />
                        <code>
                            &#160;&#160;&#160;&#160;
                            <xsl:choose>
                                <xsl:when test='starts-with(jakartaee:uri,"/WEB-INF/tags")'>
                                    &lt;%@ taglib prefix="<xsl:value-of select="jakartaee:short-name" />" tagdir="<xsl:value-of select="jakartaee:uri" />" %&gt;<br />
                                </xsl:when>
                                <xsl:otherwise>
                                    &lt;%@ taglib prefix="<xsl:value-of select="jakartaee:short-name" />" uri="<xsl:value-of select="jakartaee:uri" />" %&gt;<br />
                                </xsl:otherwise>
                            </xsl:choose>
                        </code>
                        <br />
                        <b>XML Syntax:</b>
                        <br />
                        <code>
                            &#160;&#160;&#160;&#160;
                            <xsl:choose>
                                <xsl:when test='starts-with(jakartaee:uri,"/WEB-INF/tags")'>
                                    &lt;anyxmlelement xmlns:<xsl:value-of select="jakartaee:short-name" />="urn:jsptagdir:<xsl:value-of select="jakartaee:uri" />" /&gt;<br />
                                </xsl:when>
                                <xsl:when test='starts-with(jakartaee:uri,"/")'>
                                    &lt;anyxmlelement xmlns:<xsl:value-of select="jakartaee:short-name" />="urn:jsptld:<xsl:value-of select="jakartaee:uri" />" /&gt;<br />
                                </xsl:when>
                                <xsl:otherwise>
                                    &lt;anyxmlelement xmlns:<xsl:value-of select="jakartaee:short-name" />="<xsl:value-of select="jakartaee:uri" />" /&gt;<br />
                                </xsl:otherwise>
                            </xsl:choose>
                        </code>
                        <hr />
                    </xsl:if>
                    <xsl:choose>
                        <xsl:when test="jakartaee:description!=''">
                            <xsl:value-of select="jakartaee:description" disable-output-escaping="yes" />
                        </xsl:when>
                        <xsl:otherwise>
                            No Description
                        </xsl:otherwise>
                    </xsl:choose>
                    <p />
                    <table border="1" cellpadding="3" cellspacing="0" width="100%">
                        <tr bgcolor="#CCCCFF" class="TableHeadingColor">
                            <td colspan="2">
                                <font size="+2">
                                    <b>Tag Library Information</b>
                                </font>
                            </td>
                        </tr>
                        <tr>
                            <td>Display Name</td>
                            <xsl:choose>
                                <xsl:when test="jakartaee:display-name!=''">
                                    <td>
                                        <xsl:value-of select="jakartaee:display-name" />
                                    </td>
                                </xsl:when>
                                <xsl:otherwise>
                                    <td>
                                        <i>None</i>
                                    </td>
                                </xsl:otherwise>
                            </xsl:choose>
                        </tr>
                        <tr>
                            <td>Version</td>
                            <xsl:choose>
                                <xsl:when test="jakartaee:tlib-version!=''">
                                    <td>
                                        <xsl:value-of select="jakartaee:tlib-version" />
                                    </td>
                                </xsl:when>
                                <xsl:otherwise>
                                    <td>
                                        <i>None</i>
                                    </td>
                                </xsl:otherwise>
                            </xsl:choose>
                        </tr>
                        <tr>
                            <td>Short Name</td>
                            <xsl:choose>
                                <xsl:when test="jakartaee:short-name!=''">
                                    <td>
                                        <xsl:value-of select="jakartaee:short-name" />
                                    </td>
                                </xsl:when>
                                <xsl:otherwise>
                                    <td>
                                        <i>None</i>
                                    </td>
                                </xsl:otherwise>
                            </xsl:choose>
                        </tr>
                        <tr>
                            <td>URI</td>
                            <xsl:choose>
                                <xsl:when test="jakartaee:uri!=''">
                                    <td>
                                        <xsl:value-of select="jakartaee:uri" />
                                    </td>
                                </xsl:when>
                                <xsl:otherwise>
                                    <td>
                                        <i>None</i>
                                    </td>
                                </xsl:otherwise>
                            </xsl:choose>
                        </tr>
                    </table>
                    &#160;
                    <p />
                    <!-- tags and tag files -->
                    <xsl:if test="(count(jakartaee:tag)+count(jakartaee:tag-file)) &gt; 0">
                        <table border="1" cellpadding="3" cellspacing="0" width="100%">
                            <tr bgcolor="#CCCCFF" class="TableHeadingColor">
                                <td colspan="2">
                                    <font size="+2">
                                        <b>Tag Summary</b>
                                    </font>
                                </td>
                            </tr>
                            <xsl:apply-templates
                                select="jakartaee:tag|jakartaee:tag-file">
                                <xsl:sort select="jakartaee:name" />
                            </xsl:apply-templates>
                        </table>
                        &#160;
                        <p />
                    </xsl:if>
                    <!-- functions -->
                    <xsl:if test="count(jakartaee:function) &gt; 0">
                        <table border="1" cellpadding="3" cellspacing="0" width="100%">
                            <tr bgcolor="#CCCCFF" class="TableHeadingColor">
                                <td colspan="3">
                                    <font size="+2">
                                        <b>Function Summary</b>
                                    </font>
                                </td>
                            </tr>
                            <xsl:apply-templates select="jakartaee:function">
                                <xsl:sort select='substring-before(normalize-space(jakartaee:function-signature)," ")' />
                            </xsl:apply-templates>
                        </table>
                        &#160;
                        <p />
                    </xsl:if>
                    <!-- validators -->
                    <xsl:if test="count(jakartaee:validator) &gt; 0">
                        <table border="1" cellpadding="3" cellspacing="0" width="100%">
                            <tr bgcolor="#CCCCFF" class="TableHeadingColor">
                                <td colspan="2">
                                    <font size="+2">
                                        <b>Tag Library Validator</b>
                                    </font>
                                </td>
                            </tr>
                            <xsl:apply-templates select="jakartaee:validator">
                                <xsl:sort select="jakartaee:validator-class" />
                            </xsl:apply-templates>
                        </table>
                        &#160;
                        <p />
                    </xsl:if>
                    <!-- listeners -->
                    <xsl:if test="count(jakartaee:listener) &gt; 0">
                        <table border="1" cellpadding="3" cellspacing="0" width="100%">
                            <tr bgcolor="#CCCCFF" class="TableHeadingColor">
                                <td>
                                    <font size="+2">
                                        <b>Listeners</b>
                                    </font>
                                </td>
                            </tr>
                            <xsl:apply-templates select="jakartaee:listener">
                                <xsl:sort select="jakartaee:listener-class" />
                            </xsl:apply-templates>
                        </table>
                        &#160;
                        <p />
                    </xsl:if>
                    <!-- taglib-extensions -->

                    <!-- =========== START OF NAVBAR =========== -->
                    <a name="navbar_bottom"><!-- --></a>
                    <table border="0" width="100%" cellpadding="1" cellspacing="0">
                        <tr>
                            <td COLSPAN="3" BGCOLOR="#EEEEFF" CLASS="NavBarCell1">
                                <a NAME="navbar_bottom_firstrow"><!-- --></a>
                                <table BORDER="0" CELLPADDING="0" CELLSPACING="3">
                                    <tr ALIGN="center" VALIGN="top">
                                        <td BGCOLOR="#EEEEFF" CLASS="NavBarCell1">&#160;
                                            <a href="../overview-summary.html">
                                                <font CLASS="NavBarFont1">
                                                    <b>Overview</b>
                                                </font>
                                            </a>&#160;
                                        </td>
                                        <td BGCOLOR="#FFFFFF" CLASS="NavBarCell1Rev">&#160;
                                            <font CLASS="NavBarFont1Rev">&#160;Library&#160;</font>&#160;
                                        </td>
                                        <td BGCOLOR="#EEEEFF" CLASS="NavBarCell1">
                                            <font CLASS="NavBarFont1">&#160;Tag&#160;</font>
                                        </td>
                                        <td BGCOLOR="#EEEEFF" CLASS="NavBarCell1">&#160;
                                            <a HREF="../help-doc.html">
                                                <font CLASS="NavBarFont1">
                                                    <b>Help</b>
                                                </font>
                                            </a>&#160;
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td ALIGN="right" VALIGN="top" ROWSPAN="3">
                                <em>
                                </em>
                            </td>
                        </tr>
                        <tr>
                            <td BGCOLOR="white" CLASS="NavBarCell2">
                                <font SIZE="-2">
                                    <!--&#160;PREV TAGLIB&#160; -->
                                    <!--&#160;NEXT TAGLIB&#160; -->
                                </font>
                            </td>
                            <td BGCOLOR="white" CLASS="NavBarCell2">
                                <font SIZE="-2">
                                    &#160;
                                    <a HREF="../index.html" TARGET="_top">
                                        <b>FRAMES</b>
                                    </a>&#160;
                                    &#160;
                                    <a HREF="tld-summary.html" TARGET="_top">
                                        <b>NO FRAMES</b>
                                    </a>&#160;
                                    <script>
                                        <!--
                                        if(window==top) {
                                            document.writeln('<A HREF="alltags-noframe.html" TARGET=""><B>All Tags</B></A>');
                                        }
                                        // -->
                                    </script>
                                    <noscript>
                                        <a HREF="../alltags-noframe.html" TARGET="">
                                            <b>All Tags</b>
                                        </a>
                                    </noscript>
                                </font>
                            </td>
                        </tr>
                    </table>
                    <!-- =========== END OF NAVBAR =========== -->
                    <hr />
                    <small>
                        <i>
                            Java, JSP, and JavaServer Pages are trademarks or registered
                            trademarks of Sun Microsystems, Inc. in the US and other countries.
                            Copyright 2002-3 Sun Microsystems, Inc.
                            4150 Network Circle
                            Santa Clara, CA 95054, U.S.A.
                            All Rights Reserved.
                        </i>
                    </small>
                </body>
            </html>
        </xsl:if>
    </xsl:template>

    <xsl:template match="jakartaee:tag|jakartaee:tag-file">
        <tr bgcolor="white" class="TableRowColor">
            <td width="15%">
                <b>
                    <xsl:element name="a">
                        <xsl:attribute name="href">
                            <xsl:value-of select="jakartaee:name" />.html</xsl:attribute>
                        <xsl:value-of select="jakartaee:name" />
                    </xsl:element>
                </b>
            </td>
            <td>
                <xsl:choose>
                    <xsl:when test="jakartaee:description!=''">
                        <xsl:value-of select="jakartaee:description" disable-output-escaping="yes" />
                    </xsl:when>
                    <xsl:otherwise>
                        <i>No Description</i>
                    </xsl:otherwise>
                </xsl:choose>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="jakartaee:function">
        <tr bgcolor="white" class="TableRowColor">
            <td width="15%" nowrap="" align="right">
                <code>
                    <xsl:value-of select='substring-before(normalize-space(jakartaee:function-signature)," ")' />
                </code>
            </td>
            <td width="15%" nowrap="">
                <code>
                    <b>
                        <xsl:element name="a">
                            <xsl:attribute name="href">
                                <xsl:value-of select="jakartaee:name" />.fn.html</xsl:attribute>
                            <xsl:value-of select="jakartaee:name" />
                        </xsl:element>
                    </b>(<xsl:value-of select='substring-after(normalize-space(jakartaee:function-signature),"(")' />
                </code>
            </td>
            <td>
                <xsl:choose>
                    <xsl:when test="jakartaee:description!=''">
                        <xsl:value-of select="jakartaee:description" disable-output-escaping="yes" />
                    </xsl:when>
                    <xsl:otherwise>
                        <i>No Description</i>
                    </xsl:otherwise>
                </xsl:choose>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="jakartaee:validator">
        <tr valign="top" bgcolor="white" class="TableRowColor">
            <td width="15%">
                <b>
                    <xsl:value-of select="jakartaee:validator-class" />
                </b>
            </td>
            <td>
                <xsl:choose>
                    <xsl:when test="jakartaee:description!=''">
                        <xsl:value-of select="jakartaee:description" disable-output-escaping="yes" />
                    </xsl:when>
                    <xsl:otherwise>
                        <i>No Description</i>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:if test="count(jakartaee:init-param)&gt;0">
                    <blockquote>
                        <b>Initialization Parameters:</b>
                        <br />
                        <table border="1">
                            <tr>
                                <td>
                                    <b>Name</b>
                                </td>
                                <td>
                                    <b>Value</b>
                                </td>
                                <td>
                                    <b>Description</b>
                                </td>
                            </tr>
                            <xsl:apply-templates select="jakartaee:init-param">
                                <xsl:sort select="jakartaee:param-name" />
                                <xsl:sort select="jakartaee:param-value" />
                            </xsl:apply-templates>
                        </table>
                    </blockquote>
                </xsl:if>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="jakartaee:init-param">
        <tr valign="top">
            <td>
                <xsl:value-of select="jakartaee:param-name" />
            </td>
            <td>
                <xsl:value-of select="jakartaee:param-value" />
            </td>
            <td>
                <xsl:choose>
                    <xsl:when test="jakartaee:description!=''">
                        <xsl:value-of select="jakartaee:description" />
                    </xsl:when>
                    <xsl:otherwise>
                        <i>No Description</i>
                    </xsl:otherwise>
                </xsl:choose>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="jakartaee:listener">
        <tr valign="top" bgcolor="white" class="TableRowColor">
            <td>
                <b>
                    <xsl:value-of select="jakartaee:listener-class" />
                </b>
            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet>