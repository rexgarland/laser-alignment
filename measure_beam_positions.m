function [ beam_position ] = measure_beam_positions( camera1, camera2 )
% Returns the location of the beam's centroids (a vector of 4 values:
% camera1_x, camera1_y, camera2_x, camera2_y).
centroid1 = measure_centroid(camera1);
centroid2 = measure_centroid(camera2);
beam_position = [centroid1; centroid2];
end

function [ centroid ] = measure_centroid( camera )
% Returns the centroid (x, y pixel position as a vector) of the beam in the
% given camera.
image = take_snapshot(camera);
% minimize squares of error to the gaussian
fun = @(center, radius) (gaussian(center, radius, size(image))-image).^2;
optimum = fminsearch(fun,x0);
end

function [ image ] = take_snapshot( camera )
% Returns a snapshot from the camera as a matrix.
imaq
end