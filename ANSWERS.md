
# Flutter Architecture, Widgets and Basic UI
## IT 120 - Integrative Programming and Technologies 2

### 1. GitHub Repository

GitHub Repository Link: [PASTE YOUR GITHUB REPOSITORY LINK HERE]

### 2. Activity 2 - Debug Console

Last three `build() called` lines:

build() called: 5 glasses
build() called: 6 glasses
build() called: 6 glasses

### 3. Experiment Observations

**Activity 2 - setState()**

Observation: When _glasses++ was moved outside setState(), the counter value still changed, but the UI did not automatically rebuild as expected. Using setState() ensures that Flutter knows the state has changed and updates the displayed UI.

**Activity 3 - Expanded**

Observation: When Expanded was used, the widgets shared the available horizontal space in the row. Removing Expanded changed the layout and could cause uneven spacing or a render overflow when the widgets did not fit.


**Activity 5 - ThemeData**

Observation: Changing the theme through ThemeData changed the app's overall appearance. The light and dark modes allowed the interface colors to change according to the selected theme.

### 4. Review Questions and Answers

**1. What is the difference between a StatelessWidget and a StatefulWidget? Give one example of each from this lab.**

A StatelessWidget does not manage changing state, while a StatefulWidget can manage data that changes while the app is running. The Profile Card in Activity 1 is an example of a StatelessWidget, while the Water Tracker in Activity 2 is an example of a StatefulWidget.

**2. Why is a StatefulWidget written as two classes? What does each class do?**

The first class defines the widget and creates its state. The second class extends State and holds the changing data and the build() method that displays the updated interface.

**3. In Activity 2, what happened when you changed `_glasses` outside `setState()`? Why?**

Changing `_glasses` outside `setState()` does not notify Flutter to rebuild the interface. The displayed value may not update immediately because Flutter has not been instructed to redraw the widget.

**4. Looking at the Debug Console in Activity 2, when is `build()` called?**

The build() method is called when Flutter creates the interface and when the widget needs to be rebuilt, such as after a state change using setState().

**5. Explain the main axis and the cross axis of a Row and of a Column.**

In a Row, the main axis is horizontal and the cross axis is vertical. In a Column, the main axis is vertical and the cross axis is horizontal.

**6. In Activity 3, what happened when you removed Expanded from a StatBox? What does Expanded do?**

Removing Expanded changes how the StatBox uses the available width and may cause uneven sizing or overflow. Expanded allows a widget to take a share of the available space along the Row's main axis.

**7. Why do we use GridView.builder for the menu instead of a Column with many children?**

GridView.builder displays items in a grid and builds them as needed. It is useful for a menu because it arranges items into rows and columns and can handle scrolling efficiently.

**8. How do Stack and Positioned create the Best seller badge in Activity 4?**

Stack allows widgets to overlap. Positioned places the Best seller badge at a specific location over the menu item or its image.

**9. What is the difference between customizing with ThemeData and with a style on one widget? Give one example of each from Activity 5.**

ThemeData applies shared visual settings across the app, such as the color scheme or button theme. A style on one widget affects only that widget, such as setting the text size of a title.

**10. When you flip the dark-mode switch in Activity 5, which widget holds the state, and how does the change reach MaterialApp?**

The State object belonging to the settings page's StatefulWidget holds the dark-mode value. When the switch changes, setState() updates the state and rebuilds the interface, allowing MaterialApp to use the updated theme.
