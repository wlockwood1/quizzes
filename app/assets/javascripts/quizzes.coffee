# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#$(document).on "page:change", ->
#  $('#start-quiz').click ->
#    alert 'Quiz started!'
#    Start timer
#

$(document).on "page:change", ->
  $('#guess').submit (e) ->
    e.preventDefault()
    $(e.target) checkAnswer()
    $(e.target).val('')
#
  #  Checks to see if guess value matches any of the answers

  checkAnswer = (e) ->
    e.preventDefault()
    txt = $(@).val();
    $('.answer_solution').each() -> #try ('#answers .answer_solution' but not working)
      $(@) rightAnswer() if($(@).text().toUpperCase().indexOf(txt.toUpperCase()) != -1)

#  Function to show right answer and change class so it will display
   rightAnswer = (e) ->
     e.preventDefault()
     $(@).addClass '.answer_solution_correct'
     $(@).removeClass '.answer_solution'

#    Maybe this instead
  #var answer = $("#<= "answer_#{@answer.id}" %>")
  #  answer.append("<= j render @answer %>");
  #commDiv.siblings().find('.form-control').val("");
  #       $('.correct-answers').increment


#  Shows all answers when user gives up on game
  $('#give_up').click (event) ->
    event.preventDefault()
    $('answer_solution').show()

  #  Starts game/countdown after pause
  $('#start').click (event) ->
#    Game.create. This should be a form with 'Start' as the submit button

#  Continues game/countdown after pause. Use countdown js
  $('#play').click (event) ->

#  Pauses game/countdown. Use countdown js
  $('#pause').click (event) ->

