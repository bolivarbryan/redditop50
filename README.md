**Welcome to ReddiTop50!**
===================

> **Guidelines**
>  - Assume the latest platform and use 
>  - Use UITableView / UICollectionView to arrange the data.
>  - Please refrain from using AFNetworking, instead, use NSURLSession
>  - Support Landscape
>  - Use Storyboards
> 
> **App should be able to show data from each entry such as:**
> - Title (at its full length, so take this into account when sizing your cells)
> - Author
> - Entry date, following a format like “x hours ago” 
> - A thumbnail for those who have a picture.
> - Number of comments
> 
> In addition, for those having a picture (besides the thumbnail),
> please allow the user to tap on the thumbnail to be sent to the full
> sized picture. You don’t have to implement the IMGUR API, so just
> opening the URL would be OK.
> 
> **Also, include:**
>  - Pagination support
>  - Saving pictures in the picture gallery
>  - App state-preservation/restoration
>  - Support iPhone 6/ 6+ screen size
> 
> Note: Please refrain from using external libraries (by way of using
> CocoaPods and similar), as we want to see your coding skills as much
> as possible.

----------

	**Models**
=======

- **Post**: [www.reddit.com/top.json](www.reddit.com/top.json)


Property    					| Type 						| Description 							| JSon 					
-------- 						| ---  						| -------------------- 					| ----						
ID 		 						| String   					| ID of the post 						| id						
Title    							| String  					| Title of the post 					| title						
URL      						| URL	   					| Links to post 							| url						
Author	 						| User						| Refers to User's Model 			| author				
EntryDate    				| Date						| Creation date							| created				
Thumbnail   				| URL (optional) 		| Refers to thumbnail's URL 	| thumbnail			
Comments 					| Array of Comment | Refers to Users comments 	| permalink			
Number of comments 	| Int 							| Number of comments 			| num_comments	
Image 							| Image (optional) 	| Refers to post image 			| preview				



 - **User**: [https://www.reddit.com/user/{user}/about.json](https://www.reddit.com/user/%7Buser%7D/about.json)
 
Property    					| Type 		| Description 										| JSon			
-------- 						| ---  		| -------------------- 								| ----				
Name 		 					| String   	| Username 											| id				
Created    					| Date  		| Account creation date  						| title			
Link Karma      			| Int	   		| Points received from posts 				| url				
Comment Karma	 		| Int			| Points received from comments		| author		


 - **Comment**: Post.Comments
 

Property    			| Type 		| Description 							| JSon			
-------- 				| ---  		| -------------------- 					| ----				
Body 		 			| String   	| Body of the comment 			| body			
Author    				| String  	| Author of the comment  		| author		
Comments      		| String	   	| Comments of comments 		| children		


- **Image**: Post.Image

Property    	| Type 					| Description 			| JSon 					
-------- 		| ---  					| -------------------- 	| ----						
URL 		 	| URL (optional)   | Image URL 			| source.url			
Height   		| Int  					| Image height 		| height					
Width      		| Int	   					| Image width 			| width					


----------

	**ViewModels**
=======

- **PostViewModel**


Property    					| Type 		| Description 							
-------- 						| ---  		| -------------------- 					
Time ago 		 			| String   	| Formats and shows how long ago this post was created				
Author name   			| String  	| Author's name 						
Number of comments  | String	| Number of comments 			


----------

	**Use Cases**
=======

- **As a user I want to be able to see a list of top posts in home screen**

Subtask   												| Conditions 											| Status
-------- 													| ---  														| ------
Fetch data from server							|																| [Pending]
Save Fetched data in local database		|																| [Pending]
Offline use												| Loads previous records from server		| [Pending]									
Use of tableview for listing posts			|																| [Pending]
Add Pagination in TableView					|																| [Pending]
Add cell for text only posts						| Only text												| [Pending]
Add cell for link posts								| Text + thumbnail									| [Pending]
Add cell for image posts							| Text + image											| [Pending]
Add empty state										|																| [Pending]
Open options for tapping image				| Watch fullscreen, Save Picture				| [Pending]
Open Url after tapping thumbnail			| Open safari											| [Pending]



- **As a user I want to be able to see a list of comments of a Post**

Subtask   																	| Conditions 			| Status
-------- 																		| -------------  			| ------
List post’s comments in a tableview							|								| [Pending]
Link to Same comments view if it has subcomments	|								| [Pending]
Link to user profile after tapping username				| 								| [Pending]					


- **As a user I want to be able to see a user's profile**

Subtask   												| Conditions 			| Status
-------- 													| -------------  			| ------
Show karma count for comment				|								| [Pending]
Show karma count for links						|								| [Pending]
Show link for user profile in safari			| Tappable				| [Pending]	


----------


	**Views**
=======
