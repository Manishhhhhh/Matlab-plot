%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Version history%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%27/06/2023
%1.Added HBM speed.STAT,torque.STAT var name to calculate efficiency from
%average speed torque value for testnum19,20
%2.commented HBM speed and HBM torque on testnum19,20 as it is not required

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function p2f_plot(app)
app.p2_plotbtn=1;
%%%%%%%%%%%%%%%%%%Manual Scaling%%%%%%%%%%%%%%%%%%%%%%%
cla(app.p2_UIAxes,"reset");
cla(app.p2_UIAxes2,"reset");
cla(app.p2_UIAxes3,"reset");
d = uiprogressdlg(app.UIFigure,'Title','Please wait',"Message","Plotting Data",'Indeterminate','on');
xminn=app.p2_XminEditField.Value;
xmaxx=app.p2_XmaxEditField.Value;
yminl=app.p2_YminleftEditField.Value;
ymaxl=app.p2_YmaxleftEditField.Value;
yminr=app.p2_YminrightEditField.Value;
ymaxr=app.p2_YmaxrightEditField_2.Value;
manual=app.p2_ManualScalingCheckBox.Value;
%%%%%%%%%%%%%%%%%%%%Pattern matching%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
matchpatime=contains(app.p2_variables,'PATime','IgnoreCase',true);
matchbts_voltage=matches(app.p2_variables,'BTS_Voltage','IgnoreCase',true);
matchvoltageset=matches(app.p2_variables,'BTS_Voltage_Set_Val','IgnoreCase',true);
matchspeed_set_value=matches(app.p2_variables,'Speed_Set_Val','IgnoreCase',true);
matchtorque_set_value1=matches(app.p2_variables,'Torque_Set_Val','IgnoreCase',true);
matchdew_p_inverter=matches(app.p2_variables,'DEW_P_Inverter','IgnoreCase',true);
matchCAN_InverterTemp=matches(app.p2_variables,'CAN_InverterTemp','IgnoreCase',true);
matchCAN_CapacitorTemp=matches(app.p2_variables,'CAN_CapacitorTemp','IgnoreCase',true);
matchCAN_StatorTemp=matches(app.p2_variables,'CAN_StatorTemp','IgnoreCase',true);
matchCAN_DCU_IdcAct_val=matches(app.p2_variables,'CAN_DCU_IdcAct_val','IgnoreCase',true);
matchdynospeed=matches(app.p2_variables,'Dyno_Speed','IgnoreCase',true);
matchmotortorque=matches(app.p2_variables,'Motor_Torque','IgnoreCase',true);

matchCAN_DCU_IqAct=matches(app.p2_variables,'CAN_DCU_IqAct','IgnoreCase',true);
matchCAN_VCU_DCU_TorqSet=matches(app.p2_variables,'VCU_DCU_TorqSet','IgnoreCase',true);
%matchCAN_VCU_DCU_TorqSet=matches(app.p2_variables,'VCU_DCU_TorqSet','IgnoreCase',true);
matchCAN_ID740_Data4=matches(app.p2_variables,'matchCAN_ID740_Data4','IgnoreCase',true);

matchucurrent=matches(app.p2_variables,'DEW_I1_RMS_Engine','IgnoreCase',true);
matchvcurrent=matches(app.p2_variables,'DEW_I2_RMS_Engine','IgnoreCase',true);
matchwcurrent=matches(app.p2_variables,'DEW_I3_RMS_Engine','IgnoreCase',true);
matchuvcurrent=matches(app.p2_variables,'DEW_V12_RMS_Engine','IgnoreCase',true);
matchvwcurrent=matches(app.p2_variables,'DEW_V23_RMS_Engine','IgnoreCase',true);
matchwucurrent=matches(app.p2_variables,'DEW_V31_RMS_Engine','IgnoreCase',true);

matchCAN_DCU_EopRotAct=matches(app.p2_variables,'CAN_DCU_EopRotAct','IgnoreCase',true);
matchCAN_DCU_UdcAct_val=matches(app.p2_variables,'CAN_DCU_UdcAct_val','IgnoreCase',true);
matchDEW_Temp1_Bearing_DUT=matches(app.p2_variables,'DEW_Temp3_Dynamo-Exit','IgnoreCase',true);

matchDUT_Angle_Set_Val=matches(app.p2_variables,'DUT_Angle_Set_Val','IgnoreCase',true);
matchDUT_Current_Set_Val=matches(app.p2_variables,'DUT_Current_Set_Val','IgnoreCase',true);
matchCAN_Modulation_Rate=matches(app.p2_variables,'CAN_ModulationRate.STAT','IgnoreCase',true);

t40ch2=contains(app.p2_variables,'HBM_Speed2','IgnoreCase',true);
t40ch2=sum(t40ch2);
if app.p2_ButtonGroup_2.SelectedObject.Text=="T40 ch1"
    matchhbm_speed1=matches(app.p2_variables,'HBM_Speed1','IgnoreCase',true);
    matchthbm_torque1=matches(app.p2_variables,'HBM_Torque1','IgnoreCase',true);
    matchhbm_speed1_stat=matches(app.p2_variables,'HBM_Speed_P1.STAT','IgnoreCase',true);
    matchhbm_torque1_stat=matches(app.p2_variables,'HBM_Torque_P1.STAT','IgnoreCase',true);
else
    matchhbm_speed1=matches(app.p2_variables,'HBM_Speed2','IgnoreCase',true);
    matchthbm_torque1=matches(app.p2_variables,'HBM_Torque2','IgnoreCase',true);
    matchhbm_speed1_stat=matches(app.p2_variables,'HBM_Speed_P2.STAT','IgnoreCase',true);
    matchhbm_torque1_stat=matches(app.p2_variables,'HBM_Torque_P2.STAT','IgnoreCase',true);
end
% if app.p2_ButtonGroup_2.SelectedObject.Text=="T40 ch1"
%     matchhbm_speed1=matches(app.p2_variables,'HBM_Speed_P1.STAT','IgnoreCase',true);
%     matchthbm_torque1=matches(app.p2_variables,'HBM_Torque_P1.STAT','IgnoreCase',true);
% else
%     matchhbm_speed1=matches(app.p2_variables,'HBM_Speed2_P1.STAT','IgnoreCase',true);
%     matchthbm_torque1=matches(app.p2_variables,'HBM_Torque2_P1.STAT','IgnoreCase',true);
% end
%%%%%%%%%%%%%%%%%%%%Variable Retrive%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
PATime = app.p2_data{:,matchpatime};
BTS_Voltage=app.p2_data{:,matchbts_voltage};
BTS_Voltage_Set_Val=app.p2_data{:,matchvoltageset};
speedvalue = app.p2_data{:,matchspeed_set_value};
torquevalue = app.p2_data{:,matchtorque_set_value1};
%speedvalue=app.data{:,"Dyno_Speed"};
%torquevalue=app.data{:,"Motor_Torque"};
HBM_Speed1=app.p2_data{:,matchhbm_speed1};
HBM_Torque1=app.p2_data{:,matchthbm_torque1};
HBM_Speed_P1P2_STAT=app.p2_data{:,matchhbm_speed1_stat};
HBM_Torque_P1P2_STAT=app.p2_data{:,matchhbm_torque1_stat};
DEW_P_Inverter=app.p2_data{:,matchdew_p_inverter};
CAN_StatorTemp=app.p2_data{:,matchCAN_StatorTemp};
CAN_InverterTemp=app.p2_data{:,matchCAN_InverterTemp};
CAN_CapacitorTemp=app.p2_data{:,matchCAN_CapacitorTemp};
CAN_DCU_IdcAct_val=app.p2_data{:,matchCAN_DCU_IdcAct_val};
Dyno_Speed=app.p2_data{:,matchdynospeed};

CAN_DCU_IqAct=app.p2_data{:,matchCAN_DCU_IqAct};
CAN_VCU_DCU_TorqSet=app.p2_data{:,matchCAN_VCU_DCU_TorqSet};
CAN_ID740_Data4=app.p2_data{:,matchCAN_ID740_Data4};

Ucurrent=app.p2_data{:, matchucurrent};
Vcurrent=app.p2_data{:, matchvcurrent};
Wcurrent=app.p2_data{:, matchwcurrent};
uvcurrent=app.p2_data{:, matchuvcurrent};
vwcurrent=app.p2_data{:, matchvwcurrent};
wucurrent=app.p2_data{:, matchwucurrent};

CAN_DCU_EopRotAct=app.p2_data{:, matchCAN_DCU_EopRotAct};
CAN_DCU_UdcAct_val=app.p2_data{:, matchCAN_DCU_UdcAct_val};
DEW_Temp1_Bearing_DUT=app.p2_data{:, matchDEW_Temp1_Bearing_DUT};

DUT_Angle_Set_Val=app.p2_data{:, matchDUT_Angle_Set_Val};
DUT_Current_Set_Val=app.p2_data{:, matchDUT_Current_Set_Val};
CAN_Modulation_Rate=app.p2_data{:, matchCAN_Modulation_Rate};
%title(app.p2_UIAxes,"Graph");

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Test graph code %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if app.p2_string0==1
    hold (app.p2_UIAxes,"on");

    num=numel(HBM_Speed1);
     tr21=(15.0*9554./HBM_Speed1);         %rated torque
     tr22=((15.0*9554./HBM_Speed1).*-1);   %rated torque for -ve half

    %tr21=(150*9549./HBM_Speed1)
    %tr22=((150.*60000./HBM_Sped1).*-1);

    mat1(1:num,1)=HBM_Speed1;
    mat1(1:num,2)=HBM_Torque1;
    mat1(1:num,3)=tr21;
    mat1(1:num,4)=tr22;
    mat2=sortrows(mat1,3);
    plot(app.p2_UIAxes,app.p2_data{:,"Dyno_Speed"},app.p2_data{:,"Motor_Torque"},"LineStyle","none","Marker","o","MarkerSize",2);

    %   plot(app.p2_UIAxes,HBM_Speed1,HBM_Torque1,"LineStyle","none","Marker","o","MarkerSize",2);
    ylabel(app.p2_UIAxes,"Torque(Nm)");
    xlabel(app.p2_UIAxes,"Speed(rpm)");
    ylim(app.p2_UIAxes,[-255 255]);
    app.p2_UIAxes.XAxisLocation = "origin";
    app.p2_Label.Text="Vehicle dynamics";
    power=(HBM_Speed1.*HBM_Torque1)/9554;
    %power=power*1000;

    l11=plot(app.p2_UIAxes,mat2(:,1),mat2(:,3),'r-');
    l21=plot(app.p2_UIAxes,mat2(:,1),mat2(:,4),'r-');
    l11.YData(l11.YData >= 150)=150;
    l21.YData(l21.YData <= -150)=-150;

    plot(app.p2_UIAxes2,PATime,power,'r-');
    ylabel(app.p2_UIAxes2,"Power(kW)","FontWeight","bold");
    xlabel(app.p2_UIAxes2,"Time(Sec)","FontWeight","bold");
    ylim(app.p2_UIAxes3,[-265 265]);
    app.p2_UIAxes2.XAxisLocation = "origin";
    plot(app.p2_UIAxes3,PATime,HBM_Torque1,'b-');
    ylabel(app.p2_UIAxes3,"Torque(Nm)","FontWeight","bold");
    xlabel(app.p2_UIAxes3,"Time(Sec)","FontWeight","bold");
    app.p2_UIAxes3.XAxisLocation = "origin";
    if manual==1
        xlim(app.p2_UIAxes,[xminn,xmaxx]);
        ylim(app.p2_UIAxes,[yminl,ymaxl]);
    end
    close(d);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5555
