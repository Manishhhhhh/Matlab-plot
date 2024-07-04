%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Version history%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%24/07/2023

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%if yl checkbox1 is selected%%%%%%%%%%%%%5
function p3f_plot(app)
cla(app.p3_UIAxes,"reset");
hold(app.p3_UIAxes,"on");
app.p3_UIAxes.Title.String="Graph";
app.p3_UIAxes.Box="on";

d = uiprogressdlg(app.UIFigure,'Title','Please wait',"Message","Plotting Data",'Indeterminate','on');
str=strings(16,1);
str2=strings(16,1);
str20=strings(1,1);

xdata=app.p3_data{:,app.p3_xparameter1.Value};
yldata=app.p3_data{:,app.p3_ylparameter1.Value};
len=length(yldata);
str="";
str2="";
str20="";
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if app.p3_ylcheckbox1.Value==1
    yldata=app.p3_data{:,app.p3_ylparameter1.Value};
    str(1)=app.p3_ylparameter1.Value;
    str2(1)=p3_getunit(app.p3_ylparameter1.Value);
    disp(str2);
    if app.p3_ylcheckbox11.Value==1
        plot(app.p3_UIAxes,xdata,yldata,Color=app.p3_ylcolor1.Value,LineStyle=app.p3_yllinestyle1.Value,LineWidth=app.p3_yllinewidth1.Value,Marker=app.p3_ylmarker1.Value,MarkerIndices=1:len,MarkerEdgeColor=app.p3_ylmarkeredgecolor1.Value,MarkerFaceColor=app.p3_ylmarkercolor1.Value,MarkerSize=app.p3_ylmarkersize1.Value);
    else
        plot(app.p3_UIAxes,xdata,yldata,'-');
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if app.p3_ylcheckbox2.Value==1
    yldata=app.p3_data{:,app.p3_ylparameter2.Value};
    str(2)=app.p3_ylparameter2.Value;
    str2(2)=p3_getunit(app.p3_ylparameter2.Value);
    if app.p3_ylcheckbox12.Value==1
        plot(app.p3_UIAxes,xdata,yldata,Color=app.p3_ylcolor2.Value,LineStyle=app.p3_yllinestyle2.Value,LineWidth=app.p3_yllinewidth2.Value,Marker=app.p3_ylmarker2.Value,MarkerIndices=1:len,MarkerEdgeColor=app.p3_ylmarkeredgecolor2.Value,MarkerFaceColor=app.p3_ylmarkercolor2.Value,MarkerSize=app.p3_ylmarkersize2.Value);
    else
        plot(app.p3_UIAxes,xdata,yldata,'-');
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if app.p3_ylcheckbox3.Value==1
    yldata=app.p3_data{:,app.p3_ylparameter3.Value};
    str(3)=app.p3_ylparameter3.Value;
    str2(3)=p3_getunit(app.p3_ylparameter3.Value);
    if app.p3_ylcheckbox13.Value==1
        plot(app.p3_UIAxes,xdata,yldata,Color=app.p3_ylcolor3.Value,LineStyle=app.p3_yllinestyle3.Value,LineWidth=app.p3_yllinewidth3.Value,Marker=app.p3_ylmarker3.Value,MarkerIndices=1:len,MarkerEdgeColor=app.p3_ylmarkeredgecolor3.Value,MarkerFaceColor=app.p3_ylmarkercolor3.Value,MarkerSize=app.p3_ylmarkersize3.Value);
    else
        plot(app.p3_UIAxes,xdata,yldata,'-');
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if app.p3_ylcheckbox4.Value==1
    yldata=app.p3_data{:,app.p3_ylparameter4.Value};
    str(4)=app.p3_ylparameter4.Value;
    str2(4)=p3_getunit(app.p3_ylparameter4.Value);
    if app.p3_ylcheckbox14.Value==1
        plot(app.p3_UIAxes,xdata,yldata,Color=app.p3_ylcolor4.Value,LineStyle=app.p3_yllinestyle4.Value,LineWidth=app.p3_yllinewidth4.Value,Marker=app.p3_ylmarker4.Value,MarkerIndices=1:len,MarkerEdgeColor=app.p3_ylmarkeredgecolor4.Value,MarkerFaceColor=app.p3_ylmarkercolor4.Value,MarkerSize=app.p3_ylmarkersize4.Value);
    else
        plot(app.p3_UIAxes,xdata,yldata,'-');
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if app.p3_ylcheckbox5.Value==1
    yldata=app.p3_data{:,app.p3_ylparameter5.Value};
    str(5)=app.p3_ylparameter5.Value;
    str2(5)=p3_getunit(app.p3_ylparameter5.Value);
    if app.p3_ylcheckbox15.Value==1
        plot(app.p3_UIAxes,xdata,yldata,Color=app.p3_ylcolor5.Value,LineStyle=app.p3_yllinestyle5.Value,LineWidth=app.p3_yllinewidth5.Value,Marker=app.p3_ylmarker5.Value,MarkerIndices=1:len,MarkerEdgeColor=app.p3_ylmarkeredgecolor5.Value,MarkerFaceColor=app.p3_ylmarkercolor5.Value,MarkerSize=app.p3_ylmarkersize5.Value);
    else
        plot(app.p3_UIAxes,xdata,yldata,'-');
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if app.p3_ylcheckbox6.Value==1
    yldata=app.p3_data{:,app.p3_ylparameter6.Value};
    str(6)=app.p3_ylparameter6.Value;
    str2(6)=p3_getunit(app.p3_ylparameter6.Value);
    if app.p3_ylcheckbox16.Value==1
        plot(app.p3_UIAxes,xdata,yldata,Color=app.p3_ylcolor6.Value,LineStyle=app.p3_yllinestyle6.Value,LineWidth=app.p3_yllinewidth6.Value,Marker=app.p3_ylmarker6.Value,MarkerIndices=1:len,MarkerEdgeColor=app.p3_ylmarkeredgecolor6.Value,MarkerFaceColor=app.p3_ylmarkercolor6.Value,MarkerSize=app.p3_ylmarkersize6.Value);
    else
        plot(app.p3_UIAxes,xdata,yldata,'-');
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if app.p3_ylcheckbox7.Value==1
    yldata=app.p3_data{:,app.p3_ylparameter7.Value};
    str(7)=app.p3_ylparameter7.Value;
    str2(7)=p3_getunit(app.p3_ylparameter7.Value);
    if app.p3_ylcheckbox17.Value==1
        plot(app.p3_UIAxes,xdata,yldata,Color=app.p3_ylcolor7.Value,LineStyle=app.p3_yllinestyle7.Value,LineWidth=app.p3_yllinewidth7.Value,Marker=app.p3_ylmarker7.Value,MarkerIndices=1:len,MarkerEdgeColor=app.p3_ylmarkeredgecolor7.Value,MarkerFaceColor=app.p3_ylmarkercolor7.Value,MarkerSize=app.p3_ylmarkersize7.Value);
    else
        plot(app.p3_UIAxes,xdata,yldata,'-');
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if app.p3_ylcheckbox8.Value==1
    yldata=app.p3_data{:,app.p3_ylparameter8.Value};
    str(8)=app.p3_ylparameter8.Value;
    str2(8)=p3_getunit(app.p3_ylparameter8.Value);
    if app.p3_ylcheckbox18.Value==1
        plot(app.p3_UIAxes,xdata,yldata,Color=app.p3_ylcolor8.Value,LineStyle=app.p3_yllinestyle8.Value,LineWidth=app.p3_yllinewidth8.Value,Marker=app.p3_ylmarker8.Value,MarkerIndices=1:len,MarkerEdgeColor=app.p3_ylmarkeredgecolor8.Value,MarkerFaceColor=app.p3_ylmarkercolor8.Value,MarkerSize=app.p3_ylmarkersize8.Value);
    else
        plot(app.p3_UIAxes,xdata,yldata,'-');
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
yyaxis(app.p3_UIAxes,"right");
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if app.p3_yrcheckbox1.Value==1
    yrdata=app.p3_data{:,app.p3_yrparameter1.Value};
    str(9)=app.p3_yrparameter1.Value;
    str2(9)=p3_getunit(app.p3_yrparameter1.Value);
    if app.p3_yrcheckbox11.Value==1
        plot(app.p3_UIAxes,xdata,yrdata,Color=app.p3_yrcolor1.Value,LineStyle=app.p3_yrlinestyle1.Value,LineWidth=app.p3_yrlinewidth1.Value,Marker=app.p3_yrmarker1.Value,MarkerIndices=1:len,MarkerEdgeColor=app.p3_yrmarkeredgecolor1.Value,MarkerFaceColor=app.p3_yrmarkercolor1.Value,MarkerSize=app.p3_yrmarkersize1.Value);
    else
        plot(app.p3_UIAxes,xdata,yrdata,'-');
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if app.p3_yrcheckbox2.Value==1
    yrdata=app.p3_data{:,app.p3_yrparameter2.Value};
    str(10)=app.p3_yrparameter2.Value;
    str2(10)=p3_getunit(app.p3_yrparameter2.Value);
    if app.p3_yrcheckbox12.Value==1
        plot(app.p3_UIAxes,xdata,yrdata,Color=app.p3_yrcolor2.Value,LineStyle=app.p3_yrlinestyle2.Value,LineWidth=app.p3_yrlinewidth2.Value,Marker=app.p3_yrmarker2.Value,MarkerIndices=1:len,MarkerEdgeColor=app.p3_yrmarkeredgecolor2.Value,MarkerFaceColor=app.p3_yrmarkercolor2.Value,MarkerSize=app.p3_yrmarkersize2.Value);
    else
        plot(app.p3_UIAxes,xdata,yrdata,'-');
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if app.p3_yrcheckbox3.Value==1
    yrdata=app.p3_data{:,app.p3_yrparameter3.Value};
    str(11)=app.p3_yrparameter3.Value;
    str2(11)=p3_getunit(app.p3_yrparameter3.Value);
    if app.p3_yrcheckbox13.Value==1
        plot(app.p3_UIAxes,xdata,yrdata,Color=app.p3_yrcolor3.Value,LineStyle=app.p3_yrlinestyle3.Value,LineWidth=app.p3_yrlinewidth3.Value,Marker=app.p3_yrmarker3.Value,MarkerIndices=1:len,MarkerEdgeColor=app.p3_yrmarkeredgecolor3.Value,MarkerFaceColor=app.p3_yrmarkercolor3.Value,MarkerSize=app.p3_yrmarkersize3.Value);
    else
        plot(app.p3_UIAxes,xdata,yrdata,'-');
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if app.p3_yrcheckbox4.Value==1
    yrdata=app.p3_data{:,app.p3_yrparameter4.Value};
    str(12)=app.p3_yrparameter4.Value;
    str2(12)=p3_getunit(app.p3_yrparameter4.Value);
    if app.p3_yrcheckbox14.Value==1
        plot(app.p3_UIAxes,xdata,yrdata,Color=app.p3_yrcolor4.Value,LineStyle=app.p3_yrlinestyle4.Value,LineWidth=app.p3_yrlinewidth4.Value,Marker=app.p3_yrmarker4.Value,MarkerIndices=1:len,MarkerEdgeColor=app.p3_yrmarkeredgecolor4.Value,MarkerFaceColor=app.p3_yrmarkercolor4.Value,MarkerSize=app.p3_yrmarkersize4.Value);
    else
        plot(app.p3_UIAxes,xdata,yrdata,'-');
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if app.p3_yrcheckbox5.Value==1
    yrdata=app.p3_data{:,app.p3_yrparameter5.Value};
    str(13)=app.p3_yrparameter5.Value;
    str2(12)=p3_getunit(app.p3_yrparameter5.Value);
    if app.p3_yrcheckbox15.Value==1
        plot(app.p3_UIAxes,xdata,yrdata,Color=app.p3_yrcolor5.Value,LineStyle=app.p3_yrlinestyle5.Value,LineWidth=app.p3_yrlinewidth5.Value,Marker=app.p3_yrmarker5.Value,MarkerIndices=1:len,MarkerEdgeColor=app.p3_yrmarkeredgecolor5.Value,MarkerFaceColor=app.p3_yrmarkercolor5.Value,MarkerSize=app.p3_yrmarkersize5.Value);
    else
        plot(app.p3_UIAxes,xdata,yrdata,'-');
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if app.p3_yrcheckbox6.Value==1
    yrdata=app.p3_data{:,app.p3_yrparameter6.Value};
    str(14)=app.p3_yrparameter6.Value;
    str2(14)=p3_getunit(app.p3_yrparameter6.Value);
    if app.p3_yrcheckbox16.Value==1
        plot(app.p3_UIAxes,xdata,yrdata,Color=app.p3_yrcolor6.Value,LineStyle=app.p3_yrlinestyle6.Value,LineWidth=app.p3_yrlinewidth6.Value,Marker=app.p3_yrmarker6.Value,MarkerIndices=1:len,MarkerEdgeColor=app.p3_yrmarkeredgecolor6.Value,MarkerFaceColor=app.p3_yrmarkercolor6.Value,MarkerSize=app.p3_yrmarkersize6.Value);
    else
        plot(app.p3_UIAxes,xdata,yrdata,'-');
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if app.p3_yrcheckbox7.Value==1
    yrdata=app.p3_data{:,app.p3_yrparameter7.Value};
    str(15)=app.p3_yrparameter7.Value;
    str2(15)=p3_getunit(app.p3_yrparameter7.Value);
    if app.p3_yrcheckbox17.Value==1
        plot(app.p3_UIAxes,xdata,yrdata,Color=app.p3_yrcolor7.Value,LineStyle=app.p3_yrlinestyle7.Value,LineWidth=app.p3_yrlinewidth7.Value,Marker=app.p3_yrmarker7.Value,MarkerIndices=1:len,MarkerEdgeColor=app.p3_yrmarkeredgecolor7.Value,MarkerFaceColor=app.p3_yrmarkercolor7.Value,MarkerSize=app.p3_yrmarkersize7.Value);
    else
        plot(app.p3_UIAxes,xdata,yrdata,'-');
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if app.p3_yrcheckbox8.Value==1
    yrdata=app.p3_data{:,app.p3_yrparameter8.Value};
    str(16)=app.p3_yrparameter8.Value;
    str2(16)=p3_getunit(app.p3_yrparameter8.Value);
    if app.p3_yrcheckbox18.Value==1
        plot(app.p3_UIAxes,xdata,yrdata,Color=app.p3_yrcolor8.Value,LineStyle=app.p3_yrlinestyle8.Value,LineWidth=app.p3_yrlinewidth8.Value,Marker=app.p3_yrmarker8.Value,MarkerIndices=1:len,MarkerEdgeColor=app.p3_yrmarkeredgecolor8.Value,MarkerFaceColor=app.p3_yrmarkercolor8.Value,MarkerSize=app.p3_yrmarkersize8.Value);
    else
        plot(app.p3_UIAxes,xdata,yrdata,'-');
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
str20=p3_getunit(app.p3_xparameter1.Value);
str21=str2(1:8);
str22=str2(9:end);
str21(cellfun('isempty',str21)) = [];
str22(cellfun('isempty',str22)) = [];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if app.p3_scaling_struct.mode(1) == 1
    xlim(app.p3_UIAxes,[app.p3_scaling_struct.min(1),app.p3_scaling_struct.max(1)]);
    xticks(app.p3_UIAxes,app.p3_scaling_struct.min(1):app.p3_scaling_struct.step(1):app.p3_scaling_struct.max(1));
    xlabel(app.p3_UIAxes,app.p3_scaling_struct.axislabel(1),Interpreter="none");
    app.p3_UIAxes.XColor=app.p3_scaling_struct.color(1);
    set(app.p3_UIAxes,'XGrid',app.p3_scaling_struct.grid(1));
