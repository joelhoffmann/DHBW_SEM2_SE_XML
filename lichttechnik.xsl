<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" />

    <xsl:template match="/lichttechnik">
        <html>
            <body>
                <h2>Lagerbestand Lichttechnik</h2>
                <p>Diese Tabelle könnte einem Lager für Veranstaltungstechnik helfen, ihren Lagerbestand bezüglich Lichttechnik einzusehen, um so Events o.ä. zu planen.</p>
                <p>Dabei kann auf den ersten blick ein grober Überblick über den Stromverbrauch der verscheidenen Geräte erkannt werden</p>
                <p>Des Weiteren kann erkannt werden, ob es noch lücken im Datensatz gibt (gekenntzeichnet durch rote Schrift).</p>
                <table border="1 solid" cellpadding="5">
                        <tr style="font-weight: bold; text-align:center" bgcolor="#8d9cd6">
                            <th>Hersteller</th>
                            <th>Name</th>
                            <th>Lichtleistung</th>
                            <th>Bewegung</th>
                            <th>Abstrahlwinkel</th>
                            <th>Lebenserwartung</th>
                            <th>Leistungsaufnahme</th>
                            <th>Gewicht</th>
                        </tr>
                    <xsl:for-each select="*/*">
                        <tr >
                            <td style="width: 12.5% ;">
                                <xsl:value-of select="hersteller" />
                            </td>
                            <td style="width: 12.5% ;">
                                <xsl:value-of select="name" />
                            </td>
                            <td style="width: 12.5% ;">
                                <p style="font-weight: bold; text-align:center">
                                    <xsl:value-of select="lichtleistung" />
                                </p>
                                <xsl:value-of select="lichtleistung/@einheit" />
                            </td>
                            <td style="width: 12.5% ;">
                                <xsl:if test="bewegung/tilt">
                                    <tr>
                                        Tilt: <xsl:value-of select="bewegung/tilt" />
                                    </tr>
                                </xsl:if>
                                <xsl:if test="bewegung/pan">
                                    <tr>
                                        Pan: <xsl:value-of select="bewegung/pan" />
                                    </tr>
                                </xsl:if>
                                <xsl:if test ="not(bewegung/pan)">
                                    <xsl:if test ="not(bewegung/tilt)">
                                        <tr style="color: red;">
                                            nicht vorhanden
                                        </tr>
                                    </xsl:if>
                                </xsl:if>
                            </td>
                            <td style="width: 12.5% ;">
                                <xsl:if test="abstrahlwinkel/von">
                                    <xsl:value-of select="abstrahlwinkel/von" />
                                </xsl:if>
                                <xsl:if test="abstrahlwinkel/bis">
                                        bis
                                    <xsl:value-of select="abstrahlwinkel/bis" />
                                </xsl:if>
                            </td>
                            <td style="width: 12.5% ;">
                                <xsl:value-of select="lebenserwartung" />
                                &#160; 
                                <xsl:value-of select="lebenserwartung/@einheit" />
                            </td>
                            <xsl:choose>
                                <xsl:when test="leistungsaufnahme &lt;= 150">
                                    <td bgcolor="#b2ff94" style="text-align:center; width: 12.5% ;">
                                        <xsl:value-of select="leistungsaufnahme" />
                                        &#160; 
                                        <xsl:value-of select="leistungsaufnahme/@einheit" />
                                    </td>
                                </xsl:when>
                                <xsl:when test="leistungsaufnahme &lt;= 500">
                                    <td bgcolor="#ffcf75" style="text-align:center; width: 12.5% ;">
                                        <xsl:value-of select="leistungsaufnahme" />
                                        &#160; 
                                        <xsl:value-of select="leistungsaufnahme/@einheit" />
                                    </td>
                                </xsl:when>
                                <xsl:when test="leistungsaufnahme &gt;= 500">
                                    <td bgcolor="#e36868" style="text-align:center; width: 12.5% ;">
                                        <xsl:value-of select="leistungsaufnahme" />
                                        &#160; 
                                        <xsl:value-of select="leistungsaufnahme/@einheit" />
                                    </td>
                                </xsl:when>

                            </xsl:choose>
                            <td style="width: 12.5% ;">
                                <xsl:value-of select="gewicht" />
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>