This demo shows two different branches (master & xcode64) with the same projects but tested against different XCode versions and breaking changes between them.


####Master branch build status: 
[![Build Status](https://travis-ci.org/austimkelly/MovingHelper.svg?branch=master)](https://travis-ci.org/austimkelly/MovingHelper)

This demo is built targeting XCode 7 and Swift 2.0.

####xcode64 branch build status: 
[![Build Status](https://travis-ci.org/austimkelly/MovingHelper.svg?branch=xcode64)](https://travis-ci.org/austimkelly/MovingHelper)

This demo is built targeting XCode 6.4 and Swift 1.2

####Additional Resources

Some other helpful resources for testing and scripting with Travis CI:

   * [Testing Multiple iOS Platforms on Travis](http://andreas.boehrnsen.de/blog/2014/02/testing-multiple-ios-platforms-on-travis/) - Some tips for testing against > 1 iOS version on the simulator.
   * [Travis CI XCode Configurations](http://docs.travis-ci.com/user/languages/objective-c/) - What simulators and such are available against each XCode version.
   * [Stripe SDK](https://github.com/stripe/stripe-ios) - This is just a good demonstration of maintaining an SDK with multiple branches, XCode versions, and some advanced testing, static analysis.
   * [xctool](https://github.com/facebook/xctool) - A drop-in replacement for the `xcodebuild` cmd-line tool. Install with `brew install xctool`. See also the blog post by [NSHipster](http://nshipster.com/xctool/).
   * [Travis CI Lint Tool](http://lint.travis-ci.org/) - Find syntax errors before you push them to version control!
