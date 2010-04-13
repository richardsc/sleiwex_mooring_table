clear all; close all
more off

% A script to determine the mean depths (and standard deviation) for
% the SLEIWEX 2008 moorings by doing a tidal analysis using t_tide to
% determine z0.
%
% created 2010-04-13
% Clark Richards

loaddir = '~/research/sleiwex/data/moored/';
depth = zeros(20,1);
depthstd = zeros(20,1);

ttideout_fn = 'ttideout';

% M1 (PT sensor)
load([loaddir 'M1/mooring_A_PT']);
starti = 2.8e5;
endi = 6.1e5;
endatmosi = 2.75e5;
data = loggerdata(starti:endi,2);
% Remove atmospheric pressure
data = data - mean(loggerdata(1:endatmosi,2));
[TIDESTRUC,XOUT]=t_tide(data,'interval',1/3600,'output',ttideout_fn);

%read in x0 from t_tide output file
[depth(1),depthstd(1)] = read_x0(ttideout_fn);

keep depth depthstd loaddir ttideout_fn

% M2 Don't bother
%load([loaddir 'M2/vector1072/sl08b01']);

% M3 (MUN ADV)
load([loaddir 'M3/MUNadv']);
starti = 2.4e5;
endi = 4.7e6;
data = adv.P(2.4e5:4.7e6);
dt = (adv.YD(2)-adv.YD)*86400;

% Interpolate to 1s
dti = 1/86400;
ti = adv.YD(starti):dti:adv.YD(endi);
data = interp1(adv.YD(starti:endi),adv.P(starti:endi),ti);

[TIDESTRUC,XOUT]=t_tide(data,'interval',1/3600,'output',ttideout_fn);

%read in x0 from t_tide output file
[depth(3),depthstd(3)] = read_x0(ttideout_fn);

keep depth depthstd loaddir ttideout_fn

% M4  (J - MUN 1200kHz ADCP)
load([loaddir 'M4/mun_1200adcp']);
starti = 800;
endi = 1.6e4;
data = adcp.pressure(starti:endi)/1000;
dt = (adcp.mtime(2)-adcp.mtime(1))*86400;

[TIDESTRUC,XOUT]=t_tide(data,'interval',dt/3600,'output',ttideout_fn);

%read in x0 from t_tide output file
[depth(4),depthstd(4)] = read_x0(ttideout_fn);

keep depth depthstd loaddir ttideout_fn

% M5 (K - MUN 600kHz ADCP)
load([loaddir 'M5/mun_600adcp']);
starti = 700;
endi = 1.6e4;
data = adcp.pressure(starti:endi)/1000;
dt = (adcp.mtime(2)-adcp.mtime(1))*86400;

[TIDESTRUC,XOUT]=t_tide(data,'interval',dt/3600,'output',ttideout_fn);

%read in x0 from t_tide output file
[depth(5),depthstd(5)] = read_x0(ttideout_fn);

keep depth depthstd loaddir ttideout_fn

% M6 (C - DAL pod 1; with aquadopp)
% Vector
load([loaddir 'M6/vector1943/194301']);
starti = 10e4;
endi = length(vec.pres);
data = vec.pres(starti:endi);
dt = 1/vec.fs;

% Interpolate to 1s
dti = 1/86400;
ti = vec.time(starti):dti:vec.time(endi);
data = interp1(vec.time(starti:endi),vec.pres(starti:endi),ti);

[TIDESTRUC,XOUT]=t_tide(data,'interval',1/3600,'output',ttideout_fn);

%read in x0 from t_tide output file
[depth(8),depthstd(8)] = read_x0(ttideout_fn);

keep depth depthstd loaddir ttideout_fn

% M6 
% aquadopp
load([loaddir 'M6/aquadopp/processedAquadopp']);
starti = 1025;
endi = 80900;
data = aquadopp.pressure(starti:endi);
dt = (aquadopp.yearday(2)-aquadopp.yearday(1))*86400;

[TIDESTRUC,XOUT]=t_tide(data,'interval',dt/3600,'output',ttideout_fn);

%read in x0 from t_tide output file
[depth(9),depthstd(9)] = read_x0(ttideout_fn);

keep depth depthstd loaddir ttideout_fn

