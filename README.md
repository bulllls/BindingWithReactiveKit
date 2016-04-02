
There's an interesting iOS Swift tutorial on wiring up your UI code with reactive binding from Colin Eberhardt over at RayWenderlich. The ["Bond Tutorial: Bindings in Swift"](https://www.raywenderlich.com/123108/bond-tutorial) shows a fluent and expressive way to manipulate how data flows through your app, using the [Swift Bond](https://github.com/SwiftBond/Bond) library.

> Swift Bond is a binding framework that removes the mundane task of wiring up your UI, giving you more time to think about the real problems you are trying to solve with your application.

# ReactiveKit

However, its awesome creator [Srđan Rašić](https://github.com/srdanrasic) now [focuses more](https://github.com/SwiftBond/Bond/issues/200) on his new and improved framework for reactive and functional reactive programming: [ReactiveKit](https://github.com/ReactiveKit/ReactiveKit). To get a feel for the the changes, I recreated the demo app from the tutorial, swapping out Bond in favor of ReactiveKit ([The diff](https://github.com/sohooo/BindingWithReactiveKit/commit/b7300b3dd8c3932c29550aad8a5b4f0623065194?diff=split)).

# The app

![ReactiveKit app](http://i.giphy.com/3o7iN6uySqBSuneTok.gif)

# Setup

First, clone the project:

```bash
% git clone https://github.com/sohooo/BindingWithReactiveKit.git
```

Then install the pods:
```bash
% cd BindingWithReactiveKit/
sohooo@aiur [~/Code/swift/BindingWithReactiveKit (master)]
% pod install
Analyzing dependencies
Downloading dependencies
Installing DatePickerCell (1.0.4)
Installing ReactiveFoundation (1.0.4)
Installing ReactiveKit (1.1.3)
Installing ReactiveUIKit (1.0.10)
Generating Pods project
Integrating client project
Sending stats
Pod installation complete! There are 3 dependencies from the Podfile and 4 total pods installed.

% open BindingWithBond.xcworkspace
```

Finally, open the project and add your 500px API key in `Info.plist` (look for `apiKey: Your key goes here`), as described in the tutorial in ["Using the 500px API"](https://www.raywenderlich.com/123108/bond-tutorial#attachment_124498). Create an account if you need, it's free.

Enjoy!


# Links

- ["Bond Tutorial: Bindings in Swift"](https://www.raywenderlich.com/123108/bond-tutorial)
- This [Github repository](https://github.com/sohooo/BindingWithReactiveKit)
- Framework: [Swift Bond](https://github.com/SwiftBond/Bond)
- Framework: [ReactiveKit](https://github.com/ReactiveKit/ReactiveKit)
