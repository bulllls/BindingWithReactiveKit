
There's an interesting iOS Swift tutorial on wiring up your UI code with reactive binding from Colin Eberhardt over at RayWenderlich. The ["Bond Tutorial: Bindings in Swift"](https://www.raywenderlich.com/123108/bond-tutorial) shows a fluent and expressive way to manipulate how data flows through your app, using the [Swift Bond](https://github.com/SwiftBond/Bond) library.

> Swift Bond is a binding framework that removes the mundane task of wiring up your UI, giving you more time to think about the real problems you are trying to solve with your application.

# ReactiveKit

However, its awesome creator [Srđan Rašić](https://github.com/srdanrasic) now [focuses more](https://github.com/SwiftBond/Bond/issues/200) on his new and improved framework for reactive and functional reactive programming: [ReactiveKit](https://github.com/ReactiveKit/ReactiveKit). To get a feel for the the changes, I recreated the demo app from the tutorial, swapping out Bond in favor of ReactiveKit (currently on: 2.0.0-beta4).

# The app

See [my article](http://txt.intothespirit.com/articles/binding-with-reactivekit/) which includes a nice GIF.

# Setup

__Note:__ the branch `reactivekit-2` currently shows the usage of __ReactiveKit 2.0.0-beta4__.

First, clone the project:

```bash
% git clone https://github.com/sohooo/BindingWithReactiveKit.git
% git checkout reactivekit-2  # 2.0 branch
```

Then install the pods:
```bash
% cd BindingWithReactiveKit/
sohooo@aiur [~/Code/swift/BindingWithReactiveKit (reactivekit-2)]
% pod install
Analyzing dependencies
Downloading dependencies
Installing DatePickerCell (1.0.4)
Installing ReactiveKit (2.0.0-beta4)
Installing ReactiveUIKit (2.0.0-beta4)
Generating Pods project
Integrating client project
Sending stats
Pod installation complete! There are 3 dependencies from the Podfile and 3 total pods installed.

% open BindingWithBond.xcworkspace
```

Enjoy!


# Links

- ["Bond Tutorial: Bindings in Swift"](https://www.raywenderlich.com/123108/bond-tutorial)
- This [Github repository](https://github.com/sohooo/BindingWithReactiveKit)
- Framework: [Swift Bond](https://github.com/SwiftBond/Bond)
- Framework: [ReactiveKit](https://github.com/ReactiveKit/ReactiveKit)
