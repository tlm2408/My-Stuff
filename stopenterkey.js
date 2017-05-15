function stopRKey(evt) {
   var evt = (evt) ? evt : ((event) ? event : null);
   var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null);
   if ((evt.keyCode == 13) && (node.type=="text")) {return false;}
   if ((evt.keyCode == 13) && (node.type=="radio")) {return false;}
   if ((evt.keyCode == 13) && (node.type=="checkbox")) {return false;}
   if ((evt.keyCode == 13) && (node.type=="textarea")) {return false;}
   if ((evt.keyCode == 13) && (node.type=="dropdown")) {return false;}
}
document.onkeypress = stopRKey; 