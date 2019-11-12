%%
% analog filter design
%
% specs:
%
% 
% Passband Ripple: 2 dB
% Stopband Attenuation: 80 dB
% Fpass = 16 kHz
% Fstop = 20 kHz

%
clc;
close all;
clear;
spec_pbr_pos = 1; % upper ripple limit as a unitless quantity
%pbr-pass band ripple 
spec_pbr_neg = 10^(-3/20); % lower ripple limit as a unitless quantity
%-2db down; 20log10[10^(-2/20)]
spec_sba = 10^(-80/20); % stopband attenuation, converted from dB
%stop band attenuation :80db down
Wrange = linspace(0,2*pi*50000,1000000); % linear frequency range for plotting
%omega range(Wrange) ; taking a vector 50000 in Hrz; as omega =2piF and
%taking 1 million points 
Frange = (1/(2*pi))*Wrange;
%frequency range; we'll plot in terms of Hrz not omegaa
Ypbrpos = spec_pbr_pos*ones(size(Wrange));
%plotting that red lines that makes a band to pass freq
Ypbrneg = spec_pbr_neg*ones(size(Wrange));
%second red line
Ysba = spec_sba*ones(size(Wrange));
%

%% Butterworth Design
    % design attempt
    Nbw = 15;
    Wnbw = 2*pi*16100;
    [numHbw, denHbw] = butter(Nbw,Wnbw,'s');
    Hbw = tf(numHbw,denHbw);
    [Ybw_mag,Ybw_ph] = bode(Hbw, Wrange);
    Ybw_mag=reshape(Ybw_mag,[1 max(size(Ybw_mag))]);
    Ybw_ph=reshape(Ybw_ph,[1 max(size(Ybw_ph))]);
    
    % plot response with specs superimposed
    figure; plot(Frange, 20*log10(Ybw_mag)); grid;
    title('Butterworth Analog Filter Response (N=43)');
    xlabel('freq (kHz)');
 
    ylabel('response (dB)');
    % plot specs/constraints for comparison
    hold on; plot(Frange,20*log10(Ypbrpos),'r-', Frange,20*log10(Ypbrneg),'r-',Frange,20*log10(Ysba),'r-');
    xline(16000,'r-'); xline(30000,'r-');
    
    % inspect phase response
    figure; plot(Frange, Ybw_ph); grid;
    title('Butterworth Phase Response (N=43)');
    xlabel('freq (kHz)');
    ylabel('phase (rad)');
    hold on; xline(16000,'r-'); xline(30000,'r-');
    
%% Elliptical Design
    % design attempt
    Ne = 6;
    Rpe = 3;
    Rse = 80;
    Wpe = 2*pi*16000;
    [numHe, denHe] = ellip(Ne,Rpe,Rse,Wpe,'s');
    He = tf(numHe,denHe);
    [Ye_mag,Ye_ph] = bode(He, Wrange);
    Ye_mag=reshape(Ye_mag,[1 max(size(Ye_mag))]);
    Ye_ph=reshape(Ye_ph,[1 max(size(Ye_ph))]);

    % plot response with specs superimposed
    figure; plot(Frange, 20*log10(Ye_mag)); grid;
    title('Elliptical Analog Filter Response (N=8)');
    xlabel('freq (Hz)');
    ylabel('response (dB)');
    % plot specs/constraints for comparison
    hold on; plot(Frange,20*log10(Ypbrpos),'r-', Frange,20*log10(Ypbrneg),'r-',Frange,20*log10(Ysba),'r-');
    xline(16000,'r-'); xline(30000,'r-');

    % inspect phase response
    figure; plot(Frange, Ye_ph); grid;
    title('Elliptical Phase Response (N=8)');
    xlabel('freq (kHz)');
    ylabel('phase (rad)');
    hold on; xline(16000,'r-'); xline(30000,'r-');

%% chebyshev 1
    Wp = 2*pi*16000;
    %%Ws = 30000/50000;
    Rp = 3;
    %%Rs = 80;
    n = 8;
    %%[n,Wp] = cheb1ord(Wp,Ws,Rp,Rs);
    %%[b,a] = cheby1(n,Rp,Wp);
    %%freqz(b,a,512,1000); 
    %%title('n = 4 Chebyshev Type I Lowpass Filter');
    [numHc1, denHc1] = cheby1(n,Rp,Wp,'s');
    Hc1 = tf(numHc1,denHc1);
    [Ye_mag,Ye_ph] = bode(Hc1, Wrange);
    Ye_mag=reshape(Ye_mag,[1 max(size(Ye_mag))]);
    Ye_ph=reshape(Ye_ph,[1 max(size(Ye_ph))]);
     % plot response with specs superimposed
    figure; plot(Frange, 20*log10(Ye_mag)); grid;
    title('chebyshev1 Analog Filter Response (N=8)');
    xlabel('freq (Hz)');
    ylabel('response (dB)');
    % plot specs/constraints for comparison
    hold on; plot(Frange,20*log10(Ypbrpos),'r-', Frange,20*log10(Ypbrneg),'r-',Frange,20*log10(Ysba),'r-');
    xline(16000,'r-'); xline(30000,'r-');
    
% inspect phase response
    figure; plot(Frange, Ye_ph); grid;
    title('chebyshev1 Phase Response (N=8)');
    xlabel('freq (kHz)');
    ylabel('phase (rad)');
    hold on; xline(16000,'r-'); xline(30000,'r-');