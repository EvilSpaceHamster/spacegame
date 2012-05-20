<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:component="http://www.shonk.co.uk/spacegame/component">
<xsl:variable name="scale" select="'50'"/>
<xsl:output encoding="utf-8"/>
<!-- import all components -->

	<xsl:template match="//spaceship">
		<svg xmlns="http://www.w3.org/2000/svg" version="1.1">
			<g transform="translate(400)">
			<rect x="0" y="0" width="300" height="90" fill="#000000;"/>
			<text y="25" x="5" style="font-weight:bold;fill:#ffffff;font-family:arial;">Ship:</text><text style="fill:#ffffff;font-family:arial;" y="25" x="90" > <xsl:value-of select="@name"/> by <xsl:value-of select="@author"/></text>
			<text y="45" x="5" style="font-weight:bold;fill:#ffffff;font-family:arial;">Power:</text><text style="fill:#ffffff;font-family:arial;" y="45" x="90" > <xsl:value-of select="count(//component:fissionReactor)"/> MW</text>
			<text y="65" x="5" style="font-weight:bold;fill:#ffffff;font-family:arial;">Firepower:</text><text style="fill:#ffffff;font-family:arial;" y="65" x="90" > <xsl:value-of select="count(//component:gattlingGun)"/> Weapons</text>
			<text y="85" x="5" style="font-weight:bold;fill:#ffffff;font-family:arial;">Speed:</text><text style="fill:#ffffff;font-family:arial;" y="85" x="90" > <xsl:value-of select="count(//component:ionEngine) * 500"/> m/s</text>
			</g>
			<xsl:apply-templates>
				<xsl:with-param name="startX" select="'2'"/>
				<xsl:with-param name="startY" select="'2'"/>
				<xsl:with-param name="startAngle" select="'0'"/>
			</xsl:apply-templates>
		</svg>
	</xsl:template>
</xsl:stylesheet>