if app.p2_string1==1 || app.p2_string2==1
    cla(app.p2_UIAxes,"reset");
    hold (app.p2_UIAxes,"on");
    %CAN_DCU_IqAct=app.data{:,"CAN_DCU_IqAct"};
    %CAN_VCU_DCU_TorqSet=app.data{:,"CAN_VCU_DCU_TorqSet"};
    num=numel(CAN_VCU_DCU_TorqSet);
    idx1=2;
    for k=2:num-1
        k=idx1;
        if idx1<num && CAN_VCU_DCU_TorqSet(k,:) > CAN_VCU_DCU_TorqSet(k-1,:)
            pastart=PATime(k-1,:);
            paend=pastart+1.5;
            [idx1,~]=find(PATime==paend,1,"first");
            TF=isempty(idx1);
            if TF == 1
                %plot(app.p2_UIAxes,PATime(k-1:end,:),CAN_DCU_IqAct(k-1:end,:),"y-");
                plot(app.p2_UIAxes,PATime(k-1:end,:),CAN_VCU_DCU_TorqSet(k-1:end,:),"k-");
                plot(app.p2_UIAxes,PATime(k-1:end,:),HBM_Torque1(k-1:end,:),'g-');
                break;
            else
                hold (app.p2_UIAxes,"on");
                %plot(app.p2_UIAxes,PATime(k-1:idx1,:),CAN_DCU_IqAct(k-1:idx1,:),"y-");
                plot(app.p2_UIAxes,PATime(k-1:idx1,:),CAN_VCU_DCU_TorqSet(k-1:idx1,:),"k-");
                plot(app.p2_UIAxes,PATime(k-1:idx1,:),HBM_Torque1(k-1:idx1,:),'g-');
            end
        end
        idx1=idx1+1;

    end
    grid(app.p2_UIAxes,"on");
    xlabel(app.p2_UIAxes,"time(S)");
    %ylabel(app.p2_UIAxes,"torque(NM) and current(A)");
    %legend(app.p2_UIAxes,"current","Indicated Torque","Actual Torque","NumColumns",3,"Location","southoutside");
    ylabel(app.p2_UIAxes,"torque(NM)");
    legend(app.p2_UIAxes,"Indicated Torque","Actual Torque","NumColumns",2,"Location","southoutside");
    if manual==1
        xlim(app.p2_UIAxes,[xminn,xmaxx]);
        ylim(app.p2_UIAxes,[yminl,ymaxl]);
    end
    if app.p2_string1 == 1
        app.p2_Label.Text="Dynamic Performance";
    else
        app.p2_Label.Text="Torque Response";
    end
    hold(app.p2_UIAxes,"off");
    close(d);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5555
if app.p2_string3==1
    cla(app.p2_UIAxes,"reset");

    PATimez=PATime-PATime(1);
    T=[PATimez CAN_StatorTemp CAN_InverterTemp CAN_CapacitorTemp HBM_Torque1 Ucurrent Vcurrent Wcurrent];
    T=array2table(T);
    T.Properties.VariableNames=["PATimez","CAN_StatorTemp","CAN_InverterTemp","CAN_CapacitorTemp","HBM_Torque1","Ucurrent","Vcurrent","Wcurrent"];
    
    hold (app.p2_UIAxes,"on");
    yyaxis (app.p2_UIAxes,"left");
    plot(app.p2_UIAxes,T{:,"PATimez"},T{:,"CAN_InverterTemp"},"b-");
    %plot(app.p2_UIAxes,PATime,CAN_InverterTemp,"b-");
    hold (app.p2_UIAxes,"on");
    plot(app.p2_UIAxes,T{:,"PATimez"},T{:,"CAN_CapacitorTemp"},"r-");
    %plot(app.p2_UIAxes,PATime,CAN_CapacitorTemp,"c-");
    plot(app.p2_UIAxes,T{:,"PATimez"},T{:,"CAN_StatorTemp"},"k-");
    %plot(app.p2_UIAxes,PATime,CAN_StatorTemp,"k-") ;
    ylm=ylim(app.p2_UIAxes);
    ylim(app.p2_UIAxes,[0,ylm(2)]);
    yyaxis (app.p2_UIAxes,"right");
    plot(app.p2_UIAxes,T{:,"PATimez"},T{:,"HBM_Torque1"},"g-");
    %plot(app.p2_UIAxes,PATime,HBM_Torque1,"g-");
    plot(app.p2_UIAxes,T{:,"PATimez"},T{:,"Ucurrent"},"m-");
    %plot(app.p2_UIAxes,PATime,Ucurrent,"k-");
    plot(app.p2_UIAxes,T{:,"PATimez"},T{:,"Vcurrent"},"-","Color","#D95319");
    %plot(app.p2_UIAxes,PATime,Vcurrent,"m-");
    plot(app.p2_UIAxes,T{:,"PATimez"},T{:,"Wcurrent"},"y-");
    %plot(app.p2_UIAxes,PATime,Wcurrent,"y-");
    app.p2_Label.Text="Rotator Locking";
    xlabel(app.p2_UIAxes,"Time[sec]");
    legend(app.p2_UIAxes,"INVtemp","Filmcaptemp","Statortemp","torque","Ucurrent","Vcurrent","Wcurrent","NumColumns",4,"Location","southoutside");
    yyaxis (app.p2_UIAxes,"left");
    ylabel(app.p2_UIAxes,"Temperature[celcius]");
    yyaxis (app.p2_UIAxes,"right");
    ylabel(app.p2_UIAxes,"Torque[Nm] Current[A]");
    if manual==1
        xlim(app.p2_UIAxes,[xminn,xmaxx]);
        yyaxis(app.p2_UIAxes,"left");
        ylim(app.p2_UIAxes,[yminl,ymaxl]);
        yyaxis(app.p2_UIAxes,"right");
        ylim(app.p2_UIAxes,[yminr,ymaxr]);
    end
    app.p2_Label.Text="Rotor Locking ";
    hold (app.p2_UIAxes,"off");
    close(d);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5555
if app.p2_string4==1
    cla(app.p2_UIAxes,"reset");
    %BTS_Voltage=app.data{:,"BTS_Voltage"};
    grid(app.p2_UIAxes,"on");
    PATimez=PATime-PATime(1);
    T=[PATimez HBM_Torque1 BTS_Voltage CAN_InverterTemp CAN_StatorTemp];
    T=array2table(T);
    T.Properties.VariableNames=["PATimez","HBM_Torque1","BTS_Voltage","CAN_InverterTemp","CAN_StatorTemp"];

    hold(app.p2_UIAxes,"on");
    xlabel(app.p2_UIAxes,"Time[S]");
    yyaxis(app.p2_UIAxes,"left");
    plot(app.p2_UIAxes,T{:,"PATimez"},T{:,"HBM_Torque1"},"r-");
    %plot(app.p2_UIAxes,PATime,HBM_Torque1,'g-');
    ylabel(app.p2_UIAxes,"Torque[NM], voltage[V]");
    plot(app.p2_UIAxes,T{:,"PATimez"},T{:,"BTS_Voltage"},"b-");
    %plot(app.p2_UIAxes,PATime,BTS_Voltage,'r-');
    ylm=ylim(app.p2_UIAxes);
    ylim(app.p2_UIAxes,[0,ylm(2)]);
    yyaxis(app.p2_UIAxes,"right");
    plot(app.p2_UIAxes,T{:,"PATimez"},T{:,"CAN_InverterTemp"},"k-");
    %plot(app.p2_UIAxes,PATime,CAN_InverterTemp,'b-');
    ylabel(app.p2_UIAxes,"Temperature[deg C]");
    plot(app.p2_UIAxes,T{:,"PATimez"},T{:,"CAN_StatorTemp"},"g-");
    %plot(app.p2_UIAxes,PATime,CAN_StatorTemp,'k-');
    ylim(app.p2_UIAxes,[0,150]);
    yticks(app.p2_UIAxes,0:5:150);
    legend(app.p2_UIAxes,"Torque","DV voltage","INV temperature","Stator Temperature","NumColumns",4,"Location","southoutside");
    if manual==1
        xlim(app.p2_UIAxes,[xminn,xmaxx]);
        yyaxis(app.p2_UIAxes,"left");
        ylim(app.p2_UIAxes,[yminl,ymaxl]);
        yyaxis(app.p2_UIAxes,"right");
        ylim(app.p2_UIAxes,[yminr,ymaxr]);
    end
    hold(app.p2_UIAxes,"off");
    app.p2_Label.Text="Overload Capacity ";
    close(d);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if app.p2_string5 == 1 
    cla(app.p2_UIAxes,"reset");
    X = str2double(app.p2_VoltageSetValueDropDown.Value);
    Z = str2double(app.p2_TorqueSetValueDropDown.Value);
    Y = str2double(app.p2_SpeedSetValueDropDown.Value);

    PATime=PATime(BTS_Voltage_Set_Val==X);
    torquevalue=torquevalue(BTS_Voltage_Set_Val==X);
    speedvalue=speedvalue(BTS_Voltage_Set_Val==X);
    HBM_Torque1=HBM_Torque1(BTS_Voltage_Set_Val==X);

    PATime=PATime(speedvalue==Y);
    torquevalue=torquevalue(speedvalue==Y);
    HBM_Torque1=HBM_Torque1(speedvalue==Y);
    filteredspeed=speedvalue(speedvalue==Y);

    PATime=PATime(torquevalue==Z);
    HBM_Torque1=HBM_Torque1(torquevalue==Z);
    torque_setpoint=torquevalue(torquevalue==Z);
    
    speedvalue=filteredspeed(1);
    if abs(speedvalue) > 0 && abs(speedvalue) < 100
        numofdata=6000;
    elseif abs(speedvalue) >= 100 && abs(speedvalue) < 1000
        numofdata=600;
    elseif abs(speedvalue) >= 1000 && abs(speedvalue) < 10000
        numofdata=60;
    else 
        numofdata=6;
    end

    disp(numofdata)

    %[idx,~]=find(torquevalue==torque_setpoint,1,"first");
    %pastart=PATime(1,:);
    %pastart=pastart+(samplingrate*3);
    %[idx1,~]=find(PATime==pastart,1,"first");
    %paend=pastart+(samplingrate*6);
    %[idx2,~]=find(PATime==paend,1,"first");
    %%idx1=PATime(1);
    %%idx2=PATime(1+numofdata);
    
    HBM_Torque1=HBM_Torque1(1:numofdata,:);
    mintorque=min(HBM_Torque1);
    maxtorque=max(HBM_Torque1);
    count=numofdata;
    square=HBM_Torque1(:,:).^2;
    summ=sum(square);
    sqrtt=summ/count;
    rms=sqrt(sqrtt);    
    ripple=(maxtorque-mintorque)/rms;
    PATime=PATime(1:numofdata,:);
    maxtrq = max(HBM_Torque1);
    mintrq = min(HBM_Torque1);
    midtrq =mean(HBM_Torque1);

