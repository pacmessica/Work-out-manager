function ready() {
  $(".start-workout").on("click", startWorkout);
}
$(document).on("page:load", ready);
$(document).ready(ready)

function startWorkout(){
  $(".workout-overview").hide();
  $(".workout-animation").show();
  var breakTime = this.dataset.workoutinterval * 1000;
  console.log(breakTime)
  var exercises = $(".exercise-view");
  var len = exercises.length;
  var i = 0;

  doBreak();
  setTimeout(showExercise, breakTime);

  function doBreak() {
    $(".exercise-view").hide();
    $(".rest-countdown").show();
    var time = breakTime / 1000;
    countDown(time)
  }

  function countDown(time) {
    $(".countdown").html(time)
    var newTime = time - 1;
    console.log(newTime)
    if (newTime > 0) {
      setTimeout(function(){ countDown(newTime) }, 1000);
    }
  }

  function showExercise() {
    $(".rest-countdown").hide();
    var prev = (i-1 < 0) ? len-1 :i-1;
    $(exercises[i]).show();
    $(exercises[prev]).hide();
    if (++i >= len) {
      $(".workout-animation").hide();
      return;
    }
    var exerciseTime = exercises[i-1].dataset.exercisetime * 1000;
    console.log(exerciseTime)
    setTimeout(doBreak, exerciseTime);
    setTimeout(showExercise, breakTime + exerciseTime);
  }


}
