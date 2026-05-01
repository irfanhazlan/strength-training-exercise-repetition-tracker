% Strength Training Exercises Repetition Tracker
% Irfan Hazlan
% Student ID = 11345787

% Code for analysing the finite-state machine repetition detection algorithm

% Read CSV file from excel
data = readmatrix('bicep_curl_data.csv'); % Import acceleration data

% Assign columns to CSV file
time = data(:,1) / 1000;   % Convert time from ms to s
a_smooth = data(:,5);      % Retrieve smoothed acceleration data from column 5
reps = data(:,6);          % Retrieve current number of repetitions

% Reset time to start from zero
time = time - time(1);

% Define repetition detection thresholds
POSITIVE_THRESHOLD = 1.0;    % Threshold value for positive motion
NEGATIVE_THRESHOLD = -1.0;   % Threshold value for negative motion

% Find the first two counted repetitions
rep_idx = find(diff(reps) > 0) + 1;   % Find when the repetition count increases

% Check if at least two repetitions are detected
if length(rep_idx) < 2
    error('Fewer than two repetitions were detected in the CSV file.');
end

rep1 = rep_idx(1);   % Retrieve index of the first counted repetition
rep2 = rep_idx(2);   % Retrieve index of the second counted repetition

% Select a small time range around the first two repetitions
t_start = time(rep1) - 1.0;   % Start 1 second before Rep 1
t_end = time(rep2) + 1.0;     % End 1 second after Rep 2

zoom_range = (time >= t_start) & (time <= t_end);   % Select data within the chosen time range

time_zoom = time(zoom_range);
a_zoom = a_smooth(zoom_range);

% Reset zoomed time to start from zero
time_zoom = time_zoom - time_zoom(1);

% Plot
figure('Color','w');
plot(time_zoom, a_zoom, 'r', 'LineWidth', 2);
hold on;
grid on;
box on;

% Add positive and negative threshold lines
yline(POSITIVE_THRESHOLD, '--k', 'Positive Threshold', 'LineWidth', 1.5);
yline(NEGATIVE_THRESHOLD, '--k', 'Negative Threshold', 'LineWidth', 1.5);

% Add axis labels, title and formatting
xlabel('Time (s)', 'FontSize', 13);
ylabel('Smoothed Acceleration, a_{smooth} (m/s^2)', 'FontSize', 13);
title('Plot of Smoothed Acceleration against Time', ...
      'FontSize', 15, 'FontWeight', 'bold');

set(gca, 'FontSize', 12);
xlim([0 time_zoom(end)]);   % Limit the x-axis to the selected zoomed time range