%     PATimez=PATime-PATime(1);
%     T=[PATimez HBM_Torque1];
%     T=array2table(T);
%     T.Properties.VariableNames=["PATimez","HBM_Torque1"];

    hold (app.p2_UIAxes,"on");
    grid(app.p2_UIAxes,"on");
    plot(app.p2_UIAxes,PATime,HBM_Torque1,"color","#D95319",'LineWidth',1);
    yline(app.p2_UIAxes,torque_setpoint,"b",'LineWidth',1);
    %yline(app.p2_UIAxes,maxtrq,"m--");
    %yline(app.p2_UIAxes,mintrq,"g--");
    %yline(app.p2_UIAxes,rms,"y");
    app.p2_UITable2.ColumnName=["Parameter","Value"];
    TB(1:4,1)=["Min Torque","Max Torque","Torque RMS","Torque Ripple"];
    TB(1,2)=mintrq;
    TB(2,2)=maxtrq;
    TB(3,2)=rms;
    TB(4,2)=ripple;
    app.p2_UITable2.Data=TB;
    app.p2_Label.Text="Torque Ripple";
    xlabel(app.p2_UIAxes,"Time[sec]");
    ylabel(app.p2_UIAxes,"Torque[Nm]");
    legend(app.p2_UIAxes,"HBM Torque1","Motor Torque Set Val",'Location',"northoutside",'NumColumns',3);
    if manual==1
        xlim(app.p2_UIAxes,[xminn,xmaxx]);
        ylim(app.p2_UIAxes,[yminl,ymaxl]);
    end
    hold(app.p2_UIAxes,"off");
    close(d);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if app.p2_string6 == 1
    cla(app.p2_UIAxes,"reset");
    
X = str2double(app.p2_VoltageSetValueDropDown.Value);
    Z = str2double(app.p2_TorqueSetValueDropDown.Value);
    Y = str2double(app.p2_SpeedSetValueDropDown.Value);

    PATime=PATime(BTS_Voltage_Set_Val==X);
    torquevalue=torquevalue(BTS_Voltage_Set_Val==X);
    speedvalue=speedvalue(BTS_Voltage_Set_Val==X);
    HBM_Torque1=HBM_Torque1(BTS_Voltage_Set_Val==X);

    PATime=PATime(speedvalue==Y);
    torquevalue=torquevalue(speedvalue==Y);
    HBM_Torque1=HBM_Torque1(speedvalue==Y);

    PATime=PATime(torquevalue==Z);
    HBM_Torque1=HBM_Torque1(torquevalue==Z);
    torque_setpoint=torquevalue(torquevalue==Z);

    %%time start from 0
    PATimez=PATime-PATime(1);
    T=[PATimez HBM_Torque1];
    T=array2table(T);
    T.Properties.VariableNames=["PATimez","HBM_Torque1"];

    hold (app.p2_UIAxes,"on");
    grid(app.p2_UIAxes,"on");
    plot(app.p2_UIAxes,T{:,"PATimez"},T{:,"HBM_Torque1"},"b-");
    yline(app.p2_UIAxes,torque_setpoint,"color","#D95319");

    app.p2_Label.Text="Accuracy of torque control";
    xlabel(app.p2_UIAxes,"Time(sec)");
    ylabel(app.p2_UIAxes,"Torque(Nm)");
    legend(app.p2_UIAxes,"Torque val","Torque Set Val",'Location',"northoutside",'NumColumns',2);
    if manual==1
        xlim(app.p2_UIAxes,[xminn,xmaxx]);
        ylim(app.p2_UIAxes,[yminl,ymaxl]);
    end
    hold(app.p2_UIAxes,"off");
    close(d);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if app.p2_string7 == 1
    cla(app.p2_UIAxes,"reset");
    set(app.p2_UIAxes,'XGrid','on');
    set(app.p2_UIAxes,'YGrid','on');
    %matchmotorspeed=contains(app.variables,'Motor_Speed','IgnoreCase',true);
    DEW_P_Inverter=DEW_P_Inverter*0.001;
    uniquev=unique(BTS_Voltage_Set_Val);
    size=numel(uniquev);
    hold (app.p2_UIAxes,"on");
    T(1:3,1)=["Voltage[V]","Dynamo speed [rpm]","Maximum power[kW]"];
    for i=1:size
        speedx=Dyno_Speed(BTS_Voltage_Set_Val==uniquev(i));
        powerx=DEW_P_Inverter(BTS_Voltage_Set_Val==uniquev(i));
        plot(app.p2_UIAxes,speedx,powerx);
        maxpower=max(powerx);
        maxspeed=Dyno_Speed(DEW_P_Inverter==maxpower);
        T(1,i+1)=uniquev(i);
        T(2,i+1)=maxspeed;
        T(3,i+1)=maxpower;
    end
    app.p2_Label.Text="Torque Speed Performance";
    xlabel(app.p2_UIAxes,"Dynamo Speed [rpm]");
    ylabel(app.p2_UIAxes,"System Power [kW]");
    app.p2_Label.Text="Range of Operation Supply Voltage";
    legend(app.p2_UIAxes,num2str(uniquev(:)),'Location',"northoutside",'NumColumns',6);
    app.p2_UITable2.Data=T';
    if manual==1
        xlim(app.p2_UIAxes,[xminn,xmaxx]);
        ylim(app.p2_UIAxes,[yminl,ymaxl]);
    end
    hold (app.p2_UIAxes,"off");
    close(d);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if  app.p2_string8==1
    cla(app.p2_UIAxes,"reset");
    set(app.p2_UIAxes,'XGrid','on');
    set(app.p2_UIAxes,'YGrid','on');
    %matchmotorspeed=contains(app.variables,'Motor_Speed','IgnoreCase',true);
    DEW_P_Inverter=DEW_P_Inverter*0.001;
    uniquev=unique(BTS_Voltage_Set_Val);
    size=numel(uniquev);
    hold (app.p2_UIAxes,"on");
    T(1:3,1)=["Voltage[V]","Dynamo speed [rpm]","Maximum power[kW]"];
    for i=1:size
        speedx=Dyno_Speed(BTS_Voltage_Set_Val==uniquev(i));
        powerx=DEW_P_Inverter(BTS_Voltage_Set_Val==uniquev(i));
        plot(app.p2_UIAxes,speedx,powerx);
        maxpower=min(powerx);
        maxspeed=Dyno_Speed(DEW_P_Inverter==maxpower);
        T(1,i+1)=uniquev(i);
        T(2,i+1)=maxspeed;
        T(3,i+1)=maxpower;
    end
    app.p2_Label.Text="Torque Speed Performance";
    xlabel(app.p2_UIAxes,"Dynamo Speed [rpm]");
    ylabel(app.p2_UIAxes,"System Power [kW]");
    legend(app.p2_UIAxes,num2str(uniquev(:)),'Location',"northoutside",'NumColumns',6);
    app.p2_UITable2.Data=T';
    if manual==1
        xlim(app.p2_UIAxes,[xminn,xmaxx]);
        ylim(app.p2_UIAxes,[yminl,ymaxl]);
    end
    hold (app.p2_UIAxes,"off");
    close(d);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if app.p2_string9==1
    cla(app.p2_UIAxes,"reset");
    num=numel(Dyno_Speed);
    hold(app.p2_UIAxes,"on");
    scatter(app.p2_UIAxes,Dyno_Speed,uvcurrent,"filled","LineWidth",25);
    scatter(app.p2_UIAxes,Dyno_Speed,vwcurrent,"filled");
    scatter(app.p2_UIAxes,Dyno_Speed,wucurrent,"filled");
    xlabel(app.p2_UIAxes,"Speed[rpm]");
    ylabel(app.p2_UIAxes,"Effective Voltage[Vrms]");
    legend(app.p2_UIAxes,["uv","vw","wu"],"Location","north",'NumColumns',3);
    if manual==1
        xlim(app.p2_UIAxes,[xminn,xmaxx]);
        ylim(app.p2_UIAxes,[yminl,ymaxl]);
    end
    app.p2_UITable2.ColumnName=["Dyno Speed","UV","VW","WU"];
    T(1,1)="[rpm]"; T(1,2:4)="[Vrms]";
    for k=1:num
        T(k+1,1)=Dyno_Speed(k,:);
        T(k+1,2)=uvcurrent(k,:);
        T(k+1,3)=vwcurrent(k,:);
        T(k+1,4)=wucurrent(k,:);
    end

    app.p2_UITable2.Data=T;
    app.p2_Label.Text="Regeneration Power";
    hold(app.p2_UIAxes,"off");
    close(d);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if app.p2_string10==1
    cla(app.p2_UIAxes,"reset");
    %matchdewirmsinverter=contains(app.variables,'DEW_I_RMS_Inverter','IgnoreCase',true);

    invvalueo=CAN_InverterTemp;
    BTS_Voltage_Set_Val_Unique=unique(BTS_Voltage_Set_Val);

    X = str2double(app.p2_VoltageSetValueDropDown.Value);
    Z = str2double(app.p2_TorqueSetValueDropDown.Value);
    Y = str2double(app.p2_SpeedSetValueDropDown.Value);

    PATime=PATime(BTS_Voltage_Set_Val==X);
    CAN_StatorTemp=CAN_StatorTemp(BTS_Voltage_Set_Val==X);
    CAN_InverterTemp=CAN_InverterTemp(BTS_Voltage_Set_Val==X);
    CAN_DCU_IdcAct_val=CAN_DCU_IdcAct_val(BTS_Voltage_Set_Val==X);
    torquevalue=torquevalue(BTS_Voltage_Set_Val==X);
    speedvalue=speedvalue(BTS_Voltage_Set_Val==X);
    HBM_Torque1=HBM_Torque1(BTS_Voltage_Set_Val==X);

    PATime=PATime(speedvalue==Y);
    CAN_StatorTemp=CAN_StatorTemp(speedvalue==Y);
    CAN_InverterTemp=CAN_InverterTemp(speedvalue==Y);
    CAN_DCU_IdcAct_val=CAN_DCU_IdcAct_val(speedvalue==Y);
    torquevalue=torquevalue(speedvalue==Y);
    HBM_Torque1=HBM_Torque1(speedvalue==Y);

    PATime=PATime(torquevalue==Z);
    CAN_StatorTemp=CAN_StatorTemp(torquevalue==Z);
    CAN_InverterTemp=CAN_InverterTemp(torquevalue==Z);
    CAN_DCU_IdcAct_val=CAN_DCU_IdcAct_val(torquevalue==Z);
    HBM_Torque1=HBM_Torque1(torquevalue==Z);
    
    %%time start from 0
    PATimez=PATime-PATime(1);
    T=[PATimez CAN_StatorTemp CAN_InverterTemp CAN_DCU_IdcAct_val HBM_Torque1];
    T=array2table(T);
    T.Properties.VariableNames=["PATimez","CAN_StatorTemp","CAN_InverterTemp","CAN_DCU_IdcAct_val","HBM_Torque1"];

    hold(app.p2_UIAxes,"on");
    yyaxis(app.p2_UIAxes,"left");

    plot(app.p2_UIAxes,T{:,"PATimez"},T{:,"CAN_DCU_IdcAct_val"},"b-");
    %plot(app.p2_UIAxes,PATime,CAN_DCU_IdcAct_val,"b-");
    hold(app.p2_UIAxes,"on");
    ylabel(app.p2_UIAxes,"DC Current [A]");
    yyaxis(app.p2_UIAxes,"right");
    plot(app.p2_UIAxes,T{:,"PATimez"},T{:,"CAN_InverterTemp"},"r-");
    %plot(app.p2_UIAxes,PATime,CAN_InverterTemp,"r-");
    plot(app.p2_UIAxes,T{:,"PATimez"},T{:,"CAN_StatorTemp"},"g-");
    %plot(app.p2_UIAxes,PATime,CAN_StatorTemp,"g-");
    ylabel(app.p2_UIAxes,"Temperature[deg.Celcius]");
    xlabel(app.p2_UIAxes,"Time[s]");
    %title(app.p2_UIAxes,"Max Current of Inverter - graph");
    app.p2_Label.Text="Max Current of Inverter";
    legend(app.p2_UIAxes,"Current [DC]","INV temp","Stator temp",'northoutside','NumColumns',3);
    yyaxis(app.p2_UIAxes,"left");
    ylim(app.p2_UIAxes,[0,300]);
    yyaxis(app.p2_UIAxes,"right");
    ylim(app.p2_UIAxes,[0,150]);
    yticks(app.p2_UIAxes,0:5:150);
    %app.p2_TableLabel.Text= "Max Current of Inverter - Table";
    TB(1,1)="Voltage";TB(1,2)="INV Max temp";
    TB(2,1)="[V]";TB(2,2)="[C]";
    for i=1:numel(BTS_Voltage_Set_Val_Unique)
        icur=invvalueo(BTS_Voltage_Set_Val==BTS_Voltage_Set_Val_Unique(i));
        maxi=max(icur);
        TB(i+2,1)=BTS_Voltage_Set_Val_Unique(i);
        TB(i+2,2)=maxi;
    end
    app.p2_UITable2.Data=TB;
    if manual==1
        xlim(app.p2_UIAxes,[xminn,xmaxx]);
        yyaxis(app.p2_UIAxes,"left");
        ylim(app.p2_UIAxes,[yminl,ymaxl]);
        yyaxis(app.p2_UIAxes,"right");
        ylim(app.p2_UIAxes,[yminr,ymaxr]);
        yticks(app.p2_UIAxes,yminr:5:ymaxr);
    end
    grid(app.p2_UIAxes,"on");
    hold(app.p2_UIAxes,"off");
    close(d);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if app.p2_string11==1
    cla(app.p2_UIAxes,"reset");
    hold(app.p2_UIAxes,"on");
    X = str2double(app.p2_VoltageSetValueDropDown.Value);
    Z = str2double(app.p2_TorqueSetValueDropDown.Value);
    Y = str2double(app.p2_SpeedSetValueDropDown.Value);

    %     speedvalue=app.data{:,"Dyno_Speed"};
    %     torquevalue=app.data{:,"Motor_Torque"};

    PATime=PATime(BTS_Voltage_Set_Val==X);
    CAN_StatorTemp=CAN_StatorTemp(BTS_Voltage_Set_Val==X);
    CAN_InverterTemp=CAN_InverterTemp(BTS_Voltage_Set_Val==X);
    CAN_CapacitorTemp=CAN_CapacitorTemp(BTS_Voltage_Set_Val==X);
    torquevalue=torquevalue(BTS_Voltage_Set_Val==X);
    speedvalue=speedvalue(BTS_Voltage_Set_Val==X);
    HBM_Torque1=HBM_Torque1(BTS_Voltage_Set_Val==X);

    PATime=PATime(speedvalue==Y);
    CAN_StatorTemp=CAN_StatorTemp(speedvalue==Y);
    CAN_InverterTemp=CAN_InverterTemp(speedvalue==Y);
    CAN_CapacitorTemp=CAN_CapacitorTemp(speedvalue==Y);
    torquevalue=torquevalue(speedvalue==Y);
    HBM_Torque1=HBM_Torque1(speedvalue==Y);

    PATime=PATime(torquevalue==Z);
    CAN_StatorTemp=CAN_StatorTemp(torquevalue==Z);
    CAN_InverterTemp=CAN_InverterTemp(torquevalue==Z);
    CAN_CapacitorTemp=CAN_CapacitorTemp(torquevalue==Z);
    HBM_Torque1=HBM_Torque1(torquevalue==Z);

