%% Ravi Namuduri 1543511 ENGI 1331 TTh 2:30 - 4

%problem 1

%Problem statement: determine whether the motor is enabled or disabled based on the
% state of the lawnmower switches

%input variables
%brake = brake (on/off)
%seat = operator seat switch (seated/Not-seated)
%blade = blade power switch (turning/off)
%leftbar = left guide bar neutral switch (neutral, forward, backward)
%rightbar = right guide bar neutral switch (neutral, forward, backward)
%ignition = ignition switch (run, off)

%output variables
%state = state of motor after switch input (enabled, disabled)

%housekeeping
clear
clc

%menu inputs
brake = menu('Brake Switch', 'On', 'Off');
seat = menu('Operator Seat Switch', 'Seated', 'Not-seated');
blade = menu('Blade Power Switch', 'Turning', 'Off');
leftbar = menu('Left Guide Bar Neutral Switch', 'Neutral', 'Forward', 'Back');
rightbar = menu('Right Guide Bar Neutral Switch', 'Neutral', 'Forward', 'Back');
ignition = menu('Ignition Switch', 'Run', 'Off');

%calculations

%if there is no input for any choice
if brake == 0 || seat == 0 || blade == 0 || leftbar == 0 || rightbar == 0 || ignition == 0
  fprintf('Missed selection. Unable to determine motor state.\n');
%pass input presence check
else
%ignition is primary check
  if ignition == 1
    if brake == 2
      if leftbar ~= 1 || rightbar ~= 1 || blade == 1 && seat == 2
        state = 'disabled';
      elseif leftbar ~= 1 || rightbar ~= 1 || blade == 1 && seat == 1
        state = 'enabled';
      end
    else
      if leftbar ~= 1 || rightbar ~= 1 || blade == 1 && seat == 2
        state = 'disabled';
      elseif leftbar == 1 && rightbar == 1 || blade == 1 && seat == 1
        state = 'enabled';
      end
    end
  else
    state = 'disabled';
  end
%output
  fprintf('Motor should be %s.\n',state);
end

%% Ravi Namuduri 1543511 ENGI 1331 TTh 2:30 - 4

%problem 2

%allow the user to choose if they have a resistance in ohms or in color code.
% then convert the selected input to the other; e.g. if given in ohms, return
% color code, and vice versa.

clear
clc

load('P2_ColorGuide.mat');

resist = menu('Color Code or Resistance', 'Color Code', 'Resistance');

if resist == 1


elseif resist == 2
  ohms = input('Enter resistance in ohms as vector: ');
  if ohms(1, 3:length(ohms)) ~= 0
    error('Invalid resistance. Terminating');
  else
    color1 = cell((length(ohms)):0);
    for dig1 = 1:2
      color1{dig1} = [ColorCode{1,(ohms(1,dig1)+1)} dig1];
    end
    mult = length(ohms(1,:))-2;
      color1{mult} = [Multiplier{1,mult} mult];
  end


else
  error('No choice made. Terminating.');
end

%% Ravi Namuduri 1543511 ENGI 1331 TTh 2:30 - 4

%problem 3

%problem statement: find the maximum distance travelled [m] from a given weight [N],
% k1 [N/m], k2 [N/m], and distance to rest [m].

%input variables
%weight = weight of mass [N]
%k_1 = spring constant of main spring [N/m]
%k_2 = spring constant of support springs [N/m]
%d = distance travelled until rest [m]

%intermediate variables
%x_mat = defined matrix for set of calculated distances
%curr_col = current column during vector column cycling
%dist = concatenation of weight and x_mat vectors
%rowd = row of max weight (unused)
%cold = column of max weight

%output variables
%x = distance mass travelled before rest [m]
%dist = set of distances x [m]

%housekeeping
clc
clear

%input
weight = input('Enter weight [N]: ');
k_1 = input('Enter k1 [N/m]: ');
k_2 = input('Enter k2 [N/m]: ');
d = input('Enter rest position [m]: ');

%calculations

%multiple weight values
  if length(weight) > 1
    x_mat = [];
    for curr_col = 1:length(weight)
      x = weight(1,curr_col)/k_1;
      if x >= d
        x = (weight(1,curr_col)+(2*k_2*d))/(k_1+(2*k_2));
        x_mat = [x_mat x];
        curr_col = curr_col + 1;
      elseif x < d
        x_mat = [x_mat x];
      end
    end
    dist = [weight;x_mat];
    [rowd cold] = max(weight);
%output
    fprintf('The max weight given (%0.0f) will pass through a distance of %0.2f m.\n',max(weight),dist(2,cold));
%plotting
    scatter(weight,x_mat);
    title('Relationship of weight and spring compression');
    xlabel('Weight (weight) [N]');
    ylabel('Distance moved through (x) [m]');
%only one weight value
  elseif length(weight) == 1
    x = weight/k_1;
    if x >= d
      x = (weight+(2*k_2*d))/(k_1+(2*k_2));
    elseif x < d
    end
%output
    fprintf('The weight will pass through a distance of %0.4f m.\n',x);
  end
