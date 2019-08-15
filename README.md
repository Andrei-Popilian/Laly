![a0d38835-1277-4a95-a975-66693b8c3fec_200x200](https://user-images.githubusercontent.com/45980382/63086325-ed88d500-bf4f-11e9-9973-5df46b4ba4ea.png)

Laly is an lightweight framework ment to reduce the ammount of code used while using NSLayoutAnchor or NSLayoutConstraint.
It's easy to learn, read and write and debug.


### Table of Contents
 1. [Setup](#setup)
 1. [Problems, Suggestions, Pull Requests?](#problems-suggestions-pull-requests)

## Setup
### Compatibility
The current release of Laly supports the following versions of iOS and OS X:

* Xcode
  * Language Support: **Swift** *(5.1)*
  * Fully Compatible With: **Xcode 11.0**
* iOS
  * Fully Compatible With: **iOS 9.0**
  
### Using [Carthage](https://github.com/Carthage/Carthage)
1. Add the `Andrei-Popilian/Laly` project to your [Cartfile](https://github.com/Carthage/Carthage/blob/master/Documentation/Artifacts.md#cartfile).

  ```ogdl
  github "Andrei-Popilian/Laly"
  ```

1. Run `carthage update`, then follow the [additional steps required](https://github.com/Carthage/Carthage#adding-frameworks-to-an-application) to add the framework into your project.
1. Import the Laly framework/module.
  * Swift: `import Laly`

That's it - now go write some beautiful Auto Layout code!

## Problems, Suggestions, Pull Requests?
Please open a [new Issue here](https://github.com/Andrei-Popilian/Laly/issues/new) if you run into a problem specific to Laly, have a feature request, or want to share a comment. Note that general Auto Layout questions should be asked on [Stack Overflow](http://stackoverflow.com).

Pull requests are encouraged and greatly appreciated! Please try to maintain consistency with the existing code style. If you're considering taking on significant changes or additions to the project, please communicate in advance by opening a new Issue. This allows everyone to get onboard with upcoming changes, ensures that changes align with the project's design philosophy, and avoids duplicated work.
