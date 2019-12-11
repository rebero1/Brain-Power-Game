Name: Haochen Zeng
Email: hzeng4@u.rochester.edu
Course: CSC 214 - Mobile App Development (iOS)
Instructor: Arthur Roolfs
 
Assignment #: Project 3
 
 
I affirm that I have not given or received any unauthorized help on this assignment, and that this work is my own.
Date: 12/4/2019
 

Description:
This is game is called BrainPower. In summary, the game will show you pictures, and you will need to memorize  them. After a period of time, you shall be asked to to chose those pictures. The game will calculate your score based on the correct answers.

Level of difficulty:



The game has 3 level of difficulty. n creating your profile with additional key, you see an option of choosing difficulty.  Easy, medium, hard


Level 1  is easy:

In easy level. You will see 4 pictures, and you shall have  5 seconds to memorize each picture.
 
Level 2 is medium :

In medium level. You will see 5 pictures, and you shall have 3 seconds to memorize each picture.

Level 3 is hard:


In hard level. You will see 6 pictures, and you shall have 2 seconds to memorize each picture. 



Background:



In the background, you shall choose either white or black. The tableview is always white, the rest depends on your preference.


ViewControllers in details.


		TableView


The first is the tableView which will be used to display the profile of the user.

The Tableview has 3 button on the top

		A. Edit

Edit is used to delete profiles
		
		B. Score

Score uses, USERDEFAULT, to display the highest score and the number of times you played the game. 

		C. Is plus key

Plus is used to add a profile of the user.



		
		DetailView( Viewcontroller)

This will display the pictures  according to the level of difficulty you chose. There is a button named TestMemory click it when you are done seeing new pictures.
This has animations and transition which helps to display the pictures. There are 2 transitions and 2 animation all are used randomly to display pictures.


		PictureView (ViewController)

This displays pictures in gridView. You will need to select the pictures you saw in previews page. The  images are 20 in total.
When  you select on it will become gray. There are Done button on top. Select it when you are done choosing your pictures. Done will take you to the score view


		ScoreView(ViewController)

The scoreView will display your score. If you tap it, (Gesture recognizer) it will rotate the score as animation. There are two most important button on top. 
Train: training will open another a webView, and web view will be displayed in white. It will use your internet and open a page online to which will train you on how to memorize things. 

		WebView(VieWController)

It will help you take you on a page online which will help you to memorize pictures. There are guidelines on how to memorize things. 





			UserDefault.

User default are implemented in 3 different places.

	1. It is implemented to store the highest score of the user. If you click  score at Tableview you should be able to see it.
	2. It is implemented to track how many times  you played the game. The number is displayed along with the highest score.
	3. When you open the page for the first time, you will see an alert, to avoid this alert Userdefault is used to remember that you already saw it.

	
			Gestures

Gestures is used in ScoreView. If you tap  on its view  it will listen and  then rotate  the screen accordingly. 

Gestures  are also implemented in picturesView. Since we have many pictures, gestures is used to listen when you tap  on an icon.

		
			Transition and  animation

Animation and transition are implemented  on the detailView, where the images are being displayed. There are many images and displayed with animation and transition combined. 
ScoreView also implements animation when you click on the view, it will rotate -90 degrees.


			Coredata


Is used to store the profile  of the user, background, name....


			Colors

The user can choose between white and black background 

			Alerts

There are many alerts in the app. The first one is the alert you see when you turn the app. Second,  is used to display highest score.  The third one is used to ask the user if they want to resume the game.


			RESUME GAME

When seeing pictures, you can close the app and open it again. When resuming the timer will pause, and the alert will show up asking if you want to resume, select yes, and wait for 1 second and there you go.  Don't 


			Localization

There are two language which you can choose dependently. 


	




 
Note to TA:
Have fun. 