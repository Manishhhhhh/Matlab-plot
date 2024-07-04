function unit = p3_getunit(value)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Purpose : Set unit to selected dropdown item

%***********Revision history**************:

%Changes :

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 patvltg="Volt";
 patcrnt="Current";
 patspd="Speed";
 pattrq="Torque";
 patp="_P_";
 pattmp="temp";
 patacc="acc";
%  patime="time";
% if contains(value,patime,'IgnoreCase',true)==1
%     unit="(sec)";
if contains(value,patvltg,'IgnoreCase',true)==1
    unit="(V)";
elseif contains(value,patcrnt,'IgnoreCase',true)==1
    unit="(A)";
elseif contains(value,patspd,'IgnoreCase',true)==1
    unit="(rpm)";
elseif contains(value,pattrq,'IgnoreCase',true)==1
    unit="(Nm)";
elseif contains(value,pattmp,'IgnoreCase',true)==1
    unit="(degree C)";
elseif contains(value,patp,'IgnoreCase',true)==1
    unit="(KW)";
elseif contains(value,patacc,'IgnoreCase',true)==1
    unit=" (mm/sec)";
else
    unit="";
end
unit=value+unit;
end