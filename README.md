# AzureOverall: Eat at a Distance

## Overview

For the good of the public, it is important that people maintain social distancing. That means fewer trips to the supermarket, where aisles can often be less than six feet apart. As a result, small markets and vendors are feeling the pain of a drop in revenue.

Pursuit Farms is building a delivery service to rescue their business. They've contracted you to create the prototype of their new app, AzureOverall. Using AzureOverall, a user should be able look through available recipes and add as many as they would like to their cart. Payment and delivery will be handled by a third-party service.  

This project is a 2-day take home coding challenge from Pursuit.org.

## App Details

- A native iOS application in Swift and Objective-C.
- Recipes are fetched from the Spoonacular Recipe API: https://spoonacular.com/food-api
- Three screens are be implemented: A **Browse Screen**, a **Cart Screen**, and a **Detail Screen**.
- The **Browse Screen** has a search bar and a collection view. By default, nothing is loaded. Searching for a keyword in the search bar should load a list of recipes into the Collection View. Each cell displays the recipe's image, the recipe's title, the number of servings, and the time it takes to prepare.
- The **Cart Screen** has a table view. Each cell displays the title of the recipe, its image, and the current number of times it has been added to the cart. 
- Selecting a cell in the Browse Screen or in the Cart Screen navigates to a Detail Screen for that item. 
- The **Detail Screen** displays the title and image of the recipe. It displays the current number of items in the cart, and includes a stepper that allows the user to add/remove multiple items to/from their cart. 
- Changes from the Detail Screen persists and are available and visible throughout the app after each launch.


## Technical Details

- Clean, well-architected, intuitively-named code
- Intuitive and well-designed user interface
- Displaying collections of information
- Network requests
- Memory management
- Multithread processing
- Using the `Data` type
- Source control

## UI

