# Swipable Card Demo
 Swipeable Card Views showing data from server
 
 ## Installation
 After taking a pull or downloading the zip, open it in xcode.
 Check the pod and you will find two pod there
 ```bash
 pod 'CardSlider'
 pod 'iCarousel'
 ```
 Setting up pod
  open the terminal at folder
 ```bash
 pod init
 pod install
 ```
 you're good to go now install and run the build.
 
## Demo
Select your preferrable device then Buiild and run the current scheme.

After successfully launching you'll see an initial screen with button - Demo One and Demo Two.
Press any one of it. Press any one of it. 

## Demo One Visual Display
![](demoOne.gif)


## Demo Two Visual Display
![](demoTwo.gif)

## Framework Used
CardSlider for sliding effect and scrolling through to different cards and modify some files to our need.
iCarousel for second Demo carsousel effect.
I didn't used any network library for fetching network request just the Apple native URLSession Class from Foundation framework but I would prefer Alamofire over it.

## Improvements Needs to be done
- Change the card slider to better one.
- Need to improve UI of Detail view.
- Refresh back to index.

