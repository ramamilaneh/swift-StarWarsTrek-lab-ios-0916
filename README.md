# Star Wars Trek

![](http://i.imgur.com/jx5tRVD.jpg)

**Demo of App**:

[![](http://img.youtube.com/vi/GT2jvl3qxeI/0.jpg)](https://www.youtube.com/watch?v=GT2jvl3qxeI "Star Wars Trek")

The user should be presented with characters from the Star Wars and Star Trek films (scrollable via two `UIScrollView`'s). They need to select one character from each film (by tapping the `UIImageView`). After selecting two characters (one from each universe), you should segue over to another `UIViewController` that will display the selected images (two in total). The user should then be able to drag the two `UIImageView`'s around the screen (as in the demo) and simulate a fight!

# Instructions

Just as if you were presented with the ingredients of making an apple pie (apple pies are very good) without the explicit instructions of _how_ to make the apple pie, we will take that approach here.

In the `Main.storyboard`, in your first `View Controller` it should be made up of the following "ingredients":

* Two(2) `UILabel`s.
* Two(2) `UIStackView`s.
* Two(2) `UIScrollView`s.
* Eight(8) `UIImageView`s.

I would prefer that you take a stab at making this work with just those instructions for now. Struggling through something like this is a great way to become familiar with Interface Builder (even if you don't get the answer!). But... below are some hints to help you out if you need them:

The hints below only relate to the top Scroll View and its subviews and not the scroll view at the bottom of the view. Considering they're both similar, if you can get one to work, you'll have what you need to get the other to work.

Hints:  
* The top Scroll view has paging enabled.
* The top Scroll View's Center Y constraint is equal to the View's Center Y with a multiplier of 0.6.
* The top Scroll View's height constraint is equal to the View's height with a multiplier of 0.3.
* The top Scroll View's Center X constraint is equal to the View's Center X.
* The top Scroll View's aspect ratio is 1:1.
* The top Stack View (as a subview of the top Scroll View) has its top, bottom, leading and trailing constraints equal to its superview's top, bottom, leading and trailing (subhint: remember the pin tool!).
* The top Stack View's height constraint is equal to the top Scroll Views height.
* The top Stack View's aspect ratio should be 4:1.
* The top Stack View's alignment should be set to Fill
* The Top Stack View's distribution should be set to Fill Equally
* The four ImageViews within this top Stack View should have their content mode set to to Aspect Fill, and User Interaction Enabled should be checked and Clip to Bounds should be checked.
* The Star Wars UILabel should be constrained right above the top Scroll View.

---

Once your layout is complete (and working!) go through the following instructions:

Create `IBOutlet`s for all of the `UIImageView`s you have within the two `UIStackView`s and give them the following names:

```swift
    @IBOutlet weak var starWarsOne: UIImageView!
    @IBOutlet weak var starWarsTwo: UIImageView!
    @IBOutlet weak var starWarsThree: UIImageView!
    @IBOutlet weak var starWarsFour: UIImageView!
    
    @IBOutlet weak var starTrekOne: UIImageView!
    @IBOutlet weak var starTrekTwo: UIImageView!
    @IBOutlet weak var starTrekThree: UIImageView!
    @IBOutlet weak var starTrekFour: UIImageView!
```

After creating those outlets, create the following instance properties (right below your outlets):

```swift
    var starWarsCharacter: UIImageView!
    var starTrekCharacter: UIImageView!
```

Ultimately, whenever someone "selects" one of the `UIImageView`s by tapping on it (which we will setup shortly), we will assign that tapped `UIImageView` to one of these stored properties.

---

Setting up our `UITapGestureRecognizer`'s. 

Create the function `setupStarWarsGestureRecognizers()`. In your implementation, you should first create a constant called `imageViews` and assign it the value `[starWarsOne, starWarsTwo, starWarsThree, starWarsFour]`. What we're doing here is creating an array which contains all of the `UIImageView`'s related to the Star Wars characters. We're storing this array in a constant called `imageViews`.

Next (still within the implementation of this function) we should iterate over this `imageViews` constants. Within this for loop we will be accessing each `imageView`.

```swift
for imageview in imageViews {

}
```

Within the for loop, we should create a `UITapGestureRecognizer` that will be added to the `imageView`. The `numberOfTapsRequired` on this gesture recognizer object should be 1.

How to handle the `selector` argument (keep reading).

Lets say there was a function on our View Controller like the following:

```swift
    func iLovePasta() {
        print("I love pasta!")
    }
```

If the argument to a function takes in a parameter with the type `Selector`. We can pass along as an argument to this function this `iLovePasta` method by typing out the following:  
```swift
#selector(iLovePasta)
```

The `target` argument should be set to `self`. Why? Because.. `self` is the one that has the `iLovePasta` function available to it! So this tap gesture recognizer object is being added to the `imageview` which will respond to taps (1 tap to be exact), when it is tapped, it will call on the function you passed along to the `selector` argument on `self` (`self` being the current instance of the View Controller).

As this code is being placed inside of a for loop. Each iteration generates a **new** `UITapGestureRecognizer` object. That way each `UIImageView` instance will have its very own `UITapGestureRecognizer` object added to it--and each one when tapped will call on the method you provide to it. You shouldn't have it call on the function `iLovePasta`.

Instead, you should create the following function. `starwarsCharacterChosen(_:)` that takes in one argument named `sender` of type `UITapGestureRecognizer`. This is what should be passed in as the `action ` argument to the `UITapGestureRecognizer` initializer.

You should add a `print()` statement to the `starWarsCharacterChosen(_:)` function, run your app and make sure that when tapping these Star Wars `UIImageView`'s that this function gets called and you see the `print()` statement print whatever you had written to console. If nothing is printing, make sure that `isUserInteractionEnabled` is set to `true` on each `UIImageView` instance which can be done programmatically or in storyboard.

Everything we did above for the Star Wars `UIImageView`'s should also be done for the Star Trek `UIImageView`'s. You should start by implementing the function `setupStarTrekGestureRecognizers()` that does _exactly_ the same thing you did above for the Star Wars `UIImageView`'s, except.. now we're doing them for the Star Trek `UIImageView`'s. The `UITapGestureRecognizer`'s you create within this function should pass the following function to its `action` argument. `starTrekCharacterChosen(_:)`. This new function (which you should now create (not implement!) takes in one argument called `sender` of type `UITapGestureRecognizer`.

Add `print()` statement to this new function and make sure your Star Trek `UIImageView`'s are tappable and printing any message to console before moving forward.

Your `viewDidLoad()` function should now look like this:

```swift
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStarWarsGestureRecognizers()
        setupStarTrekGestureRecognizers()
    }
```

---

Lets go back to the `starWarsCharacterChosen(_:)` function you created above. It's time to implement it now. The parameter name we can work with here is called `sender` which is of type `UITapGestureRecognizer`. Whenever a Star Wars `UIImageView` is tapped, this function is called and the `UITapGestureRecognizer` object associated with that tapped `UIImageView` is passed into this function as an argument. How can we access the `UIView` instance (in this case, we have more detail—-meaning it's a `UIImageView` instance that's associated with this `UITapGestureRecognizer` instance). Any `UITapGestureRecognizer` instance has access to the following stored property. `view`.

`sender.view` is how we can access the `UIView` instance associated with this `UITapGestureRecognizer`. But like I said, it's not a `UIView` instance, more specifically it's a `UIImageView`. So in order to grab access to the `UIImageView` instance associated with the `UITapGestureRecognizer` object, we need to type in the following code:

```swift
let chosenImageView = sender.view as! UIImageView
```
 
This `chosenImageView` constant is of type `UIImageView`. It's also a reference to the `UIImageView` instance tapped on screen. It means we can change/mutate/update or do whatever we want to this `chosenImageView` constant and it will change the appearance of the `UIImageView` on screen.

So.. lets do that! Set the `borderWidth` of this `chosenImageView` constant to 2.0 (this has to be done through the `layer` property (available to all `UIView`s)).  Also, set the `borderColor` to `UIColor.green.cgColor`. 

After doing all of that, we should assign a value to our `starWarsCharacter` stored property. We should assign it the value `chosenImageView`.

Run your app and make sure that when tapping any of the Star Wars `UIImageView`s that a green border appears around every single one.

You might notice that when tapping multiple `UIImageView`s that each one gets its own green border.. but that shouldn't be. What do I mean by that? Well.. we really only want a user to be able to select just one `UIImageView`. How can solve a problem like that?

We can do that with the following line of code. This piece of code needs to be the very first line of code within this function. That way, it will immediately set the `borderWidth` of what was the previously chosen `UIImageView` to 0.0.

```swift
if starWarsCharacter != nil { starWarsCharacter.layer.borderWidth = 0.0 }
```

---

Implement the `starTrekCharacterChosen(_:)` function you created above. You should be doing the exact same thing as you just did when you implemented the Star Wars version of this function.

---

Head over to the `Main.storyboard` file. Create another View Controller Scene. As well, create a `DetailViewController.swift` file that subclasses from `UIViewController`. Setup the custom class of this new View Controller scene to your `DetailViewController`. In Interface Builder, constrain two `UIImageView`'s wherever you like. They should be the same size though (same `width` and `height`). 


Create outlets for the two `UIImageView`s to the `DetailViewController.swift`

```swift
    @IBOutlet weak var starWarsImageView: UIImageView!
    @IBOutlet weak var starTrekImageView: UIImageView!
```

As well, create the following stored properties (right below your outlets):

```swift
    var starWarsImage: UIImage!
    var starTrekImage: UIImage!
```

Next, we will want to setup a segue between the two view controllers. Watch this video (no sound) to see how to do that:

[![](http://img.youtube.com/vi/D30fRpi2i0s/0.jpg)](https://www.youtube.com/watch?v=D30fRpi2i0s "Segue")

---

Head on back to the `ViewController.swift` file. Create a function called `checkForFight()`. In your implementation of this function you should check to see that both the `starWarsCharacter` and `starTrekCharacter` are _not_ nil. If they aren't nil, then you should programmatically perform the segue (using the identifier we created in the video which was "fightSegue".)

You programmatically perform a segue with the following piece of code:

```swift
performSegue(withIdentifier: "fightSegue", sender: nil)
```

Now the question is.. where do we write this code? It should be the last thing called in both the `starWarsCharacterChosen(_:)` function and the `starTrekCharacterChosen(_:)` function. What's happening here is that after every time a `UIImageView` is tapped, it will create a green border around the `UIImageView`, set either the `starTrekCharacter` or `starWarsCharacter` property with the appropriate value (depending on if it was a Star Wars ImageView or Star Trek ImageView which was tapped) then it will call on the `checkForFight()` function which will look to see if both the `starTrekCharacter` and `starWarsCharacter` instance properties are not nil (which means they have values) and if so, we will then perform a segue to the detail view controller.

---

You should now implement `prepare(for:sender:)` function available to all `UIViewController`s within the `ViewController.swift` file. This function will get called anytime someone calls on `performSegue(withIdentifier:sender:)` which is what we're doing in the above function.

In our implementation of this function, we need to grab hold of the `destionation` view controller from the `segue` object and assign values to both its `starWarsImage` and `starTrekImage` instance properties. What values do we assign to them? Well... take at both the `starWarsCharacter` and `starTrekCharacter` properties, they are of type `UIImageView`. In order to grab the`UIImage` associated with a `UIImageView`, you need to access its `image` property.

---

Head on back over to your `DetailViewController.swift` file. In `viewDidLoad()` you should now have the following code:

```swift
tarTrekImageView.image = starTrekImage
starWarsImageView.image = starWarsImage
```

Run your app, select a Star Wars and Star Trek character. It should segue over to the other view controller and display both of those images chosen. If so, keep moving forward!

The following could be done in the `viewDidLoad()` method:

You should create a `UIPanGestureRecognizer` and add it to the `starTrekImageView`. You should create another `UIPanGestureRecognizer` to be added to the `starWarsImageView`. Each of these gesture recognizer objects should call on methods implemented by you on this view controller (similar to how you implemented the `UITapGestureRecognizer`'s in the other view controller). The difference here though is that we want the user to be able to move the `UIImageView` around the screen (like the demo shows us).

How do you do that? Well..... I leave that up to you :)

Make sure user interaction is enabled on both your `UIImageView`s. 

**Advanced**:

Look to see if the two `UIImageView`s are colliding, if so.. change the `backgroundColor` of the `view` to some random color, like so:
 
[![](http://img.youtube.com/vi/VefofQB__80/0.jpg)](https://www.youtube.com/watch?v=VefofQB__80 "Star Wars Trek")

<a href='https://learn.co/lessons/StarWarsTrekLab' data-visibility='hidden'>View this lesson on Learn.co</a>
