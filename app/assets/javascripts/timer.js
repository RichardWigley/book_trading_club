//
//  slowHide
//    - slide toggle away after a period of time has passed
//    - used on flash messages as a delays before removal
//
function slowHide( jQuery ) {
  setTimeout(function () { $('.js-slow-time').slideToggle('slow'); }, 5000);
}
$( document ).ready( slowHide );
