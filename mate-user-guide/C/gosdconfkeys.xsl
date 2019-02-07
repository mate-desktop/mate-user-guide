<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:its="http://www.w3.org/2005/11/its">
<xsl:output method="xml" omit-xml-declaration="yes" />
<xsl:template match="schema[key]">
  <section><xsl:attribute name="xml:id"><xsl:value-of select="@id" /></xsl:attribute>
    <title>Dconf Directory: <xsl:value-of select="@path" /></title>
     <para>To obtain the list of dconf keys, run one of the following commands:</para>
     <para its:translate="no"><screen><xsl:text disable-output-escaping="yes">$ dconf list </xsl:text><xsl:value-of select="@path" />
<xsl:text>&#xa;</xsl:text><xsl:text disable-output-escaping="yes">$ gsettings list-keys </xsl:text><xsl:value-of select="@id" /></screen></para>
     <para>In the following list of dconf keys, the data type of the dconf key is shown in parentheses, next to its description, if available.
           The list also contains an example to read the value of the key using the <command>dconf</command> or <command>gsettings</command> commands.</para>
     <variablelist><info><title>List of dconf keys</title></info>
       <xsl:for-each select="key">
         <varlistentry>
           <term><xsl:value-of select="@name"/></term>
           <listitem><para>(<xsl:value-of select="@type"/>) <xsl:value-of select="description"/></para>
             <para its:translate="no"><screen><xsl:text disable-output-escaping="yes">$ dconf read </xsl:text><xsl:value-of select="../@path" /><xsl:value-of select="@name"/>
<xsl:text>&#xa;</xsl:text><xsl:text disable-output-escaping="yes">$ gsettings get </xsl:text><xsl:value-of select="../@id" /><xsl:text> </xsl:text><xsl:value-of select="@name"/></screen></para>
           </listitem>
         </varlistentry>
       </xsl:for-each>
    </variablelist>
  </section>
</xsl:template>
</xsl:stylesheet>
