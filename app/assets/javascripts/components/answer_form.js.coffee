$r = React.DOM

@AnswerForm = React.createClass
  getInitialState: ->
    quiz_id:
    hint: ''
    solution: ''
  valid: ->
    @state.solution
  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value
  handleSubmit: (e) ->
    e.preventDefault()
    $.post '', { answer: @state }, (data) =>
      @props.handleNewAnswer data
      @setState @getInitialState()
    , 'JSON'
  render: ->
    $r.form
      className: 'form-inline'
      onSubmit: @handleSubmit
      $r.div
        className: 'form-group'
        $r.input
          type: 'hidden'
          name: 'quiz_id'
          value: @state.quiz_id
      $r.div
        className: 'form-group'
        $r.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Hint'
          name: 'hint'
          value: @state.hint
          onChange: @handleChange
      $r.div
        className: 'form-group'
        $r.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Solution'
          name: 'solution'
          value: @state.solution
          onChange: @handleChange
      $r.button
        type: 'submit'
        className: 'btn btn-primary'
        disabled: !@valid()
        'Create answer'
