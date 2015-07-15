# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "page:change", ->

  $('#start_quiz').click (e) ->
    e.preventDefault()
    $('#live_game').show()
    $('#start_quiz').hide()
    $('options  ').hide()
    $('#guess').find('.form-control').focus()
    $('.timer').show()
    $('.answer_count').show()
    $clock.countdown getQuizTimer(), (event) ->
      $(this).html event.strftime('%M:%S')

#    Shows all answers and stop quiz when clock hits 0:00
    .on('finish.countdown', ->
      $('.answer_solution').show()
      $('#guess').hide()
      $('#give_up').hide())

#    .on('pause.countdown', ->
#                  )
#  User enters guess
  $('#guess').submit (e) ->
    e.preventDefault()
#    Calls checkAnswer function for guess
    checkAnswer(e)
    $($(e.target).find('input')[1]).val('')
#    Should clear form
    #$(e.target).val('')

  #  Checks to see if guess value matches any of the answers
  checkAnswer = (e) ->
    e.preventDefault()
#   Sets value of text input in guess form to txt. Maybe if full names, can split at space so you can only guess last name
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
    modify_corr(1)
  #   Ruby: Game.increment_counter(:correct_answers, @game)

#  Shows all answers when user gives up on game
  $('#give_up').click (event) ->
    event.preventDefault()
    $('.answer_solution').show()
    $('#guess').hide()
    $('#give_up').hide()
    $clock.countdown('stop');

  #  Starts game/countdown after pause
  $('#start').click (event) ->
#    Game.create. This should be a form with 'Start' as the submit button

#  Continues game/countdown after pause. Use countdown js
  $('#play').click (event) ->

#  Pauses game/countdown. Use countdown js
  $('#pause').click (event) ->

#  Increases correct answer count
  modify_corr = (val) ->
    corr = document.getElementById('corr').value
    new_corr = parseInt(corr, 10) + val
    if new_corr < 0
      new_corr = 0
    document.getElementById('corr').value = new_corr
    new_corr