%     if Z < 0
%         tmin=-265;
%         tmax=0;
%     elseif Z > 0
%         tmin=0;
%         tmax=265;
%     else
%         tmin=-265;
%         tmax=265;
%     end
    PATimez=PATime-PATime(1);
    T=[PATimez CAN_StatorTemp CAN_InverterTemp CAN_CapacitorTemp HBM_Torque1];
    T=array2table(T);
    T.Properties.VariableNames=["PATimez","CAN_StatorTemp","CAN_InverterTemp","CAN_CapacitorTemp","HBM_Torque1"];

    yyaxis(app.p2_UIAxes,"left");
    plot(app.p2_UIAxes,T{:,"PATimez"},T{:,"CAN_StatorTemp"},"k-");
    plot(app.p2_UIAxes,T{:,"PATimez"},T{:,"CAN_InverterTemp"},"b-");
    plot(app.p2_UIAxes,T{:,"PATimez"},T{:,"CAN_CapacitorTemp"},"r-");
    ylabel(app.p2_UIAxes,"Temperature[℃]");
    ylim(app.p2_UIAxes,[0,150]);
    yticks(app.p2_UIAxes,0:5:150);
    yyaxis(app.p2_UIAxes,"right");
    plot(app.p2_UIAxes,T{:,"PATimez"},T{:,"HBM_Torque1"},"g-");
    ylabel(app.p2_UIAxes,"Torque[Nm]") ;
    %ylim(app.p2_UIAxes,[tmin,tmax]);
    %yticks(app.p2_UIAxes,tmin:10:tmax);
    app.p2_Label.Text="Inverter Current during Series operation";
    xlabel(app.p2_UIAxes,"Time[s]");
    legend(app.p2_UIAxes,"INV temp","Filmcap temp","Stator temp","Torque act",'Location','northoutside','NumColumns',4);
    if manual==1
        xlim(app.p2_UIAxes,[xminn,xmaxx]);
        yyaxis(app.p2_UIAxes,"left");
        ylim(app.p2_UIAxes,[yminl,ymaxl]);
        yticks(app.p2_UIAxes,yminl:5:ymaxl);
        yyaxis(app.p2_UIAxes,"right");
        ylim(app.p2_UIAxes,[yminr,ymaxr]);
    end
    hold(app.p2_UIAxes,"off");
    close(d);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if app.p2_string12==1
    cla(app.p2_UIAxes,"reset");
    X = str2double(app.p2_VoltageSetValueDropDown.Value);
    Z = str2double(app.p2_TorqueSetValueDropDown.Value);
    Y = str2double(app.p2_SpeedSetValueDropDown.Value);

    %     speedvalue=app.data{:,"Dyno_Speed"};
    %     torquevalue=app.data{:,"Motor_Torque"};

    PATime=PATime(BTS_Voltage_Set_Val==X);
    CAN_StatorTemp=CAN_StatorTemp(BTS_Voltage_Set_Val==X);
    CAN_InverterTemp=CAN_InverterTemp(BTS_Voltage_Set_Val==X);
    CAN_CapacitorTemp=CAN_CapacitorTemp(BTS_Voltage_Set_Val==X);
    torquevalue=torquevalue(BTS_Voltage_Set_Val==X);
    speedvalue=speedvalue(BTS_Voltage_Set_Val==X);
    HBM_Torque1=HBM_Torque1(BTS_Voltage_Set_Val==X);

    PATime=PATime(speedvalue==Y);
    CAN_StatorTemp=CAN_StatorTemp(speedvalue==Y);
    CAN_InverterTemp=CAN_InverterTemp(speedvalue==Y);
    CAN_CapacitorTemp=CAN_CapacitorTemp(speedvalue==Y);
    torquevalue=torquevalue(speedvalue==Y);
    HBM_Torque1=HBM_Torque1(speedvalue==Y);

    PATime=PATime(torquevalue==Z);
    CAN_StatorTemp=CAN_StatorTemp(torquevalue==Z);
    CAN_InverterTemp=CAN_InverterTemp(torquevalue==Z);
    CAN_CapacitorTemp=CAN_CapacitorTemp(torquevalue==Z);
    HBM_Torque1=HBM_Torque1(torquevalue==Z);
