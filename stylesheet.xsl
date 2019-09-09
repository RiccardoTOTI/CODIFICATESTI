<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml" >

<xsl:output method="html" 
            encoding="UTF-8" 
            indent="yes" 
            omit-xml-declaration="yes" />


<xsl:template match="/">
  <html>
    <head>
      <link rel="stylesheet" type="text/css" href="style.css" media="screen" />
      <script src="script.js"> </script>
      <meta charset="UTF-8"/>
        <title>Progetto di Codifica di Testi</title>
    </head>

    <body>
      <section>
        
        <h1> <xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@xml:id='maintitle']"/> </h1>
        
        <div>
          <xsl:value-of select="//tei:fileDesc/tei:titleStmt/tei:text"/> 
        </div>

        <div class="intro">
          <b>Realizzazione dell'edizione digitale delle corrispondenze 
          inviate da Giovanni a Oliva e Antonietta Turtura tra il 1913 e il 1918.</b>
          <br />
         <b>Le fonti sono conservate al <xsl:value-of select="//tei:teiHeader[@xml:id='common']//tei:repository"/>
         situato a <xsl:value-of select="//tei:teiHeader[@xml:id='common']//tei:settlement"/>.</b>
        </div>

          <div id="cartoline">
            <div id="cartolina">
              <a href="#testocartoline">
                  <input type="image" src="./7694-029/7694-029F.jpg"  id="img1"></input>
              </a>
            </div>

            <div id="cartolina">
              <a href="#testocartoline">
                <input type="image"  src="./7694-050/7694-050F.jpg"  id="img2"></input>
              </a>
            </div>

            <div id="cartolina">
              <a href="#testocartoline">
                <input type="image"  src="./7694-199/7694-199F.jpg"  id="img3"></input>
              </a>
            </div>
          </div>

      </section>

      <section id="testocartoline">

        <div id="text">
          <div id="imgs">
            <div id="fimgs">
              <xsl:apply-templates select="//tei:facsimile"/>
              <xsl:apply-templates select="//tei:surface[@type='rimg']/tei:graphic"/>
            </div>
            <xsl:apply-templates select="//tei:TEI/tei:text/tei:body/tei:div[@type='retro']"/>
          </div>
          <div id="description">
            <p id="desc29"><b>Descrizione del fronte : </b><br /><xsl:value-of select="//tei:div[@xml:id='frontedesc29']//tei:figDesc"/></p>
            <p id="desc50"><b>Descrizione del fronte : </b><br /><xsl:value-of select="//tei:div[@xml:id='frontedesc50']//tei:figDesc"/></p>
            <p id="desc199"><b>Descrizione del fronte : </b><br /><xsl:value-of select="//tei:div[@xml:id='frontedesc199']//tei:figDesc"/></p>
            <xsl:apply-templates select="//tei:TEI/tei:teiHeader"/>
          </div>
        </div>
      </section>

            <section id="altreinfo">
             <strong class="about"> Responsabili </strong> <br/>
               <xsl:apply-templates select="//tei:respStmt"/>
              <br/>
             <strong class="about"> Permessi </strong> <br/>
               A partire dal <xsl:value-of select="//tei:teiHeader[@xml:id='common']/tei:fileDesc/tei:publicationStmt/tei:date"/>  <br />
               <xsl:value-of select="//tei:availability"/>  concessa dal <xsl:value-of select="//tei:teiHeader[@xml:id='common']//tei:addrLine"/> <br/> <br/>
           </section>
    </body>
  </html>
</xsl:template>


<xsl:template match="//tei:respStmt">
  <xsl:apply-templates/> <br/>
</xsl:template>

<xsl:template match="//tei:div[@type='retro']">
  <xsl:variable name="index" select="position()"/>
  <xsl:element name="div" >
    <xsl:attribute name="id">
        <xsl:value-of select="concat('Contents_' , $index) "/>
    </xsl:attribute>
    <xsl:apply-templates/>
  </xsl:element>
</xsl:template>


<xsl:template match="//tei:TEI/tei:teiHeader">
    <xsl:variable name="index2" select="position()"/>
    <xsl:element name="div" >
      <xsl:attribute name="id">
        <xsl:value-of select="concat('postheader_' , $index2) "/>
      </xsl:attribute>
      <xsl:apply-templates/>
    </xsl:element>
</xsl:template>

<!-- SCHEDA CON LE INFO E LE NOTE, IN ORDINE -->


<!-- NOTE -->

<xsl:template match="//tei:notesStmt">
      <h2> &#9658; Note </h2>
      <div id="notes"> <xsl:apply-templates/> </div>
</xsl:template>

<xsl:template match="//tei:notesStmt/tei:note">
    <xsl:variable name="index3" select="position()"/>
      <xsl:element name="p">
        <xsl:attribute name="id">
          <xsl:value-of select="concat('note_', $index3)"/>
        </xsl:attribute>
          <ul>
            <xsl:apply-templates/>
          </ul>
      </xsl:element>
</xsl:template>


<!--INFO-->

<xsl:template match="//tei:sourceDesc">
    <h2> &#9658; Informazioni</h2>
    <xsl:apply-templates/>
</xsl:template>


<xsl:template match="//tei:title[@type='t1']">
    <p id="t1"><xsl:value-of select="."/> </p>
</xsl:template>

<xsl:template match="//tei:orgName[@type='t2']">
    <p id="t2"><xsl:value-of select="."/> </p>
</xsl:template>

<xsl:template match="//tei:title[@type='custom']">
    <p><strong>Titolo : </strong><xsl:value-of select="."/> </p>
</xsl:template>

<xsl:template match="//tei:bibl/tei:publisher">
   <p> <strong>Editore : </strong> <xsl:value-of select="."/>  </p>
