function removeFavourite(){
  var element = this;
  var workoutId = this.dataset.workoutid;
  var favCount = parseInt($(this).prev('.fav-count').html());
  console.log(favCount)
  $.ajax({
    type: "POST",
    complete: function(result) {
      if ( result.statusText === 'OK' ) {
        removeListeners();
        $(element).removeClass("red");
        $(element).removeClass("faved");
        $(element).addClass("unfaved");
        $(element).prev('.fav-count').removeClass("red");
        $(element).prev('.fav-count').html(favCount - 1);
        addListeners();
      }
    },
    url: '/favourites',
    data: JSON.stringify({ workout_id: workoutId }),
    contentType: "application/json",
    dataType: "json"
  });
}

function addFavourite(){
  var element = this;
  var workoutId = this.dataset.workoutid;
  var favCount = parseInt($(this).prev('.fav-count').html());
  console.log(favCount)
  $.ajax({
    type: "POST",
    complete: function(result) {
      if ( result.statusText === 'OK' ) {
        removeListeners();
        $(element).addClass("red");
        $(element).removeClass("unfaved");
        $(element).addClass("faved");
        $(element).prev('.fav-count').addClass("red");
        $(element).prev('.fav-count').html(favCount + 1);
        addListeners();
      }
    },
    url: '/favourites',
    data: JSON.stringify({ workout_id: workoutId }),
    contentType: "application/json",
    dataType: "json"
  });
}

function addListeners(){
  $(".faved").on("click", removeFavourite);
  $(".unfaved").on("click", addFavourite);
}

function removeListeners(){
  $(".faved").off("click", removeFavourite);
  $(".unfaved").off("click", addFavourite);
}

$(document).on("ready page:load", function () {
  addListeners();
})
