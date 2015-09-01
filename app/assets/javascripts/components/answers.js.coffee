

@Answers = React.createClass
  getInitialState: ->
    answers: @props.data
  getDefaultProps: ->
    answers: []
  addAnswer: (answer) ->
    answers = React.addons.update(@state.answers, { $push: [answer] })
    @setState answers: answers
  updateAnswer: (answer, data) ->
    index = @state.answers.indexOf answer
    answers = React.addons.update(@state.answers, { $splice: [[index, 1, data]] })
    @replaceState answers: answers
  deleteAnswer: (answer) ->
    index = @state.answers.indexOf answer
    answers = React.addons.update(@state.answers, { $splice: [[index, 1]] })
    @replaceState answers: answers
  render: ->
    React.DOM.div
      className: 'answers'
      React.DOM.h2
        className: 'title'
        'Answers'
      React.createElement AnswerForm, quizId: @props.quizId, handleNewAnswer: @addAnswer
      React.DOM.hr null
      React.DOM.table
        className: 'table table-striped table-hover table-responsive table-condensed'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th className: 'text-center', null, 'Hint'
            React.DOM.th className: 'text-center', null, 'Solution'
            React.DOM.th className: 'text-center', null, 'Actions'
        React.DOM.tbody null,
          for answer in @state.answers
            React.createElement Answer, key: answer.id, answer: answer, handleEditAnswer: @updateAnswer, handleDeleteAnswer: @deleteAnswer