% M7 (D - DAL pod 2; with 1200kHz ADCP)
% 1200 ADCP
load([loaddir 'M7/adcp1200kHz/SL08C001_1200kHz_cat']);
starti = 400;
endi = 1.6e4;
data = adcp.pressure(starti:endi)/1000;
dt = (adcp.mtime(2)-adcp.mtime(1))*86400;

[TIDESTRUC,XOUT]=t_tide(data,'interval',dt/3600,'output',ttideout_fn);

%read in x0 from t_tide output file
[depth(10),depthstd(10)] = read_x0(ttideout_fn);

keep depth depthstd loaddir ttideout_fn

% M7 (D - DAL pod 2; with 1200kHz ADCP)
% Vector
load([loaddir 'M7/vector1063/106301']);
starti = 104200;
endi = length(vec.pres);
data = vec.pres(starti:endi);
dt = 1/vec.fs;

% Interpolate to 1s
dti = 1/86400;
ti = vec.time(starti):dti:vec.time(endi);
data = interp1(vec.time(starti:endi),vec.pres(starti:endi),ti);

[TIDESTRUC,XOUT]=t_tide(data,'interval',1/3600,'output',ttideout_fn);

%read in x0 from t_tide output file
[depth(11),depthstd(11)] = read_x0(ttideout_fn);

keep depth depthstd loaddir ttideout_fn

% M8 (E - DAL pod 3; with RBR chain)
load([loaddir 'M8/vector1936/193601']);
starti = 1.3e5;
endi = length(vec.pres);
data = vec.pres(starti:endi);
dt = 1/vec.fs;

% Interpolate to 1s
dti = 1/86400;
ti = vec.time(starti):dti:vec.time(endi);
data = interp1(vec.time(starti:endi),vec.pres(starti:endi),ti);

[TIDESTRUC,XOUT]=t_tide(data,'interval',1/3600,'output',ttideout_fn);

%read in x0 from t_tide output file
[depth(15),depthstd(15)] = read_x0(ttideout_fn);

keep depth depthstd loaddir ttideout_fn

% M9 (F - DAL pod 4; single 600kHz ADCP)
load([loaddir 'M9/adcp600kHz/adcpRaw']);
starti = 2000;
endi = 70000;
data = adcp.pressure(starti:endi)/1000;
dt = (adcp.mtime(2)-adcp.mtime(1))*86400;

[TIDESTRUC,XOUT]=t_tide(data,'interval',dt/3600,'output',ttideout_fn);

%read in x0 from t_tide output file
[depth(17),depthstd(17)] = read_x0(ttideout_fn);

keep depth depthstd loaddir ttideout_fn

% M10 (G - Deep mooring; 60m)
load([loaddir 'M10/adcpRaw']);
starti = 1600;
endi = 3.6e4;
data = adcp.pressure(starti:endi)/1000;
dt = (adcp.mtime(2)-adcp.mtime(1))*86400;

[TIDESTRUC,XOUT]=t_tide(data,'interval',dt/3600,'output',ttideout_fn);

%read in x0 from t_tide output file
[depth(18),depthstd(18)] = read_x0(ttideout_fn);

keep depth depthstd loaddir ttideout_fn

% M11 (H - Deep mooring; 80m)
% ADCP
load([loaddir 'M11/adcpRaw']);
starti = 2200;
endi = 7.1e4;
data = adcp.pressure(starti:endi)/1000;
dt = (adcp.mtime(2)-adcp.mtime(1))*86400;

[TIDESTRUC,XOUT]=t_tide(data,'interval',dt/3600,'output',ttideout_fn);

%read in x0 from t_tide output file
[depth(19),depthstd(19)] = read_x0(ttideout_fn);

keep depth depthstd loaddir ttideout_fn

% M11 (H - Deep mooring; 80m)
% S4
load([loaddir 'processed/S4/S4_data']);
starti = 470;
endi = 12000;
data = S4.meta.depths(starti:endi);
dt = 1/S4.fs;

[TIDESTRUC,XOUT]=t_tide(data,'interval',dt/3600,'output',ttideout_fn);

%read in x0 from t_tide output file
[depth(20),depthstd(20)] = read_x0(ttideout_fn);

keep depth depthstd loaddir ttideout_fn

