function r = rotates(R,x,theta)
%% ROTATES
% This function takes a vector, angle and rotation number and applies
% rotation matrices to the given vector. It then outputs to rotated vector
% to the user.

    if R == 1
        r = x*[1 0 0; 0 cosd(theta) sind(theta); 0 -sind(theta) cosd(theta)];
    elseif R == 2
        r = x*[cosd(theta) 0 -sind(theta); 0 1 0; sind(theta) 0 cosd(theta)];
    elseif R == 3
        r = x*[cosd(theta) sind(theta) 0; -sind(theta) cosd(theta) 0; 0 0 1];
    else
        error('Please select an appropriate axis of revolution!')
    end
end