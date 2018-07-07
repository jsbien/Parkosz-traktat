/*
     Image Markup Tool v 1.8 Web View javascript functions file
     Paleography exercise version (developed by Marjorie Burghart)  
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
     
*/


//We need to know if this is the dreadful IE6 or below -- it can't handle key CSS features.

var isOldIE = ((navigator.userAgent.indexOf('MSIE 6') > -1) || (navigator.userAgent.indexOf('MSIE 5') > -1));
var isIE = (navigator.userAgent.indexOf('MSIE') > -1);

/*These three arrays are for convenience; they allow us to unhighlight things quickly. */

var Areas = new Array();
var Anns = new Array();
var Inputs = new Array();
var AnnMenuItems = new Array();

var HeightOffset;
var ImgLeft;
var ImgWidth;
var ImgRight;
var ImgBottom;
var ImgHeight;
var ViewWidth;
var WindowHeight;
var Initializing = true;

function Initialize(){
/* Populate three handy lists with pointers to the menu items, areas and Anns. */
    HeightOffset = parseInt(document.getElementById('Image').offsetTop);
    ImgLeft = parseInt(document.getElementById('Image').offsetLeft);
    ImgWidth = parseInt(document.getElementById('Image').offsetWidth);
    ImgRight = ImgLeft + ImgWidth;
    ImgHeight = parseInt(document.getElementById('Image').offsetHeight);
    ImgBottom = HeightOffset + ImgHeight;
    
    var L = document.getElementById('AnnMenuContainer');
    ViewWidth = parseInt(L.parentNode.offsetWidth);
    
    var NList = document.getElementsByTagName('div');
    for (var i=0; i<NList.length; i++){
        if (NList[i].className == 'Area'){
            NList[i].style.left = (parseInt(NList[i].style.left) + ImgLeft) + 'px';
            NList[i].style.top = (parseInt(NList[i].style.top) + HeightOffset) + 'px';
//Remove non-breaking spaces which were only added for the accursed IE.
            if (isIE == false){
                NList[i].innerHTML = '';
            }
            Areas.push(NList[i]);
        }
        else{
            if (NList[i].className == 'Annotation'){
                Anns.push(NList[i]);
            }
        }
    }
    NList = document.getElementsByTagName('li');
    for (i=0; i<NList.length; i++){
         if (NList[i].className == 'AnnMenuItem'){
             AnnMenuItems.push(NList[i]);
         }
    }


    NList = document.getElementsByTagName('input');
    for (i=0; i<NList.length; i++){
             Inputs.push(NList[i]);
    }


//Position the Annotation Menu container

    L.style.top = HeightOffset + 'px';
    SetAnnMenuHeight();
   
    if (parseInt(L.offsetWidth) > (ViewWidth / 3)){
        L.style.width = '30%'; //Hack for IE, which doesn't support CSS max-width 
    }
    var LLeft = Math.min(ImgRight,  (ViewWidth - parseInt(L.offsetWidth)));
    L.style.left = LLeft + 'px';

    if (isOldIE == false){
        L.style.position = 'fixed';
    }
    


//Now hide all the submenus
    NList = document.getElementsByTagName('ul');
    for (i=0; i<NList.length; i++){
        if (NList[i].className == 'AnnSubmenu'){
            NList[i].style.display = 'none';
        }
    }
    
//Now check to see if there's a hash in the url, and select that area if there is.
    var DocHash = document.location.hash;
    var Item = null;
    var ItemId = '';
    if (DocHash.length > 1){
//Find the item id by stripping off the initial #Area_ or # if not Area_
        if (DocHash.substring(0, 6) == '#Area_'){
            ItemId = DocHash.substring(6, DocHash.length);
            Item = document.getElementById(ItemId);
//If it's an annotation, show it:
            if (Item.className == 'Annotation'){
                ShowAnn(ItemId);
            }
        }
        else{
            ItemId = DocHash.substring(1, DocHash.length);
            Item = document.getElementById(ItemId);
            if (Item != null){
//Try to find a container which is an annotation div
                while ((Item.className != 'Annotation') && (Item.nodeName.toLowerCase() != 'body')){
                    Item = Item.parentNode;
                }
                if (Item.className == 'Annotation'){
//we have an annotation; we need to find the corresponding area and show it.
//Strip off the first four characters (Ann_).
                    var TheId = Item.getAttribute('id');
                    ShowAnn(TheId.substring(4, TheId.length));      
                }
            }
        }
    }
    
//Attach the onresize event (if the IE version is not 6, where it causes endless loops).
    if (isOldIE == false){
        window.onresize = SetAnnMenuHeight;
    }    
    
    Initializing = false;
}

