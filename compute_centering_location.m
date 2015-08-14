function [ mirror_movements ] = compute_centering_location( mirror_locations )
% Returns the movements the mirrors should make to move the beams to the
% center of each camera. Movements are a vector of 4 components (x and y
% for each mirror / beam). This function assumes a linear relationship
% between mirror displacement and beam displacement.
assert( size( mirror_locations ) == [4 1] )
control_matrix = calibrate_control_matrix();
mirror_movements = control_matrix * (-mirror_locations);
end

function [ control_matrix ] = calibrate_control_matrix()
% Returns the control matrix that describes the beam's motion on the
% cameras with respect to the movement of alignment mirrors. Linearity is
% assumed for small angles.
control_matrix = zeros(4);
identity = eye(4);
for i = 1:4
    current = measure_beam_positions();
    move_mirrors(identity(:,i))
    now = measure_beam_positions();
    control_matrix(:,i) = now - current;
end
end