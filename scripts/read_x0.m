function x0 = read_x0(filename)

% A function to read the x0 value from the t_tide output file
% the value of interest is on line 9

fid = fopen(filename);

i = 1;
while i < 10
  str = fgetl(fid);
  i = i + 1;
end

eval([str(1:8) ';']);

fclose(fid);