function SetAnnMenuHeight(){
/* Set the maximum height of the menu, based on the available window height, so that 
    it can scroll appropriately when required. */
    
    if (window.innerHeight){
        WindowHeight = parseInt(window.innerHeight);
    }
    else{
        if (document.documentElement.clientHeight){
            WindowHeight = parseInt(document.documentElement.clientHeight);
        }
        else{
            WindowHeight = 400; //have to fix it at something.
        }
    }
    var AnnMenuTitleHeight = parseInt(document.getElementById('AnnMenuTitle').offsetHeight);
    var M = document.getElementById('AnnMenu');
    M.style.maxHeight = (WindowHeight - (HeightOffset + AnnMenuTitleHeight)) + 'px';
}

function UnHighlight(){
/* Hide all area borders on the image, and unhighlight area list items, assuming they aren't the currently selected item.  */
     for (var i=0; i<Areas.length; i++){
         if (Areas[i] != null){
             if (Areas[i].className != 'SelectedArea'){
                 Areas[i].className = 'Area';
            }
         }
      }
      for (var i=0; i<AnnMenuItems.length; i++){
         if (AnnMenuItems[i] != null) {
             if (AnnMenuItems[i].className == 'SelectedAnnMenuItem'){
                 AnnMenuItems[i].className = 'AnnMenuItem';
            }
         }
     }
}

function CloseZoom(){

    var Z = document.getElementById('Zoom');
    if (Z != null){
		Z.style.display = 'none';
	}
	Deselect();
}


function UnHighlightInput(){
      for (var i=0; i<Inputs.length; i++){
         if (Inputs[i] != null) {
             if (Inputs[i].className == 'selection'){
                 Inputs[i].className = 'none';
            }
         }
     }
}


function Deselect(){
    if (Initializing == true){return;}
/* Deselect the currently-selected elements  */
     var c;
     for (var i=0; i<Areas.length; i++){
         if (Areas[i] != null){
             Areas[i].className = 'Area';
         }
     }
     for (i=0; i<AnnMenuItems.length; i++){
         if (AnnMenuItems[i] != null){
             AnnMenuItems[i].className = 'AnnMenuItem';
         }
     }
     for (i=0; i<Anns.length; i++){
         if (Anns[i] != null){
             Anns[i].style.display = 'none';
         }
     }
}

function HighlightInput(ItemId) {
// highlights the input text field corresponding to this zone

// first things first: clear all
UnHighlightInput();
Deselect();


    var TheArea = document.getElementById('Area_' + ItemId);
    if (TheArea != null){
        TheArea.className = 'SelectedArea';
        if (parseInt(TheArea.style.top) < GetScrollTop()){
            window.scrollBy(0, (parseInt(TheArea.style.top) - GetScrollTop()));
        } 
        var AreaBottom = parseInt(TheArea.style.top) + parseInt(TheArea.style.height);
        if ((GetScrollTop() + GetViewportHeight()) < AreaBottom){
            window.scrollTo(0, parseInt(TheArea.style.top));
        } 
    }



var TheInput = document.getElementById('input_' + ItemId);
    if (TheInput != null){
		TheInput.className = 'selection';
		TheInput.focus();
	}
}

function Highlight(ItemId){
    if (Initializing == true){return;}
    UnHighlight();

    var El = document.getElementById('Area_' + ItemId);
    if (El != null){
        if (El.className != 'SelectedArea'){
            El.className = 'HighlightedArea';
        }
    }
    
    El = document.getElementById('MenuItem_' + ItemId);
    if (El != null){
        if (El.className != 'SelectedAnnMenuItem'){
            El.className = 'HighlightedAnnMenuItem';
/* The following lines can be uncommented if you want to make the 
menu expand itself automatically to reveal hidden items when their 
counterpart areas in the image are moused-over. */
//            if (El.parentNode.style.display != 'block'){
//                El.parentNode.style.display = 'block';
//            }
        }
    }

}

