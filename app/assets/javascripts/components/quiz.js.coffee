@Quiz = React.createClass
    render: ->
      React.DOM.tr null,
        React.DOM.td null, @props.quiz.name
        React.DOM.td null, @props.quiz.description
        React.DOM.td null, @props.quiz.games_count
        React.DOM.td null,
          React.DOM.a
            href: "/quizzes/#{@props.quiz.id}/edit"
            'Edit Quiz'
