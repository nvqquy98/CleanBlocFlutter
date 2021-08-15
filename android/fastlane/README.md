fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew install fastlane`

# Available Actions
## Android
### android buildDevelop
```
fastlane android buildDevelop
```
Build Develop
### android buildStaging
```
fastlane android buildStaging
```
Build Staging
### android buildProduction
```
fastlane android buildProduction
```
Build Production
### android test
```
fastlane android test
```
Runs all the tests
### android distributeDevelop
```
fastlane android distributeDevelop
```
Submit a new Develop Build to Firebase Distribution
### android distributeStaging
```
fastlane android distributeStaging
```
Submit a new Staging Build to Firebase Distribution
### android distributeProduction
```
fastlane android distributeProduction
```
Submit a new Production Build to Firebase Distribution

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