function ShowCategory(El){
    if (Initializing == true){return;}
    var AnnList = El.parentNode.getElementsByTagName('div');
    if (AnnList.length > 0){

// insertion: to highlight all the annotation of the current category (as if there was a mouseOver event on each)
/*
var children = El.parentNode.getElementsByTagName("li");
		  var courant = '';
for (i=0; i<children.length ; i++){
			courant = children[i].id.substr(9);
			HighlightClass(courant);
} 
*/
// fin d'insertion

        if (AnnList[0].style.display != 'block'){
            AnnList[0].style.display = 'block';
        }
        else{
            AnnList[0].style.display = 'none';
        }
    }  
}

function JumpTo(ItemId){
    ShowAnn(ItemId);
//The following line commented out to stop unnecessary jumping around. It removes the option 
//of bookmarking a specific annotation, though :-(
//    document.location.hash='Area_' + ItemId;

//Now we need to scroll the annotation into view:

/* For dismally crappy old IE6 which doesn't support position: fixed,
move the menu so it doesn't scroll out of view. */
    if (isOldIE == true){
        document.getElementById('AnnMenuContainer').style.top = (HeightOffset + GetScrollTop()) + 'px';
    }
}

function ShowAnn(ItemId){

    var TheArea = document.getElementById('Area_' + ItemId);
    if (TheArea != null){
        TheArea.className = 'SelectedArea';
        if (parseInt(TheArea.style.top) < GetScrollTop()){
            window.scrollBy(0, (parseInt(TheArea.style.top) - GetScrollTop()));
        } 
        var AreaBottom = parseInt(TheArea.style.top) + parseInt(TheArea.style.height);
        if ((GetScrollTop() + GetViewportHeight()) < AreaBottom){
            window.scrollTo(0, parseInt(TheArea.style.top));
        } 
    }
    
    var TheMenuItem = document.getElementById('MenuItem_' + ItemId);
    if (TheMenuItem != null){
// commented for the paleography drills
//        if (TheMenuItem.parentNode.style.display != 'block'){
//            TheMenuItem.parentNode.style.display = 'block';
//        }
       TheMenuItem.className = 'SelectedAnnMenuItem';
    }
    
    var TheAnnotation = document.getElementById('Ann_' + ItemId);
//Position the Ann div (try to keep it on the image itself)
    if (TheAnnotation != null){

//Otherwise, figure out the best place to show it:
//First, set it to absolute positioning
        TheAnnotation.style.position = 'absolute';
	
//Horizontal position
        var ALeft = parseInt(TheArea.style.left);

//Show the Ann so we can position it afterwards
        TheAnnotation.style.left = ALeft + 'px';
        TheAnnotation.style.display = 'block';
        if (ALeft + parseInt(TheAnnotation.offsetWidth) > ImgRight){
            ALeft = ImgRight - parseInt(TheAnnotation.offsetWidth);
        }
        TheAnnotation.style.left = ALeft + 'px';
//Vertical position
        var ATop = parseInt(TheArea.style.top) + parseInt(TheArea.offsetHeight);
        if (ATop + parseInt(TheAnnotation.offsetHeight) > ImgBottom){
            ATop = parseInt(TheArea.style.top) - parseInt(TheAnnotation.offsetHeight);
        }
        TheAnnotation.style.top = ATop  + 'px';
//Handle the problem of disappearing off the top
        if (parseInt(TheAnnotation.offsetTop) < HeightOffset){
            TheAnnotation.style.top = HeightOffset + 'px';
            TheAnnotation.style.left = '0px';
        }
    }
}




function HideAnn(AnnId){
	Deselection(AnnId);
    var El = document.getElementById(AnnId);
    if (El != null){
	El.style.display = 'none';
	El.style.position = 'absolute';
    }
    DroppedX = -1;
    DroppedY = -1;
}

