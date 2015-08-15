function pid_controller( mirrors, cameras )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
size = [200; 200; 200; 200]; % size of the camera images
middle = size/2;
last = middle;
integral = [0; 0; 0; 0];
control_matrix = calibrate_control_matrix();
inverse_control_matrix = inv(control_matrix);
while true
    beam_positions = measure_beam_positions(camera1,camera2);
    proportional = beam_positions-middle;
    derivative = beam_positions-last;
    integral = proportional + integral*0.7; % exponential weighting
    % tune PID controller here:
    beam_movement = proportional*(0.5) + integral*(0.1) + derivative*(0.2);
    mirror_movement = inverse_control_matrix*beam_movement;
    move_mirrors(mirror_movement);
end
end

