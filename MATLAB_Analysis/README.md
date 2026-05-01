# MATLAB Analysis

This folder contains the MATLAB scripts used to analyse the acceleration data collected from the wearable strength training exercise repetition tracker.

The MATLAB scripts were used to plot the signal processing stages and analyse the finite-state machine repetition detection algorithm.

## Files

| File | Description |
|---|---|
| `plot_acceleration_vs_gravity.m` | Plots the acceleration magnitude and estimated gravity component against time |
| `plot_dynamic_vs_smooth_acceleration.m` | Plots the dynamic acceleration and smoothed acceleration against time |
| `finite_state_machine_analysis.m` | Plots a zoomed-in smoothed acceleration waveform used to analyse the repetition detection finite-state machine |

## Required Data File

Before running the MATLAB scripts, the CSV data file must be obtained from the Excel_Analysis folder.

The required CSV file is:

```text
bicep_curl_data.csv
