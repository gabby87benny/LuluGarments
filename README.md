# LuluGarments

# Given Challenge:
1 - Build two screens as shown:
The first screen shows a list of garment names and buttons to order the list by alphabetical
order or by creation date/time.
A “+” button at the top right corner presents the second screen as a modal view.
The second screen allows saving a new garment in persistent memory, using the database of
your choice. Tapping the “Save” button closes the modal view and returns to the first screen
with the list. The list then shows the newly added garment.
2 - unit test some of the code

# Solution:

1. Displayed list of garments names sorted by Alphabetical order initially. Added sample data initially
2. Displayed results in table view. Designed UI in storyboard using Auto layout.
3. Added capability for user to switch to Alphabetical / Creation date sort using Segmented Control.
4. Added + bar button at top. On tap, displays the detail in the form of modal. Swiping down closes the same.
5. Detail view gives user the capability to add Garment. On Save, closes the modal and saves the data in DB.
6. Implemented Core data as persistence mechanism. Added Save and Retreival operations.
7. Implemented MVVM design with POP approach.
8. Handled error and propogated from network layer through UI.
9. Implemented unit test cases for controllers, view models and DB layer using XCTestCase.
10. App supports iOS 13.0 and later.
11. App supports both orientations.

Nice to do (If i have some more time) :
1. Add more tests towards Modal view, DB manager, etc.
2. Add swipe to delete capability to delete the garment.
