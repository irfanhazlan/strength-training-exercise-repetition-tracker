% Strength Training Exercises Repetition Tracker
% Irfan Hazlan
% Student ID = 11345787

% Code for plotting the comparison between dynamic acceleration and smoothed acceleration against time

% Read CSV file
data = readmatrix('bicep_curl_data.csv') % Import acceleration data

% Assign columns
time = data(:,1) / 1000;        % Convert time from ms to s
a_dyn = data(:,4);              % Retrieve dynamic acceleration data from column 4
a_smooth = data(:,5);           % Retrieve smoothed acceleration data from column 5
counting_enabled = data(:,7);   % Retrieve counting flag from column 7
rest_active = data(:,8);        % Retrieve rest flag from column 8

% Only plot value during valid repetitions
valid = (counting_enabled == 1) & (rest_active == 0);   
time_valid = time(valid);
a_dyn_valid = a_dyn(valid);
a_smooth_valid = a_smooth(valid);       

% Reset time to start from zero
time_valid = time_valid - time_valid(1);

% Plot
figure;
plot(time_valid, a_dyn_valid, 'b', 'LineWidth', 1.2);
hold on;
plot(time_valid, a_smooth_valid, 'r', 'LineWidth', 1.8);

% Add axis labels, title, legend 
xlabel('Time (s)');
ylabel('Acceleration (m/s^2)');
title('Plot of Dynamic Acceleration and Smoothed Acceleration against Time ');
legend('a\_dyn', 'a\_smooth', 'Location', 'best');
grid on;
xlim ([0 10]);      % Limit the x-axis or time to first 10 seconds of valid exercise data

