$ = require 'jquery'

module.exports =
  activate: (state) ->
    atom.workspaceView.command "layout-manager:maximize-active-pane", => @maximize()
    atom.workspaceView.command "layout-manager:enlarge-active-pane", => @enlarge()
    atom.workspaceView.command "layout-manager:shrink-active-pane", => @shrink()
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
