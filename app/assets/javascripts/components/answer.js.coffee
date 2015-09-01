@Answer = React.createClass
  getInitialState: ->
    edit: false
  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit
  handleEdit: (e) ->
    e.preventDefault()
    data =
      hint: React.findDOMNode(@refs.hint).value
      solution: React.findDOMNode(@refs.solution).value
    $.ajax
      method: 'PUT'
      url: "/quizzes/#{ @props.answer.quiz_id }/answers/#{ @props.answer.id}"
      dataType: 'JSON'
      data:
        answer: data
      success: (data) =>
        @setState edit: false
        @props.handleEditAnswer @props.answer, data
  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/quizzes/#{ @props.answer.quiz_id}/answers/#{ @props.answer.id}"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteAnswer @props.answer
  answerForm: ->
    React.DOM.tr null,
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.answer.hint
          ref: 'hint'
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.answer.solution
          ref: 'solution'
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-default'
          onClick: @handleEdit
          'Update'
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleToggle
          'Cancel'
  answerRow: ->
    React.DOM.tr null,
      React.DOM.td null, @props.answer.hint
      React.DOM.td null, @props.answer.solution
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-default'
          onClick: @handleToggle
          'Edit'
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleDelete
          'Delete'
  render: ->
    if @state.edit
      @answerForm()
    else
      @answerRow()
