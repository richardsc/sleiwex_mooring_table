clear all; close all

% Script to determine the x and y coordinates of the sleiwex 2008
% moorings in the rotated coordinate system centred on the camera
% location on the island.
%
% 2009-09-15
% Clark Richards

IAL = [-69.716989 47.875485];
angle = 31.5;
angle = deg2rad(31.5);

moorings = [-69.7191333 47.8767333;
            -69.7197667 47.8770000;
            -69.7214722 47.8784444;
            -69.7249351 47.8784094;
            -69.7231459 47.8820245;
            -69.7272910 47.8784397;
            -69.7271193 47.8796946;
            -69.7298312 47.8807424;
            -69.7349833 47.8806333;
            -69.7605285 47.8920800;
            -69.7731953 47.8975000];

mooring_names = [' M1';
                 ' M2';
                 ' M3';
                 ' M4';
                 ' M5';
                 ' M6';
                 ' M7';
                 ' M8';
                 ' M9';
                 'M10';
                 'M11'];

% Determine xy coords using island origin (minus on x is because all
% locations are to the left of the y-axis, but the m_lldist just
% returns a distance
for i = 1:11
  x(i,:) = -m_lldist([IAL(1);moorings(i,1)],[IAL(2);IAL(2)]);
  y(i,:) = m_lldist([IAL(1);IAL(1)],[IAL(2);moorings(i,2)]);
end

% Now rotate the coordinate system
xp = x.*cos(angle) - y.*sin(angle);
yp = x.*sin(angle) + y.*cos(angle);


break


% Load the GPS ship track to plot with the points
track = importdata('../../../postcruise/mooring_positions/gps/20080704gps_Coriolis.TXT',',',8);
ship_lat = track.data(:,1);
ship_lon = track.data(:,2);
trackdate = track.data(:,3);
tracktime = track.data(:,4);

july3track_lat = ship_lat(trackdate==20080703 & tracktime>183000 & ...
			  tracktime<213000);
july3track_lon = ship_lon(trackdate==20080703 & tracktime>183000 & ...
			  tracktime<213000);

july4track_lat = ship_lat(trackdate==20080704 & tracktime>183000 & ...
			  tracktime<213000);
july4track_lon = ship_lon(trackdate==20080704 & tracktime>183000 & ...
			  tracktime<213000);
