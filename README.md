# Layout Manager package

This package provides useful commands to manage the layout of panes within
an Atom editor window.

## Currently implemented commands

### Maximize active pane
Enlarges the active pane (the one that contains the active editor) to occupy
the entire editor view. Other panes remain open only hidden behind the active
one.

Repeating this command will restore the active pane to its original size.

Switching the active pane while maximized will make the newly active pane
visible and the previous one hidden.

*Default binding: Command + Shift + Enter*

![Maximize Example](https://raw.githubusercontent.com/santip/layout-manager/master/examples/maximize.gif)

### Enlarge active pane
Will modify the DOM in order to make the active pane slightly larger than
before (other panes will shrink proportionally).

Repeating this command allows to enlarge the pane as much as desired.

If inside a row, the pane only enlarges horizontally.

If inside a column, the pane only enlarges vertically.

*Default binding: Command + Alt + "="*

![Enlarge Example](https://raw.githubusercontent.com/santip/layout-manager/master/examples/enlarge.gif)

### Shrink active pane

Will modify the DOM in order to make the active pane slightly shorter than
before (other panes will grow proportionally).

Repeating this command allows to shrink the pane as much as desired.

If inside a row, the pane only shrinks horizontally.

If inside a column, the pane only shrinks vertically.

*Default binding: Command + Alt + "-"*

![Shrink Example](https://raw.githubusercontent.com/santip/layout-manager/master/examples/shrink.gif)

## Future commands

### Move active editor to {right,left,up,down} pane

Self explanatory

### Merge all editors in a single pane

Remove all panes leaving a single one but without closing any editors, only
merging them into the new single pane.

### Reorganize into a specific layout

Some possible layouts are:
- 2 columns
- 3 columns
- 2 x 2 grid
- 2 rows
- many more...

The command should reorganize existing editors without closing them. Ideally
it should aim to maintain as much of the current distribution as possible.

# Feedback and pull requests are welcome.
