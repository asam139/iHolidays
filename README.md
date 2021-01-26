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


## Installation



