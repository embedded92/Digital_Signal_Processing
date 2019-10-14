%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% my first program
% by: Ramneet
% date: 09-10-2019
%
%%
clear;  % clear memory
clc;    % clear console
format SHORTENG;
disp('program complete!');

%% 
%  read audio files 
%
ffile = 'Good-Bye_Female_sound.mp3';
%mfile = 'human_voice_shh_male_001.mp3';
%mfile='zapsplat_human_voice_male_in_peril_says_no_please_13185.mp3';
[y, FS]=audioread(ffile);
%[ym, FSm]=audioread(mfile);
y = decimate(y, 2);
%y = y';

%%
%  write audio files
%
ffile2 = 'Good-Bye_Female_sound_changed.ogg';
%!rm Good-Bye_Female_sound_changed.ogg
audiowrite(ffile2,y,FS);
%audiowrite(mfile2,ym2,FSm);