else
    app.p3_UIAxes.XColor='black';
    xlabel(app.p3_UIAxes,str20,Interpreter="none");
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if app.p3_scaling_struct.mode(2) == 1
    yyaxis(app.p3_UIAxes,"left");
    ylim(app.p3_UIAxes,[app.p3_scaling_struct.min(2),app.p3_scaling_struct.max(2)]);
    yticks(app.p3_UIAxes,app.p3_scaling_struct.min(2):app.p3_scaling_struct.step(2):app.p3_scaling_struct.max(2));
    ylabel(app.p3_UIAxes,app.p3_scaling_struct.axislabel(2),Interpreter="none");
    app.p3_UIAxes.YColor=app.p3_scaling_struct.color(2);
    set(app.p3_UIAxes,'YGrid',app.p3_scaling_struct.grid(2));
else
    yyaxis(app.p3_UIAxes,"left");
    app.p3_UIAxes.YColor='black';
    ylabel(app.p3_UIAxes,str21,Interpreter="none");
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if app.p3_scaling_struct.mode(3) == 1
    yyaxis(app.p3_UIAxes,"right");
    ylim(app.p3_UIAxes,[app.p3_scaling_struct.min(3),app.p3_scaling_struct.max(3)]);
    yticks(app.p3_UIAxes,app.p3_scaling_struct.min(3):app.p3_scaling_struct.step(3):app.p3_scaling_struct.max(3));
    ylabel(app.p3_UIAxes,app.p3_scaling_struct.axislabel(3),Interpreter="none");
    app.p3_UIAxes.YColor=app.p3_scaling_struct.color(3);
    yyaxis(app.p3_UIAxes,"left");
    set(app.p3_UIAxes,'YGrid',app.p3_scaling_struct.grid(3));
else
    yyaxis(app.p3_UIAxes,"right");
    app.p3_UIAxes.YColor='black';
    ylabel(app.p3_UIAxes,str22,Interpreter="none");
    yyaxis(app.p3_UIAxes,"left");
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
str(cellfun('isempty',str)) = [];
legend(app.p3_UIAxes,str,Location="northoutside",Interpreter="none",Orientation="horizontal",NumColumns=5);
hold(app.p3_UIAxes,"off");
close(d);
end