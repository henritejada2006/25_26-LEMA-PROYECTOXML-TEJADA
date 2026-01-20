<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="/">
        <xsl:result-document href="../catalogo_1.html">
            
        </xsl:result-document>
        <html>
            <head>
                <title>Servicios - Tech Solutions S.A.</title>
                <meta charset="UTF-8"/>
                <style>
                    body { font-family: Arial, sans-serif; margin: 20px; background-color: #f5f5f5; }
                    .servicios-container { max-width: 1000px; margin: 0 auto; }
                    h1 { color: #333; text-align: center; }
                    .servicio { background-color: white; margin: 20px 0; padding: 20px; border-radius: 8px; box-shadow: 0 2px 4px rgba(0,0,0,0.1); }
                    .servicio h2 { color: #0066cc; margin-top: 0; }
                    .servicio p { color: #666; line-height: 1.6; }
                    .items { margin-left: 20px; }
                    .items li { margin: 8px 0; color: #555; }
                    .imagen { color: #999; font-size: 0.9em; font-style: italic; }
                </style>
            </head>
            <body>
                <div class="servicios-container">
                    <h1>Nuestros Servicios</h1>
                    <xsl:apply-templates select="empresa/servicios"/>
                </div>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="servicios">
        <xsl:for-each select="servicio">
            <div class="servicio">
                <h2><xsl:value-of select="nombre"/></h2>
                <p><xsl:value-of select="descripcion"/></p>
                <xsl:if test="descripcion2">
                    <ul class="items">
                        <xsl:for-each select="descripcion2/item">
                            <li><xsl:value-of select="."/></li>
                        </xsl:for-each>
                    </ul>
                </xsl:if>
                <p class="imagen">Imagen: <xsl:value-of select="imagen"/></p>
            </div>
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>