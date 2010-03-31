clear all; close all

% A script to determine the mean depths (+- std) of each SLEIWEX 2008
% mooring from the average pressure signals.
%
% Clark Richards 2009-05-14

loaddir = '/data/acoustic/kt-experiments/sleiwex2008/moored/';
depth = zeros(11,1);
depthstd = zeros(11,1);

% M1 (A - PT sensor)
load([loaddir 'A/mooring_A_PT']);
depth(1) = mean(loggerdata(2.8e5:6.1e5,2))-mean(loggerdata(1:2.8e5,2));
depthstd(1) = std(loggerdata(2.8e5:6.1e5,2));

keep depth depthstd loaddir

% M2 (B - Dave's vector) I won't bother ...
depth(2) = 0;
depthstd(2) = 0;

% M3 (I - MUN ADV)
load([loaddir 'I/MUNadv']);
depth(3) = mean(adv.P(2.4e5:4.7e6));
depthstd(3) = std(adv.P(2.4e5:4.7e6));

keep depth depthstd loaddir

% M4 (J - MUN 1200kHz ADCP)
load([loaddir 'J/mun_1200adcp']);
depth(4) = mean(adcp.pressure(800:1.6e4)/1000);
depthstd(4) = std(adcp.pressure(800:1.6e4)/1000);

keep depth depthstd loaddir

% M5 (K - MUN 600kHz ADCP)
load([loaddir 'K/mun_600adcp']);
depth(5) = mean(adcp.pressure(700:1.6e4)/1000);
depthstd(5) = std(adcp.pressure(700:1.6e4)/1000);

keep depth depthstd loaddir

% M6 (C - DAL pod 1; with aquadopp)
load([loaddir 'C/vector1943/194301']);
depth(6) = mean(vec.pres(10e4:end));
depthstd(6) = std(vec.pres(10e4:end));

keep depth depthstd loaddir

% M7 (D - DAL pod 2; with 1200kHz ADCP)
load([loaddir 'D/adcp1200kHz/SL08C001_1200kHz_cat']);
depth(7) = mean(adcp.pressure(400:1.6e4)/1000);
depthstd(7) = std(adcp.pressure(400:1.6e4)/1000);

keep depth depthstd loaddir

% M8 (E - DAL pod 3; with RBR chain)
load([loaddir 'E/vector1936/193601']);
depth(8) = mean(vec.pres(1.3e5:end));
depthstd(8) = std(vec.pres(1.3e5:end));

keep depth depthstd loaddir

% M9 (F - DAL pod 4; single 600kHz ADCP)
load([loaddir 'F/adcp600kHz/adcpRaw']);
depth(9) = mean(adcp.pressure(2000:70000)/1000);
depthstd(9) = std(adcp.pressure(2000:70000)/1000);

keep depth depthstd loaddir

% M10 (G - Deep mooring; 60m)
load([loaddir 'G/adcpRaw']);
depth(10) = mean(adcp.pressure(1600:3.6e4)/1000);
depthstd(10) = std(adcp.pressure(1600:3.6e4)/1000);

keep depth depthstd loaddir

% M11 (H - Deep mooring; 80m)
load([loaddir 'H/adcpRaw']);
depth(11) = mean(adcp.pressure(2200:7.1e4)/1000);
depthstd(11) = std(adcp.pressure(2200:7.1e4)/1000);

keep depth depthstd loaddir
