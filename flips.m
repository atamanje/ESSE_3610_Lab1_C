function r = flips(a,x)
%% FLIPS
% This function takes a vector and axis, then applies a reflection matrix
% to the given vector. It then outputs to reflected vector to the user.

    if a == 1
        r = x*[-1 0 0; 0 1 0; 0 0 1];
    elseif a == 2
        r = x*[1 0 0; 0 -1 0; 0 0 1];
    elseif a == 3
        r = x*[1 0 0; 0 1 0; 0 0 -1];
    else
        error('Please select an appropriate axis of reflection!')
    end
end