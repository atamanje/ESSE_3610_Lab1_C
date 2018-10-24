function [R,ang1,ang2] = coordtrans(sys1,sys2,r,val1,val2)
% COORDTRANS is a function designed to take angles and vectors from one
% coordinate system to another. This fuinction will be used for the
% purposes of ESSE 3610 Lab 1 Part C. To be completed by 25 Oct 2018.
%
% Creators:
% Jessie Atamanchuk (213448899)
% David Dobrzanski  ()

% Create DMS to degrees
% This function works in the same matter as the MATLAB 2018b function
% dms2degreees(DMS). For further help, enter, "help dms2degrees" in the
% command console.

% Function feclaration
    function [deg] = DMS2degrees(DMS)
        D = DMS(1);
        M = DMS(2);
        S = DMS(3);
        if D >= 0 && M >= 0 && S >= 0
            SGN = 1;
        elseif D < 0 && M < 0 && S > 0
            SGN = -1;
        elseif D < 0 && M > 0 && S < 0
            SGN = -1;
        elseif D > 0 && M < 0 && S < 0
            SGN = -1;
        else
            error(['DMS angle is incorrect! For further help, enter,'...
                '"help dms2degrees" in the command console.'])
        end
        deg = SGN*(abs(D) + abs(M)/60 + abs(S)/3600);
    end
    function [r2,ang1,ang2] = la2it(r,az,alt)
        % Convert angles in input from DMS to degrees
        az = DMS2degrees(az);
        alt = DMS2degrees(alt);
        if isempty(r)
            r = [cosd(alt)*cosd(az) cosd(alt)*sind(az) ...
                sind(alt)];
        end
        az = input('What is the IT latitude?\n','s');
        az = DMS2degrees(az);
        lon = input('What is the IT longitude?\n','s');
        lon = DMS2degrees(lon);
        r2 = rotates(3,rotates(2,flips(2,r),90-lon),180-az);
        ang1 = 2*atand(r2(2)/(r2(1) + sqrt(r2(1)^2 + r2(2)^2)));
        ang2 = asind(r2(3));
    end
%% Template
    function [r2,ang1,ang2] = it2ap(r,lat,lon)
        % Convert angles in input from DMS to degrees
        lat = DMS2degrees(lat);
        lon = DMS2degrees(lon);
        if isempty(r)
            r = [cosd(lon)*cosd(lat) cosd(lon)*sind(lat) ...
                sind(lon)];
        end
        local = input('What is the local time [hh]?\n' );
        gast = local - lon;
        %r2 = rotates(3,rotates(2,flips(2,r),90-lon),180-lat);
        %ang1 = 2*atand(r2(2)/(r2(1) + sqrt(r2(1)^2 + r2(2)^2)));
        %ang2 = asind(r2(3));
    end
%% Template
    function [r2,ang1,ang2] = ap2tra(r,az,el)
        % Convert angles in input from DMS to degrees
        az = DMS2degrees(az);
        el = DMS2degrees(el);
        if isempty(r)
            r = [cosd(el)*cosd(az) cosd(el)*sind(az) ...
                sind(el)];
        end
        lat = input('What is the IT latitude?\n','s');
        lat = DMS2degrees(lat);
        lon = input('What is the IT longitude?\n','s');
        lon = DMS2degrees(lon);
        %r2 = rotates(3,rotates(2,flips(2,r),90-lon),180-lat);
        %ang1 = 2*atand(r2(2)/(r2(1) + sqrt(r2(1)^2 + r2(2)^2)));
        %ang2 = asind(r2(3));
    end
%% Template
    function [r2,ang1,ang2] = tra2mra(r,az,el)
        % Convert angles in input from DMS to degrees
        az = DMS2degrees(az);
        el = DMS2degrees(el);
        if isempty(r)
            r = [cosd(el)*cosd(az) cosd(el)*sind(az) ...
                sind(el)];
        end
        lat = input('What is the IT latitude?\n','s');
        lat = DMS2degrees(lat);
        lon = input('What is the IT longitude?\n','s');
        lon = DMS2degrees(lon);
        %r2 = rotates(3,rotates(2,flips(2,r),90-lon),180-lat);
        %ang1 = 2*atand(r2(2)/(r2(1) + sqrt(r2(1)^2 + r2(2)^2)));
        %ang2 = asind(r2(3));
    end
%% Template
    function [r2,ang1,ang2] = mra2mra0(r,az,el)
        % Convert angles in input from DMS to degrees
        az = DMS2degrees(az);
        el = DMS2degrees(el);
        if isempty(r)
            r = [cosd(el)*cosd(az) cosd(el)*sind(az) ...
                sind(el)];
        end
        lat = input('What is the IT latitude?\n','s');
        lat = DMS2degrees(lat);
        lon = input('What is the IT longitude?\n','s');
        lon = DMS2degrees(lon);
        %r2 = rotates(3,rotates(2,flips(2,r),90-lon),180-lat);
        %ang1 = 2*atand(r2(2)/(r2(1) + sqrt(r2(1)^2 + r2(2)^2)));
        %ang2 = asind(r2(3));
    end
%% Template
    function [r2,ang1,ang2] = mra02e(r,az,el)
        % Convert angles in input from DMS to degrees
        az = DMS2degrees(az);
        el = DMS2degrees(el);
        if isempty(r)
            r = [cosd(el)*cosd(az) cosd(el)*sind(az) ...
                sind(el)];
        end
        lat = input('What is the IT latitude?\n','s');
        lat = DMS2degrees(lat);
        lon = input('What is the IT longitude?\n','s');
        lon = DMS2degrees(lon);
        %r2 = rotates(3,rotates(2,flips(2,r),90-lon),180-lat);
        %ang1 = 2*atand(r2(2)/(r2(1) + sqrt(r2(1)^2 + r2(2)^2)));
        %ang2 = asind(r2(3));
    end

%% Coordinate transformation
if strcmp(sys1,'LA') || strcmp(sys2,'IT')
    [R,ang1,ang2] = la2it(r,val1,val2);
end
end