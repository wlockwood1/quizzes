@Quiz = React.createClass
    render: ->
      React.DOM.tr null,
        React.DOM.td null, @props.quiz.name
        React.DOM.td null, @props.quiz.description
        React.DOM.td null, @props.quiz.games_count
