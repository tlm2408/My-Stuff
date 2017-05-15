//
//   Add focus styling to the parent (LI) element of the radio button receiving focus
//
function parentFocus( event ) {
  // Get event object  if using Internet Explorer
  var e = event || window.event;
  
  // Check the object for W3C DOM event object, if not use IE event object to update the class of the parent element
  if( e.target )
    e.target.parentNode.className = "focus";
  else
    e.srcElement.parentNode.className = "focus";
  
}

//
//   Remove focus styling from the parent (LI) element of the radio button receiving focus
//
function parentBlur( event ) {
  // Get event object  if using Internet Explorer
  var e = event || window.event;
  
  var node;
  
  // Check the object for W3C DOM event object, if not use IE event object to update the class of the parent element
  if( e.target )
    e.target.parentNode.className = "";
  else
    e.srcElement.parentNode.className = "";

}