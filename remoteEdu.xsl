<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
    <head>
      <link rel="stylesheet" href="eduStyle.css" />
    </head>
    <body>
      <h1>Learning Modality Preferences in NYC School Districts
      as of January 4th, 2021</h1>
      <table>
        <tr>
          <th>School District Number</th>
          <th>Total Enrollment</th>
          <th>Percent Blended/Hybrid Learning</th>
          <th>Percent Remote Learning</th>
        </tr>
        <xsl:for-each select="response/row">
          <tr>
            <td class="district"><xsl:value-of select="district"/></td>
            <td class="totalEnroll"><xsl:value-of select="total_enrollment"/></td>
            <td class="blended"><xsl:value-of select="blended_1"/></td>
            <td class="remote"><xsl:value-of select="remote_1"/></td>
          </tr>
        </xsl:for-each>
      </table>
    </body>
    <script src="eduScript.js">
    </script>
  </html>
</xsl:template>
</xsl:stylesheet>
