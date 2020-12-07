# PiggyPilot
Financial App

Install Flutter and Android studio (Windows):
  1. Google 'Flutter'
  2. Choose website flutter.dev
  3. Click get started
  4. Choose operating system 
  5. Download .zip file and extract (not to cloud)
  6. Search env in search bar and select edit environment variables
  7. Hit environment variables button
  8. Edit the path to your folder containing: flutter\bin
  9. Open Console
  10. Type 'flutter doctor' and hit enter
  11. A list of dependencies will show up based on what you need to install (Android studio, android tool chain, flutter)
  12. Google android studio and hit the link to download it and extract the file (not to cloud)
  13. Run flutter doctor again and you should only have an X for android toolchain
  14. Copy and paste the sentence that is listed after toolchain and click y for each question 
  15. If you have all green checks you are ready to go
  
Install Flutter and Android studio (Mac):
  1. Google 'Flutter'
  2. Choose website flutter.dev
  3. Click get started
  4. Choose operating system 
  5. Download .zip file and extract (not to cloud)
  6. Open terminal and find where you installed the flutter SDK package
  7. Type this into the console: 'export PATH="$PATH:[PATH_TO_FLUTTER_GIT_DIRECTORY]/flutter/bin"' (in the [] enter your own path)
  8. Type 'flutter doctor' into the terminal and hit enter
  9. A list of dependencies will show up based on what you need to install (Android studio, android tool chain, flutter, xcode (not needed))
  10. Google android studio and hit the link to download it and extract the file (not to cloud)
  11. Run flutter doctor again and you should only have an X for android toolchain
  12. Copy and paste the sentence that is listed after toolchain and click y for each question 
  13. If you have all green checks you are ready to go
  
Compile:
  1. Download files from github and save to the Android Studio folder
  2. Open Android Studio
  3. Click on Open existing Android Studio project (Locate the folder within the Android Studio folder)
  4. Click on folder and click to open
  5. Once code is loaded in, there is a library folder(lib) on the left that has all of the .dart files that has the apps code
  6. Click Tools on the taskbar and hit AVD Manager
  7. Click create virtual device
  8. Choose the pixel 3 and click next
  9. Download the Q release name and click next
  10. Click finish
  11. Now you will see a list of all virtual devices, so click on the green play button on the right in the actions column (This will open the virtual device)

Run:
  1. Once each step above is complete, click the green play button on the Android Studio task bar
  2. This will show it is running in the terminal and display on the virtual device
