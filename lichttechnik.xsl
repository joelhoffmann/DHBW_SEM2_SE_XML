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
                <p>Der Produktname ist mit einer Farbe umrahmt, um seine Lichtquelle darzustellen. Dabei wird unterscheiden zwischen LED (grün), LASER (blau), HALOGENE (orange)</p>

                <table border="1 solid" cellpadding="5" style="border-collapse: collapse; background-color: #f7f7f7; font-size:125%;">
                    <tr style="font-weight: bold; text-align:center;" bgcolor="#8d9cd6">
                        <th>Hersteller</th>
                        <th>Produktname</th>
                        <th>Lichtleistung</th>
                        <th>Bewegung</th>
                        <th>Abstrahlwinkel</th>
                        <th>Lebenserwartung</th>
                        <th>Leistungsaufnahme</th>
                        <th>Gewicht</th>
                        <th>Leuchtmittel</th>
                    </tr>
                    <xsl:for-each select="*/*">
                        <tr style="text-align:center;">
                            <xsl:choose>
                                <xsl:when test="name() = 'movinglights'">
                                    <td style="width: 8%; border: 3px solid ;border-color: #12782a;">
                                        <xsl:value-of select="hersteller" />
                                    </td>
                                </xsl:when>
                                <xsl:when test="name() = 'bars'">
                                    <td style="width: 8%; border: 3px solid ;border-color: #12782a;">
                                        <xsl:value-of select="hersteller" />
                                    </td>
                                </xsl:when>
                                <xsl:when test="name() = 'spots'">
                                    <td style="width: 8%; border: 3px solid ;border-color: #12782a;">
                                        <xsl:value-of select="hersteller" />
                                    </td>
                                </xsl:when>
                                <xsl:when test="name() = 'projector'">
                                    <td style="width: 8%; border: 3px solid ;border-color: #8591ff;">
                                        <xsl:value-of select="hersteller" />
                                    </td>
                                </xsl:when>
                                <xsl:when test="name() = 'showlaser'">
                                    <td style="width: 8%; border: 3px solid ;border-color: #8591ff;">
                                        <xsl:value-of select="hersteller" />
                                    </td>
                                </xsl:when>
                                <xsl:when test="name() = 'konventionel'">
                                    <td style="width: 8%; border: 3px solid ;border-color: #ffa385;">
                                        <xsl:value-of select="hersteller" />
                                    </td>
                                </xsl:when>
                                <xsl:when test="name() = 'followspot'">
                                    <td style="width: 8%; border: 3px solid ;border-color: #ffa385;">
                                        <xsl:value-of select="hersteller" />
                                    </td>
                                </xsl:when>
                            </xsl:choose>
                            <td style="width: 8% ;">
                                <xsl:value-of select="name" />
                            </td>
                            <td style="width: 8% ;">
                                <p style="font-weight: bold; text-align:center">
                                    <xsl:value-of select="lichtleistung" />

                                </p>
                                <xsl:value-of select="lichtleistung/@einheit" />
                            </td>
                            <td style="width: 8%;">
                                <xsl:if test="bewegung/tilt">
                                    <p sytle="text-align:center;">
                                        Tilt: <xsl:value-of select="bewegung/tilt" />
                                    </p>
                                </xsl:if>
                                <xsl:if test="bewegung/pan">
                                    <p>
                                        Pan: <xsl:value-of select="bewegung/pan" />
                                    </p>
                                </xsl:if>
                                <xsl:if test ="not(bewegung/pan)">
                                    <xsl:if test ="not(bewegung/tilt)">
                                        <p style="color: red;">
                                            nicht vorhanden
                                        </p>
                                    </xsl:if>
                                </xsl:if>
                            </td>
                            <td style="width: 8% ;">
                                <xsl:if test="abstrahlwinkel/von">
                                    <xsl:value-of select="abstrahlwinkel/von" />
                                </xsl:if>
                                <xsl:if test="abstrahlwinkel/bis">
                                        bis
                                    <xsl:value-of select="abstrahlwinkel/bis" />
                                </xsl:if>
                                <xsl:if test="not(abstrahlwinkel/von)">
                                    <p style="color: red;">
                                        nicht vorhanden
                                    </p>
                                </xsl:if>
                            </td>
                            <td style="width: 8% ;">
                                <xsl:if test ="not(lebenserwartung)">
                                    <p style="color: red;">
                                        nicht vorhanden
                                    </p>
                                </xsl:if>
                                <xsl:if test = "lebenserwartung">
                                    <xsl:value-of select="lebenserwartung" />
                                    &#160; 
                                    <xsl:value-of select="lebenserwartung/@einheit" />
                                </xsl:if>
                            </td>
                            <xsl:choose>
                                <xsl:when test="leistungsaufnahme &lt;= 400">
                                    <td bgcolor="#b2ff94" style="width: 5% ;">
                                        <xsl:value-of select="leistungsaufnahme" />
                                        &#160; 
                                        <xsl:value-of select="leistungsaufnahme/@einheit" />
                                    </td>
                                </xsl:when>
                                <xsl:when test="leistungsaufnahme &lt;= 1000">
                                    <td bgcolor="#ffcf75" style="width: 5% ;">
                                        <xsl:value-of select="leistungsaufnahme" />
                                        &#160; 
                                        <xsl:value-of select="leistungsaufnahme/@einheit" />
                                    </td>
                                </xsl:when>
                                <xsl:when test="leistungsaufnahme &gt;= 1000">
                                    <td bgcolor="#e36868" style="width: 5% ;">
                                        <xsl:value-of select="leistungsaufnahme" />
                                        &#160; 
                                        <xsl:value-of select="leistungsaufnahme/@einheit" />
                                    </td>
                                </xsl:when>
                            </xsl:choose>
                            <td style="width: 8% ;">
                                <xsl:value-of select="gewicht" />
                                <xsl:value-of select="gewicht/@einheit" />
                            </td>
                            <td style="width: 8% ;">
                                <table border="1 solid" cellpadding="0" style="width: 100%; height: 80px;  border-collapse: collapse;">
                                    <tr>
                                        <td style="width: 30%; height:100%; ">
                                            <xsl:value-of select="lichtquelle/menge"/>
                                            x
                                        </td>
                                        <td style="width: 70%; height:100%; ">
                                            <xsl:value-of select="lichtquelle/produkt"/>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>