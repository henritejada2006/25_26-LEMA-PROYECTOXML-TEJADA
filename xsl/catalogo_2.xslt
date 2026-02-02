<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:variable name="empresaXml2" select="document('../xml/empresa.xml')"/>
    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" href="../assets/css/main.css" />
            </head>
            <body style="padding:50px;">
                <h1>Catálogo por Categorías</h1>
                <xsl:for-each select="$empresaXml2/empresa/catalogo/item">
                     <div style="border:1px solid #ccc; margin-bottom:10px; padding:10px;">
                        <h3><xsl:value-of select="nombre"/></h3>
                        <p>Categoría: <xsl:value-of select="@categoria"/></p>
                    </div>
                </xsl:for-each>
                <a href="../index.html">Volver al Inicio</a>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>