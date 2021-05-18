<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:tei="http://www.tei-c.org/ns/1.0">
    <xsl:output method="xml" version="1.0" encoding="utf-8" doctype-system="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd" doctype-public="-//W3C//DTD XHTML 1.1//EN"></xsl:output>
    
    
 <!-- 

     Image Markup Tool v 1.8 Web View XSLT output file
     Palaeography exercise version (developed by Marjorie Burghart)  
     v. 1.0 January 2010

     LICENSE
     
     The contents of this file are subject to the Mozilla Public License Version
     1.1 (the "License"); you may not use this file except in compliance with
     the License. You may obtain a copy of the License at
     "http://www.mozilla.org/MPL/"
     
     Software distributed under the License is distributed on an "AS IS" basis,
     WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
     the specific language governing rights and limitations under the License.exp
     
     The Original Code is "[web_view.xsl]".
     
     The Developer of this Modification is Marjorie Burghart (http://marjorie.burghart.online.fr). 
     Copyright (C) 2010 Marjorie Burghart. All Rights Reserved.
     
     The Initial Developer of the Original Code is Martin Holmes (Victoria,
     BC, Canada, "http://www.mholmes.com/"). Copyright (C) 2006-2008 Martin Holmes
     and the University of Victoria Computing and Media Centre. The code was
     co-developed for university and personal projects, and rights are shared
     by Martin Holmes and the University of Victoria. All Rights Reserved.
     
     -->
    
    <!-- Variables which will be set by the output routine. -->
    
    <xsl:variable name="DocTitle">line 5</xsl:variable>
    <xsl:variable name="DocFileName">line1-05</xsl:variable>
    <xsl:variable name="ScaledImageWidth">800</xsl:variable>
    <xsl:variable name="ScaledImageHeight">58</xsl:variable>
    <xsl:variable name="ZoomImageWidth">3024</xsl:variable>
    <xsl:variable name="ZoomImageHeight">220</xsl:variable>
    <xsl:variable name="ImageScaleFactor">0.26455</xsl:variable>
    <xsl:variable name="ScaledImageFileName">line1-05_wv_5 wiersz.jpg</xsl:variable>
    <xsl:variable name="ZoomImageFileName">line1-05_wv_zoom_5 wiersz.jpg</xsl:variable>
    
    <!--
        xhtml document
        ============================================= 
    -->
    <xsl:template match="/">
        <xsl:element name="html">
            <xsl:attribute name="xmlns">http://www.w3.org/1999/xhtml</xsl:attribute>
            <xsl:element name="head">
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
                <xsl:element name="title">
                    <xsl:value-of select="$DocTitle"></xsl:value-of>
                </xsl:element>
                <!-- CSS stylesheet declaration -->
                <xsl:element name="link"> 
                    <xsl:attribute name="rel">stylesheet</xsl:attribute>
                    <xsl:attribute name="type">text/css</xsl:attribute>
                    <xsl:attribute name="href"><xsl:value-of select="$DocFileName"></xsl:value-of>.css</xsl:attribute>
                </xsl:element>
                          
                
                <!-- Create the stylesheet tag for the annotation area display characteristics
                    (currently colour only). -->
                <xsl:element name="style">
                    <xsl:attribute name="type">text/css</xsl:attribute>
                    <!-- Put the CSS itself inside a comment. -->
                    <xsl:comment>
                        <xsl:text>&#xD;
</xsl:text>
                        <!-- Iterate through the rendition elements. -->
                        <xsl:for-each select="//tei:tagsDecl[@xml:id='imtAnnotationCategories']/tei:rendition">
                            <xsl:text>&#xD;
</xsl:text>
                            <xsl:text>&#xD;
/*</xsl:text>
                            <xsl:value-of select="tei:label"></xsl:value-of>
                            <xsl:text>*/&#xD;
</xsl:text>
                            <xsl:text>.</xsl:text><xsl:value-of select="@xml:id"></xsl:value-of>
                            <xsl:text>&#xD;
</xsl:text>
                            <xsl:text>{</xsl:text>
                            <xsl:text>&#xD;
</xsl:text>
                            <xsl:value-of select="tei:code"></xsl:value-of>
                            <xsl:text>&#xD;
/*</xsl:text>
                            <xsl:value-of select="tei:code/@rend"></xsl:value-of>
                            <xsl:text>*/&#xD;
</xsl:text>
                            <xsl:text>}</xsl:text>
                            <xsl:text>&#xD;
</xsl:text>
                        </xsl:for-each>
                        <xsl:text>&#xD;
</xsl:text>    
                    </xsl:comment>
                </xsl:element>    


                <!-- Javascript declaration -->
                <xsl:element name="script"> 
                    <xsl:attribute name="type">text/javascript</xsl:attribute>
                    <xsl:attribute name="src"><xsl:value-of select="$DocFileName"></xsl:value-of>.js</xsl:attribute>
                    <xsl:text> </xsl:text><xsl:comment>Don't let the tag get closed!</xsl:comment><xsl:text> </xsl:text>
                </xsl:element>
                
            
                
            </xsl:element>
            
          
          
            
            
<!-- Now add the special css for annotation layer classes. -->
            
            <xsl:element name="body">
                    <xsl:attribute name="onload">Initialize()</xsl:attribute>
                
                <xsl:element name="div">
                    <xsl:attribute name="id">ImageContainer</xsl:attribute>

                    <xsl:element name="h1">
                        <xsl:attribute name="id">DocTitle</xsl:attribute>
                        <xsl:value-of select="$DocTitle"></xsl:value-of>     <br></br>
                        <span style="font-size: 60%"><xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:p/tei:msDesc/tei:msIdentifier/tei:settlement"></xsl:value-of>, <xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:p/tei:msDesc/tei:msIdentifier/tei:repository"></xsl:value-of>, <xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:p/tei:msDesc/tei:msIdentifier/tei:idno/@type"></xsl:value-of> <xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:p/tei:msDesc/tei:msIdentifier/tei:idno"></xsl:value-of></span>           <br></br>
                        <a href="../" style="font-size: 60%">back to the index</a>
                    </xsl:element>
                    

<xsl:element name="p">
            <xsl:attribute name="style">text-align: center</xsl:attribute>    
    <b>Transcription by <xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:principal"></xsl:value-of></b> 
</xsl:element>

                    <h3>Introduction</h3>
                    <xsl:element name="div">
                        <xsl:attribute name="id">auteur</xsl:attribute>
                                      
                    </xsl:element>
                    
                    <xsl:element name="div">
                        <xsl:attribute name="id">DocIntroduction</xsl:attribute>
                        <xsl:apply-templates select="//tei:teiHeader/tei:encodingDesc/tei:projectDesc/tei:ab[@n='introduction']"></xsl:apply-templates>
                    </xsl:element>
                    

                    
<!-- Now the image itself. -->
                <xsl:element name="img"> 
<!-- Use the scaled version of the image. -->
                    <xsl:attribute name="id">Image</xsl:attribute>
                    <xsl:attribute name="src"><xsl:value-of select="$ScaledImageFileName"></xsl:value-of></xsl:attribute>
                    <xsl:attribute name="width"><xsl:value-of select="$ScaledImageWidth"></xsl:value-of></xsl:attribute>
                    <xsl:attribute name="height"><xsl:value-of select="$ScaledImageHeight"></xsl:value-of></xsl:attribute>
                    <xsl:attribute name="alt"><xsl:value-of select="$DocTitle"></xsl:value-of></xsl:attribute>
                </xsl:element>  
<!-- Now the transparent boxes showing areas on the image. -->
                <xsl:for-each select="//tei:facsimile[@xml:id='imtAnnotatedImage']/tei:surface/tei:zone">
                    <xsl:variable name="CurrClass"><xsl:value-of select="@rendition"></xsl:value-of></xsl:variable>
                    <xsl:element name="div">
                        <xsl:variable name="CurrRectId"><xsl:value-of select="@xml:id"></xsl:value-of></xsl:variable>
                        <xsl:variable name="RectWidth" select="number(@lrx) - number(@ulx)"></xsl:variable>
                        <xsl:variable name="RectHeight" select="number(@lry) - number(@uly)"></xsl:variable>
                        <xsl:attribute name="id">Area_<xsl:value-of select="$CurrRectId"></xsl:value-of></xsl:attribute>
                        <xsl:attribute name="class">Area</xsl:attribute>
                        <xsl:attribute name="ondblclick">ShowAnn('<xsl:value-of select="$CurrRectId"></xsl:value-of>')</xsl:attribute>
<!-- Add an event to show the full-scale image fragment if using scale/zoom. -->
                        <xsl:if test="number($ImageScaleFactor) &lt; 1">
                            <xsl:attribute name="onclick">ShowZoom(<xsl:value-of select="@ulx"></xsl:value-of>,<xsl:value-of select="@uly"></xsl:value-of>,<xsl:value-of select="$RectWidth"></xsl:value-of>,<xsl:value-of select="$RectHeight"></xsl:value-of>); HighlightInput('<xsl:value-of select="$CurrRectId"></xsl:value-of>')</xsl:attribute>
                        </xsl:if>
                  
                        <!-- Version pour paléographie -->
                        <xsl:attribute name="onmouseover">Highlight('<xsl:value-of select="$CurrRectId"></xsl:value-of>')</xsl:attribute>
                        <xsl:attribute name="onmouseout">UnHighlight(); UnHighlightWord('MenuItem_<xsl:value-of select="$CurrRectId"></xsl:value-of>')</xsl:attribute>
                        


<!-- Calculate the scaled dimensions of the annotation area on the image. -->
                        <xsl:variable name="BoxL"><xsl:value-of select="round(@ulx * number($ImageScaleFactor))"></xsl:value-of></xsl:variable>
                        <xsl:variable name="BoxT"><xsl:value-of select="round(@uly * number($ImageScaleFactor))"></xsl:value-of></xsl:variable>
                        <xsl:variable name="BoxW"><xsl:value-of select="round($RectWidth * number($ImageScaleFactor))"></xsl:value-of></xsl:variable>
                        <xsl:variable name="BoxH"><xsl:value-of select="round($RectHeight * number($ImageScaleFactor))"></xsl:value-of></xsl:variable>
                      
<!-- Create its style tag. -->
                        <xsl:variable name="CurrStyle">
                            position: absolute;
                            left: <xsl:value-of select="$BoxL"></xsl:value-of>px;  
                            top: <xsl:value-of select="$BoxT"></xsl:value-of>px; 
                            width: <xsl:value-of select="$BoxW"></xsl:value-of>px; 
                            height: <xsl:value-of select="$BoxH"></xsl:value-of>px;
                            <!-- Add the colour setting from the tagsDecl in the header. -->
                            <xsl:value-of select="//tei:tagsDecl/tei:rendition[@xml:id=$CurrClass]/tei:code"></xsl:value-of>;
                            background-color: transparent;
                            padding: 0;
                            cursor: pointer;
                            
                    <!-- Include a font-size setting to make the non-breaking spaces take up
                    most of the box. If we don't do this, then IE will not process mouseover
                    messages for the box (except at the top left, where the nbsp is). Make the
                    text centred in the box. -->
                            font-size: <xsl:value-of select="($BoxH - 6)"></xsl:value-of>px;
                            text-align: center;
                            vertical-align: middle;
                            
                    <!-- Set it to overflow: hidden, so that we can be sure if there are too many 
                        spaces in the box, it will not cause scrollbars. -->
                            overflow: hidden;
                            
                        </xsl:variable>
                        <xsl:attribute name="style"><xsl:value-of select="normalize-space($CurrStyle)"></xsl:value-of></xsl:attribute>  
<!-- Include the string value of the head tag as a title element to give us a mouseover hint. -->
                        <xsl:attribute name="title">
                            <!--
                          <xsl:choose>
                            <xsl:when test="//tei:div[@facs = concat('#', $CurrRectId)]"><xsl:value-of select="//tei:div[@facs = $CurrRectId]/tei:head" /></xsl:when>
                            <xsl:otherwise><xsl:value-of select="//tei:div[@corresp = concat('#', $CurrRectId)]/tei:head" /></xsl:otherwise>
                          </xsl:choose>
                            -->
                          <xsl:if test="number($ImageScaleFactor) &lt; 1"> (click = zoom)</xsl:if></xsl:attribute>
                       <!-- Add a non-breaking spaces to give some real content. -->
                        <xsl:text>       </xsl:text>
                    </xsl:element>   
                </xsl:for-each>
              </xsl:element>
 
<!-- Now the actual annotation data itself (which will be hidden until called up). -->  
                <xsl:for-each select="//tei:div[@type='imtAnnotation']">
                <!-- Find out the id it's linked to, whether it happens to use @facs or @corresp to point to it. -->
                  <xsl:variable name="linkId"><xsl:choose><xsl:when test="@facs"><xsl:value-of select="translate(@facs, '#', '')"></xsl:value-of></xsl:when><xsl:otherwise><xsl:value-of select="translate(@corresp, '#', '')"></xsl:value-of></xsl:otherwise></xsl:choose></xsl:variable>
                    <xsl:variable name="linkColour"><xsl:value-of select="//tei:zone[@xml:id=$linkId]/@rendition"></xsl:value-of></xsl:variable> 
                    <xsl:variable name="Colour"><xsl:value-of select="//tei:tagsDecl/tei:rendition[@xml:id=$linkColour]/tei:code"></xsl:value-of></xsl:variable> 
                    
                        
                        <xsl:element name="div">                        
                         <xsl:attribute name="id">Ann_<xsl:value-of select="$linkId"></xsl:value-of></xsl:attribute>
                         <xsl:attribute name="class">Annotation</xsl:attribute>
                                                            
                                <xsl:element name="div">
                             <xsl:attribute name="class">AnnTitlebar</xsl:attribute>
                                    <xsl:attribute name="style">background-color: <xsl:value-of select="substring($Colour, 8)"></xsl:value-of>;<xsl:if test="substring($Colour, 8)='#ff0000' or substring($Colour, 8)='#0000ff' or substring($Colour, 8)='#000000'  or substring($Colour, 8)='#800000'"> color: #ffffff;</xsl:if></xsl:attribute>
                             <xsl:element name="div">
                                 <xsl:attribute name="class">PopupCloser</xsl:attribute>
                                 <xsl:attribute name="onclick">HideAnn('Ann_<xsl:value-of select="$linkId"></xsl:value-of>')</xsl:attribute><img alt="Close" src="close.gif"></img></xsl:element>
                             <xsl:element name="div">
                                             <xsl:attribute name="class">AnnTitle</xsl:attribute>
                                             <xsl:attribute name="onmousedown">BeginDrag(this.parentNode.parentNode, event)</xsl:attribute><xsl:apply-templates select="tei:head"></xsl:apply-templates>
                             </xsl:element>
                                </xsl:element>
                                
                         <xsl:element name="div">
                             <xsl:attribute name="class">AnnText</xsl:attribute>
                         <xsl:for-each select="tei:div/tei:*">
                             <xsl:apply-templates select="."></xsl:apply-templates>
                         </xsl:for-each>
                         </xsl:element>
                            
                    </xsl:element>
                </xsl:for-each>



                <!-- Now the actual popUp data itself (which will be hidden until called up). Copy of the annotation data above. -->  

                <xsl:for-each select="//tei:div[@type='imtAnnotation']">
                    <xsl:variable name="linkId"><xsl:choose><xsl:when test="@facs"><xsl:value-of select="translate(@facs, '#', '')"></xsl:value-of></xsl:when><xsl:otherwise><xsl:value-of select="translate(@corresp, '#', '')"></xsl:value-of></xsl:otherwise></xsl:choose></xsl:variable>
                    <xsl:variable name="linkColour"><xsl:value-of select="//tei:zone[@xml:id=$linkId]/@rendition"></xsl:value-of></xsl:variable> 
                    <xsl:variable name="Colour"><xsl:value-of select="//tei:tagsDecl/tei:rendition[@xml:id=$linkColour]/tei:code"></xsl:value-of></xsl:variable> 
                    
                    <xsl:element name="div">
                        <xsl:attribute name="id">popUp_<xsl:value-of select="$linkId"></xsl:value-of></xsl:attribute>
                        <xsl:attribute name="class">Annotation</xsl:attribute>
                        <xsl:element name="div">
                            <xsl:attribute name="class">AnnTitlebar</xsl:attribute>
                            <xsl:attribute name="style">background-color: <xsl:value-of select="substring($Colour, 7)"></xsl:value-of>;<xsl:if test="substring($Colour, 8)='#ff0000' or substring($Colour, 8)='#0000ff' or substring($Colour, 8)='#000000' "> color: #ffffff;</xsl:if></xsl:attribute>
                            <xsl:element name="div">
                                <xsl:attribute name="class">PopupCloser</xsl:attribute>
                                <xsl:attribute name="onclick">HideAnn('Ann_<xsl:value-of select="$linkId"></xsl:value-of>')</xsl:attribute><img alt="Close" src="close.gif"></img></xsl:element>
                            <xsl:element name="div">
                                <xsl:attribute name="class">AnnTitle</xsl:attribute>
                                <xsl:attribute name="onmousedown">BeginDrag(this.parentNode.parentNode, event)</xsl:attribute><xsl:apply-templates select="tei:head"></xsl:apply-templates>
                            </xsl:element>
                        </xsl:element>
                        <xsl:element name="div">
                            <xsl:attribute name="class">AnnText</xsl:attribute>
                            <xsl:for-each select="tei:div/tei:*">
                                <xsl:apply-templates select="."></xsl:apply-templates>
                            </xsl:for-each>
                        </xsl:element>
                    </xsl:element>   
                </xsl:for-each>


<!-- First the list of layers, which will be draggable and floating. -->
                <xsl:element name="div">
                    <xsl:attribute name="style">display:none;</xsl:attribute>
                    <xsl:attribute name="id">AnnMenuContainer</xsl:attribute>
<!--                     <xsl:attribute name="style">max-height: <xsl:value-of select="$ScaledImageHeight" />px</xsl:attribute> -->
                    <xsl:element name="div">
                        <xsl:attribute name="id">AnnMenuTitle</xsl:attribute>
                        <xsl:attribute name="onmousedown">BeginDrag(this.parentNode, event)</xsl:attribute>Menu
                    </xsl:element>         
                    <!-- <xsl:call-template name="BuildMenu" /> -->                                            
                </xsl:element>
                
                <!-- Add a div which is going to be used to show zoom popups -->
                <xsl:if test="number($ImageScaleFactor) &lt; 1">
                    <div id="Zoom">
                        <!--
                            <xsl:attribute name="onmousedown">BeginDrag(this, event)</xsl:attribute>
                            <xsl:attribute name="ondblclick">this.style.display = 'none';UnHighlightInput()</xsl:attribute>                                                    
                        -->
                        <xsl:attribute name="onclick">this.style.display = 'none';UnHighlightInput()</xsl:attribute>                        
                        <img>
                            <xsl:attribute name="src"><xsl:value-of select="$ZoomImageFileName"></xsl:value-of></xsl:attribute>
                            <xsl:attribute name="width"><xsl:value-of select="$ZoomImageWidth"></xsl:value-of></xsl:attribute>
                            <xsl:attribute name="height"><xsl:value-of select="$ZoomImageHeight"></xsl:value-of></xsl:attribute>
                            <xsl:attribute name="alt"><xsl:value-of select="$DocTitle"></xsl:value-of></xsl:attribute>
                            <xsl:attribute name="title">click here to close.</xsl:attribute>
                        </img>                                                
                    </div>
                </xsl:if>    


                <h3>Transcription (<a href="javascript:expMenu('docTranscriptionCases','');">show / hide</a>)</h3>
                <p class="para">(Click on the line heading to show or hide the transcription; on the image, click on a word to zoom in on it, double-click to see its transcription)</p>
                <xsl:element name="div">                       
                    <xsl:attribute name="id">docTranscriptionCases</xsl:attribute>                        
                    <xsl:call-template name="BuildTranscriptionCases"></xsl:call-template>
                </xsl:element>
                

                <h3>Solution (<a href="javascript:expMenu('docTranscriptionAuto','');">show / hide</a>)</h3>
                    <xsl:element name="div">
                        <xsl:attribute name="id">docTranscriptionAuto</xsl:attribute>                        
                        <xsl:call-template name="BuildTranscription"></xsl:call-template>
                    </xsl:element>                
                
                
                <!-- footer -->
                
                <hr></hr>
                <xsl:element name="p">
                    <xsl:attribute name="style">text-align: center</xsl:attribute>
                    <a href="http://www.tei-c.org/" target="_blank"><img src="http://www.tei-c.org/About/Badges/We-use-TEI.png" alt="We use TEI" style="border:0px"></img></a>
                      
                    <a href="http://validator.w3.org/" target="_blank"><img src="http://www.w3.org/Icons/valid-xhtml11" alt="Valid XHTML 1.1" style="border:0px" height="31" width="88"></img></a>                     
                     
                    <a href="http://jigsaw.w3.org/css-validator/check/referer" target="_blank"><img src="http://jigsaw.w3.org/css-validator/images/vcss" alt="Valid CSS 2.1" style="border:0px" height="31" width="88"></img></a>
                </xsl:element>      
                                
                
            </xsl:element>
        </xsl:element>


    </xsl:template>
   
 <!-- The template for creating the menu of categories and annotations. -->
    <xsl:template name="BuildMenu">
        <!--
        <xsl:element name="ul">
            <xsl:attribute name="id">AnnMenu</xsl:attribute>
            <xsl:for-each select="//tei:tagsDecl[@xml:id='imtAnnotationCategories']/tei:rendition[@xml:id != 'marques']">                
                <xsl:variable name="CurrCategory"><xsl:value-of select="@xml:id" /></xsl:variable>
                <xsl:if test="//tei:facsimile[@xml:id='imtAnnotatedImage']/tei:surface/tei:zone[@rendition=$CurrCategory]">
                        <xsl:element name="li">
                    <xsl:element name="span">
                        <xsl:attribute name="class">CategoryTitleClosed</xsl:attribute>
                        <xsl:attribute name="onclick">ShowCategory(this)</xsl:attribute>
                        <xsl:apply-templates select="tei:label" />
                    </xsl:element>
                    <xsl:element name="ul">
                        <xsl:attribute name="class">AnnSubmenu</xsl:attribute>
                        <xsl:for-each select="//tei:facsimile[@xml:id='imtAnnotatedImage']/tei:surface/tei:zone[@rendition=$CurrCategory]">
                            <xsl:variable name="CurrAnnId"><xsl:value-of select="@xml:id" /></xsl:variable>
                            <xsl:for-each select="//tei:div[translate(@facs, '#', '') = $CurrAnnId or translate(@corresp, '#', '') = $CurrAnnId]">                                
                                <xsl:element name="li">
                                    <xsl:attribute name="class">AnnMenuItem</xsl:attribute>
                                    <xsl:attribute name="onclick">JumpTo('<xsl:value-of select="$CurrAnnId" />')</xsl:attribute>
                                    <xsl:attribute name="onmouseover">Highlight('<xsl:value-of select="$CurrAnnId" />')</xsl:attribute>
                                    <xsl:attribute name="onmouseout">UnHighlight()</xsl:attribute>
                                    <xsl:apply-templates select="tei:head" />
                                </xsl:element>                                    
                            </xsl:for-each>
                        </xsl:for-each>
                    </xsl:element>
                </xsl:element>
                </xsl:if>
            </xsl:for-each>
        </xsl:element>
        -->
    </xsl:template>
    
    
    <xsl:template name="BuildTranscription">
        <xsl:element name="ul">
            <xsl:attribute name="id">AnnMenu</xsl:attribute>
            <xsl:for-each select="//tei:tagsDecl[@xml:id='imtAnnotationCategories']/tei:rendition[@xml:id != 'marques']">
                
                <!-- Uncomment the next line if you want to sort the categories by their label (= display name). -->
                <!--<xsl:sort select="tei:label" />-->
                <xsl:variable name="CurrCategory"><xsl:value-of select="@xml:id"></xsl:value-of></xsl:variable>
                <!-- We only want to export a category if it has annotations. -->
                <xsl:if test="//tei:facsimile[@xml:id='imtAnnotatedImage']/tei:surface/tei:zone[@rendition=$CurrCategory]">
                    <xsl:element name="li">
                        
                        <xsl:element name="span">
                            <xsl:attribute name="style">background-color: <xsl:value-of select="substring(tei:code,8)"></xsl:value-of></xsl:attribute>
                             </xsl:element>
                                                
                        <xsl:element name="span">
                            <xsl:attribute name="class">CategoryTitleClosed</xsl:attribute>
                            <xsl:attribute name="onclick">ShowCategory(this)</xsl:attribute>
                            <xsl:apply-templates select="tei:label"></xsl:apply-templates>
                        </xsl:element>
                        
                        <xsl:element name="div">
                            <xsl:attribute name="class">AnnSubmenuSolution</xsl:attribute>
                            <xsl:attribute name="style">display: none</xsl:attribute>                                                       
                            <xsl:for-each select="//tei:facsimile[@xml:id='imtAnnotatedImage']/tei:surface/tei:zone[@rendition=$CurrCategory]">
                                <xsl:variable name="CurrAnnId"><xsl:value-of select="@xml:id"></xsl:value-of></xsl:variable>
                                <xsl:for-each select="//tei:div[translate(@facs, '#', '') = $CurrAnnId or translate(@corresp, '#', '') = $CurrAnnId]">
                                    <xsl:element name="span">
                                        <xsl:attribute name="class">AnnMenuItem</xsl:attribute>
                                        <xsl:attribute name="id">MenuItem_<xsl:value-of select="$CurrAnnId"></xsl:value-of></xsl:attribute>
                                        <xsl:attribute name="onclick">JumpTo('<xsl:value-of select="$CurrAnnId"></xsl:value-of>')</xsl:attribute>
                                        <xsl:attribute name="onmouseover">Highlight('<xsl:value-of select="$CurrAnnId"></xsl:value-of>')</xsl:attribute>
                                        <xsl:attribute name="onmouseout">UnHighlight(); UnHighlightWord('MenuItem_<xsl:value-of select="$CurrAnnId"></xsl:value-of>')</xsl:attribute>
                                        <xsl:apply-templates select="tei:head"></xsl:apply-templates>
                                    </xsl:element> 
                                </xsl:for-each>
                            </xsl:for-each>
                        </xsl:element>
                        
                    </xsl:element>
                </xsl:if>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
    

    <xsl:template name="BuildTranscriptionCases">
        <xsl:element name="ul">
            <xsl:attribute name="style">display: block</xsl:attribute>
            <xsl:attribute name="id">AnnMenuCases</xsl:attribute>
            <xsl:for-each select="//tei:tagsDecl[@xml:id='imtAnnotationCategories']/tei:rendition[@xml:id != 'marques']">
               <xsl:variable name="CurrCategory"><xsl:value-of select="@xml:id"></xsl:value-of></xsl:variable>
                <xsl:if test="//tei:facsimile[@xml:id='imtAnnotatedImage']/tei:surface/tei:zone[@rendition=$CurrCategory]">
                    <xsl:element name="li">

                        <xsl:element name="span">
                            <xsl:attribute name="style">background-color: <xsl:value-of select="substring(tei:code,8)"></xsl:value-of></xsl:attribute>
                             </xsl:element>
                                                
                            <xsl:element name="span">
                                <xsl:attribute name="class">CategoryTitleClosed</xsl:attribute> 
                                <xsl:attribute name="onclick">ShowCategory(this)</xsl:attribute>
                                <xsl:attribute name="onmouseover">this.parentNode.getElementsByTagName('ul').style.display = 'block'</xsl:attribute>                               
                                <xsl:apply-templates select="tei:label"></xsl:apply-templates>                                
                                
                            </xsl:element>                            
                        
                        <xsl:element name="div">
                            <xsl:attribute name="class">AnnSubmenuCases</xsl:attribute>
                            <xsl:attribute name="style">display: block</xsl:attribute>                           
                            <xsl:for-each select="//tei:facsimile[@xml:id='imtAnnotatedImage']/tei:surface/tei:zone[@rendition=$CurrCategory]">
                                <xsl:variable name="CurrAnnId"><xsl:value-of select="@xml:id"></xsl:value-of></xsl:variable>
                                <xsl:variable name="RectWidth" select="number(@lrx) - number(@ulx)"></xsl:variable>
                                <xsl:variable name="RectHeight" select="number(@lry) - number(@uly)"></xsl:variable>
                                <xsl:variable name="RectX" select="@ulx"></xsl:variable>
                                <xsl:variable name="RectY" select="@uly"></xsl:variable>
                                
                                <xsl:for-each select="//tei:div[translate(@facs, '#', '') = $CurrAnnId or translate(@corresp, '#', '') = $CurrAnnId]">
                                                                        
                                    <xsl:element name="input">
                                        <xsl:attribute name="id">input_<xsl:value-of select="$CurrAnnId"></xsl:value-of></xsl:attribute>
                                        <xsl:attribute name="type">text</xsl:attribute>
                                        <xsl:attribute name="size"><xsl:value-of select="string-length(tei:head)"></xsl:value-of></xsl:attribute>
                                        <xsl:attribute name="onfocus">HighlightInput('<xsl:value-of select="$CurrAnnId"></xsl:value-of>'); ShowZoom(<xsl:value-of select="$RectX"></xsl:value-of>,<xsl:value-of select="$RectY"></xsl:value-of>,<xsl:value-of select="$RectWidth"></xsl:value-of>,<xsl:value-of select="$RectHeight"></xsl:value-of>)</xsl:attribute>
                                        <xsl:attribute name="onclick">HighlightInput('<xsl:value-of select="$CurrAnnId"></xsl:value-of>'); ShowZoom(<xsl:value-of select="$RectX"></xsl:value-of>,<xsl:value-of select="$RectY"></xsl:value-of>,<xsl:value-of select="$RectWidth"></xsl:value-of>,<xsl:value-of select="$RectHeight"></xsl:value-of>)</xsl:attribute>
                                        <!--     <xsl:attribute name="onmouseout">UnHighlight(); UnHighlightWord('MenuItem_<xsl:value-of select="$CurrAnnId"/>')</xsl:attribute>    -->
                                        <xsl:attribute name="onblur">style.backgroundColor=checkTranscription('<xsl:value-of select="tei:head"></xsl:value-of>', this.value); UnHighlightWord('MenuItem_<xsl:value-of select="$CurrAnnId"></xsl:value-of>'); UnHighlightInput(); CloseZoom()</xsl:attribute>
                                    </xsl:element>            
                                 
                                </xsl:for-each>
                            </xsl:for-each>
                        </xsl:element>
                    </xsl:element>
                </xsl:if>
            </xsl:for-each>
        </xsl:element>
        <br></br>
    </xsl:template>


    
 <!-- Some default handlers for common TEI elements at the paragraph level. -->
 <!-- HTML p tags are avoided in favour of div tags because of potential nesting problems. -->

    <xsl:template match="tei:ab">
        <xsl:element name="div">
            <xsl:attribute name="class">Para</xsl:attribute>
            <xsl:apply-templates></xsl:apply-templates>
        </xsl:element>
    </xsl:template>
    
    
    <!-- used to show / hide zones referred to in the introduction -->
    <xsl:template match="tei:ref">
        <xsl:element name="a">
            <xsl:attribute name="href">#</xsl:attribute>
            
            <xsl:variable name="myVar" select="@target"></xsl:variable>            
            
            <xsl:attribute name="onmouseover">
                <xsl:call-template name="split">
                    <xsl:with-param name="string">
                        <xsl:value-of select="@target"></xsl:value-of>
                    </xsl:with-param>
                    <xsl:with-param name="type">onmouseover</xsl:with-param>
                </xsl:call-template>
            </xsl:attribute>            
            
            <xsl:attribute name="onmouseout">                   
                <xsl:call-template name="split">
                    <xsl:with-param name="string">
                        <xsl:value-of select="@target"></xsl:value-of>
                    </xsl:with-param>
                    <xsl:with-param name="type">onmouseout</xsl:with-param>
                </xsl:call-template>
            </xsl:attribute> 
            <xsl:apply-templates></xsl:apply-templates>
        </xsl:element>
    </xsl:template>

    
    <xsl:template name="split">
        <xsl:param name="string"></xsl:param>
        <xsl:param name="type"></xsl:param>
        
        <xsl:choose>
            <xsl:when test="$type = 'onmouseover'">
                <xsl:choose>
                    <xsl:when test="contains($string,' ')">ShowAnn('<xsl:value-of select="substring-before($string,' ')"></xsl:value-of>'); <xsl:call-template name="split">
                        <xsl:with-param name="string">
                            <xsl:value-of select="substring-after($string,' ')"></xsl:value-of>
                        </xsl:with-param>
                        <xsl:with-param name="type">onmouseover</xsl:with-param>
                    </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>ShowAnn('<xsl:value-of select="$string"></xsl:value-of>')</xsl:otherwise>
                </xsl:choose>            
            </xsl:when>
            <xsl:when test="$type = 'onmouseout'">
                <xsl:choose>
                    <xsl:when test="contains($string,' ')">HideAnn('Ann_<xsl:value-of select="substring-before($string,' ')"></xsl:value-of>'); <xsl:call-template name="split">
                        <xsl:with-param name="string">
                            <xsl:value-of select="substring-after($string,' ')"></xsl:value-of>
                        </xsl:with-param>
                        <xsl:with-param name="type">onmouseout</xsl:with-param>
                    </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>HideAnn('Ann_<xsl:value-of select="$string"></xsl:value-of>')</xsl:otherwise>
                </xsl:choose>            
            </xsl:when>                    
        </xsl:choose>
        

    </xsl:template>


      
    <xsl:template match="tei:p">
        <xsl:element name="div">
            <xsl:attribute name="class">Para</xsl:attribute>
            <xsl:apply-templates></xsl:apply-templates>
        </xsl:element>
    </xsl:template>
    

    <xsl:template match="tei:lb">
        <br></br>
        <xsl:if test="@n">
<span class="lineNumber">[l. <xsl:value-of select="@n"></xsl:value-of>]</span>                      
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="tei:graphic">
    <xsl:if test="count(preceding-sibling::*)=0">
	<xsl:element name="br"></xsl:element>
    </xsl:if>
        <xsl:element name="a">
        <xsl:attribute name="target">_blank</xsl:attribute>
        <xsl:attribute name="href">./album_Auvergne/slide.php?rep=<xsl:value-of select="//tei:tagUsage[@gi='graphic']/tei:ref[@xml:id='categoryId']/@target"></xsl:value-of>&amp;filename=<xsl:value-of select="@url"></xsl:value-of>&amp;page=1&amp;resol=</xsl:attribute>
        <xsl:element name="img">
            <xsl:attribute name="src">./album_Auvergne/<xsl:value-of select="//tei:tagUsage[@gi='graphic']/tei:ref[@xml:id='categoryId']/@target"></xsl:value-of>/_miniatures/min_<xsl:value-of select="@url"></xsl:value-of></xsl:attribute>		  
        </xsl:element>
    </xsl:element>

    </xsl:template>
    
    
    <xsl:template match="tei:hi">
        <xsl:element name="span">
            <xsl:choose>
                 <xsl:when test="@rend='underline'">
                     <xsl:attribute name="style">text-decoration: underline;</xsl:attribute>
                 </xsl:when>   
                <xsl:when test="@rend='italic' or @rend='italics'">
                    <xsl:attribute name="style">font-style: italic;</xsl:attribute>
                </xsl:when>  
                <xsl:when test="@rend='bold'">
                    <xsl:attribute name="style">font-weight: bold;</xsl:attribute>
                </xsl:when> 
                <xsl:when test="@rend='sup'">
                    <xsl:attribute name="style">position: relative; top: -0.5em; font-size: 80%;</xsl:attribute>
                </xsl:when> 
            </xsl:choose>
            <xsl:apply-templates></xsl:apply-templates>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:lg">
        <xsl:element name="div">
            <xsl:attribute name="class">Stanza</xsl:attribute>
            <xsl:apply-templates></xsl:apply-templates>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:lg/tei:l">
        <xsl:apply-templates></xsl:apply-templates>
        <xsl:element name="br"></xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:note">
        <xsl:apply-templates></xsl:apply-templates>
    </xsl:template>
    
    <xsl:template match="tei:emph">
        <em><xsl:apply-templates></xsl:apply-templates></em>
    </xsl:template>
    
    <xsl:template match="tei:list">
        <xsl:choose>
            <xsl:when test="@type='ordered'">
                <ul><xsl:apply-templates></xsl:apply-templates></ul>
            </xsl:when>
            <xsl:otherwise>
                <ol><xsl:apply-templates></xsl:apply-templates></ol>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="tei:list/tei:item">
        <li><xsl:apply-templates></xsl:apply-templates></li>
    </xsl:template>
    
<!-- Creation of a series of links from a ref tag with space-delimited uris in its target attribute. -->
    <xsl:template match="tei:note[@type='link']/tei:ref">
        <xsl:element name="span">
            <xsl:attribute name="id"><xsl:value-of select="@xml:id"></xsl:value-of></xsl:attribute>
            *
        </xsl:element>
        <xsl:apply-templates></xsl:apply-templates>
        <xsl:call-template name="RecurseTargets">
            <xsl:with-param name="Targets"><xsl:value-of select="normalize-space(@target)"></xsl:value-of></xsl:with-param>
            <xsl:with-param name="Pos">1</xsl:with-param>
        </xsl:call-template>
    </xsl:template> 
    
    <xsl:template name="RecurseTargets">
        <xsl:param name="Targets"></xsl:param>
        <xsl:param name="Pos"></xsl:param>
        [<xsl:element name="a">
            <xsl:choose>
                <xsl:when test="not(contains($Targets, ' '))">
                    <xsl:attribute name="href"><xsl:call-template name="Ext_xml_to_htm"><xsl:with-param name="InURI"><xsl:value-of select="$Targets"></xsl:value-of></xsl:with-param></xsl:call-template></xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="href"><xsl:call-template name="Ext_xml_to_htm"><xsl:with-param name="InURI"><xsl:value-of select="substring-before($Targets, ' ')"></xsl:value-of></xsl:with-param></xsl:call-template></xsl:attribute>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$Pos"></xsl:value-of>
        </xsl:element>]
        <xsl:if test="string-length(normalize-space(substring-after($Targets, ' '))) &gt; 0">
            <xsl:call-template name="RecurseTargets">
                <xsl:with-param name="Targets"><xsl:value-of select="normalize-space(substring-after($Targets, ' '))"></xsl:value-of></xsl:with-param>
                <xsl:with-param name="Pos"><xsl:value-of select="$Pos+1"></xsl:value-of></xsl:with-param>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    <xsl:template name="Ext_xml_to_htm"><xsl:param name="InURI"></xsl:param><xsl:value-of select="concat(substring-before($InURI, '.xml'), '.htm', substring-after($InURI, '.xml'))"></xsl:value-of></xsl:template>
    
 <!-- Handling of quotations: inline unless longer than 150 characters. -->
    <xsl:template match="tei:cit/tei:quote">
        <xsl:choose>
            <xsl:when test="string-length(.) &gt; 150">
                <xsl:element name="div">
                    <xsl:attribute name="class">BlockCit</xsl:attribute>
                    <xsl:apply-templates></xsl:apply-templates>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                &quot;<xsl:apply-templates></xsl:apply-templates>&quot; 
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
<!-- Bibls appear differently depending on whether their quote is block or inline. -->
    <xsl:template match="tei:cit/tei:bibl">
        <xsl:choose>
            <xsl:when test="string-length(preceding-sibling::tei:quote) &gt; 150">
                <xsl:element name="div">
                    <xsl:attribute name="class">BlockCitBibl</xsl:attribute>
                    (<xsl:apply-templates></xsl:apply-templates>)
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                (<xsl:apply-templates></xsl:apply-templates>)
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="tei:cit">
        <xsl:apply-templates></xsl:apply-templates>
    </xsl:template>

</xsl:stylesheet>