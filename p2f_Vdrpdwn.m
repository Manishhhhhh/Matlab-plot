function p2f_Vdrpdwn(app)
if app.p2_SpeedSetValueDropDown.Visible == "on"
    X = str2double(app.p2_VoltageSetValueDropDown.Value);
    matchspeedsetval=contains(app.p2_variables,'Speed_Set_Val');
    %matchspeedsetval=contains(app.variables,'Dyno_Speed');
    app.p2_speedsetval=app.p2_data{:,matchspeedsetval};
    app.p2_speedsetval=app.p2_speedsetval(app.p2_voltagesetval==X);
    numels=numel(unique(app.p2_speedsetval));
    sunique(1)=0;sunique(2:numels+1)=unique(app.p2_speedsetval);
    speedstri=string(sunique);
    app.p2_SpeedSetValueDropDown.Items=speedstri;
    app.p2_SpeedSetValueDropDown.Value=app.p2_SpeedSetValueDropDown.Items(1);
    app.p2_TorqueSetValueDropDown.Items=["0"];
end
end