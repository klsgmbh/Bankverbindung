<?xml version="1.0" encoding="us-ascii"?>
<out:stylesheet xmlns:out="http://www.w3.org/1999/XSL/Transform" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://xmlns.cit.de/assistants/store" xmlns:s="http://xmlns.cit.de/assistants/store" xmlns:a="http://xmlns.cit.de/assistants/internal" xmlns:t="http://xmlns.cit.de/intelliform/transaction" xmlns:a2="http://xmlns.cit.de/assistants/store#attributes" xmlns:java="http://xml.apache.org/xslt/java" version="1.0" exclude-result-prefixes="xsl s a" extension-element-prefixes="java">
   <out:template match="/*">
      <data class="de.cit.assistants.DataBean" name="myForm">
         <out:if test="@t:form-version">
            <out:attribute name="version">
               <out:value-of select="@t:form-version"/>
            </out:attribute>
         </out:if>
         <out:for-each select="F00000013">
            <field name="F00000013" type="string">
               <out:if test="string-length(normalize-space(.))=0">
                  <out:attribute name="type">string</out:attribute>
               </out:if>
               <out:apply-templates select="@*"/>
               <out:value-of select="."/>
            </field>
         </out:for-each>
         <out:for-each select="F00000045">
            <field name="F00000045" type="string">
               <out:if test="string-length(normalize-space(.))=0">
                  <out:attribute name="type">string</out:attribute>
               </out:if>
               <out:apply-templates select="@*"/>
               <out:value-of select="."/>
            </field>
         </out:for-each>
         <out:for-each select="bank">
            <field name="bank" type="string">
               <out:if test="string-length(normalize-space(.))=0">
                  <out:attribute name="type">string</out:attribute>
               </out:if>
               <out:apply-templates select="@*"/>
               <out:value-of select="."/>
            </field>
         </out:for-each>
         <out:for-each select="F00000106h">
            <field name="F00000106h" type="string">
               <out:if test="string-length(normalize-space(.))=0">
                  <out:attribute name="type">string</out:attribute>
               </out:if>
               <out:apply-templates select="@*"/>
               <out:value-of select="."/>
            </field>
         </out:for-each>
         <out:for-each select="F00000107h">
            <field name="F00000107h" type="string">
               <out:if test="string-length(normalize-space(.))=0">
                  <out:attribute name="type">string</out:attribute>
               </out:if>
               <out:apply-templates select="@*"/>
               <out:value-of select="."/>
            </field>
         </out:for-each>
         <out:for-each select="f00000106">
            <field name="f00000106" type="string">
               <out:if test="string-length(normalize-space(.))=0">
                  <out:attribute name="type">string</out:attribute>
               </out:if>
               <out:if test="@xsi:type">
                  <out:attribute name="type">
                     <out:value-of select="@xsi:type"/>
                  </out:attribute>
               </out:if>
               <out:apply-templates select="@*"/>
               <out:value-of select="."/>
            </field>
         </out:for-each>
         <out:for-each select="f00000107">
            <field name="f00000107" type="string">
               <out:if test="string-length(normalize-space(.))=0">
                  <out:attribute name="type">string</out:attribute>
               </out:if>
               <out:if test="@xsi:type">
                  <out:attribute name="type">
                     <out:value-of select="@xsi:type"/>
                  </out:attribute>
               </out:if>
               <out:apply-templates select="@*"/>
               <out:value-of select="."/>
            </field>
         </out:for-each>
      </data>
   </out:template>
   <out:template match="@s:readonly">
      <out:attribute name="{local-name()}">
         <out:value-of select="."/>
      </out:attribute>
   </out:template>
   <out:template match="@*"/>
</out:stylesheet>