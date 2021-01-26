# iHolidays
[![Platforms](https://img.shields.io/badge/platforms-iOS-lightgrey.svg)](https://github.com/asam139/iHolidays)
[![Swift](https://img.shields.io/badge/Swift-5.0-orange.svg)](https://swift.org)
[![Xcode](https://img.shields.io/badge/Xcode-12.0-blue.svg)](https://developer.apple.com/xcode)

iOS App using MVVM-C with Clean Architecture

## Requirements

- **iOS** 11.0+ / **macOS** 10.15+ / **Xcode** 12.0+
- Swift 5.0+

## Arquicture

The app uses the MVVM-C with a Clean Architecture.

<p align="center">
  <img src="https://raw.githubusercontent.com/asam139/iHolidays/master/Assets/architecture.jpg" title="Architecture" width="100%">
</p>

### Clean Arquicture

So in the first place, why do we want to use clean architecture?
- Separation of Concerns —Separation of code in different modules or sections with specific responsibilities makes it easier for maintenance and further modification.
- Loose coupling — flexible codes can be easily changed without changing the whole system.
- Easily Testable

Let’s consider there are three layers in the project in general: App (View), Data, Domain.

* Data: In this layer, you have an abstract definition of the different data sources, and how they should be used. Mappers that map server response to database models, models that are the response model of the server, Repository to implement API calls, database operations, a database for implement Dao interface and API package for define API calls methods from server. In a typical App, we usually keep the repository interface and repository in the same package and we can do it locally so we can have access everywhere directly but in this case, the data layer should never know about other layers.
* Domain: This layer is known as business logic. These are the rules of your business. It contains a model package that contains the database models. 
* Repository which is only the interface and the use cases. So what is a use case? as we know use cases only do one job and in this for characters when we want to get data from the database we write one use case that its job is only to get data from the database.

### MVVM

In the second place, why do we use MVVM?. 

MVVM guides us how to distribute responsibilities between classes in a GUI application (or between layers - more about this later), with the goal of having a small number of classes, while keeping the number of responsibilities per class small and well defined.

'Proper' MVVM assumes at least a moderately complex application, which deals with data it gets from "somewhere". It may get the data from a database, a file or a web service.

## Frameworks

In this section it defends the reason to use each framework installed in the project.

### RxSwift

This advantages are several but the most importants are: 
- Asynchrony is simplified with Declarative Code.
- Multithreading is simplified.
- Cleaner Code & Architectures.
- Composable Components.
- Multi-Platform

Conversely the downsides are mainly two:
- The learning process can be quite intimidating at the beginning.
- You need to be familiar with block closures and functional programming concepts.
- It is easy to create memory leaks if you are not careful with self references inside closures.

Finally, to sum, reactive programming help you to write better, cleaner code and create components that can be reused in a robust codebase that can evolve. So the  disadvantages are justified. 

### Swinject

Swinject is framework to manage the DI (Dependency Injection) so the best way to justify it it is explaining the reason to use DI.

Dependency Injection is a pattern that allows an object to be injected in a way that is completely independent of any object consumption. This improves when any change needs to be made on one side will not impact another side implementation.
Dependency injection separates the creation of an object dependency from the object behavior, which allows program designs to be less coupled.

We could to create own implementatio to manage DI but Swinject is well maintained and developed by the community powered by the Swift generic type system and first class functions to define dependencies of your app simply and fluently. Besides it supports a lot of ways/plugins to register components which improve and simplify the organizacion

### Moya

Firstly, Moya is a abstraction layer over Alamofire. If you know Alamofire is used to abstract away access to URLSession and all those nasty details. 

Nowadays, looking at the URLSession APIs available, it’s a lot easier to build up network requests. However, doing so will likely move you towards building your own networking layer on top of URLSession. This layer needs to be tested and can potentially grow towards a more complex layer as your project evolves.

With that in mind, taking the fact that Alamofire is well maintained and used by a lot of projects, you’re probably saving yourself a lot of hassle and time by adding Alamofire as a dependency. Besides, it is quite small and makes it way more elegant to write network requests.

On the hand it needs to explain the reason to add one more abstraction layer as it is Moya. Moya solves some problems that Alamofire does not manage as:

- Abstracts away the nitty gritty of URLs, parameters, etc
- Lets you define a clear usage of different endpoints with associated enum values.
- Treats test stubs as first-class citizens so unit testing is super-easy.
- Plugins to log, authentication, etc.

### XCoordinator