%     if Z < 0
%         tmin=-265;
%         tmax=0;
%     elseif Z > 0
%         tmin=0;
%         tmax=265;
%     else
%         tmin=-265;
%         tmax=265;
%     end

    PATimez=PATime-PATime(1);
    T=[PATimez CAN_StatorTemp CAN_InverterTemp CAN_CapacitorTemp HBM_Torque1];
    T=array2table(T);
    T.Properties.VariableNames=["PATimez","CAN_StatorTemp","CAN_InverterTemp","CAN_CapacitorTemp","HBM_Torque1"];

    yyaxis(app.p2_UIAxes,"left");
    hold(app.p2_UIAxes,"on");
    set(app.p2_UIAxes,'ycolor','k')
    plot(app.p2_UIAxes,T{:,"PATimez"},T{:,"CAN_StatorTemp"},"k-");
    plot(app.p2_UIAxes,T{:,"PATimez"},T{:,"CAN_InverterTemp"},"b-");
    plot(app.p2_UIAxes,T{:,"PATimez"},T{:,"CAN_CapacitorTemp"},"r-");
    ylabel(app.p2_UIAxes,"Temperature[℃]");
    yyaxis(app.p2_UIAxes,"right");
    set(app.p2_UIAxes,'ycolor','k')
    plot(app.p2_UIAxes,T{:,"PATimez"},T{:,"HBM_Torque1"},"g-");
    ylabel(app.p2_UIAxes,"Torque[Nm]") ;
    %ylim(app.p2_UIAxes,[tmin,tmax]);
    %yticks(app.p2_UIAxes,tmin:10:tmax);
    app.p2_Label.Text="Inverter Current during Transient operation";
    xlabel(app.p2_UIAxes,"Time[s]");
    legend(app.p2_UIAxes,"INV temp","Filmcap temp","Stator temp","Torque act",'Location','northoutside','NumColumns',4);
    yyaxis(app.p2_UIAxes,"left");
    ylim(app.p2_UIAxes,[0,150]);
    yticks(app.p2_UIAxes,0:5:150);
    set(app.p2_UIAxes,'xcolor','k')
    if manual==1
        xlim(app.p2_UIAxes,[xminn,xmaxx]);
        yyaxis(app.p2_UIAxes,"left");
        ylim(app.p2_UIAxes,[yminl,ymaxl]);
        yticks(app.p2_UIAxes,yminl:5:ymaxl);
        yyaxis(app.p2_UIAxes,"right");
        ylim(app.p2_UIAxes,[yminr,ymaxr]);
    end
    hold(app.p2_UIAxes,"off");
    close(d);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if app.p2_string13==1
    cla(app.p2_UIAxes,"reset");
    X = str2double(app.p2_VoltageSetValueDropDown.Value);
    Z = str2double(app.p2_TorqueSetValueDropDown.Value);
    Y = str2double(app.p2_SpeedSetValueDropDown.Value);

    PATime=PATime(BTS_Voltage_Set_Val==X);
    CAN_StatorTemp=CAN_StatorTemp(BTS_Voltage_Set_Val==X);
    CAN_InverterTemp=CAN_InverterTemp(BTS_Voltage_Set_Val==X);
    CAN_CapacitorTemp=CAN_CapacitorTemp(BTS_Voltage_Set_Val==X);
    torquevalue=torquevalue(BTS_Voltage_Set_Val==X);
    speedvalue=speedvalue(BTS_Voltage_Set_Val==X);
    HBM_Torque1=HBM_Torque1(BTS_Voltage_Set_Val==X);
    HBM_Speed1=HBM_Speed1(BTS_Voltage_Set_Val==X);                   %addition to #V1.1 

    PATime=PATime(speedvalue==Y);
    CAN_StatorTemp=CAN_StatorTemp(speedvalue==Y);
    CAN_InverterTemp=CAN_InverterTemp(speedvalue==Y);
    CAN_CapacitorTemp=CAN_CapacitorTemp(speedvalue==Y);
    torquevalue=torquevalue(speedvalue==Y);
    HBM_Torque1=HBM_Torque1(speedvalue==Y);
    HBM_Speed1=HBM_Speed1(speedvalue==Y);                            %addition to #V1.1 

    PATime=PATime(torquevalue==Z);
    CAN_StatorTemp=CAN_StatorTemp(torquevalue==Z);
    CAN_InverterTemp=CAN_InverterTemp(torquevalue==Z);
    CAN_CapacitorTemp=CAN_CapacitorTemp(torquevalue==Z);
    HBM_Torque1=HBM_Torque1(torquevalue==Z);
    HBM_Speed1=HBM_Speed1(torquevalue==Z);                           %addition to #V1.1 

%     if Z < 0
%         tmin=-265;
%         tmax=0;
%     elseif Z > 0
%         tmin=0;
%         tmax=265;
%     else
%         tmin=-265;
%         tmax=265;
%     end

    hold(app.p2_UIAxes,"on");
    app.p2_Label.Text="Max speed";
    xlabel(app.p2_UIAxes,"Time(sec)");
    set(app.p2_UIAxes,'xcolor','k')
    yyaxis(app.p2_UIAxes,"left");
    ylim(app.p2_UIAxes,[0,150]);
    %ylim(app.p2_UIAxes,[tmin,tmax]);
    yticks(app.p2_UIAxes,0:5:150);
    set(app.p2_UIAxes,'ycolor','k')
    ylabel(app.p2_UIAxes,"Temperature[C] / Torque[Nm]");
    plot(app.p2_UIAxes,PATime,CAN_StatorTemp,"k-");
    plot(app.p2_UIAxes,PATime,CAN_CapacitorTemp,"r-");
    plot(app.p2_UIAxes,PATime,HBM_Torque1,"g-");
    yyaxis(app.p2_UIAxes,"right");
    ylim(app.p2_UIAxes,[0,20000]);
    set(app.p2_UIAxes,'ycolor','k')
    ylabel(app.p2_UIAxes,"Speed[rpm]");
    plot(app.p2_UIAxes,PATime,HBM_Speed1,"c-");
    legend(app.p2_UIAxes,"Stator temp","Tcap","T40 Torque","T40 speed",'Location','northoutside','NumColumns',4);
    if manual==1
        xlim(app.p2_UIAxes,[xminn,xmaxx]);
        yyaxis(app.p2_UIAxes,"left");
        ylim(app.p2_UIAxes,[yminl,ymaxl]);
        yticks(app.p2_UIAxes,yminl:5:ymaxl);
        yyaxis(app.p2_UIAxes,"right");
        ylim(app.p2_UIAxes,[yminr,ymaxr]);
    end
    hold(app.p2_UIAxes,"off");
    close(d);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if app.p2_string14==1
    cla(app.p2_UIAxes,"reset");

    X = str2double(app.p2_VoltageSetValueDropDown.Value);
    Z = str2double(app.p2_TorqueSetValueDropDown.Value);
    Y = str2double(app.p2_SpeedSetValueDropDown.Value);

    %     speedvalue=app.data{:,"Dyno_Speed"};
    %     torquevalue=app.data{:,"Motor_Torque"};

    PATime=PATime(BTS_Voltage_Set_Val==X);
    CAN_StatorTemp=CAN_StatorTemp(BTS_Voltage_Set_Val==X);
    CAN_InverterTemp=CAN_InverterTemp(BTS_Voltage_Set_Val==X);
    CAN_CapacitorTemp=CAN_CapacitorTemp(BTS_Voltage_Set_Val==X);
    torquevalue=torquevalue(BTS_Voltage_Set_Val==X);
    speedvalue=speedvalue(BTS_Voltage_Set_Val==X);
    HBM_Torque1=HBM_Torque1(BTS_Voltage_Set_Val==X);

    PATime=PATime(speedvalue==Y);
    CAN_StatorTemp=CAN_StatorTemp(speedvalue==Y);
    CAN_InverterTemp=CAN_InverterTemp(speedvalue==Y);
    CAN_CapacitorTemp=CAN_CapacitorTemp(speedvalue==Y);
    torquevalue=torquevalue(speedvalue==Y);
    HBM_Torque1=HBM_Torque1(speedvalue==Y);

    PATime=PATime(torquevalue==Z);
    CAN_StatorTemp=CAN_StatorTemp(torquevalue==Z);
    CAN_InverterTemp=CAN_InverterTemp(torquevalue==Z);
    CAN_CapacitorTemp=CAN_CapacitorTemp(torquevalue==Z);
    HBM_Torque1=HBM_Torque1(torquevalue==Z);

%     if Z < 0
%         tmin=-265;
%         tmax=0;
%     elseif Z > 0
%         tmin=0;
%         tmax=265;
%     else
%         tmin=-265;
%         tmax=265;
%     end

    PATimez=PATime-PATime(1);
    T=[PATimez CAN_StatorTemp CAN_InverterTemp CAN_CapacitorTemp HBM_Torque1];
    T=array2table(T);
    T.Properties.VariableNames=["PATimez","CAN_StatorTemp","CAN_InverterTemp","CAN_CapacitorTemp","HBM_Torque1"];

    hold(app.p2_UIAxes,"on");
    yyaxis(app.p2_UIAxes,"left")
    plot(app.p2_UIAxes,T{:,"PATimez"},T{:,"CAN_StatorTemp"},"k-");
    plot(app.p2_UIAxes,T{:,"PATimez"},T{:,"CAN_InverterTemp"},"b-");
    plot(app.p2_UIAxes,T{:,"PATimez"},T{:,"CAN_CapacitorTemp"},"r-");
    ylabel(app.p2_UIAxes,"Temperature[℃]");
    ylim(app.p2_UIAxes,[0,150]);
    yticks(app.p2_UIAxes,0:5:150);
    yyaxis(app.p2_UIAxes,"right")
    plot(app.p2_UIAxes,T{:,"PATimez"},T{:,"HBM_Torque1"},"g-")
    ylabel(app.p2_UIAxes,"Torque[Nm]");
    %ylim(app.p2_UIAxes,[tmin,tmax]);
    %yticks(app.p2_UIAxes,tmin:10:tmax);
    app.p2_Label.Text="Series of Torque";
    xlabel(app.p2_UIAxes,"Time[s]")
    legend(app.p2_UIAxes,"Stator temp","INV temp","Filmcap temp","Torque act",'Location','northoutside','NumColumns',4);
    if manual==1
        xlim(app.p2_UIAxes,[xminn,xmaxx]);
        yyaxis(app.p2_UIAxes,"left");
        ylim(app.p2_UIAxes,[yminl,ymaxl]);
        yticks(app.p2_UIAxes,yminl:5:ymaxl);
        yyaxis(app.p2_UIAxes,"right");
        ylim(app.p2_UIAxes,[yminr,ymaxr]);
    end
    hold(app.p2_UIAxes,"off");
    close(d);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if app.p2_string15==1
    cla(app.p2_UIAxes,"reset");

    X = str2double(app.p2_VoltageSetValueDropDown.Value);
    Z = str2double(app.p2_TorqueSetValueDropDown.Value);
    Y = str2double(app.p2_SpeedSetValueDropDown.Value);

    %     speedvalue=app.data{:,"Dyno_Speed"};
    %     torquevalue=app.data{:,"Motor_Torque"};

    speedvaluex=speedvalue;
    BTS_Voltage_Set_Valx=BTS_Voltage_Set_Val;

    %%Number of unique elements%%
    vunique=unique(BTS_Voltage_Set_Valx);
    numelv=numel(vunique);
    sunique=unique(speedvaluex);
    numels=numel(sunique);
    T="";
    z=1;
    zz=4;
    %%To create table%%
    for i=1:numelv
        speedvaluex=speedvalue(BTS_Voltage_Set_Valx==vunique(i));
        CAN_StatorTempx=CAN_StatorTemp(BTS_Voltage_Set_Valx==vunique(i));
        CAN_InverterTempx=CAN_InverterTemp(BTS_Voltage_Set_Valx==vunique(i));
        for j=1:numels
            x=CAN_StatorTempx(speedvaluex==sunique(j));
            y=CAN_InverterTempx(speedvaluex==sunique(j));
            disp("loop")
            %x=max(x);
            x=42;
