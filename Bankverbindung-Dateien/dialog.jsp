<?xml version="1.0" encoding="utf-8"?>
<%@ page contentType="application/xhtml+xml; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://www.cit.de/ns/jsp" prefix="cit" %>
<%@ page import="de.cit.jsp.control.PageProcessor" %>
<%! private boolean isVisited(final HttpSession session, final String id) { return ((java.util.Set)session.getAttribute("composer.visitedPages")).contains(id); } %>
<% if (session.getAttribute("composer.visitedPages") == null) { session.setAttribute("composer.visitedPages", java.util.Collections.synchronizedSet(new java.util.HashSet())); } %>
<% PageProcessor pageProcessor = PageProcessor.getSessionInstance(session); %>
<% pageProcessor.createSyncPoint("bankverbindung"); %>
<% ((java.util.Set)session.getAttribute("composer.visitedPages")).add("bankverbindung"); %>

<%!
static java.lang.reflect.Method getComments;
static {
  try {
    getComments = de.cit.jsp.tags.FormTag.class.getMethod("getComments", String.class);
  } catch (NoSuchMethodException e) {
  }
}
   static String getComments(final Object form, final String fieldname) {
      try {
         return form != null && getComments != null ? (String) getComments.invoke(form, fieldname) : "";
      } catch (Exception e) {
         return "";
      }
   }
%>
    

