<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:component="http://www.shonk.co.uk/spacegame/component">
<xsl:variable name="scale" select="'50'"/>
<xsl:output encoding="utf-8"/>
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



<!-- components -->
	<xsl:template match="component:core">
		<xsl:param name="startX"/>
		<xsl:param name="startY"/>
		<xsl:param name="startAngle"/>
		
			
		<g>
			<xsl:choose>
				<xsl:when test="@joinedAt='east'">
					<xsl:attribute name="transform">rotate(90 <xsl:value-of select="$startX"/> <xsl:value-of select="$startY"/>)</xsl:attribute>
				</xsl:when>
				<xsl:when test="@joinedAt='south'">
					<xsl:attribute name="transform">rotate(180 <xsl:value-of select="$startX"/> <xsl:value-of select="$startY"/>)</xsl:attribute>
				</xsl:when>
				<xsl:when test="@joinedAt='west'">
					<xsl:attribute name="transform">rotate(270 <xsl:value-of select="$startX"/> <xsl:value-of select="$startY"/>)</xsl:attribute>
				</xsl:when>
			</xsl:choose>
			
			<rect width="{$scale}" height="{$scale}" style="fill:red;">
			
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
	
	<xsl:template match="component:hull">
		<xsl:param name="startX" select ="'0'"/>
		<xsl:param name="startY" select ="'0'"/>
		<xsl:param name="startAngle" select ="'0'"/>
		
			
		<g>
			<xsl:choose>
				<xsl:when test="@joinedAt='east'">
					<xsl:attribute name="transform">rotate(90 <xsl:value-of select="$startX"/> <xsl:value-of select="$startY"/>)</xsl:attribute>
				</xsl:when>
				<xsl:when test="@joinedAt='south'">
					<xsl:attribute name="transform">rotate(180 <xsl:value-of select="$startX"/> <xsl:value-of select="$startY"/>)</xsl:attribute>
				</xsl:when>
				<xsl:when test="@joinedAt='west'">
					<xsl:attribute name="transform">rotate(270 <xsl:value-of select="$startX"/> <xsl:value-of select="$startY"/>)</xsl:attribute>
				</xsl:when>
			</xsl:choose>
			
			<rect width="{$scale}" height="{$scale}" style="fill:blue;">
			
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
	<xsl:template match="component:fissionReactor">
		<xsl:param name="startX" select ="'0'"/>
		<xsl:param name="startY" select ="'0'"/>
		<xsl:param name="startAngle" select ="'0'"/>
		
			
		<g>
			<xsl:choose>
				<xsl:when test="@joinedAt='east'">
					<xsl:attribute name="transform">rotate(90 <xsl:value-of select="$startX"/> <xsl:value-of select="$startY"/>)</xsl:attribute>
				</xsl:when>
				<xsl:when test="@joinedAt='south'">
					<xsl:attribute name="transform">rotate(180 <xsl:value-of select="$startX"/> <xsl:value-of select="$startY"/>)</xsl:attribute>
				</xsl:when>
				<xsl:when test="@joinedAt='west'">
					<xsl:attribute name="transform">rotate(270 <xsl:value-of select="$startX"/> <xsl:value-of select="$startY"/>)</xsl:attribute>
				</xsl:when>
			</xsl:choose>
			
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
	<xsl:template match="component:ionEngine">
		<xsl:param name="startX" select ="'0'"/>
		<xsl:param name="startY" select ="'0'"/>
		<xsl:param name="startAngle" select ="'0'"/>
		
			
		<g>
			<xsl:choose>
				<xsl:when test="@joinedAt='east'">
					<xsl:attribute name="transform">rotate(90 <xsl:value-of select="$startX"/> <xsl:value-of select="$startY"/>)</xsl:attribute>
				</xsl:when>
				<xsl:when test="@joinedAt='south'">
					<xsl:attribute name="transform">rotate(180 <xsl:value-of select="$startX"/> <xsl:value-of select="$startY"/>)</xsl:attribute>
				</xsl:when>
				<xsl:when test="@joinedAt='west'">
					<xsl:attribute name="transform">rotate(270 <xsl:value-of select="$startX"/> <xsl:value-of select="$startY"/>)</xsl:attribute>
				</xsl:when>
			</xsl:choose>
			
			<rect width="{$scale}" height="{$scale}" style="fill:green;">
			
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
	<xsl:template match="component:gattlingGun">
		<xsl:param name="startX" select ="'0'"/>
		<xsl:param name="startY" select ="'0'"/>
		<xsl:param name="startAngle" select ="'0'"/>
		
			
		<g>
			<xsl:choose>
				<xsl:when test="@joinedAt='east'">
					<xsl:attribute name="transform">rotate(90 <xsl:value-of select="$startX"/> <xsl:value-of select="$startY"/>)</xsl:attribute>
				</xsl:when>
				<xsl:when test="@joinedAt='south'">
					<xsl:attribute name="transform">rotate(180 <xsl:value-of select="$startX"/> <xsl:value-of select="$startY"/>)</xsl:attribute>
				</xsl:when>
				<xsl:when test="@joinedAt='west'">
					<xsl:attribute name="transform">rotate(270 <xsl:value-of select="$startX"/> <xsl:value-of select="$startY"/>)</xsl:attribute>
				</xsl:when>
			</xsl:choose>
			
			<rect width="{$scale div 3}" height="{$scale}" style="fill:black;">
			
			<xsl:choose>
				<xsl:when test="@position='north'">
					<xsl:attribute name="x"><xsl:value-of select="$startX * $scale + ($scale div 3)"/></xsl:attribute>
					<xsl:attribute name="y"><xsl:value-of select="($startY - 1) * $scale"/></xsl:attribute>
				</xsl:when>
				<xsl:when test="@position='south'">
					<xsl:attribute name="x"><xsl:value-of select="$startX * $scale + ($scale div 3)"/></xsl:attribute>
					<xsl:attribute name="y"><xsl:value-of select="($startY + 1) * $scale"/></xsl:attribute>
				</xsl:when>
				<xsl:when test="@position='east'">
					<xsl:attribute name="x"><xsl:value-of select="($startX + 1) * $scale + ($scale div 3)"/></xsl:attribute>
					<xsl:attribute name="y"><xsl:value-of select="$startY * $scale"/></xsl:attribute>
				</xsl:when>
				<xsl:when test="@position='west'">
					<xsl:attribute name="x"><xsl:value-of select="($startX - 1) * $scale + ($scale div 3)"/></xsl:attribute>
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