%             y=max(y);
            y=42;
            T(z,zz)=x;
            T(z+1,zz)=y;
            zz=zz+1;
        end
        zz=4;
        z=z+2;
    end
    T(1,1)="Voltage [V]";
    ii=1;
    for i=1:2:numelv*2
        T(i,3)="Max Stator temp [deg]";
        T(i+1,3)="Max INV temp [deg]";
        T(i,2)=vunique(ii);
        ii=ii+1;
    end
    app.p2_UITable2.Data=T;
    app.p2_UITable2.ColumnName={"","","Motor speed [rpm]",sunique};
    PATime=PATime(BTS_Voltage_Set_Val==X);
    CAN_StatorTemp=CAN_StatorTemp(BTS_Voltage_Set_Val==X);
    CAN_InverterTemp=CAN_InverterTemp(BTS_Voltage_Set_Val==X);
    CAN_CapacitorTemp=CAN_CapacitorTemp(BTS_Voltage_Set_Val==X);
    torquevalue=torquevalue(BTS_Voltage_Set_Val==X);
    speedvalue=speedvalue(BTS_Voltage_Set_Val==X);
    HBM_Torque1=HBM_Torque1(BTS_Voltage_Set_Val==X);

    PATime=PATime(speedvalue==Y);
    CAN_StatorTemp=CAN_StatorTemp(speedvalue==Y);
    CAN_InverterTemp=CAN_InverterTemp(speedvalue==Y);
    CAN_CapacitorTemp=CAN_CapacitorTemp(speedvalue==Y);
    torquevalue=torquevalue(speedvalue==Y);
    HBM_Torque1=HBM_Torque1(speedvalue==Y);

    PATime=PATime(torquevalue==Z);
    CAN_StatorTemp=CAN_StatorTemp(torquevalue==Z);
    CAN_InverterTemp=CAN_InverterTemp(torquevalue==Z);
    CAN_CapacitorTemp=CAN_CapacitorTemp(torquevalue==Z);
    HBM_Torque1=HBM_Torque1(torquevalue==Z);
%     if Z < 0
%         tmin=-265;
%         tmax=0;
%     elseif Z > 0
%         tmin=0;
%         tmax=265;
%     else
%         tmin=-265;
%         tmax=265;
%     end

    PATimez=PATime-PATime(1);
    T=[PATimez CAN_StatorTemp CAN_InverterTemp CAN_CapacitorTemp HBM_Torque1];
    T=array2table(T);
    T.Properties.VariableNames=["PATimez","CAN_StatorTemp","CAN_InverterTemp","CAN_CapacitorTemp","HBM_Torque1"];

    yyaxis(app.p2_UIAxes,"left");
    set(app.p2_UIAxes,'ycolor','k')
    plot(app.p2_UIAxes,T{:,"PATimez"},T{:,"CAN_CapacitorTemp"},"r-");
    hold(app.p2_UIAxes,"on");
    ylabel(app.p2_UIAxes,"Temperature[°C]");
    plot(app.p2_UIAxes,T{:,"PATimez"},T{:,"CAN_StatorTemp"},"k-");
    plot(app.p2_UIAxes,T{:,"PATimez"},T{:,"CAN_InverterTemp"},"b-");
    ylim(app.p2_UIAxes,[0,150]);
    yticks(app.p2_UIAxes,0:5:150);
    yyaxis(app.p2_UIAxes,"right");
    set(app.p2_UIAxes,'ycolor','k');
    ylabel(app.p2_UIAxes,"Torque[Nm]");
    %ylim(app.p2_UIAxes,[tmin,tmax]);
    %yticks(app.p2_UIAxes,tmin:10:tmax);
    plot(app.p2_UIAxes,T{:,"PATimez"},T{:,"HBM_Torque1"},"g-");
    app.p2_Label.Text="Max Torque";

    xlabel(app.p2_UIAxes,"Time[S]");
    legend(app.p2_UIAxes,"filmcap temp","Stator temp","INV temp","Torque Act",'Location','northoutside','NumColumns',4);
    set(app.p2_UIAxes,'xcolor','k');

    if manual==1
        xlim(app.p2_UIAxes,[xminn,xmaxx]);
        yyaxis(app.p2_UIAxes,"left");
        ylim(app.p2_UIAxes,[yminl,ymaxl]);
        yticks(app.p2_UIAxes,yminl:5:ymaxl);
        yyaxis(app.p2_UIAxes,"right");
        ylim(app.p2_UIAxes,[yminr,ymaxr]);
    end
    hold(app.p2_UIAxes,"off");
    close(d);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if app.p2_string16==1 || app.p2_string17==1
    cla(app.p2_UIAxes,"reset");

    X = str2double(app.p2_VoltageSetValueDropDown.Value);
    Z = str2double(app.p2_TorqueSetValueDropDown.Value);
    Y = str2double(app.p2_SpeedSetValueDropDown.Value);

    %      speedvalue=app.data{:,"Dyno_Speed"};
    %     torquevalue=app.data{:,"Motor_Torque"};

    PATime=PATime(BTS_Voltage_Set_Val==X);
    CAN_StatorTemp=CAN_StatorTemp(BTS_Voltage_Set_Val==X);
    CAN_InverterTemp=CAN_InverterTemp(BTS_Voltage_Set_Val==X);
    CAN_CapacitorTemp=CAN_CapacitorTemp(BTS_Voltage_Set_Val==X);
    torquevalue=torquevalue(BTS_Voltage_Set_Val==X);
    speedvalue=speedvalue(BTS_Voltage_Set_Val==X);
    HBM_Torque1=HBM_Torque1(BTS_Voltage_Set_Val==X);

    PATime=PATime(speedvalue==Y);
    CAN_StatorTemp=CAN_StatorTemp(speedvalue==Y);
    CAN_InverterTemp=CAN_InverterTemp(speedvalue==Y);
    CAN_CapacitorTemp=CAN_CapacitorTemp(speedvalue==Y);
    torquevalue=torquevalue(speedvalue==Y);
    HBM_Torque1=HBM_Torque1(speedvalue==Y);

    PATime=PATime(torquevalue==Z);
    CAN_StatorTemp=CAN_StatorTemp(torquevalue==Z);
    CAN_InverterTemp=CAN_InverterTemp(torquevalue==Z);
    CAN_CapacitorTemp=CAN_CapacitorTemp(torquevalue==Z);
    HBM_Torque1=HBM_Torque1(torquevalue==Z);

    PATimez=PATime-PATime(1);
    T=[PATimez CAN_StatorTemp CAN_InverterTemp CAN_CapacitorTemp HBM_Torque1];
    T=array2table(T);
    T.Properties.VariableNames=["PATimez","CAN_StatorTemp","CAN_InverterTemp","CAN_CapacitorTemp","HBM_Torque1"];


