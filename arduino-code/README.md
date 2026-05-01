# Arduino Code

This folder contains the Arduino sketches used for the wearable strength training exercise repetition tracker.

The Arduino code runs on the ESP32-based wearable device and processes acceleration data from the MPU6050 IMU. The software calculates the acceleration magnitude, removes the estimated gravity component, smooths the dynamic acceleration signal, and uses a finite-state machine to count exercise repetitions.

## Files

| File | Description |
|---|---|
| `strength_training_repetition_tracker.ino` | Main Arduino code used for the final wearable device. It includes IMU signal processing, OLED display output, Wi-Fi web server communication, repetition counting, set tracking, and rest timer logic |
| `matlab_logging_version.ino` | Arduino logging version used to print IMU and algorithm variables to the Serial Monitor in CSV format for MATLAB and Excel analysis |

## Required Hardware

- ESP32 development board
- MPU6050 IMU sensor
- OLED display
- Lithium-polymer battery
- Connecting wires
- Wearable enclosure

## Required Arduino Libraries

Install the following libraries in the Arduino IDE before running the code:

- `Adafruit MPU6050`
- `Adafruit Unified Sensor`
- `Adafruit GFX Library`
- `Adafruit SSD1306`
- `Wire`
- `WiFi`
- `WebServer`

## How to Run the Main Code

1. Open the Arduino IDE.
2. Open `strength_training_repetition_tracker.ino`.
3. Install the required libraries listed above.
4. Connect the ESP32 board to the computer.
5. Select the correct ESP32 board and COM port.
6. Update the Wi-Fi SSID and password in the code if required.
7. Upload the code to the ESP32.
8. Open the Serial Monitor at `115200` baud to view the ESP32 IP address.
9. Use the mobile application to connect to the ESP32 web server.

## How to Run the MATLAB Logging Version

1. Open `matlab_logging_version.ino` in the Arduino IDE.
2. Upload the code to the ESP32.
3. Open the Serial Monitor at `115200` baud.
4. Perform the exercise while the device records IMU data.
5. Copy or save the Serial Monitor output as a CSV file.
6. Use the MATLAB scripts in the `MATLAB_Analysis` folder to plot and analyse the recorded data.

## Main Algorithm

The Arduino software uses the following processing stages:

1. Read acceleration data from the MPU6050 IMU.
2. Calculate acceleration magnitude.
3. Estimate the gravity component using a low-pass filter.
4. Subtract the gravity estimate to obtain dynamic acceleration.
5. Smooth the dynamic acceleration signal.
6. Use setup validation to confirm the device is stable before counting starts.
7. Use a finite-state machine to detect positive and negative motion phases.
8. Increment the repetition count after a valid complete movement cycle.
9. Start the rest timer automatically when the device remains idle.

## Notes

The main version includes Wi-Fi communication for the mobile application, while the MATLAB logging version is mainly used for collecting CSV data for analysis.

The setup validation stage uses `STABLE_BAND` to check that the device is stable before repetition counting begins. The repetition detection and rest timer stages use `ZERO_BAND` to identify neutral or idle motion regions.
