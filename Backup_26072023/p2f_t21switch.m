function p2f_t21switch(app)
value = app.p2_t21Switch.Value;
if value=="T-Angle"
    axis(app.p2_UIAxes,"on");
    axis(app.p2_UIAxes4,"off");
    set(app.p2_UIAxes4.Children,'Visible','off');
    set(app.p2_UIAxes.Children,'Visible','on');
    set(app.p2_UIAxes4.Legend,'Visible','off');
    set(app.p2_UIAxes.Legend,'Visible','on');
    app.p2_ManualScalingCheckBox.Value=app.p2_strct.lims(1,1);
    app.p2_XminEditField.Value=app.p2_strct.lims(1,2);
    app.p2_XmaxEditField.Value=app.p2_strct.lims(1,3);
    app.p2_YminleftEditField.Value=app.p2_strct.lims(1,4);
    app.p2_YmaxleftEditField.Value=app.p2_strct.lims(1,5);
    if app.p2_plotbtn==1
        app.p2_UITable2.Data(1:end,2)=app.p2_t21.maxtorque(:);
        app.p2_UITable2.Data(1:end,3)=app.p2_t21.maxanglet(:);
        app.p2_UITable2.ColumnName={'Current[Amp]','MaxTorque[Nm]',"Angle[deg]"};
    end
else
    axis(app.p2_UIAxes,"off");
    axis(app.p2_UIAxes4,"on");
    set(app.p2_UIAxes4.Children,'Visible','on');
    set(app.p2_UIAxes.Children,'Visible','off');
    set(app.p2_UIAxes4.Legend,'Visible','on');
    set(app.p2_UIAxes.Legend,'Visible','off');
    app.p2_ManualScalingCheckBox.Value=app.p2_strct.lims(2,1);
    app.p2_XminEditField.Value=app.p2_strct.lims(2,2);
    app.p2_XmaxEditField.Value=app.p2_strct.lims(2,3);
    app.p2_YminleftEditField.Value=app.p2_strct.lims(2,4);
    app.p2_YmaxleftEditField.Value=app.p2_strct.lims(2,5);
    if app.p2_plotbtn==1
        app.p2_UITable2.Data(1:end,2)=app.p2_t21.maxmodrate(:);
        app.p2_UITable2.Data(1:end,3)=app.p2_t21.maxanglem(:);
        app.p2_UITable2.ColumnName={'Current[Amp]',"Modulation Rate","Angle[deg]"};
    end
end

end