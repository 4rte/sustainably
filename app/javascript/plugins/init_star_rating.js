

import "jquery-bar-rating";
import $ from 'jquery'; // <-- if you're NOT using a Le Wagon template (cf jQuery section)

const initStarRating = () => {
  $('#review_rating').barrating({
    theme: 'css-stars'
  });
};


const displayStarRating = () => {
  var ratingValue = document.getElementsByClassName("dropdown-content"), rounded = (ratingValue | 0);
  var decimal = ratingValue - rounded;

  for (var j = 0; j < rounded ; j++) {
    $(".rating").append('<i class="fa fa-star" aria-hidden="true"></i>');
}

  if(decimal){
    $(".rating").append('<i class="fa fa-star-half" aria-hidden="true"></i>');
}

};

export { initStarRating };
