% Strength Training Exercises Repetition Tracker
% Irfan Hazlan
% Student ID = 11345787

% Code for plotting the comparison between acceleration magnitude and estimate of gravity component against time

% Read CSV file from excel
data = readmatrix('bicep_curl_data.csv') % Import acceleration data

% Assign columns to CSV file
time = data(:,1) / 1000;       % Convert time from ms to s
a_mag = data(:,2);             % Retrieve acceleration magnitude
a_gravity = data(:,3);         % Retrieve estimate of gravity component
counting_enabled = data(:,7);  % Retrieve counting flag
rest_active = data(:,8);       % Retrieve rest flag

% Only plot value during valid repetitions
valid = (counting_enabled == 1) & (rest_active == 0);
time_valid = time(valid);
a_mag_valid = a_mag(valid);
a_gravity_valid = a_gravity(valid);

% Reset time to start from zero
time_valid = time_valid - time_valid(1);

% Plot
figure;
plot(time_valid, a_mag_valid, 'b', 'LineWidth', 1.2);
hold on;
plot(time_valid, a_gravity_valid, 'r', 'LineWidth', 1.8);

% Add axis labels, title, legend 
xlabel('Time (s)');
ylabel('Acceleration (m/s^2)');
title('Plot of Acceleration Magnitude and Gravitational Component against Time');
legend('a\_mag', 'a\_gravity', 'Location', 'best');
grid on;
xlim ([0 10]);        % Limit the x-axis or time to first 10 seconds of valid exercise data
