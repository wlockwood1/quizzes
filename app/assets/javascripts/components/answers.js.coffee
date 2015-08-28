$r = React.DOM

@Answers = React.createClass
  getInitialState: ->
    answers: @props.data
  getDefaultProps: ->
    answers: []
  addAnswer: (answer) ->
    answers = React.addons.update(@state. answers, { $push: [answer] })
    @setState answers: answers
  updateAnswer: (answer, data) ->
    index =@state.answers.indexOf answer
    answers = React.addons.update(@state.answers, { $splice: [[index, 1, data]] })
    @replaceState answers: answers
  deleteAnswer: (answer) ->
    index = @state.answers.indexOf answer
    answers = React.addons.update(@state.answers, { $splice: [[index, 1]] })
    @replaceState answers: answers
  render: ->
    $r.div
      className: 'answers'
      $r.h2
        className: 'title'
        'Answers'
      React.createElement AnswerForm, handleNewAnswer: @addAnswer
      $r.hr null
      $r.table
        className: 'table table-bordered'
        $r.thead null,
          $r.tr null,
            $r.th null, 'Hint'
            $r.th null, 'Solution'
            $r.th null, 'Actions'
        $r.tbody null,
          for answer in @state.answers
            React.createElement Answer, key: answer.id, answer: answer, handleEditAnswer: @updateAnswer, handleDeleteAnswer: @deleteAnswer
