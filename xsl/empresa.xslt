<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:variable name="empresaXml" select="document('../xml/empresa.xml')"/>
    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" href="../assets/css/main.css" />
            </head>
            <body style="padding:50px;">
                <header class="major">
                    <h2>Nuestros Servicios (Vista Tabla)</h2>
                </header>
                <div class="table-wrapper">
                    <table border="1">
                        <thead>
                            <tr>
                                <th>Servicio</th>
                                <th>Descripción</th>
                                <th>Precio Base</th>
                                <th>Precio + IVA</th>
                            </tr>
                        </thead>
                        <tbody>
                            <xsl:for-each select="$empresaXml/empresa/catalogo/item">
                                <tr>
                                    <td><strong><xsl:value-of select="nombre"/></strong></td>
                                    <td><xsl:value-of select="descripcion"/></td>
                                    <td><xsl:value-of select="precio"/>€</td>
                                    <td style="color: red; font-weight: bold;">
                                        <xsl:value-of select="format-number(precio * 1.21, '#.00')"/>€
                                    </td>
                                    <td><img src="{imagen}" alt="Imagen del producto"/></td>
                                    <td><a href="{url}" target="_blank">Ver más</a></td>
                                </tr>
                            </xsl:for-each>
                        </tbody>
                    </table>
                </div>
                <div class="total-items" style="margin-top:10px;">
                    <p><strong>Total de servicios y productos: </strong><xsl:value-of select="count($empresaXml/empresa/catalogo/item)"/></p>
                </div>
                <br/>
                <a href="../index.html">Volver al Inicio</a>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>