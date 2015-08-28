$r = React.DOM

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
      url: "/quizzes/#{ @props.answer.quiz_id}/answers/#{ @props.answer.id}"
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
    $r.tr null,
      $r.td null,
        $r.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.answer.hint
          ref: 'hint'
      $r.td null,
        $r.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.answer.solution
          ref: 'solution'
      $r.td null,
        $r.a
          className: 'btn btn-default'
          onClick: @handleEdit
          'Update'
        $r.a
          className: 'btn btn-danger'
          onClick: @handleToggle
          'Cancel'
  answerRow: ->
    $r.tr null,
      $r.td null, @props.answer.hint
      $r.td null, @props.answer.solution
      $r.td null,
        $r.a
          className: 'btn btn-default'
          onClick: @handleToggle
          'Edit'
        $r.a
          className: 'btn btn-danger'
          onClick: @handleDelete
          'Delete'
  render: ->
    if @state.edit
      @answerForm()
    else
      @answerRow()
