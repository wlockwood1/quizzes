

@AnswerForm = React.createClass
  getInitialState: ->
    quiz_id: @props.quizId
    hint: ''
    solution: ''
  valid: ->
    @state.solution
  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value
  handleSubmit: (e) ->
    e.preventDefault()
    $.post "/quizzes/#{ @props.quizId }/answers", { answer: @state }, (data) =>
      @props.handleNewAnswer data
      @setState @getInitialState()
    , 'JSON'
  render: ->
    React.DOM.form
      className: 'form-inline'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'hidden'
          name: 'quiz_id'
          value: @state.quiz_id
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Hint'
          name: 'hint'
          value: @state.hint
          onChange: @handleChange
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Solution'
          name: 'solution'
          value: @state.solution
          onChange: @handleChange
      React.DOM.button
        type: 'submit'
        className: 'btn btn-primary'
        disabled: !@valid()
        'Create answer'
