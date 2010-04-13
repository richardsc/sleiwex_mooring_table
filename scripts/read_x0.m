function [x0,x0_std] = read_x0(filename)

% A function to read the x0 value from the t_tide output file
% the value of interest is on line 9

fid = fopen(filename);

i = 1;
while i < 10
  if i == 8
    str1 = fgetl(fid);
  end
  str2 = fgetl(fid);
  i = i + 1;
end

eval([str1(1:8) ';']);
x0_std = str2num(str2(8:14));

fclose(fid);