$ = require 'jquery'

module.exports =
  activate: (state) ->
    atom.workspaceView.command "layout-manager:maximize-active-pane", => @maximize()
    atom.workspaceView.command "layout-manager:enlarge-active-pane", => @enlarge()
    atom.workspaceView.command "layout-manager:shrink-active-pane", => @shrink()
    atom.workspaceView.command "layout-manager:move-pane-right", => @moveRight()
    atom.workspaceView.command "layout-manager:move-pane-left", => @moveLeft()
    atom.workspaceView.command "layout-manager:move-pane-down", => @moveDown()
    atom.workspaceView.command "layout-manager:move-pane-up", => @moveUp()
    atom.workspaceView.command "layout-manager:move-pane-next", => @moveNext()
    atom.workspaceView.command "layout-manager:move-pane-previous", => @movePrevious()
    # TODO rebuild layout from stored state

  maximize: ->
    $('html').toggleClass('maximize-pane-on')

  enlarge: ->
    flex = @getFlex()
    flex.grow *= 1.1
    flex.shrink *= 1.1
    @setFlex flex

  shrink: ->
    flex = @getFlex()
    flex.shrink /= 1.1
    flex.grow /= 1.1
    @setFlex flex

  moveRight: -> @move 'horizontal', +1
  moveLeft: -> @move 'horizontal', -1
  moveUp: -> @move 'vertical', -1
  moveDown: -> @move 'vertical', +1
  moveNext: -> @moveOrder +1
  movePrevious: -> @moveOrder -1

  moveOrder: (delta) ->
    pane = atom.workspace.getActivePane()
    if delta > 0
      atom.workspace.activateNextPane()
    else
      atom.workspace.activatePreviousPane()
    target = atom.workspace.getActivePane()
    @swapEditor pane, target

  move: (orientation, delta) ->
    pane = atom.workspace.getActivePane()
    [axis,child] = @getAxis pane, orientation
    if axis?
      target = @getRelativePane axis, child, delta
    if target?
      @swapEditor pane, target

  swapEditor: (source, target) ->
    editor = source.getActiveItem()
    source.removeItem editor
    target.addItem editor
    target.activateItem editor
    target.activate()

  getAxis: (pane, orientation) ->
    axis = pane.parent
    child = pane
    while true
      return unless axis.constructor.name == 'PaneAxis'
      break if axis.orientation == orientation
      child = axis
      axis = axis.parent
    return [axis,child]

  getRelativePane: (axis, source, delta) ->
    position = axis.children.indexOf source
    target = position + delta
    return unless target < axis.children.length
    return axis.children[target].getPanes()[0]

  getFlex: ->
    [grow,shrink,basis] = $('.pane.active').css('-webkit-flex').split ' '
    return {grow,shrink,basis}

  setFlex: ({grow,shrink,basis}) ->
    flex = [grow,shrink,basis].join ' '
    $('.pane.active').css('-webkit-flex', flex)

  deactivate: ->

  serialize: ->
    # TODO walk over .panes, .pane-row, .pane-col, .pane elements
    #      and store their flex values
