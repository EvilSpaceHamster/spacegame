<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:component="http://www.shonk.co.uk/spacegame/component">
<xsl:variable name="scale" select="'50'"/>
<xsl:output encoding="utf-8"/>

	<xsl:template match="component:fissionReactor">
		<xsl:param name="startX" select ="'0'"/>
		<xsl:param name="startY" select ="'0'"/>
		<xsl:param name="startAngle" select ="'0'"/>
		
			
		<g>
		
			<rect width="{$scale}" height="{$scale}" style="fill:grey;">
			
			<xsl:choose>
				<xsl:when test="@position='north'">
					<xsl:attribute name="x"><xsl:value-of select="$startX * $scale"/></xsl:attribute>
					<xsl:attribute name="y"><xsl:value-of select="($startY - 1) * $scale"/></xsl:attribute>
				</xsl:when>
				<xsl:when test="@position='south'">
					<xsl:attribute name="x"><xsl:value-of select="$startX * $scale"/></xsl:attribute>
					<xsl:attribute name="y"><xsl:value-of select="($startY + 1) * $scale"/></xsl:attribute>
				</xsl:when>
				<xsl:when test="@position='east'">
					<xsl:attribute name="x"><xsl:value-of select="($startX + 1) * $scale"/></xsl:attribute>
					<xsl:attribute name="y"><xsl:value-of select="$startY * $scale"/></xsl:attribute>
				</xsl:when>
				<xsl:when test="@position='west'">
					<xsl:attribute name="x"><xsl:value-of select="($startX - 1) * $scale"/></xsl:attribute>
					<xsl:attribute name="y"><xsl:value-of select="$startY * $scale"/></xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="x"><xsl:value-of select="$startX * $scale"/></xsl:attribute>
					<xsl:attribute name="y"><xsl:value-of select="$startY * $scale"/></xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
			</rect>
			
			<xsl:apply-templates>
			<xsl:with-param name="startX">
			<xsl:choose>
				<xsl:when test="@position='east'">
					<xsl:value-of select="($startX + 1)"/>
				</xsl:when>
				<xsl:when test="@position='west'">
					<xsl:value-of select="($startX - 1)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$startX"/>
				</xsl:otherwise>
			</xsl:choose>
			</xsl:with-param>
			<xsl:with-param name="startY">
			<xsl:choose>
				<xsl:when test="@position='north'">
					<xsl:value-of select="($startY - 1)"/>
				</xsl:when>
				<xsl:when test="@position='south'">
					<xsl:value-of select="($startY + 1)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$startY"/>
				</xsl:otherwise>
			</xsl:choose>
			</xsl:with-param>
			</xsl:apply-templates>
		</g>
	</xsl:template>

</xsl:stylesheet>