</xsl:template>

<xsl:template match="//tei:bibl/tei:pubPlace">
      <p> <strong>Luogo di pubblicazione : </strong> <xsl:value-of select="."/> </p>
</xsl:template>

<xsl:template match="//tei:sourceDesc/tei:msDesc/tei:msIdentifier">
      <p><strong>Codice identificativo cartolina : </strong> <xsl:value-of select="./tei:idno"/> </p>
</xsl:template>

<xsl:template match="//tei:msContents" >
     <p> <strong>Descrizione : </strong>  <xsl:value-of select="//tei:msContents/tei:summary"/> </p>
     <p><strong>Scritta in : </strong> <xsl:value-of select="//tei:msContents/tei:textLang"/> </p>
</xsl:template>

<!--Caratteristiche-->
<xsl:template match="//tei:physDesc">
    <p><b>Caratteristiche : </b>
        <xsl:value-of select="current()/tei:objectDesc/tei:supportDesc/tei:support/tei:objectType"/> di <xsl:value-of select="current()/tei:objectDesc/tei:supportDesc/tei:support/tei:material"/>,
        con dimensioni in cm <xsl:value-of select="current()/tei:objectDesc/tei:supportDesc/tei:support/tei:dimensions/tei:height"/>
        x <xsl:value-of select="current()//tei:objectDesc/tei:supportDesc/tei:support/tei:dimensions/tei:width"/>.</p>
    <p><b>Francobolli/timbri : </b>
        <xsl:value-of select="current()/tei:objectDesc/tei:supportDesc/tei:support/tei:stamp[@type='postage']"/> /
        <xsl:value-of select="current()/tei:objectDesc/tei:supportDesc/tei:support/tei:stamp[@type='postmark']"/>
        </p>
    <p><b>Stato di Conservazione : </b>
    <xsl:value-of select="//tei:supportDesc/tei:condition"/>
        </p>
</xsl:template>

<!--Persone-->
<xsl:template match="//tei:sourceDesc/tei:listPerson">
    <strong>Persone : </strong>
       <ul>
        <xsl:apply-templates/>
       </ul>
</xsl:template>

<xsl:template match="//tei:listPerson/tei:person">
      <li>  <xsl:apply-templates/>  </li>
</xsl:template>

<xsl:template match="//tei:person/tei:persName">
     <xsl:value-of select="."/> -
</xsl:template>

<xsl:template match="//tei:person/tei:sex">
      <xsl:value-of select="."/>  -
</xsl:template>

<!--Città-->
<xsl:template match="//tei:sourceDesc/tei:listPlace">
    <strong>Città : </strong>
       <ul>
        <xsl:apply-templates/>
       </ul>
</xsl:template>

<xsl:template match="//tei:place">
    <li>
      <xsl:value-of select="./tei:district[@type='comune']"/> , <xsl:value-of select="./tei:district[@type='provincia']"/>
    </li>
</xsl:template>


<xsl:template match="//tei:profileDesc/tei:correspDesc">
 <div>
  <strong>Atto di corrispondenza : </strong>
   <ul>
     <li>  Cartolina spedita da : <strong><xsl:value-of select="./*[@type='sent']/tei:persName" /></strong> da <strong><xsl:value-of select="./*[@type='sent']/tei:placeName"/></strong> il <strong><xsl:value-of select="./*[@type='sent']/tei:date"/></strong></li>
     <li>  Cartolina arrivata a : <strong><xsl:value-of select="./*[@type='received']/tei:persName"/></strong> a <strong><xsl:value-of select="./*[@type='received']/tei:placeName"/></strong></li>
    </ul>
 </div>
</xsl:template>

<xsl:template match="//tei:encodingDesc">
    <strong>Interpretazioni Editoriali : </strong>
       <ul>
        <xsl:apply-templates/>
       </ul>
</xsl:template>

<xsl:template match="//tei:interpretation/tei:p/tei:list/tei:item/tei:choice">
      <li>  <b><xsl:value-of select="./*[@type='orig']"/> : </b><xsl:value-of select="./*[@type='inter']"/></li>
</xsl:template>



<!--Applica spazi e bold e a capo-->

<xsl:template match="//tei:lb">
      <br/> <xsl:apply-templates/>
</xsl:template>

<xsl:template match="//tei:addrLine">
     <p> <xsl:apply-templates/> </p>
</xsl:template>

<xsl:template match="//*[@type='grasso']" >
    <xsl:element name="div">
    <xsl:attribute name="id">
      <xsl:value-of select="@xml:id"/>
    </xsl:attribute>
    <strong>
      <xsl:apply-templates/>
    </strong>
    </xsl:element>
</xsl:template>


<xsl:template match="//tei:facsimile">
   <xsl:variable name="index4" select="position()"/>
   <xsl:for-each select="tei:surface[@type='fimg']/tei:graphic">
     <xsl:element name="img">
       <xsl:attribute name="id">
          <xsl:value-of select="concat('postfront_' , $index4) "/>
       </xsl:attribute>
       <xsl:attribute name="src">
            <xsl:value-of select="current()/@url "/>
       </xsl:attribute>
          <xsl:apply-templates/>
    </xsl:element>
   </xsl:for-each>
</xsl:template>

<xsl:template match="//tei:surface[@type='rimg']/tei:graphic">
    <xsl:variable name="index5" select="position()"/>
    <xsl:element name="img">
    <xsl:attribute name="id">
          <xsl:value-of select="concat('postretro_', $index5)"/>
    </xsl:attribute>
    <xsl:attribute name="src">
          <xsl:value-of select="current()/@url "/>
    </xsl:attribute>
        <xsl:apply-templates/>
  </xsl:element>
</xsl:template>

</xsl:stylesheet>