#  Adam Balzan - William Hill Tech Test

## Screen Design

Screen design is MVC pattern with SRP in mind

## Code / Folder structure
### Models:
Holds the data structure of the Json Feed
### View Controllers:
Hold the View Controllers of the application (UIViewControllers and UITableViewControllers)
### Cells:
hold the tableview cell that is re used for Daily and hourly tables
### Icons:
Holds the static images that match the "icon" property of the Darksky API
### Other:
DarkSkyDataRequest.swift is the service class that will request data and return objects / arrays of objects
Main.storyboard is the interface file 


The idea is to have most logic in ViewModel, keeping ViewController slim -- which is not reliable and reasonable to unit test.
Service is Dependency Injected to ViewModel so it can be overriden in unit tests to simulate different behaviours (success / error)

## Unit Tests

Written unit tests are stable and fast. Unit tests don't manipulate UI or access Network (try unplug network and run the tests)

## How to compile

You need Xcode 9 / Swift 3.

## Additional features of this App:
Pull to Refresh