%     if Z < 0
%         tmin=-265;
%         tmax=0;
%     elseif Z > 0
%         tmin=0;
%         tmax=265;
%     else
%         tmin=-265;
%         tmax=265;
%     end

    hold(app.p2_UIAxes,"on");
    yyaxis(app.p2_UIAxes,"left");
    plot(app.p2_UIAxes,T{:,"PATimez"},T{:,"CAN_InverterTemp"},"b-");
    ylim(app.p2_UIAxes,[0,150]);
    yticks(app.p2_UIAxes,0:5:150);
    plot(app.p2_UIAxes,T{:,"PATimez"},T{:,"CAN_StatorTemp"},"k-");
    plot(app.p2_UIAxes,T{:,"PATimez"},T{:,"CAN_CapacitorTemp"},"r-");
    ylabel(app.p2_UIAxes,"Temperature[celsius]");
    yyaxis(app.p2_UIAxes,"right");
    plot(app.p2_UIAxes,T{:,"PATimez"},T{:,"HBM_Torque1"},"g-");
    ylabel(app.p2_UIAxes,"Torque[Nm]") ;
    %ylim(app.p2_UIAxes,[tmin,tmax]);
    %yticks(app.p2_UIAxes,tmin:10:tmax);

    if app.p2_string17==1
        app.p2_Label.Text="Temperature Rise";
    else
        app.p2_Label.Text="Temperature Gradient";
    end
    xlabel(app.p2_UIAxes,"Time[sec]");
    legend(app.p2_UIAxes,"INVtemp","Stator Temp","Filmcap Temp","TorqueAct",'Location','northoutside','NumColumns',4);
    if manual==1
        xlim(app.p2_UIAxes,[xminn,xmaxx]);
        yyaxis(app.p2_UIAxes,"left");
        ylim(app.p2_UIAxes,[yminl,ymaxl]);
        yticks(app.p2_UIAxes,yminl:5:ymaxl);
        yyaxis(app.p2_UIAxes,"right");
        ylim(app.p2_UIAxes,[yminr,ymaxr]);
    end
    hold(app.p2_UIAxes,"off");
    close(d);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if app.p2_string18==1
    cla(app.p2_UIAxes,"reset");
    grid(app.p2_UIAxes,"on");
    hold(app.p2_UIAxes,"on");
    yyaxis(app.p2_UIAxes,"left");
    plot(app.p2_UIAxes,PATime,CAN_DCU_EopRotAct,"b");
    plot(app.p2_UIAxes,PATime,CAN_DCU_UdcAct_val ,"y-");
    plot(app.p2_UIAxes,PATime,DEW_Temp1_Bearing_DUT,"k-");
    plot(app.p2_UIAxes,PATime,HBM_Torque1,"g-");
    ylabel(app.p2_UIAxes,"Oil Pump speed,UDC,Temperature,Torque") ;
    yyaxis(app.p2_UIAxes,"right");
    %plot(app.p2_UIAxes,PATime,dcu,"r-");
    plot(app.p2_UIAxes,PATime,HBM_Speed1,"c-");
    ylabel(app.p2_UIAxes,"Motor Speed[rpm]");
    xlabel(app.p2_UIAxes,"Time[s]");
    app.p2_Label.Text="Cold Start";
    legend(app.p2_UIAxes,"EOP speed[rpm]","DCU UdcAct[V]","DEWTemp1 Bearing DUT[deg c]","Torque","Speed",'Location','northoutside','NumColumns',3);
    if manual==1
        xlim(app.p2_UIAxes,[xminn,xmaxx]);
        yyaxis(app.p2_UIAxes,"left");
        ylim(app.p2_UIAxes,[yminl,ymaxl]);
        yyaxis(app.p2_UIAxes,"right");
        ylim(app.p2_UIAxes,[yminr,ymaxr]);
    end
    hold(app.p2_UIAxes,"off");
    close(d);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if app.p2_string19==1
    cla(app.p2_UIAxes,"reset");
    numb=numel(speedvalue);
    mechp(1:numb) = 0;
    neweffi(1:numb)=0;
    for i=1:numb
        mechp(i)=(HBM_Speed_P1P2_STAT(i)*HBM_Torque_P1P2_STAT(i))/9549;
        neweffi(i)=(mechp(i)/DEW_P_Inverter(i))*1000;
    end
    neweffi=neweffi*100;
    X = str2double(app.p2_VoltageSetValueDropDown.Value);
    speedvalue=speedvalue(BTS_Voltage_Set_Val==X);
    torquevalue=torquevalue(BTS_Voltage_Set_Val==X);
    %HBM_Torque1=HBM_Torque1(BTS_Voltage_Set_Val==X);
    %HBM_Speed1=HBM_Speed1(BTS_Voltage_Set_Val==X);
    neweffi=neweffi(BTS_Voltage_Set_Val==X);
    XX = linspace(min(speedvalue),max(speedvalue),100);
    YY = linspace(min(torquevalue),max(torquevalue),100);
    [x,y] = meshgrid(XX,YY);
    z = griddata(speedvalue,torquevalue,neweffi,x,y);
    hold (app.p2_UIAxes,"on");
    %h=surf(app.p2_UIAxes,x,y,z);
    %h.EdgeColor = 'none';
    [~,c] = contourf(app.p2_UIAxes,x,y,z,"ShowText","on");
    %c.LabelSpacing=500;
    c.LevelStep=2;
    colormap(app.p2_UIAxes,"jet");
    colorbar(app.p2_UIAxes);
    caxis(app.p2_UIAxes,[25 95]);
    app.p2_Label.Text="Efficiency";
    xlabel(app.p2_UIAxes,"Speed[rpm]");
    ylabel(app.p2_UIAxes,"Torque[Nm]");
    maxeff=max(neweffi);
    vspeed=speedvalue(neweffi==maxeff);
    vtorque=torquevalue(neweffi==maxeff);
    T(1,1)="MaxEfficiency";T(1,2)=maxeff;
    T(2,1)="Speed";T(2,2)=vspeed;
    T(3,1)="torque";T(3,2)=vtorque;
    T(4,1)="Voltage";T(4,2)=X;
    app.p2_UITable2.ColumnName={'Parameter','Value'};
    app.p2_UITable2.Data=T;
    plot(app.p2_UIAxes,6000,70,'wx','markersize',10);
    textt='  '+string(maxeff);
    text(app.p2_UIAxes,6000,70,textt,"Color",'w');
    if manual==1
        xlim(app.p2_UIAxes,[xminn,xmaxx]);
        ylim(app.p2_UIAxes,[yminl,ymaxl]);
        c.LevelStep=app.p2_StepEditField.Value;
        %caxis(app.p2_UIAxes,[app.LowEditField.Value app.HighEditField.Value]);
    end
    hold (app.p2_UIAxes,"off");
    close(d);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if app.p2_string20==1
    cla(app.p2_UIAxes,"reset");
    numb=numel(speedvalue);
    mechp(1:numb) = 0;
    neweffi(1:numb)=0;
    for i=1:numb
        mechp(i)=(HBM_Speed_P1P2_STAT(i)*HBM_Torque_P1P2_STAT(i))/9549;
        neweffi(i)=((DEW_P_Inverter(i)/mechp(i))/1000);
    end
    neweffi=neweffi*100;
    neweffi(neweffi < 0) = 0;
    X = str2double(app.p2_VoltageSetValueDropDown.Value);
    speedvalue=speedvalue(BTS_Voltage_Set_Val==X);
    torquevalue=torquevalue(BTS_Voltage_Set_Val==X);
    %HBM_Torque1=HBM_Torque1(BTS_Voltage_Set_Val==X);
    %HBM_Speed1=HBM_Speed1(BTS_Voltage_Set_Val==X);
    neweffi=neweffi(BTS_Voltage_Set_Val==X);
    XX = linspace(min(speedvalue),max(speedvalue),100);
    YY = linspace(min(torquevalue),max(torquevalue),100);
    [x,y] = meshgrid(XX,YY);
    z = griddata(speedvalue,torquevalue,neweffi,x,y);
    hold (app.p2_UIAxes,"on");
    %h=surf(app.p2_UIAxes,x,y,z);
    %h.EdgeColor = 'none';

    [~,c] = contourf(app.p2_UIAxes,x,y,z,"ShowText","on");
    %c.LabelSpacing=500;
    colormap(app.p2_UIAxes,"jet");
    colorbar(app.p2_UIAxes);
    caxis(app.p2_UIAxes,[0 100]);
    app.p2_Label.Text="Regeneration Power";
    xlabel(app.p2_UIAxes,"Speed[rpm]");
    ylabel(app.p2_UIAxes,"Torque[Nm]");
    maxeff=max(neweffi);
    vspeed=speedvalue(neweffi==maxeff);
    vtorque=torquevalue(neweffi==maxeff);
    T(1,1)="MaxEfficiency";T(1,2)=maxeff;
    T(2,1)="Speed";T(2,2)=vspeed;
    T(3,1)="torque";T(3,2)=vtorque;
    T(4,1)="Voltage";T(4,2)=X;
    app.p2_UITable2.ColumnName={'Parameter','Value'};
    app.p2_UITable2.Data=T;
    if manual==1
        xlim(app.p2_UIAxes,[xminn,xmaxx]);
        ylim(app.p2_UIAxes,[yminl,ymaxl]);
        c.LevelStep=app.p2_StepEditField.Value;
        %caxis(app.p2_UIAxes,[app.LowEditField.Value app.HighEditField.Value]);
    end
    hold (app.p2_UIAxes,"off");
    close(d);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if app.p2_string21==1
    cla(app.p2_UIAxes,"reset");
    cla(app.p2_UIAxes4,"reset");

    X = str2double(app.p2_VoltageSetValueDropDown.Value);
    Y = str2double(app.p2_SpeedSetValueDropDown.Value);

    %PATime=PATime(BTS_Voltage_Set_Val==X);
    CAN_Modulation_Rate=CAN_Modulation_Rate(BTS_Voltage_Set_Val==X);
    speedvalue=speedvalue(BTS_Voltage_Set_Val==X);
    HBM_Torque1=HBM_Torque1(BTS_Voltage_Set_Val==X);
    DUT_Angle_Set_Val=DUT_Angle_Set_Val(BTS_Voltage_Set_Val==X);
    DUT_Current_Set_Val=DUT_Current_Set_Val(BTS_Voltage_Set_Val==X);

    %PATime=PATime(speedvalue==Y);
    HBM_Torque1=HBM_Torque1(speedvalue==Y);
    DUT_Angle_Set_Val=DUT_Angle_Set_Val(speedvalue==Y);
    DUT_Current_Set_Val=DUT_Current_Set_Val(speedvalue==Y);
    CAN_Modulation_Rate=CAN_Modulation_Rate(speedvalue==Y);

    cunique=unique(DUT_Current_Set_Val);
    cnum=numel(cunique);

    hold(app.p2_UIAxes,"on");
    hold(app.p2_UIAxes4,"on");
    grid(app.p2_UIAxes,"on");
    grid(app.p2_UIAxes4,"on");

    app.p2_t21.maxtorque="";
    app.p2_t21.maxmodrate="";

    for k=1:cnum
        HBM_Torque1x=HBM_Torque1(DUT_Current_Set_Val==cunique(k));
        DUT_Angle_Set_Valx=DUT_Angle_Set_Val(DUT_Current_Set_Val==cunique(k));
        CAN_Modulation_Ratex=CAN_Modulation_Rate(DUT_Current_Set_Val==cunique(k));
        plot(app.p2_UIAxes,DUT_Angle_Set_Valx,HBM_Torque1x,'.-',"MarkerSize",14);
        plot(app.p2_UIAxes4,DUT_Angle_Set_Valx,CAN_Modulation_Ratex,'.-',"MarkerSize",14);

        t21maxtorque(k)=max(HBM_Torque1x);
        app.p2_t21.maxanglet(k)=DUT_Angle_Set_Valx(find(HBM_Torque1x==t21maxtorque(k),1,'first'));

        modrate=1-CAN_Modulation_Ratex;
        [~,pos]=min(modrate);
        t21maxmodrate(k)=CAN_Modulation_Ratex(pos);
        app.p2_t21.maxanglem(k)=DUT_Angle_Set_Valx(pos);

        leg(k)=string(cunique(k))+" A";

        app.p2_t21.maxtorque(k)=sprintf('%0.2f',t21maxtorque(k));
        app.p2_t21.maxmodrate(k)=sprintf('%0.3f',t21maxmodrate(k));
    end
    %     app.t21.maxtorque=double(app.t21.maxtorque);
    %     app.t21.maxmodrate=double(app.t21.maxmodrate);

    legend(app.p2_UIAxes,leg(:),"Location","northoutside","NumColumns",5);
    legend(app.p2_UIAxes4,leg(:),"Location","northoutside","NumColumns",5);
    app.p2_Label.Text="Parameter Tuning";
    xlabel(app.p2_UIAxes,"DUT Angle[deg]");
    xlabel(app.p2_UIAxes4,"DUT Angle[deg]");
    ylabel(app.p2_UIAxes,"Torque[Nm]");
    ylim(app.p2_UIAxes,[0 300])
    ylabel(app.p2_UIAxes4,"Modulation Rate");

    if app.p2_t21Switch.Value=="T-Angle"
        set(app.p2_UIAxes,'Visible',"on");
        set(app.p2_UIAxes.Legend,'Visible',"on");
        set(app.p2_UIAxes.Children,'Visible',"on");
        set(app.p2_UIAxes4,'Visible',"off");
        set(app.p2_UIAxes4.Legend,'Visible',"off");
        set(app.p2_UIAxes4.Children,'Visible',"off");
        T(1:cnum,2)=app.p2_t21.maxtorque(:);
        T(1:cnum,3)=app.p2_t21.maxanglet(:);
        app.p2_UITable2.ColumnName={'Current[Amp]','MaxTorque[Nm]',"Angle[deg]"};
    else
        set(app.p2_UIAxes4,'Visible',"on");
        set(app.p2_UIAxes4.Legend,'Visible',"on");
        set(app.p2_UIAxes4.Children,'Visible',"on");
        set(app.p2_UIAxes,'Visible',"off");
        set(app.p2_UIAxes.Legend,'Visible',"off");
        set(app.p2_UIAxes.Children,'Visible',"off");
        T(1:cnum,2)=app.p2_t21.maxmodrate(:);
        T(1:cnum,3)=app.p2_t21.maxanglem(:);
        app.p2_UITable2.ColumnName={'Current[Amp]',"Modulation Rate","Angle[deg]"};
    end
    T(1:cnum,1)=cunique(:);
    app.p2_UITable2.Data=T;
    xlim(app.p2_UIAxes,[0 90]);
    xlim(app.p2_UIAxes4,[0 90]);
    ylim(app.p2_UIAxes4,[0 1.2]);
    if manual==1
        if app.p2_t21Switch.Value=="T-Angle"
            xlim(app.p2_UIAxes,[xminn,xmaxx]);
            ylim(app.p2_UIAxes,[yminl,ymaxl]);
        else
            xlim(app.p2_UIAxes4,[xminn,xmaxx]);
            ylim(app.p2_UIAxes4,[yminl,ymaxl]);
        end
    end
    hold(app.p2_UIAxes,"off");
    hold(app.p2_UIAxes4,"off");
    close(d);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%test
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if app.p2_string99==1
    cla(app.p2_UIAxes,"reset");
    app.p2_GraphLabel.Text="Vibration/Temperature graph";
    Acc11=app.p2_data{:,"TDS_1201P_Accelerometer1"};
    Acc21=app.p2_data{:,"TDS_1201P_Accelerometer2"};
    Acc31=app.p2_data{:,"TDS_1201P_Accelerometer3"};
    Acc41=app.p2_data{:,"TDS_1201P_Accelerometer4"};
    Temp11=app.p2_data{:,"TDS_1201P_Thermoeter1"};
    Temp21=app.p2_data{:,"TDS_1201P_Thermoeter2"};
    Temp31=app.p2_data{:,"TDS_1201P_Thermoeter3"};
    Temp41=app.p2_data{:,"TDS_1201P_Thermoeter4"};
    Temp51=app.p2_data{:,"TDS_1201P_Thermoeter5"};
    Temp61=app.p2_data{:,"TDS_1201P_Thermoeter6"};
    Temp71=app.p2_data{:,"TDS_1201P_Thermoeter7"};
    Temp81=app.p2_data{:,"TDS_1201P_Thermoeter8"};
    Speed1=app.p2_data{:,"CTM700_DRIVE_Speed.AV"};
    Time1=app.p2_data{:,"Measurement_Time_10Hz"};
    Speed2=app.p2_data{:,"Speed_Set_Val"};
    Torque1=app.p2_data{:,"HBM_Torque1"};
    %timediff=PATime(2,1)-PATime(3,1);
    PATime=PATime(:,1)-PATime(1,1);
    T=[Speed1 Acc11 Acc21 Acc31 Acc41 Temp11 Temp21 Temp31 Temp41 Temp51 Temp61 Temp71 Temp81 Time1 Speed2 Torque1];
    T=array2table(T);
    T.Properties.VariableNames=["Speed","Acc1","Acc2","Acc3","Acc4","Temp1","Temp2","Temp3","Temp4","Temp5","Temp6","Temp7","Temp8","Timee","Speedd","Torquee"];

    hold(app.p2_UIAxes2,"on");
    app.p2_UIAxes2.Title.String="Speed timeline";
    xlabel(app.p2_UIAxes2,"Time[sec]");
    ylabel(app.p2_UIAxes2,"Speed[RPM]");
    set(app.p2_UIAxes2,'XGrid','on');
    set(app.p2_UIAxes2,'YGrid','on');
    app.p2_t99p5=plot(app.p2_UIAxes2,PATime,T{:,15},'-');

    hold(app.p2_UIAxes3,"on");
    app.p2_UIAxes3.Title.String="Torque timeline";
    xlabel(app.p2_UIAxes3,"Time[sec]");
    ylabel(app.p2_UIAxes3,"Torque[Nm]");
    set(app.p2_UIAxes3,'XGrid','on');
    set(app.p2_UIAxes3,'YGrid','on');
    app.p2_t99p5=plot(app.p2_UIAxes3,PATime,T{:,16},'-');

    T2=sortrows(T,1);
    hold(app.p2_UIAxes,"on");
    xlabel(app.p2_UIAxes,"Speed[RPM]");
    %yyaxis(app.p2_UIAxes,"left");
    app.p2_opt0.Value=1;
    app.p2_opt1.Value=1;
    app.p2_opt2.Value=1;
    app.p2_opt3.Value=1;
    app.p2_opt4.Value=1;
    app.p2_opt5.Value=1;
    app.p2_opt6.Value=1;
    app.p2_opt7.Value=1;

    app.p2_opt3.Enable="on";
    app.p2_opt2.Enable="on";
    app.p2_opt1.Enable="on";
    app.p2_opt0.Enable="on";
    app.p2_opt3.Visible="on";
    app.p2_opt2.Visible="on";
    app.p2_opt1.Visible="on";
    app.p2_opt0.Visible="on";

    if app.p2_t99_Switch.Value=="Vibration"
        app.p2_opt0.Text="Vibration1";
        app.p2_opt1.Text="Vibration2";
        app.p2_opt2.Text="Vibration3";
        app.p2_opt3.Text="Vibration4";

        app.p2_opt4.Enable="off";
        app.p2_opt5.Enable="off";
        app.p2_opt6.Enable="off";
        app.p2_opt7.Enable="off";

        app.p2_opt4.Visible="off";
        app.p2_opt5.Visible="off";
        app.p2_opt6.Visible="off";
        app.p2_opt7.Visible="off";
       
        app.p2_t99p1=plot(app.p2_UIAxes,T2{:,"Speed"},T2{:,"Acc1"},'-');
        app.p2_t99p2=plot(app.p2_UIAxes,T2{:,"Speed"},T2{:,"Acc2"},'-');
        app.p2_t99p3=plot(app.p2_UIAxes,T2{:,"Speed"},T2{:,"Acc3"},'-');
        app.p2_t99p4=plot(app.p2_UIAxes,T2{:,"Speed"},T2{:,"Acc4"},'-');
        ylabel(app.p2_UIAxes,"Vibration[mm/s]");
        legend(app.p2_UIAxes,"Accelerometer1","Accelerometer2","Accelerometer3","Accelerometer4","NumColumns",4,"Location","southoutside");
    else
        app.p2_opt0.Text="Temperature1";
        app.p2_opt1.Text="Temperature2";
        app.p2_opt2.Text="Temperature3";
        app.p2_opt3.Text="Temperature4";
        app.p2_opt4.Text="Temperature5";
        app.p2_opt5.Text="Temperature6";
        app.p2_opt6.Text="Temperature7";
        app.p2_opt7.Text="Temperature8";

        app.p2_opt4.Enable="on";
        app.p2_opt5.Enable="on";
        app.p2_opt6.Enable="on";
        app.p2_opt7.Enable="on";

        app.p2_opt4.Visible="on";
        app.p2_opt5.Visible="on";
        app.p2_opt6.Visible="on";
        app.p2_opt7.Visible="on";

        app.p2_t99p5=plot(app.p2_UIAxes,T{:,1},T{:,6},'-');
        app.p2_t99p6=plot(app.p2_UIAxes,T{:,1},T{:,7},'-');
        app.p2_t99p7=plot(app.p2_UIAxes,T{:,1},T{:,8},'-');
        app.p2_t99p8=plot(app.p2_UIAxes,T{:,1},T{:,9},'-');
        app.p2_t99p9=plot(app.p2_UIAxes,T{:,1},T{:,10},'-');
        app.p2_t99p10=plot(app.p2_UIAxes,T{:,1},T{:,11},'-');
        app.p2_t99p11=plot(app.p2_UIAxes,T{:,1},T{:,12},'-');
        app.p2_t99p12=plot(app.p2_UIAxes,T{:,1},T{:,13},'-');
        ylabel(app.p2_UIAxes,"Temperature[Deg C]");
        legend(app.p2_UIAxes,"Thermometer1","Thermometer2","Thermometer3","Thermometer4","Thermometer5","Thermometer6","Thermometer7","Thermometer8","NumColumns",4,"Location","southoutside");
    end
    ylabel(app.p2_UIAxes,"Vibration[mm/s]");
    set(app.p2_UIAxes,'XGrid','on');
    set(app.p2_UIAxes,'YGrid','on');
    if manual==1
        xlim(app.p2_UIAxes,[xminn,xmaxx]);
        yyaxis(app.p2_UIAxes,"left");
        ylim(app.p2_UIAxes,[yminl,ymaxl]);
        yyaxis(app.p2_UIAxes,"right");
        ylim(app.p2_UIAxes,[yminr,ymaxr]);
    end
    hold(app.p2_UIAxes,"off");
    app.p2_Label.Text="Test";
    close(d);
end
end