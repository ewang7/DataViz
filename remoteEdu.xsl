<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- ?xml-stylesheet href="eduStyle.css" type="text/css"?  -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
  <html>
    <head>
      <link rel="stylesheet" href="eduStyle.css" /> <!-- Google Chrome quirks issue -->
    </head>
    <body>
      <h1>Learning Modality Preferences in NYC School Districts
      as of January 4th, 2021</h1>
      <div type="wrapper">
        <div type="col-1">
          <canvas id="pieChart" width="500px" height="500px">
            Browser does not support HTML canvas
          </canvas>
        </div>
        <div type="col-2">
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
<!-- I tried to clean-up data with an "and condition" but commas were an issue for the "blended + remote = total_enrollment"
This caused issues with totals and overall pie chart but was hidden when started with just bar charts-->
          <tr>
          <xsl:choose>
            <xsl:when test="total_enrollment &lt; 2380"> <!-- 2380 = avg. school district size in NY state-->
              <td class="district"><xsl:value-of select="district"/>*</td>
            </xsl:when>
            <xsl:otherwise>
              <td class="district"><xsl:value-of select="district"/></td>
            </xsl:otherwise>
          </xsl:choose>
              <td class="totalEnroll"><xsl:value-of select="translate(total_enrollment, ',' ,'')"/></td>
              <td class="blendedCount"><xsl:value-of select="translate(blended, ',' ,'')"/></td>
              <td class="remoteCount"><xsl:value-of select="translate(remote,',','')"/></td>
              <td class="blendedPercent"><xsl:value-of select="blended_1"/></td>
              <td class="remotePercent"><xsl:value-of select="remote_1"/></td>
              <td><canvas class="barGraphs" width="100px" height="20px">Browser does not support HTML canvas</canvas></td>
            </tr>
          </xsl:if>
          </xsl:for-each>
        </table>
        </div>
      </div>
    </body>
    <script src="eduScript.js">
    </script>
  </html>
</xsl:template>
</xsl:stylesheet>
