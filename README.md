Alumni Record  iOS Applications
Developing a multi-view iOS alumni database application with Swift and Xcode that allows users to search, add and edit alumni records in the database. 
Implemented RESTful API endpoints to allow CRUD requests sent from the front-end, with data in JSON.

<img width="200" src="https://user-images.githubusercontent.com/96745697/182013937-1b81c6bd-50cf-4f66-ad35-4dcfdce8822f.png">!
<img width="200" src="https://user-images.githubusercontent.com/96745697/182013946-92479438-4b70-4426-ae3c-ef1ed91696f6.jpg">!
<img width="200" src="https://user-images.githubusercontent.com/96745697/182013949-41679650-a4ec-4160-aaf4-b9cdb3d7f90e.jpg">!
<img width="200" src="https://user-images.githubusercontent.com/96745697/182013951-3772e6ae-599a-452c-be35-6356f397c3ba.jpg">!

#   ECE564_HW 
This is the project you will use for all of your ECE564 homework assignments. You need to download to your computer, add your code, and then add a repo under your own ID with this name ("ECE564_HW"). It is important that you use the same project name.  
This should work fine for HW1 - HW4.  If you decide to use SwiftUI for your user interface, you can recreate with a new project (keep the name) or follow something like this - https://stackoverflow.com/questions/56529488/is-there-any-way-to-use-storyboard-and-swiftui-in-same-ios-xcode-project

Any notes, additional functions, comments you want to share with the TA and I before grading please put in this file in the correspondiing section below.  Part of the grading is anything you did above and beyond the requirements, so make sure that is included here in the README.

## HW1
This is a UI view that allows you to search, add and edit members in thedatabase. You can also use the clear button to clear all the input information. You can enter personal information including firstname, lastname, wherefrom, hobbies, languages, level and role in Duke. After add, found or updated the information, the description of the person would be displayed. I would like the color of display to be black and white, so I choose to use black, white and gray. 

## HW2
The view will contain full information about the DukePerson, including their netID, firstname, lastname, gender, role, hometown, degree, email address, hobbies and languages. I add an ImageView rectangle, the imageview show an avatar for other people. But for myself and my roommate, whose netID is xq47 and bw224, I put our photos there. Besides, I set the requirement, one person can only enter hobbies and languages less or equal than 3. Moreover, I add clear button not only for all textview, but for each textview they also have their own clear button. 

## HW3
The main purpose of this homework is to persist student information to storage so the list of people information goes from session to session.
Feature 1: Use JSONEncoder to persists DukePerson. What's special: I override the encoder and decoder function to support Codable inheritance, avoiding building a class and copy the information from Dukeperson to be saved.
Feature 2: Picture support. I have pictures for all people I list in the netIdbase markdown document. The picture is stored in the DukePerson class as a String of base 64 String. I also use the Image.copy function to make the picture small.
Feature 3: "Choose Photo" support. The UIImageView is a button, and when pressed, it allows the user to "Choose a photo" from their Photos. 
Feature 5: My dukuperson data model is ready to support the entire ECE JSON Grammar as shown. The "Department" and "ID" will never be displayed.

Extra:   
1.You can search people both by their netID or firstname and lastname.
2.The Clear button allows user to clear all the input information. Besides, for each textinput, it has its own small clear button.
3. Database includes 5 people, as well as their photos.
4. There is a switch on the right side of the "ECE 564 Information" title, which can change the background color.
5. The description is always bouncevertical, which means it can always show all the description.

## HW4
The main purpose of this homework is to connect to the server, upload and download the information from the server. we will mainly focus on using TCP/IP and HTTP, and use JSON to pass information to a web server.
Feature 1: Using HTTP/REST to send my own information to a web server in the ece 564 json grammar. Controlled by a unique token. Token used in the basic authentication field of the http data request.  Plan to call this REST API whenever you change your personal information and hit save.
Feature 2: Download the latest information about the entire class. Only download when request.  After load, asking whether to refresh. If yes, HTTP GET of the server data. 
Feature 3: Error checking, data mapping. Bad data and mistaken information from the server would not crash my app.For example: If not match gender, put unkown.

Extra:
1. Clear button.
2. Search matches for netid or firstname & lastname.
3. The description is always bouncevertical.
4. Button to change the background color.
5. Pop up alert window at the beginning, asking whether to update the information.
6. A label at the bottom of the view to see whether the download is finished.


