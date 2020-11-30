import $ from 'jquery';
// /* When the user clicks on the button,
// toggle between hiding and showing the dropdown content
// function initDropdown() {
//   document.getElementById("myDropdown").classList.toggle("show");
// }

// // Close the dropdown menu if the user clicks outside of it
// window.onclick = function(event) {
//   if (!event.target.matches('.dropbtn')) {
//     var dropdowns = document.getElementsByClassName("dropdown-content");
//     var i;
//     for (i = 0; i < dropdowns.length; i++) {
//       var openDropdown = dropdowns[i];
//       if (openDropdown.classList.contains('show')) {
//         openDropdown.classList.remove('show');
//       }
//     }
//   }
// }



const initDropdown = () => {
  if(document.getElementById("myDropdown")){
    const dropdownBtn = document.getElementById("dropbtn")
    dropdownBtn.addEventListener("click", function (){
      document.getElementById("myDropdown").classList.toggle("show");
      console.log(document.getElementById("myDropdown").classList)
    })
  };
  window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {
    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
        };
      };
    };
  };
};

export { initDropdown };
