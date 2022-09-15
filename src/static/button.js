var today = new Date();
var date = today.getDate()+'-'+(today.getMonth()+1)+'-'+today.getFullYear();
//var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
//var dateTime = time+' '+date;
var dateTime = date;

document.getElementById("date").innerHTML = dateTime;

//Dropdown menu	
jQuery(function($) {
$('.btn-group').hover(function() {
$(this).find('.dropdown-menu').first().stop(true, true).delay(250).slideDown();
}, function() {
$(this).find('.dropdown-menu').first().stop(true, true).delay(500).slideUp();
});});
// ---------Responsive-navbar-active-animation-----------
function test(){
  var tabsNewAnim = $('#navbarSupportedContent');
  var selectorNewAnim = $('#navbarSupportedContent').find('li').length;
  var activeItemNewAnim = tabsNewAnim.find('.active');
  var activeWidthNewAnimHeight = activeItemNewAnim.innerHeight();
  var activeWidthNewAnimWidth = activeItemNewAnim.innerWidth();
  var itemPosNewAnimTop = activeItemNewAnim.position();
  var itemPosNewAnimLeft = activeItemNewAnim.position();
  $(".hori-selector").css({
	"top":itemPosNewAnimTop.top + "px", 
	"left":itemPosNewAnimLeft.left + "px",
	"height": activeWidthNewAnimHeight + "px",
	"width": activeWidthNewAnimWidth + "px"
  });
  $("#navbarSupportedContent").on("click","li",function(e){
	$('#navbarSupportedContent ul li').removeClass("active");
	$(this).addClass('active');
	var activeWidthNewAnimHeight = $(this).innerHeight();
	var activeWidthNewAnimWidth = $(this).innerWidth();
	var itemPosNewAnimTop = $(this).position();
	var itemPosNewAnimLeft = $(this).position();
	$(".hori-selector").css({
	  "top":itemPosNewAnimTop.top + "px", 
	  "left":itemPosNewAnimLeft.left + "px",
	  "height": activeWidthNewAnimHeight + "px",
	  "width": activeWidthNewAnimWidth + "px"
	});
  });
}
$(document).ready(function(){
  setTimeout(function(){ test(); });
});
$(window).on('resize', function(){
  setTimeout(function(){ test(); }, 500);
});
$(".navbar-toggler").click(function(){
  setTimeout(function(){ test(); });
});

$(document).ready(function() {
	$(".input-toogle").click(function() {
	  var input = jQuery(this).find("input");
	  input.prop("checked", !input.prop("checked"));
	});
});

$(document).ready(function() {
	$(".input-toogle1").click(function() {
	  var input = jQuery(this).find("input1");
	  input.prop("checked", !input.prop("checked"));
	});
});  
$(document).ready(function() {
	$(".input-toogle4").click(function() {
	  var input = jQuery(this).find("input4");
	  input.prop("checked", !input.prop("checked"));
	});
});
$(document).ready(function() {
	$(".input-toogle3").click(function() {
	  var input = jQuery(this).find("input3");
	  input.prop("checked", !input.prop("checked"));
	});
});
$(document).ready(function() {
  $('.input-toogle').click(function() {
   var b1_status = $('.b1_status').text();
   $.ajax({
	url: "/b1",
	type: "get",
	 data: {b1_status: b1_status},
	 success: function(response) {
	  $(".b1_status").html(response);
	 },
	 error: function(xhr) {
	  //Do Something to handle error
	 }
   });
  });
});

$(document).ready(function() {
  $('.input-toogle1').click(function() {
   var b2_status = $('.b2_status').text();
   $.ajax({
	url: "/b2",
	type: "get",
	 data: {b2_status: b2_status},
	 success: function(response) {
	  $(".b2_status").html(response);
	 },
	 error: function(xhr) {
	  //Do Something to handle error
	 }
   });
  });
});
$(document).ready(function() {
  $('.input-toogle3').click(function() {
   var b3_status = $('.b3_status').text();
   $.ajax({
	url: "/b3",
	type: "get",
	 data: {b3_status: b3_status},
	 success: function(response) {
	  $(".b3_status").html(response);
	 },
	 error: function(xhr) {
	  //Do Something to handle error
	 }
   });
  });
});
$(document).ready(function() {
  $('.input-toogle4').click(function() {
   var b4_status = $('.b4_status').text();
   $.ajax({
	url: "/b4",
	type: "get",
	 data: {b4_status: b4_status},
	 success: function(response) {
	  $(".b2_status").html(response);
	 },
	 error: function(xhr) {
	  //Do Something to handle error
	 }
   });
  });
});

// Get the modal
var modal = document.getElementById("chatbox");

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks on the button, open the modal
btn.onclick = function() {
  modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
	modal.style.display = "none";
  }
} 
			