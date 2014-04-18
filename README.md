# Layout Manager package

This package provides useful commands to manage the layout of panes within
an Atom editor window. Supports moving tabs between panes, resizing the active
pane and toggling maximized state for the current tab.

# NOTICE: this package has been divided in subpackages

Each feature of this package is also offered in the following individual
packages:

- [Maximize Panes](https://atom.io/packages/maximize-panes)
- [Resize panes](https://atom.io/packages/resize-panes)
- [Move panes](https://atom.io/packages/move-panes)

New features will not be added to this package and only offered in individual
packages.

## Maximize active pane
Enlarges the active pane (the one that contains the active editor) to occupy
the entire editor view. Other panes remain open only hidden behind the active
one.

![Maximize Example](https://raw.githubusercontent.com/santip/layout-manager/master/examples/maximize.gif)

Repeating this command will restore the active pane to its original size.
Also, switching the active pane while maximized will make the newly active pane
visible and the previous one hidden.

| Command name        | Default key binding           |
| ------------- |:-------------:|
| `layout-manager:maximize`      | `cmd-shift-enter` |

&nbsp;

## Enlarge / Shrink active pane

Grows the active pane gradually shrinking other panes proportionally.

If inside a row, the pane only enlarges horizontally, inside a column, the pane only enlarges vertically.

| Enlarge | Shrink |
| ---- | --- |
| ![Enlarge Example](https://raw.githubusercontent.com/santip/layout-manager/master/examples/enlarge.gif) | ![Shrink Example](https://raw.githubusercontent.com/santip/layout-manager/master/examples/shrink.gif) |

&nbsp;

| Command name        | Default key binding           |
| ------------- |:-------------:|
| `layout-manager:enlarge-active-pane`      | `cmd-alt-=` |
| `layout-manager:shrink-active-pane`      | `cmd-alt--` |

## Move active tab to different panes

Allows moving the active tab to the right, left, up or down. Also supports
cycling the active tab to next/previous panes.

![Move Example](https://raw.githubusercontent.com/santip/layout-manager/master/examples/move-panes.gif)

| Command name                        | Default key binding    |
| ----------------------------------- |:----------------------:|
| `layout-manager:move-pane-right`    | `cmd-ctrl-shift-right` |
| `layout-manager:move-pane-left`     | `cmd-ctrl-shift-left`  |
| `layout-manager:move-pane-up`       | `cmd-ctrl-shift-up`    |
| `layout-manager:move-pane-down`     | `cmd-ctrl-shift-down`  |
| `layout-manager:move-pane-next`     | None                   |
| `layout-manager:move-pane-previous` | None                   |

## Wishlist (future features)

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
