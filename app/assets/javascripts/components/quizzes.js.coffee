@Quizzes = React.createClass
  getInitialState: ->
      quizzes: @props.data
  getDefaultProps: ->
      quizzes: []
  render: ->
    React.DOM.div
      className: 'quizzes'
      React.DOM.h2
        className: 'title'
        'Quizzes'
      React.DOM.table
          className: 'table table-bordered'
          React.DOM.thead null,
            React.DOM.tr null,
              React.DOM.th null, 'Quiz Name'
              React.DOM.th null, 'Quiz Description'
              React.DOM.th null, 'Times Played'
              React.DOM.th null, 'Actions'
          React.DOM.tbody null,
            for quiz in @state.quizzes
              React.createElement Quiz, key: quiz.id, quiz: quiz
