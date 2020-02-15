# PalantiriApp
## About 
This is a scouting app for the FIRST robotics competition year 2019. This app works with a server side application [PalantiriServer](http://github.com/DannyGGWP/PalantiriServer). This application is writen in QT and designed to record match results for the 2020 FRC game Infinite Recharg and is designed to run on an android smart phone or tablet.

## How to use 
### Get the app
Download the app from the Google Play store, Grab a prepackaged binary here on Github (For Windows based devices), or Clone and build the application for your target device using QT creator and QT 5.14.1
### Set Up 
On first start open the app and go to the configuration tab Set the competition string and the dirver station you'd like to scout. All scouting data for this app is stored locally in an SQLite file with a table keyed to the competition and station it is scouting. So changing the competition string or driver station will change the SQLite table it is stored in.  
### Recording Data 
Switch back over to the Match Scouting tab. Enter the team number and match number you are scouting and enter data. One thing to note is that the goal counters are designed to track Power Cells scored and NOT points for those Cells. Once you have scouted the match hit "Submit Match" this will reset the form for the next match. NOTE: the match numbers are a Unique Key for the sqlite table this means that you can only record a match once per table and you will recive a SQL Error if you try and record the same match twice. 
### Collecting results 
There are two options for collecting the data from the Application. The Recomended way is to have an instance of the [PalantiriServer](http://github.com/DannyGGWP/PalantiriServer) running on a computer and to use the Server Upload option and point the app to the Server. This will dump the current table contents to the server VIA HTTP POST transactions. The second option is to use the Export Controls Box to dump the SQLite data base to the home location of the device. Use this option if youd like to provide your own data processing backend 
