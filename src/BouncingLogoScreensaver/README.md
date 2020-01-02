# BouncingLogoScreensaver
Display your square logo image in a beautiful way. 

To implement this component in a project which is not using ukor, simply copy the files in the BouncingLogoScreensaver directory into your project. 
This will add it as a public screensaver. Adding the line `screensaver_private=1` to your manifest file will make it a private screensaver. 

There are two different ways to add a screensaver to your Ukor project. One is simply adding it into your flavor, either by directly copying it in like the above method, or adding it as a separate source. The other option is to create a separate flavor which is your regular one plus a screensaver. 

To add the screensaver as an additional source to your main project, enter the ukor.properties.yaml file and modify your targeted 
flavor in the following way:

flavors:
  main:
    src:
      - main
      - 'BouncingLogoScreensaver'

Doing this, alongside entering your company's images in the 
BouncingLogoScreensaver/images folder and modifying the image file 
name in the BouncingLogoScreensaver.xml file will make the 
screensaver channel functional in your application.

To implement the channel with the screensaver as a separate flavor, enter the ukor.properties.yaml file and modify it in the following way:

flavors: {
  main: {
    src: ['main']
  },
  BouncingLogoScreensaver: {
    base: 'main',
    src: ['BouncingLogoScreensaver']
  }
}

Then to make this flavor, run the command `ukor make BouncingLogoScreensaver`.