var DeltaX;
var DeltaY;
var DraggedEl = null;
var DroppedX = -1;
var DroppedY = -1;

function BeginDrag(El, e){
    if (!e){e = window.event;}
    var x = parseInt(El.style.left);
    var y = parseInt(El.style.top);
    DeltaX = e.clientX - x;
    DeltaY = e.clientY - y;
    DraggedEl = El;
    if (document.addEventListener){
        document.addEventListener('mousemove', MouseMoveHandler, true);
        document.addEventListener('mouseup', MouseUpHandler, true);
    }
    else{
        document.attachEvent('onmousemove', MouseMoveHandler);
        document.attachEvent('onmouseup', MouseUpHandler);
    }
    if (e.stopPropagation){e.stopPropagation();}else{e.cancelBubble = true;}
    if (e.preventDefault){e.preventDefault();}else{e.returnValue = false;}
}

function MouseMoveHandler(e){
    if (!e){e = window.event;}
    DraggedEl.style.left = (e.clientX - DeltaX) + 'px';
    DraggedEl.style.top = (e.clientY - DeltaY) + 'px';
    if (e.stopPropagation){e.stopPropagation();}else{e.cancelBubble = true;}
}

function MouseUpHandler(e){
    if (document.removeEventListener){
        document.removeEventListener('mouseup', MouseUpHandler, true);
        document.removeEventListener('mousemove', MouseMoveHandler, true);
    }
    else{
        document.detachEvent('onmouseup', MouseUpHandler);
        document.detachEvent('onmousemove', MouseMoveHandler);
    }
    if (!e){e = window.event;}
    if (e.stopPropagation){e.stopPropagation();}else{e.cancelBubble = true;}
    if (DraggedEl != document.getElementById('AnnMenuContainer')){
        DroppedX = parseInt(DraggedEl.style.left);
        DroppedY = parseInt(DraggedEl.style.top);
        if (isOldIE == false){
            DroppedX = DroppedX - GetScrollLeft();
            DroppedY = DroppedY - GetScrollTop();
/*If the user moved the annotation, we should conclude that he/she wants it to be 
in a fixed location, perhaps off to the side of the graphic. If that's the case, then 
we need to set it to position: fixed, then convert its location relative to the scroll 
offset. */
//        DraggedEl.style.position = 'absolute';
            DraggedEl.style.left = DroppedX + 'px';
            DraggedEl.style.top = DroppedY + 'px';
            DraggedEl.style.position = 'fixed';
        }
    }
    DraggedEl = null;
}

//Utility function for getting the vertical scroll offset for a scrolling document
function GetScrollTop(){
	if (document.documentElement && document.documentElement.scrollTop){
		return document.documentElement.scrollTop;
	}
	else{
		if (document.body){
 			return document.body.scrollTop;
		}
		else{
			return window.pageYOffset;
		}
	}
}
//Utility function for getting the horizontal scroll offset for a scrolling document
function GetScrollLeft(){
	if (document.documentElement && document.documentElement.scrollLeft){
		return document.documentElement.scrollLeft;
	}
	else{
		if (document.body){
 			return document.body.scrollLeft;
		}
		else{
			return window.pageXOffset;
		}
	}
}

//Utility function for finding the height of the browser viewport
function GetViewportHeight(){
    var Result = 400; //default just in case
    if (window.innerHeight){
        Result = window.innerHeight;
    }
    else{
        Result = document.getElementsByTagName('body')[0].clientHeight;
    }
    return Result;
}

//Zooming (showing a large portion of the original image)
function ShowZoom(X, Y, W, H){
    var Z = document.getElementById('Zoom');
    if (Z != null){
        Z.style.width = (W + 6) + 'px';
        Z.style.height = (H + 6) + 'px';
        if (Z.getElementsByTagName('img').length > 0){
            var Img = Z.getElementsByTagName('img')[0];
            Img.style.left = (X * -1) + 'px';
            Img.style.top = (Y * -1) + 'px';
        }
			Z.style.top = (GetScrollTop() + 30) + 'px';
			Z.style.left ='30px';
        Z.style.display = 'block';
    }
}


