$(document).ready (function() {
  $(".start-workout").on("click", startWorkout);
});

function startWorkout(){
  $(".workout-overview").hide();
  $(".workout-animation").show();
  $(".workout-animation").children('.exercise-view:first').show()
}
