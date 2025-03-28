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
    Document   : alltags-frame.html.xsl
    Created on : October 1, 2002, 5:37 PM
    Author     : mroth
    Description:
        Creates the all tags page, listing all tags
        and functions included in all tag libraries for this generation.
-->

<xsl:stylesheet version="1.0" xmlns:jakartaee="https://jakarta.ee/xml/ns/jakartaee"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">

    <xsl:output method="html" indent="yes" />

    <!-- template rule matching source root element -->
    <xsl:template match="/">
        <html>
            <head>
                <title>All Tags / Functions</title>
                <link rel="stylesheet" type="text/css" href="stylesheet.css" title="Style" />
            </head>
            <script>
                function asd()
                {
                parent.document.title="All Tags / Functions";
                }
            </script>
            <body bgcolor="white" onload="asd();">
                <font size="+1" class="FrameHeadingFont">
                    <b>All Tags / Functions</b>
                </font>
                <br />
                <table border="0" width="100%">
                    <tr>
                        <td nowrap="true">
                            <font class="FrameItemFont">
                                <xsl:apply-templates
                                    select="jakartaee:tlds/jakartaee:taglib/jakartaee:tag|jakartaee:tlds/jakartaee:taglib/jakartaee:tag-file|jakartaee:tlds/jakartaee:taglib/jakartaee:function">
                                    <xsl:sort select="../jakartaee:short-name" />
                                    <xsl:sort select="jakartaee:name" />
                                </xsl:apply-templates>
                            </font>
                        </td>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="jakartaee:tag|jakartaee:tag-file">
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="../jakartaee:short-name"/>/<xsl:value-of select="jakartaee:name"/>.html</xsl:attribute>
            <xsl:attribute name="target"></xsl:attribute>
            <xsl:value-of select="../jakartaee:short-name"/>:<xsl:value-of select="jakartaee:name"/>
        </xsl:element>
        <br />
    </xsl:template>

    <!--
      - Same as above, but add the () to indicate it's a function
      - and change the HTML to .fn.html
    -->
    <xsl:template match="jakartaee:function">
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="../jakartaee:short-name" />/<xsl:value-of select="jakartaee:name" />.fn.html</xsl:attribute>
            <xsl:attribute name="target">tagFrame</xsl:attribute>
            <i>
                <xsl:value-of select="../jakartaee:short-name" />:<xsl:value-of select="jakartaee:name" />()</i>
        </xsl:element>
        <br />
    </xsl:template>

</xsl:stylesheet>