function Deselection(elem){
    if (Initializing == true){return;}
/* Deselect the currently-selected elements  */

var item = elem.substr(4);

var myArea = document.getElementById('Area_' + item);
if (myArea) {
	myArea.className = 'Area';
}
var myAnnMenuItem = document.getElementById('MenuItem_' + item);
if (myAnnMenuItem) {
	myAnnMenuItem.className = 'AnnMenuItem';
}
var myAnn = document.getElementById('Ann_' + item);
if (myAnn) {
	// myAnn.className = 'none';
}

}

function UnHighlightWord(elem){
var myAnnMenuItem = document.getElementById(elem);
if (myAnnMenuItem) {
	myAnnMenuItem.className = 'AnnMenuItem';
}

}


function HighlightClass(ItemId){
    if (Initializing == true){return;}
//    UnHighlight();
    
    var El = document.getElementById('Area_' + ItemId);
    if (El != null){
        if (El.className != 'SelectedArea'){
            El.className = 'HighlightedArea';
        }
    }
    
    El = document.getElementById('MenuItem_' + ItemId);
    if (El != null){
        if (El.className != 'SelectedAnnMenuItem'){
            El.className = 'HighlightedAnnMenuItem';
        }
    }
}



function getElementsByClass(theClass) {
    var allPageTags = new Array();

    //Populate the array with all the page tags
    allPageTags=document.getElementsByTagName("*");
    var Elements = new Array();

    //Cycle through the tags
    var n = 0;
    for (i=0; i<allPageTags.length; i++) {
        //Pick out the tags with our class name
        if (allPageTags[i].className==theClass) {
            Elements[n] = allPageTags[i];
            n++;
        }
    }

    return Elements;
}


function expMenu(id) {
  var itm = null;
  if (document.getElementById) {
 itm = document.getElementById(id);
  } else if (document.getElementsByClass(id)) {
  var tags = document.getElementsByClass(id);	
	for (var i = 0; i < tags.length; i++) {
	 if (tags[i].style.display == "none") {
	  tags[i].style.display = "";
	 } else {
	  tags[i].style.display = "none";
	 }
	}
  }  else if (document.all){
 itm = document.all[id];
  } else if (document.layers){
 itm = document.layers[id];
  }

  if (!itm) {
   // do nothing
  }
  else if (itm.style) {
 if (itm.style.display == "none") { itm.style.display = ""; }
 else { itm.style.display = "none"; }
  }
  else { itm.visibility = "show"; }

}




function checkTranscription(solution, proposal) {



var trimmed = proposal.replace(/^\s+|\s+$/g, '');

// all v => u; all j => i in the solution
	solution =  solution.replace(/v/i, 'u');
	solution = solution.replace(/j/i, 'i');

// a more "tolerant" option: if the student types in the letter he reads
var tolerant = solution.replace(/\[[^\]]*\]/gi, '');
var tolerant = tolerant.replace(/\([^\)]*\)/gi, '');
// then we can strip the [] signs
	stripped = solution.replace(/[\[\]\.]+/g,'');
	stripped = stripped.replace(/[\(\)\.]+/g,'');

// strip the potential "end of line" hyphen from the stripped solution, not from the proposal (if they enter it well, ok, otherwise it's a mistake)
/* trimmed = trimmed.replace(/-/i, ''); */
stripped = stripped.replace(/-/i, '');

// let's also delete all the potential full stops / periods at the end of the proposal
trimmed = trimmed.replace(/\.$/i, '');

// all v => u; all j => i in the proposal
trimmed = trimmed.replace(/v/i, 'u');
trimmed = trimmed.replace(/j/i, 'i');

// in var result, we put the colour code for the input field
	var result = "";

	if (trimmed == '') {
		result = '#FFFFFF';
	}
	else if (trimmed.toLowerCase() == solution.toLowerCase())  {
		result = '#99FF99';
	}
	else if (trimmed.toLowerCase() == stripped.toLowerCase()) {
		result = '#99FF99';
	}
	else if (trimmed.toLowerCase() == tolerant.toLowerCase()) {
		result = '#FFCC00';
	}
	else {
		result = '#FF9999';
	}

	return result;

}




