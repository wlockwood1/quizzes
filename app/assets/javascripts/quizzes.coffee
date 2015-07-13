# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#$(document).on "page:change", ->
#  $('#start-quiz').click ->
#    alert 'Quiz started!'
#    Start timer
#    Show div
#

$(document).on "page:change", ->

  $('#start_quiz').click (e) ->
    e.preventDefault()
    $('#live_game').show()
    $('#start_quiz').hide()


  $('#guess').submit (e) ->
    e.preventDefault()
#    alert 'Good guess!';
#    Calls checkAnswer function for guess
    checkAnswer(e)
    $($(e.target).find('input')[1]).val('')
#    Should clear form
    #$(e.target).val('')

  #  Checks to see if guess value matches any of the answers
  checkAnswer = (e) ->
    e.preventDefault()
#   Sets value of text input in guess form to txt
    txt = $($(e.target).find('input')[1]).val() ;
#    Check each solution in the quiz
    $('.answer_solution').each (i, answ) ->
#      Checks the guess with each solution to see if it matches
      if(txt.toUpperCase().indexOf($(answ).text().toUpperCase()) != -1)
#     Calls rightAnswer function if the .answer_solution matches guess
        rightAnswer(answ)

#  Function to show correct answer
  rightAnswer = (e) ->
#     Gives that answer a new class which will display the answer in green font
    $(e).addClass 'answer_solution_correct'
#     Removes previous class so the answer will stay on page
    $(e).removeClass 'answer_solution'
#    Increment correct answers

#  Shows all answers when user gives up on game
  $('#give_up').click (event) ->
    event.preventDefault()
    $('.answer_solution').show()
    $('#give_up').hide()

  #  Starts game/countdown after pause
  $('#start').click (event) ->
#    Game.create. This should be a form with 'Start' as the submit button

#  Continues game/countdown after pause. Use countdown js
  $('#play').click (event) ->

#  Pauses game/countdown. Use countdown js
  $('#pause').click (event) ->