<!DOCTYPE html
  PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:cit="http://www.cit.de/ns/jsp" xmlns:html="http://www.w3.org/1999/xhtml" lang="de-DE" class="no-js">
   <head>
      <cit:useBean name="myForm" class="de.cit.assistants.DataBean"/>
      <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
      <meta content="width=device-width, initial-scale=1, user-scalable=yes" name="viewport"/><% String buildRelease = application.getInitParameter("build.release"); if (buildRelease != null) {%><meta name="build.release" content="<%= buildRelease %>"/><% } %><% String buildNumber = application.getInitParameter("build.number"); if (buildNumber != null) {%><meta name="build.number" content="<%= buildNumber %>"/><% } %><% String buildRevision = application.getInitParameter("build.revision"); if (buildRevision != null) {%><meta name="build.revision" content="<%= buildRevision %>"/><% } %><!--plugin:theme-html5-->
    <cit:theme/>
    
      <script charset="utf-8" src="_plugins/theme-html5/script.js?-8236014590501371310" type="text/javascript"/>
  
      <title id="page-title">
         <cit:conditional test="!assistants.request.valid">Fehler beim Ausfüllen - </cit:conditional>Bankverbindung - Bankverbindung</title>
      <cit:script href="/WEB-INF/etc/commons.js">/**/</cit:script>
      <cit:script href="/WEB-INF/etc/script.js" fileEncoding="utf-8">/**/</cit:script><!--plugin:js-validations-banking-->
    
      <cit:script href="/WEB-INF/include/js/validations/Banking.js">/**/</cit:script>
  
      <cit:template select="/.." xhtml="true"/>
      <cit:control>
         <cit:link rel="helpbase" href="help.jsp"/>
         <cit:flow/>
      </cit:control>
   </head>
   <body id="bankverbindung">
      <div id="custom_top"/>
      <div id="if">
         <div id="page" class=" has_roadmap_right">
            <header>
               <div class="dynamic_area">
                  <div class="headercontent">
                     <div id="logo"/>
                     <h1>Bankverbindung</h1>
                     <section id="useraccount"/>
                  </div>
               </div>
            </header>
            <nav id="roadmap" class="roadmap roadmap_right">
               <h3 class="accessibility">Dialogverlauf</h3>
               <button class="switch" type="button" onclick="return false;" aria-haspopup="true" aria-expanded="true" disabled="disabled">
                  <span class="icon-switch" aria-hidden="true"/>
                  <span class="accessibility">Dialogverlauf öffnen/schließen</span>
               </button>
               <ul class="icons"><% final boolean unvisited_d4e2 = !isVisited(session, "bankverbindung"); %><li class='present<%= unvisited_d4e2 ? " unvisited" : "" %>'>
                     <span class="item">
                        <span class="label">
                           <span class="labeltext">Bankverbindung</span>
                           <span class="labelicon" title='<%= unvisited_d4e2 ? "Aktuelle Seite (nicht besucht)" : "Aktuelle Seite" %>'>
                              <span class="accessibility"><%= unvisited_d4e2 ? "Aktuelle Seite (nicht besucht)" : "Aktuelle Seite" %></span>
                           </span>
                        </span>
                     </span>
                  </li>
               </ul>
            </nav>
            <div class="dynamic_area">
               <article>
                  <section id="content" class=" narrow">
                     <cit:form beanName="myForm">
                        <div class="wizard-body">
                           <h2 id="title">Bankverbindung</h2>
                           <cit:conditional test="!assistants.request.valid &amp;&amp; (assistants.request.strictInvalid === undefined || assistants.request.strictInvalid === true)">
                              <p class="invalidInfo v2">
                                 <span class="icon-warning-sign" aria-hidden="true"/>
                                 <strong>Fehler beim Ausfüllen: Bitte überprüfen Sie Ihre Angaben.</strong>
                              </p>
                           </cit:conditional>
                           <cit:conditional test="!assistants.request.valid &amp;&amp; assistants.request.softInvalid === true">
                              <p class="invalidInfo v2 loose">
                                 <span class="icon-exclamation-sign" aria-hidden="true"/>
                                 <strong>Mögliche Fehler beim Ausfüllen: Bitte kontrollieren Sie Ihre Angaben nochmals. Wenn Sie sicher sind, klicken Sie erneut auf <em class="button-name icon-arrow-right">Weiter</em>.</strong>
                              </p>
                           </cit:conditional>
                           <p class="required-hint">
                              <em>
                                 <span class="required-mark" aria-hidden="true">*</span>
                                 <span aria-hidden="true"> Pflichtfelder</span>
                                 <span class="accessibility">Diese Seite enthält Pflichtfelder.</span>
                              </em>
                           </p>
                           <section class="block narrow label_before" data-comments='<%= getComments(pageContext.getAttribute("form"), "F00000013") %>'>
                              <cit:conditional test="!assistants.request.isValid('F00000013')">
                                 <p class="errorText v2">
                                    <span class="icon-warning-sign" aria-hidden="true"/>
                                    <strong>
                                       <cit:errorText name="F00000013"/>
                                    </strong>
                                 </p>
                              </cit:conditional>
                              <cit:errorText name="F00000013" id="#page-strict">
                                 <p class="errorText v2" id="$$ID$$">
                                    <span class="icon-warning-sign" aria-hidden="true"/>
                                    <strong>
                                       <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                 </p>
                              </cit:errorText>
                              <cit:errorText name="F00000013" id="#page-soft">
                                 <p class="errorText v2 loose" id="$$ID$$">
                                    <span class="icon-exclamation-sign" aria-hidden="true"/>
                                    <strong>
                                       <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                 </p>
                              </cit:errorText>
                              <div class="formline">
                                 <cit:inputLabel name="F00000013" v="2" required="true">
                                    <span id="$$ID$$">Familienname<span class="required-mark">
                                          <span aria-hidden="true">*</span>
                                          <span class="accessibility"> Dies ist ein Pflichtfeld.</span>
                                       </span>
                                    </span>
                                 </cit:inputLabel>
                                 <div class="inputcontainer">
                                    <cit:inputText name="F00000013" ariaLabelledby="$label-id $error-ids" required="true"/>
                                 </div>
                              </div>
                           </section>
                           <section class="block narrow label_before" data-comments='<%= getComments(pageContext.getAttribute("form"), "F00000045") %>'>
                              <cit:conditional test="!assistants.request.isValid('F00000045')">
                                 <p class="errorText v2">
                                    <span class="icon-warning-sign" aria-hidden="true"/>
                                    <strong>
                                       <cit:errorText name="F00000045"/>
                                    </strong>
                                 </p>
                              </cit:conditional>
                              <cit:errorText name="F00000045" id="#page-strict">
                                 <p class="errorText v2" id="$$ID$$">
                                    <span class="icon-warning-sign" aria-hidden="true"/>
                                    <strong>
                                       <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                 </p>
                              </cit:errorText>
                              <cit:errorText name="F00000045" id="#page-soft">
                                 <p class="errorText v2 loose" id="$$ID$$">
                                    <span class="icon-exclamation-sign" aria-hidden="true"/>
                                    <strong>
                                       <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                 </p>
                              </cit:errorText>
                              <div class="formline">
                                 <cit:inputLabel name="F00000045" v="2" required="true">
                                    <span id="$$ID$$">Vorname<span class="required-mark">
                                          <span aria-hidden="true">*</span>
                                          <span class="accessibility"> Dies ist ein Pflichtfeld.</span>
                                       </span>
                                    </span>
                                 </cit:inputLabel>
                                 <div class="inputcontainer">
                                    <cit:inputText name="F00000045" ariaLabelledby="$label-id $error-ids" required="true"/>
                                 </div>
                              </div>
                           </section>
                           <section class="block narrow label_before" data-comments='<%= getComments(pageContext.getAttribute("form"), "bank") %>'>
                              <cit:conditional test="!assistants.request.isValid('bank')">
                                 <p class="errorText v2">
                                    <span class="icon-warning-sign" aria-hidden="true"/>
                                    <strong>
                                       <cit:errorText name="bank"/>
                                    </strong>
                                 </p>
                              </cit:conditional>
                              <cit:errorText name="bank" id="#page-strict">
                                 <p class="errorText v2" id="$$ID$$">
                                    <span class="icon-warning-sign" aria-hidden="true"/>
                                    <strong>
                                       <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                 </p>
                              </cit:errorText>
                              <cit:errorText name="bank" id="#page-soft">
                                 <p class="errorText v2 loose" id="$$ID$$">
                                    <span class="icon-exclamation-sign" aria-hidden="true"/>
                                    <strong>
                                       <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                 </p>
                              </cit:errorText>
                              <div class="formline">
                                 <cit:inputLabel name="bank" v="2" required="true">
                                    <span id="$$ID$$">Name und Sitz der Bank<span class="required-mark">
                                          <span aria-hidden="true">*</span>
                                          <span class="accessibility"> Dies ist ein Pflichtfeld.</span>
                                       </span>
                                    </span>
                                 </cit:inputLabel>
                                 <div class="inputcontainer">
                                    <cit:inputText name="bank" ariaLabelledby="$label-id $error-ids" required="true"/>
                                 </div>
                              </div>
                           </section>
                           <section class="block narrow label_before" data-comments='<%= getComments(pageContext.getAttribute("form"), "F00000106h") %>'>
                              <cit:conditional test="!assistants.request.isValid('F00000106h')">
                                 <p class="errorText v2">
                                    <span class="icon-warning-sign" aria-hidden="true"/>
                                    <strong>
                                       <cit:conditional test="!My.isCustomReason('F00000106h')">
                                          <cit:errorText name="F00000106h"/>
                                       </cit:conditional>
                                       <cit:conditional test="My.isCustomReason('F00000106h')">
                                          <cit:errorText name="F00000106h">
                                             <span id="$$ID$$">
                                                <span class="accessibility">Fehler: </span>Bitte geben Sie eine gültige IBAN ein.</span>
                                          </cit:errorText>
                                       </cit:conditional>
                                    </strong>
                                 </p>
                              </cit:conditional>
                              <cit:errorText name="F00000106h" id="#page-strict">
                                 <p class="errorText v2" id="$$ID$$">
                                    <span class="icon-warning-sign" aria-hidden="true"/>
                                    <strong>
                                       <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                 </p>
                              </cit:errorText>
                              <cit:errorText name="F00000106h" id="#page-soft">
                                 <p class="errorText v2 loose" id="$$ID$$">
                                    <span class="icon-exclamation-sign" aria-hidden="true"/>
                                    <strong>
                                       <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                 </p>
                              </cit:errorText>
                              <div class="formline">
                                 <cit:inputLabel name="F00000106h" v="2" required="true">
                                    <span id="$$ID$$">IBAN<span class="required-mark">
                                          <span aria-hidden="true">*</span>
                                          <span class="accessibility"> Dies ist ein Pflichtfeld.</span>
                                       </span>
                                    </span>
                                    <span class="tooltip">
                                       <a target="intelliform_help" class="icon" href='<%= response.encodeURL("help.jsp#f00000106h") %>' aria-describedby="d0e50_tooltip">
                                          <span class="accessibility">Hilfe öffnen</span>
                                       </a>
                                    </span>
                                 </cit:inputLabel>
                                 <div class="inputcontainer">
                                    <cit:inputText name="F00000106h" ariaLabelledby="$label-id $error-ids" required="true" onValidate="isValidIBAN(value.replace(/\s+/g, &#34;&#34;))" errtitle="Bitte geben Sie eine gültige IBAN ein."/>
                                 </div>
                                 <div class="tooltip_overlay">
                                    <div class="tooltip_text" id="d0e50_tooltip"><p>Geben Sie die IBAN (<span lang="en">International Bank Account Number</span>) Ihres Kontos an. <b>Definition:</b><br/>Die IBAN (<span lang="en">International Bank Account Number</span>) ist eine internationale, standardisierte und weltweit eindeutige Notation für ein Bankkonto. Die Notation wird durch die <abbr title="Internationale Organisation für Normung">ISO</abbr>-Norm <abbr title="Internationale Organisation für Normung">ISO</abbr> 13616:2003 beschrieben.</p><button class="close" type="button" onclick="return false;">
                                          <span class="icon-close" aria-hidden="true"/>
                                          <span class="accessibility">Schließen</span>
                                       </button>
                                    </div>
                                 </div>
                              </div>
                           </section>
                           <section class="block narrow label_before" data-comments='<%= getComments(pageContext.getAttribute("form"), "F00000107h") %>'>
                              <cit:conditional test="!assistants.request.isValid('F00000107h')">
                                 <p class="errorText v2">
                                    <span class="icon-warning-sign" aria-hidden="true"/>
                                    <strong>
                                       <cit:conditional test="!My.isCustomReason('F00000107h')">
                                          <cit:errorText name="F00000107h"/>
                                       </cit:conditional>
                                       <cit:conditional test="My.isCustomReason('F00000107h')">
                                          <cit:errorText name="F00000107h">
                                             <span id="$$ID$$">
                                                <span class="accessibility">Fehler: </span>Bitte geben Sie eine gültige BIC ein.</span>
                                          </cit:errorText>
                                       </cit:conditional>
                                    </strong>
                                 </p>
                              </cit:conditional>
                              <cit:errorText name="F00000107h" id="#page-strict">
                                 <p class="errorText v2" id="$$ID$$">
                                    <span class="icon-warning-sign" aria-hidden="true"/>
                                    <strong>
                                       <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                 </p>
                              </cit:errorText>
                              <cit:errorText name="F00000107h" id="#page-soft">
                                 <p class="errorText v2 loose" id="$$ID$$">
                                    <span class="icon-exclamation-sign" aria-hidden="true"/>
                                    <strong>
                                       <span class="accessibility">Fehler: </span>Bitte Eingabe bzw. Auswahl prüfen.</strong>
                                 </p>
                              </cit:errorText>
                              <div class="formline">
                                 <cit:inputLabel name="F00000107h" v="2" required="true">
                                    <span id="$$ID$$">BIC<span class="required-mark">
                                          <span aria-hidden="true">*</span>
                                          <span class="accessibility"> Dies ist ein Pflichtfeld.</span>
                                       </span>
                                    </span>
                                    <span class="tooltip">
                                       <a target="intelliform_help" class="icon" href='<%= response.encodeURL("help.jsp#f00000107h") %>' aria-describedby="d0e68_tooltip">
                                          <span class="accessibility">Hilfe öffnen</span>
                                       </a>
                                    </span>
                                 </cit:inputLabel>
                                 <div class="inputcontainer">
                                    <cit:inputText name="F00000107h" ariaLabelledby="$label-id $error-ids" required="true" onValidate="isValidBIC(value.replace(/\s+/g, &#34;&#34;))" errtitle="Bitte geben Sie eine gültige BIC ein."/>
                                 </div>
                                 <div class="tooltip_overlay">
                                    <div class="tooltip_text" id="d0e68_tooltip"><p>Geben Sie den BIC (<span lang="en">Bank Identifier Code</span>) Ihres Geldinsitutes an.<br/><b>Definition:</b><br/>Der BIC (<span lang="en">Bank Identifier Code</span>, auch <span lang="en"><abbr title="Society for Worldwide Interbank Financial Telecommunication">SWIFT</abbr></span>-Code oder <span lang="en"><abbr title="Society for Worldwide Interbank Financial Telecommunication">SWIFT</abbr></span>-Adresse genannt) ist ein nach <abbr title="Internationale Organisation für Normung">ISO</abbr> 9362 international standardisierter Bankcode, den weltweit jedes direkt oder indirekt teilnehmende Geldinstitut eindeutig identifiziert werden kann.</p><button class="close" type="button" onclick="return false;">
                                          <span class="icon-close" aria-hidden="true"/>
                                          <span class="accessibility">Schließen</span>
                                       </button>
                                    </div>
                                 </div>
                              </div>
                           </section>
                           <cit:inputComputed name="f00000106" value="myForm.F00000106h.replace(/\s+/g, &#34;&#34;)"/>
                           <cit:inputComputed name="f00000107" value="myForm.F00000107h.replace(/\s+/g, &#34;&#34;)"/>
                        </div>
                        <nav id="roadmap_bottom" class="roadmap">
                           <h3 class="accessibility">Dialogverlauf</h3>
                           <ul class="icons"><% final boolean unvisited_d6e2 = !isVisited(session, "bankverbindung"); %><li class='present<%= unvisited_d6e2 ? " unvisited" : "" %>'>
                                 <span class="item">
                                    <span class="label">
                                       <span class="labeltext">Bankverbindung</span>
                                       <span class="labelicon" title='<%= unvisited_d6e2 ? "Aktuelle Seite (nicht besucht)" : "Aktuelle Seite" %>'>
                                          <span class="accessibility"><%= unvisited_d6e2 ? "Aktuelle Seite (nicht besucht)" : "Aktuelle Seite" %></span>
                                       </span>
                                    </span>
                                 </span>
                              </li>
                           </ul>
                        </nav>
                        <div class="wizard-buttons">
                           <div class="wizard-buttons-row">
                              <div class="button">
                                 <cit:inputSubmit type="cancel" class="submit-cancel prio3 icon-remove-sign" tabindex="0" value="Abbrechen"/>
                              </div>
                              <div class="button">
                                 <cit:inputSubmit type="save" class="submit-save prio3 icon-save" tabindex="0" value="Unterbrechen..." title="Klicken Sie hier, wenn Sie den Vorgang jetzt unterbrechen und später fortsetzen möchten."/>
                              </div>
                              <div class="button">
                                 <cit:inputSubmit type="back" class="submit-back prio2 icon-arrow-left" tabindex="0" value="Zurück"/>
                              </div>
                              <div class="button">
                                 <cit:inputSubmit class="submit-forward" tabindex="0" value="Weiter" type="forward"/>
                              </div>
                           </div>
                        </div>
                     </cit:form>
                     <footer>
                        <div class="footercontent">
                           <span>Powered by cit intelliForm</span>
                        </div>
                     </footer>
                  </section>
               </article>
            </div>
         </div>
      </div>
      <div id="custom_bottom"/>
   </body>
</html>