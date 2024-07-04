function p2f_scaling(app)
value = app.p2_ManualScalingCheckBox.Value;
if value==1
    if app.p2_t21Switch.Value=="T-Angle"
        app.p2_strct.lims(1,1:5)=[1,double(app.p2_XminEditField.Value),double(app.p2_XmaxEditField.Value),double(app.p2_YminleftEditField.Value),double(app.p2_YmaxleftEditField.Value)];
    else
        app.p2_strct.lims(2,1:5)=[1,double(app.p2_XminEditField.Value),double(app.p2_XmaxEditField.Value),double(app.p2_YminleftEditField.Value),double(app.p2_YmaxleftEditField.Value)];
    end
else
    if app.p2_t21Switch.Value=="T-Angle"
        app.p2_strct.lims(1,1:5)=[0,0,0.1,0,0.1];
    else
        app.p2_strct.lims(2,1:5)=[0,0,0.1,0,0.1];
    end
end
end