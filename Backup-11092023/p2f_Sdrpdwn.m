function p2f_Sdrpdwn(app)
if app.p2_TorqueSetValueDropDown.Visible == "on"
    Y=str2double(app.p2_SpeedSetValueDropDown.Value);
    matchtorquesetval=contains(app.p2_variables,'Torque_Set_Val');
    %matchtorquesetval=contains(app.variables,'Motor_Torque');
    Torque_Set_Val=app.p2_data{:,matchtorquesetval};
    Torque_Set_Val=Torque_Set_Val(app.p2_speedsetval==Y);
    numelt=numel(unique(Torque_Set_Val));
    tunique(1)=0;tunique(2:numelt+1)=unique(Torque_Set_Val);
    torquestri=string(tunique);
    app.p2_TorqueSetValueDropDown.Items=torquestri;
    app.p2_TorqueSetValueDropDown.Value=app.p2_TorqueSetValueDropDown.Items(1);
end
end