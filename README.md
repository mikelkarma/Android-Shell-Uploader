# Android Shell File Uploader

Automated File Transfer System for Android using a combination of Shell Script (top) and PHP Script (bottom). This system streamlines the process of searching, sending, and storing files between your Android device and a remote server.

## Shell Script (Top Section)

1. **Variables and Configurations:**
   - Defines variables for text formatting, initial directory, file name to store the list, and server information.

2. **File List Creation:**
   - Generates a list of files with specific extensions in the initial directory.

3. **Functions for Sending to PHP Server:**
   - Defines functions to send files from this list to a remote server using the `curl` command.

4. **Status Display:**
   - Displays status messages during the search, storage, and sending of files.

## PHP Script (Bottom Section)

1. **Reception and File Storage:**
   - Receives files sent by the Shell script.
   - Verifies basic authentication credentials.

2. **Directory Management:**
   - Creates a directory named "uploads" if it doesn't exist yet.

3. **Movement of Received Files:**
   - Moves the received files to the "uploads" directory.

4. **Status Display:**
   - Shows messages indicating whether the upload of each file was successful or not.

## Summary

This system automates the transfer of files from an Android device to a remote server, ensuring basic authentication and providing feedback on the status of each operation.
