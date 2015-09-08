#language-nez

[NEZ][nl] support in Atom
* Syntax highlight
* Run in Editor

## Installation
  [NEZ][nl] must be installed in order to use this plugin.

## Settings
You can configure language-nez by editing ~/.atom/config.cson (choose Open Your Config in Atom menu):
```
'language-nez':
  'nezPath': null #nez path.
```

## Usage
All commands can also be found in the Packages menu
### Toggle
`ctrl-cmd-n` (mac) / `alt-shift-N` (win & linux)or **nez** in the Command Palette.

You can test your NEZ file.
If you select a rule in editor and execute this Command, the rule is set as starting point.
you can also set starting point in the Packages menu **Set starting point**.

### Go To Declaration
`alt-cmd-n` or **Go To Declaration** in the right click menu.
You can return the cursor to the last edit position `alt-cmd-b` or **Last Edit Position** in the Packages menu.

### Debugger
**Debugger** in the Package menu.
1. Press **Choose File**, and choose a input file to parse by the NEZ file you are currently editing.
2. Select *breakpoint* from a drop-down list, and press the Button **Set Breakpoint**.
3. Press the Button **Run**.
4. Do as you think best.

[nl]:http://nez-peg.github.io/
