# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#$(document).on "page:change", ->
#  $('#start-quiz').click ->
#    alert 'Quiz started!'

$(document).on "page:change", ->
  $('#guess').submit (event) ->
    event.preventDefault()
    alert 'Good guess!' #test
#    clear form
#    check if it's equal to answer.solution
#       $('#answer-solution').sibling.show() if guess equals answer.solution

$(document).on "page:change", ->
  $('#give_up').click (event) ->
    event.preventDefault()
    $('.answer_solution').show()

