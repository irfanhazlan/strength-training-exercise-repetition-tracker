# Application Development

This folder contains the files and supporting material related to the mobile application developed for the wearable strength training exercise repetition tracker.

The mobile application was created to provide a simple user interface for viewing exercise data from the wearable device. It displays key information such as the current repetition count, rest timer status, previous set repetitions, and number of completed sets.

## Purpose

The purpose of the application is to allow the user to monitor the wearable device output without relying only on the OLED display. The ESP32 sends exercise data through a local Wi-Fi connection using a web server, and the mobile application retrieves this information for display.

## Contents

This folder include:

- Mobile application project files
- Screenshots of the application interface

## Application Features

The application is designed to display:

- Current repetition count
- Rest timer countdown
- Exercise status, such as SETUP, READY, or REST
- Repetitions completed in the previous set
- Number of completed sets
- Reset, force start and save controls 

## Communication Method

The final system uses Wi-Fi communication between the ESP32 and the mobile application. The ESP32 acts as a web server and provides exercise data through HTTP endpoints. The mobile application retrieves this data and updates the displayed values.

## Notes

Bluetooth Low Energy was initially considered for communication between the wearable device and the mobile application. However, Wi-Fi communication was used in the final implementation due to practical compatibility and development constraints.
