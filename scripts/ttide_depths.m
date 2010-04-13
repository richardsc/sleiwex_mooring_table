clear all; close all
more off

% A script to determine the mean depths (and standard deviation) for
% the SLEIWEX 2008 moorings by doing a tidal analysis using t_tide to
% determine z0.
%
% created 2010-04-13
% Clark Richards

loaddir = '~/research/sleiwex/data/moored/';
depth = zeros(11,1);
depthstd = zeros(11,1);

ttideout_fn = 'ttideout';

% M1 (A - PT sensor)
load([loaddir 'M1/mooring_A_PT']);
data = loggerdata(2.8e5:6.1e5,2);
[TIDESTRUC,XOUT]=t_tide(data,'interval',1/3600,'start time', ...
                        loggertimes(1),'output',ttideout_fn);

%read in x0 from t_tide output file
z0 = read_x0(ttideout_fn);

break

depth(1) = mean(loggerdata(2.8e5:6.1e5,2))-mean(loggerdata(1:2.8e5,2));
depthstd(1) = std(loggerdata(2.8e5:6.1e5,2));

keep depth depthstd loaddir
