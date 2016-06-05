$(document).on("ready page:load", function () {

  $(".fi-heart").on("click", function(){
    var element = this;
    var workoutId = this.dataset.workoutid;
    console.log(workoutId);
    $.ajax({
      type: "POST",
      complete: function(result) {
        if ( result.statusText === 'OK' ) {
          $(element).toggleClass("red");
          $(element).toggleClass("grey");
        }
      },
      url: '/favourites',
      data: JSON.stringify({ workout_id: workoutId }),
      contentType: "application/json",
      dataType: "json"
    });
  })
})
