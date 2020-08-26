![icon](./Pig/Assets.xcassets/icon.imageset/icon.png)

![Xcode 11.3](./Pig/Assets.xcassets/Xcode-11.3-blue.imageset/Xcode-11.3-blue.png)
![Swift 5.0](./Pig/Assets.xcassets/Swift-5.0-orange.imageset/Swift-5.0-orange.png)

# Pig
For this project; students will be tasked with creating a mobile version of the __Pig__ dice game.  
Much of the logic for the model class is already supplied, and Autolayout constraints are not required.  
See `Pig_Screenshots.pdf` for an example of what the basic interface should look like at various points throughout gameplay.  
See `Pig_Demo.mov` for an example of gameplay at various points throughout a game.

### Objectives
* Implement basic concepts of __MVC__ and __Delegation__
* Utilize *UI components* such as `UILabel`, `UIButton` and `UIImageView`
* Utilize *UI components* such as `IBOutlet` and `IBAction` for event handling

### Gameplay Rules
Each turn, a player repeatedly rolls a die until either a __1__ is rolled or the player decides to *"hold"*:

* If the player rolls a __1__, they score nothing and it becomes the next player's turn
* If the player rolls any other number, it is added to their turn total and the player's turn continues
* If a player chooses to *"hold"*, their turn total is added to their score, and it becomes the next player's turn
* The first player to score __100__ or more points wins

For example: The first player begins a turn with a roll of __5__. They could hold and score 5 points, but chooses to roll again. Player one then rolls a __2__, and could hold with a turn total of 7 points, but chooses to roll again. Their third roll yields a __1__, and they must end their turn without scoring. Player 2 then rolls the sequence __4-5-3-5-5__. They then choose to hold, which adds their turn total of 22 points to their overall score. Player 1 is then allowed to begin another turn.

### Tasks
This project will require students to do several things:

* Build the necessary user interface elements in `Pig.storyboard`
* __Connect__ those interface elements to `PigViewController.swift` as `IBAction`s and `IBOutlet`s as appropriate
* __Conform__ `PigViewController` to the `PigModelDelegate` protocol
* Learn what the `PigModel` class does and use it inside of `PigViewController` to correctly respond to the player's interactions
* Finish/Add a few methods in `PigModel`

### Requirements
* When a user elects to __roll the die__; ensure all `UIButton`s are disabled until any updates to the UI thread are complete
* A `UIImageView` located somewhere on screen __must__ display the outcome of a player's roll
* A player should not be allowed to *"hold"* while their score for a turn is __0__
* Every game event should be recorded in the game log
* The UI should clearly indicate which player is allowed to roll at any given time
* A player's score must be updated on the score board when their turn completes
* When a player's score reaches a minimum of __100__; a `UIAlert` must display, notifying the players that the game has been won, and a new game may be started 
* Players must be allowed to *"reset"* or *"start a new game"* at any time, so long as the UI thread is not performing an update
* __MVC__ is required; view logic should only be present in the ViewControllers, and likewise, business logic should be kept exclusively in the data-models
* The criterion of __ALL__ `TODO` tasks outlined in the project template __MUST__ be satisfied

### Extra Credit
Up to __5__ points of extra credit is available for getting creative with the project and adding additional features or capabilities. Ensure the project meets __ALL__ of the base requirements __before__ attempting to add anything extra! Students should include a `EXTRACREDIT.md` file with their project submission that details any additional features added in order to be considered for the extra credit points.

### Notes
* Places where code should be implemented are marked with `TODO` comments and will appear as warnings in the Issue navigator when building the project
* A __SwiftLint__ build script has been added for convenience
* __No Autolayout__: Just design for the __iPhone 11 Pro Max__ in portrait mode and use the __iPhone 11 Pro Max Simulator__ when testing
* This project will utilize some pre-packaged objects from our ObjectLibrary package:
    * `Die` (This project contains an extension with a computed variable `face` that returns the proper `UIImage` for its given case/ value)
    * `Player`

(`ctrl + cmd + click` or `alt + click` on an object in the project to see documentation)

### Submission
* Projects should run on a minimum of __Xcode 11.3__
* Projects should be free of compile-time errors and crashes (run-time errors)
* Projects should not have any compile-time warnings (in yellow)
* Unless added by the student completing the project; __All__ comments (the green stuff) __MUST__ be deleted before submission
* The following files/directories __MUST__ be deleted from the project directory before submission:
    * `README.md`
    * `Pig_Screenshots.pdf`
    * `Pig_Demo.mov`
    * `.gitignore`
    * `.git/`
    * `.github/`

When ready to submit; the student should rename the directory containing their project to their __UMSL ssoid__ (e.g. 'gmhz7b').  
Then, *right-click* on that folder and select the option that should say ' __Compress "{ssoid_directory_name}"__ '. Finally, upload the resulting __zip__ file to __Canvas__.  
Students should take special care to ensure their projects are devoid of compile-time errors/warnings and run-time errors. Failure to do so will result in significant deductions.  
