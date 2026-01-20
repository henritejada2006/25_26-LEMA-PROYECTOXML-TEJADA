<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" indent="yes" />

  <xsl:template match="/">
    <html lang="es">
      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Tech Solutions - Empresa</title>
        <style>
          * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
          }

          body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: #333;
            background-color: #f4f4f4;
          }

          header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 2rem 0;
            text-align: center;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
          }

          header h1 {
            font-size: 2.5rem;
            margin-bottom: 0.5rem;
          }

          .address {
            font-size: 0.95rem;
            opacity: 0.9;
          }

          .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 2rem;
          }

          section {
            background: white;
            margin: 2rem 0;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
          }

          section h2 {
            color: #667eea;
            font-size: 2rem;
            margin-bottom: 1.5rem;
            border-bottom: 3px solid #667eea;
            padding-bottom: 0.5rem;
          }

          .grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
          }

          .card {
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            background: white;
          }

          .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0,0,0,0.15);
          }

          .card-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 1.5rem;
          }

          .card-header h3 {
            font-size: 1.3rem;
            margin-bottom: 0.5rem;
          }

          .categoria {
            display: inline-block;
            background: rgba(255,255,255,0.3);
            padding: 0.3rem 0.8rem;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: bold;
          }

          .card-body {
            padding: 1.5rem;
          }

          .card-body p {
            margin-bottom: 1rem;
            color: #555;
          }

          .items-list {
            background: #f9f9f9;
            border-left: 4px solid #667eea;
            padding: 1rem;
            margin: 1rem 0;
            border-radius: 4px;
          }

          .items-list ul {
            list-style: none;
            padding-left: 1.5rem;
          }

          .items-list li {
            margin: 0.5rem 0;
            position: relative;
            padding-left: 1.5rem;
          }

          .items-list li:before {
            content: "✓";
            position: absolute;
            left: 0;
            color: #667eea;
            font-weight: bold;
          }

          .precio {
            font-size: 1.5rem;
            color: #764ba2;
            font-weight: bold;
            margin: 1rem 0;
          }

          .contact-form {
            display: grid;
            gap: 1rem;
            max-width: 600px;
            margin: 0 auto;
          }

          .contact-form label {
            font-weight: bold;
            color: #333;
          }

          .contact-form input,
          .contact-form textarea {
            padding: 0.75rem;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-family: inherit;
            font-size: 1rem;
          }

          .contact-form textarea {
            resize: vertical;
            min-height: 120px;
          }

          footer {
            background: #333;
            color: white;
            text-align: center;
            padding: 2rem;
            margin-top: 3rem;
          }

          @media (max-width: 768px) {
            header h1 {
              font-size: 1.8rem;
            }

            section {
              padding: 1.5rem;
            }

            .grid {
              grid-template-columns: 1fr;
            }
          }
        </style>
      </head>
      <body>
        <header>
          <h1>
            <xsl:value-of select="empresa/nombre" />
          </h1>
          <div class="address">
            <xsl:value-of select="empresa/direccion/calle" />, 
            <xsl:value-of select="empresa/direccion/ciudad" />, 
            <xsl:value-of select="empresa/direccion/pais" />
          </div>
        </header>

        <div class="container">
          <!-- Sección de Servicios -->
          <section>
            <h2>Nuestros Servicios</h2>
            <div class="grid">
              <xsl:for-each select="empresa/servicios/servicio">
                <div class="card">
                  <div class="card-header">
                    <h3>
                      <xsl:value-of select="nombre" />
                    </h3>
                    <xsl:if test="nombre/@categoria">
                      <div class="categoria">
                        <xsl:value-of select="nombre/@categoria" />
                      </div>
                    </xsl:if>
                  </div>
                  <div class="card-body">
                    <p>
                      <xsl:value-of select="descripcion" />
                    </p>
                    <xsl:if test="descripcion2">
                      <div class="items-list">
                        <ul>
                          <xsl:for-each select="descripcion2/item">
                            <li>
                              <xsl:value-of select="." />
                            </li>
                          </xsl:for-each>
                        </ul>
                      </div>
                    </xsl:if>
                  </div>
                </div>
              </xsl:for-each>
            </div>
          </section>

          <!-- Sección de Productos -->
          <section>
            <h2>Nuestros Productos</h2>
            <div class="grid">
              <xsl:for-each select="empresa/productos/producto">
                <div class="card">
                  <div class="card-header">
                    <h3>
                      <xsl:value-of select="nombre" />
                    </h3>
                    <xsl:if test="nombre/@categoria">
                      <div class="categoria">
                        <xsl:value-of select="nombre/@categoria" />
                      </div>
                    </xsl:if>
                  </div>
                  <div class="card-body">
                    <p>
                      <xsl:value-of select="descripcion" />
                    </p>
                    <xsl:if test="descripcion2">
                      <div class="items-list">
                        <ul>
                          <xsl:for-each select="descripcion2/item">
                            <li>
                              <xsl:value-of select="." />
                            </li>
                          </xsl:for-each>
                        </ul>
                      </div>
                    </xsl:if>
                    <div class="precio">
                      Precio: $<xsl:value-of select="precio" />
                    </div>
                  </div>
                </div>
              </xsl:for-each>
            </div>
          </section>

          <!-- Sección de Contacto -->
          <section>
            <h2>Contacto</h2>
            <div class="contact-form">
              <div>
                <label>Nombre:</label>
                <p>
                  <xsl:value-of select="empresa/contacto/nombre" />
                </p>
              </div>
              <div>
                <label>Email:</label>
                <p>
                  <xsl:value-of select="empresa/contacto/email" />
                </p>
              </div>
              <div>
                <label>Mensaje:</label>
                <p>
                  <xsl:value-of select="empresa/contacto/mensaje" />
                </p>
              </div>
            </div>
          </section>
        </div>

        <footer>
          <p>© 2025 <xsl:value-of select="empresa/nombre" />. Todos los derechos reservados.</p>
        </footer>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