## HW5
The goal of HW5 is to create a multi-view iOS app that contains a “master” view, we will call the List/Table view and a “detail” view we will call the Information view.
I use storyboard and code to implement the views.
Feature:
1. implement the List/Table view, and the List/Table has a Navigation Bar.
2. The List/Table view should show everyone in the class, in multiple sections with section headers: “Professor”, “Teaching Assistant", Team name - one section for each Team.  If a Student has a blank, nil, or “none” Team field, just put them in a section called “Student”
3. On the List/Table View, have an “Add” or “+” button on the Navigation Bar to add new people in database.When “Add” is pressed on the List/Table View, present an Information view to add a new “Person” to the class.
4. Add a Search Bar to the List/Table view.  Search is only required on netid.  
5. Create a row/cell type for displaying the “Person” information.  This will be used to display the different people.  The row/cell must contain:Person’s picture,Person’s name,Person’s description. When a  row/cell is selected, show the Information View in READ ONLY mode.
6. On the Information View, add an “Edit” button (could be on a Nav Bar if you have one, or anywhere on the screen). When pressed, the fields become Editable and the Button changes to “Save”. When “Save” is pressed, the information about the Person is saved.  If it is you, also send the new info up to the server. Have a way to “Cancel” or exit without saving from edit mode.
7. Move the logic to prompt for a server Refresh to the List/Table view.  A Refresh button.(Please press the retreive button on the right corner!!)

Extra:
1. In the add/edit people view, when press edit, the clear button would appear, if pressed, all information except netID would be clear.
2. There is a small button on the left corner, which enables the user to change the view color.
3. The description in the table view is all shown. And in the information view, you can roll up and down to see all the information.
4. The background color of each cell, and the information view, is all duke blue.
5. Besides the name, description and picture, the netID for eachperson is also shown, which is more convenient for search.

## HW6
The goal of HW6 is to polish the app (make it look nice) and add some final key features before we get into the final stretch of HW7.
1. Add a button to be able to "Flip" your Information view.   Use the .flipHorizontal transition style to make it look like you are flipping the Information View over.    Think of the Information View as a "card".  When you press the "Flip" button, you see the back.  On the "back" of the card, you will need a "Flip" button as well to come back to the "front".
2. On the back of the card, just put some text on the back using Attributed Text with some interesting attributes.  
3. Swipe Action support. On the Table View, enable Swipe actions for Delete and for Edit.  When you Swipe left on a Table Cell, 2 options should appear - Delete and Edit.  If you select Delete, remove the entry from the table and your data model.  If you select Edit, go to the Information View in Edit mode.

Notice: please wait for 3 seconds for the inital retrieve database.

extra:
1. When using search bar, it can flexible search lower case letter or high case letter. Ex: search "xq47" or "XQ47"
2. Fliping at its back, you can see an interesting name animation.
3. I use two different style name animation.
(This animation is provided from an open source project: https://github.com/franklinsch/iOSDrawTextAnimation
constructed by Franklin Schrans and Frederik Riedel)
4. beautiful appicon
5. error checking: If a person not enter his/her team name, it would be in student section. Professor Richard would be just in professor section. 


## HW7
The purpose of this Assignment is to have hands-on experience creating visual user interfaces - Attributed Text, Animated Images, Image Contexts, Graphics and Animation. You use these capabilities when you want to fill a View with your own content – not just use the pre-made Views like a Table View or a Text View.  You will create the “flip side” of the Information View about yourself.  We will call this the Drawing View. This is only for you, not everyone else.  For everyone else, leave as is from HW6. Much like a trading card, one side has your information, the other is a picture, but in this case the picture will be an animated scene of one of your Hobbies (important!).  Here are the specifics:

 
1. When you swipe YOUR Information View to "flip" the view, the View will be replaced by a screen-sized Drawing View you created.  Make sure swiping back works as well!
2. The Drawing MUST reflect something about one of the 3 hobbies you listed on your last homework Assignment.  Not following this will lead to loss of points. My example is hiking. A mountainview as the background, me and my dog are hiking together.
3. Make sure that the Drawing of you only appears on the Information View about you!  Your code must detect if the current Person has a Drawing View or not, and just present the "back" view from HW6 for that person if they don't.
4. Finally, the Drawing MUST contain the following 5 elements:

(1) Attributed Text  : My first name

(2) An Animated UIImage (like my fan example) : the sun 

(3) Another UIImage that was created inside a UIGraphics Image Context with VECTOR graphic drawing orders (like a Bezier curve, Rect, Ellipse, Path, etc.).  That is, an image created inside a Begin/End Image context.
example: I draw a red heart inside the small black ball

(4) Your own UIView subclass that has a draw method to create the contents (like my Duke Ball example)
exmple: small black and red ball, for my dog

(5) UIView or Layer Animation – using any of the various animation techniques, make something move in the view (in addition to the Animated UIImage mentioned above). example: hiking path

extra:

1. repeat button to repeat the animation
2. a music button with beautiful picture
3. when you press the music button, there would be birds sounds. When you filp back, the sounds would stop
4. animation for my name
5. nice layout, dog is attacked by the small red ball and I go hiking with my dog. when hiking, birds sounds makes the environment comfortable.


