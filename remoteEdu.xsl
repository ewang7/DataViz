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
      <canvas id="pieChart" width="500px" height="500px">
        Browser does not support HTML canvas
      </canvas>
      <table>
        <tr>
          <th>School District Number</th>
          <th>Total Enrollment</th>
          <th>Blended/Hybrid Learning Count</th>
          <th>Remote Learning Count</th>
          <th>Blended/Hybrid Learning Percent</th>
          <th>Remote Learning Percent</th>
          <th>Data Visual</th>
        </tr>
        <xsl:for-each select="response/row">
          <xsl:if test="total_enrollment &gt; 100">
          <tr>
            <td class="district"><xsl:value-of select="district"/></td>
            <td class="totalEnroll"><xsl:value-of select="total_enrollment"/></td>
            <td class="blendedCount"><xsl:value-of select="blended"/></td>
            <td class="remoteCount"><xsl:value-of select="remote"/></td>
            <td class="blendedPercent"><xsl:value-of select="blended_1"/></td>
            <td class="remotePercent"><xsl:value-of select="remote_1"/></td>
            <td><canvas class="barGraphs" width="100px" height="20px">Browser does not support HTML canvas</canvas></td>
          </tr>
          </xsl:if>
        </xsl:for-each>
      </table>
    </body>
    <script src="eduScript.js">
    </script>
  </html>
</xsl:template>
</xsl:stylesheet>
