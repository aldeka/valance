# Valance

Valance is (intended to be) a reusable library of CSS and React components for making native-looking Electron applications. Currently it is in the extreme early stages and only supports OSX Yosemite, but plans are in the works for supporting Windows as well as other Mac variants.

This is ***extremely*** work in progress!

### TODOs/known issues

* Top border of toolbar isn't 1px on retina screens. (It appears you can't have a 0.5px inset box-shadow, at least on Chrome, and a non-inset box-shadow would go off the window.)
* Unclear what the rules are for the toolbar padding for where the window control buttons go; it appears to be a function of toolbar height but the current LESS formula is just a guess.
* OSX Yosemite now has a "full screen button" where the "maximize" button used to go. The color is correct, but the icon is not, and the animation/action is also distinct.
* Bounding box for hover action on action buttons shouldn't be (much) taller than the buttons themselves.