[![swift-version](https://img.shields.io/badge/swift-5.2-brightgreen.svg)](https://github.com/apple/swift)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
![GitHub Workflow Status (branch)](https://img.shields.io/github/workflow/status/adessoTurkey/boilerplate-ios-swiftui/iOS%20Build%20Check%20Workflow/develop)

iOS SwiftUI Boilerplate
============================

This is the iOS SwiftUI Boilerplate created by adesso Turkey for new projects using Swift 5. The project's primary objective is to help the development of a new one to kick-start the environment with configurations, the required features used in common adesso projects, and the helpful functionalities.

Table of Contents
-----------------

- [Prerequisites](#prerequisites)
- [Branching Strategy](#branching)
- [Project Structure](#project-structure)
- [Workspace Preparing](#workspace-preparing)
- [List of Frameworks](#list-of-frameworks)
- [License](#license)

## Prerequisites

- [MacOS Monterey (12.5 or higher)](https://support.apple.com/kb/SP777)
- [Xcode 14 or higher](https://developer.apple.com/download/) ~ Swift 5.7
- [CocoaPods 1.4.0 or higher](https://cocoapods.org/#install)
- Swiftlint - To Install SwiftLint, please check Swiftlint Installation section from read me file 

## Swiftlint Installation 

- On the directory of `{project_root}/scripts/installation`, via terminal
    - run `sh swiftlint.sh` to install brew (if necessary) and swiftlint.


## Branching Strategy

Gitflow is a legacy Git workflow that was originally a disruptive and novel strategy for managing Git branches. Gitflow has fallen in popularity in favor of trunk-based workflows, which are now considered best practices for modern continuous software development and DevOps practices. Gitflow also can be challenging to use with CI/CD.

| Branch | Description |
| --- | --- |
| **Main** | In the Git flow workflow, the main branch is used to store code that is release-ready and ready for production. |
| **Develop** | The develop branch contains pre-production code with recently built features that are currently being tested. It is established at the beginning of a project and maintained during the development process. |
| **Feature** | You will create a feature branch off the develop branch while working on a new feature, and once it has been finished and carefully reviewed, you will merge your changes into the develop branch. |
| **Hotfix** | The hotfix branch is utilized in the Git pipeline to swiftly address required changes in your main branch. Your main branch should serve as the base for the hotfix branch, and it should be merged back into both the main and develop branches. |
| **Release** | The release branch should be used when preparing new production releases. Typically, the work being performed on release branches concerns finishing touches and minor bugs specific to releasing new code, with code that should be addressed separately from the main develop branch. | 


- Branch names should start with feature, hotfix or release according to purpose of the branch then should continue with ticketid. see example: feature/BSU-1234
- Pull requests should refer to specific issue with ticketid. see example: [BSU-1234] - New feature
- Merge strategy: Rebase and Merge is preffered for maintaining a linear project history.

## Project Structure

| Name | Description |
| --- | --- |
| **Application/Services**/ | Application based services will be defined here, such as logging, network, server... |
| **Configs**/ | Everything relative to build and environment configuration will be defined here |
| **Managers**/ | Managers will be put here such as LoggerManager, UtilityManager... |
| **Network**/ | Network related implementations will be defined here. You can find network related developments under feature/adesso-network branch. If you want to use it, you can merge it to develop easily. |
| **Scenes**/ | Application related scenes will be defined here, such as navigation viewcontrollers, storyboards... |
| **Utility**/ | Extensions, final classes etc. will be putt here  |
| **Resources**/ | Images, icons, assets, fonts, Mocks, `Localizable.strings`... 

## Workspace Preparing

#### Networking Layer (Optional)   
 
- If you wish to use an `async-await network layer` in your application
    - you can merge the `BSU-0020` optional branch. This is an optional feature, and merging it into your codebase will enable the use of async-await for network requests.

    ```shell
    # switch to the "develop" branch
    git checkout develop

    # fetch the latest version of the "BSU-0020" branch
    git fetch origin BSU-0020

    # merge the "BSU-0020" branch into the "develop" branch
    git merge origin/BSU-0020
    ```

    then you can start the workspace preparing.

- On the directory of `{project_root}/scripts/installation`, via terminal
	- run `./rename-project.swift "$NEW_PROJECT_NAME"` to change project name.
	- run `sh install-githooks.sh` to install git-hooks into your project. Includes following git hooks; Git hooks include SwiftLint validation, git message character limitation and issue-id check
		- pre-commit: This hook provides swiftlint control to detect errors quickly before commit.
		- commit-msg: This hook checks that messages must have a minimum 50 characters. It also tells it should contain an issue tag. Ticket id must be between square brackets and [ticketid] separated by hyphens. See example: "[ISSUE-123] commit message" or "[JIRA-56] - commit message"
	
- On your project root via terminal
	- run `pod install` - this command will regenerate workspace with Xcode.
		- [pod](https://cocoapods.org/) command & project's dependences.
	- run `open *.xcw*` - this command will open generated workspace with Xcode.

## List of Frameworks

| Framework | Description |
| ------------------------------- | --------------------------------------------------------------------- |
| [SwiftLint](https://github.com/realm/SwiftLint) | A tool to enforce Swift style and conventions. |
| [Swifter](https://github.com/SwifterSwift/SwifterSwift) | Tiny http server engine written in Swift programming language. |
| [CocoaLumberjack](https://github.com/CocoaLumberjack/CocoaLumberjack) | Powerful & flexible logging framework. |
| [CocoaDebug](https://github.com/CocoaDebug/CocoaDebug) | iOS debugging tool. |

## Useful Tools and Resources

- [CocoaPods](https://cocoapods.org/) - CocoaPods is a dependency manager for Swift and Objective-C Cocoa projects. It has over 33 thousand libraries and is used in over 2.2 million apps. CocoaPods can help you scale your projects elegantly.
- [SwiftLint](https://github.com/realm/SwiftLint) - A tool to enforce Swift style and conventions.
- [TestFlight](https://help.apple.com/itunes-connect/developer/#/devdc42b26b8) - TestFlight beta testing lets you distribute beta builds of your app to testers and collect feedback.
- [Appcenter](https://appcenter.ms/) - Continuously build, test, release, and monitor apps for every platform.

## Join the crew!

[Act now to join][linkedin/jobs] our team and become an adessi — enjoy a Great Place to Work!

## License

```
Copyright 2020 adesso Turkey

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

[linkedin/jobs]: https://www.linkedin.com/company/adessoturkey/jobs/
