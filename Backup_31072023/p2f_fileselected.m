function p2f_fileselected(app)
executionnum=0;
%[file,path]=uigetfile("Z:\erg0\*.*",'MultiSelect','on');
[file,path]=uigetfile;
[~,col]=size(file);

if isequal(file,0)
    disp("No file selected");
else
    %clear the contents of table
    app.p2_plotbtn=0;
    app.p2_UITable2.ColumnName=[];
    app.p2_UITable2.Data=[];
    app.p2_UIAxes2.Visible="off";
    app.p2_UIAxes3.Visible="off";
    app.p2_VoltageSetValueDropDown.Items=["0","0","0","0"];
    app.p2_SpeedSetValueDropDown.Items=["0","0","0","0"];
    app.p2_TorqueSetValueDropDown.Items=["0","0","0","0"];
    d = uiprogressdlg(app.UIFigure,'Title','Please wait',"Message","Reading csv file",'Indeterminate','on');
    if iscell(file)~=1
        disp("not cell");
        app.p2_data=readtable(fullfile(path,file),'VariableNamingRule',"preserve");
        app.p2_variables=app.p2_data.Properties.VariableNames;
        executionnum=1;
        str=file;
    else
        for i=1:col
            disp(" cell");
            if i==1
                app.p2_data=readtable(fullfile(path,file{1,i}),'VariableNamingRule',"preserve");
                app.p2_variables=app.p2_data.Properties.VariableNames;
                [~,varcol]=size(app.p2_variables);
                str=file(1);
            else
            p2_data_temp=readtable(fullfile(path,file{1,i}),'VariableNamingRule',"preserve");
            p2_variables_temp=p2_data_temp.Properties.VariableNames;
            [~,newvarcol]=size(p2_variables_temp);
            if newvarcol~=varcol
                disp("variable numbers are not equal");
                executionnum=-1;
                return
            else
                for j=1:varcol
                    if strcmp(p2_variables_temp(j),app.p2_variables(j))~=1
                        disp("variables are not equal");
                        executionnum=-1;
                        return
                    else
                         executionnum=1; 
                    end
                end 
            end
            
            [p2newrow,~]=size(app.p2_data);
            [newrow,~]=size(p2_data_temp);
            app.p2_data(p2newrow+1:p2newrow+newrow,1:newvarcol)=p2_data_temp;
            end
        end
    end
    
    if executionnum==1
        close(d);
        hbm=app.p2_data{:,"HBM_Torque1"};
        idx=find(hbm < -350);
        app.p2_data(idx,:)=[];

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%Testnumber selection%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        str0="testnum-0_";
        str1="testnum-1_";str2="testnum-2_";str3="testnum-3_";str4="testnum-4_";
        str5="testnum-5_";str6="testnum-6_";str7="testnum-7_";str8="testnum-8_";
        str9="testnum-9_";str10="testnum-10_";str11="testnum-11_";str12="testnum-12_";
        str13="testnum-13_";str14="testnum-14_";str15="testnum-15_";str16="testnum-16_";
        str17="testnum-17_";str18="testnum-18_";str19="testnum-19_";str20="testnum-20_";
        str21="testnum-21_";str99="testnum-test_";
        app.p2_string0=contains(str,str0);
        app.p2_string1=contains(str,str1);app.p2_string2=contains(str,str2);
        app.p2_string3=contains(str,str3);app.p2_string4=contains(str,str4);
        app.p2_string5=contains(str,str5);app.p2_string6=contains(str,str6);
        app.p2_string7=contains(str,str7);app.p2_string8=contains(str,str8);
        app.p2_string9=contains(str,str9);app.p2_string10=contains(str,str10);
        app.p2_string11=contains(str,str11);app.p2_string12=contains(str,str12);
        app.p2_string13=contains(str,str13);app.p2_string14=contains(str,str14);
        app.p2_string15=contains(str,str15);app.p2_string16=contains(str,str16);
        app.p2_string17=contains(str,str17);app.p2_string18=contains(str,str18);
        app.p2_string19=contains(str,str19);app.p2_string20=contains(str,str20);
        app.p2_string21=contains(str,str21);app.p2_string99=contains(str,str99);
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%HIDE FUNCTION%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        app.p2_UITable2.Visible="on";
        %                 app.p2_UIAxes2.Visible="off";
        %                 app.p2_UIAxes3.Visible="off";
        app.p2_UIAxes4.Visible="off";
        app.p2_TableLabel.Visible="on";
        app.p2_UIAxes.Title.Visible="off";
        app.p2_StepEditField.Visible="off";
        app.StepEditFieldLabel.Visible="off";
        app.p2_YminrightEditField.Visible="off";
        app.YminrightEditFieldLabel.Visible="off";
        app.p2_YmaxrightEditField_2.Visible="off";
        app.YmaxrightEditField_2Label.Visible="off";
        app.p2_t21Switch.Visible="off";
        app.p2_t21Switch.Enable="off";
        app.p2_t99_Switch.Enable="off";
        app.p2_t99_Switch.Visible="off";                    
        app.p2_opt7.Enable="off";                       
        app.p2_opt6.Enable="off";                       
        app.p2_opt5.Enable="off";                       
        app.p2_opt4.Enable="off";                       
        app.p2_opt3.Enable="off";                       
        app.p2_opt2.Enable="off";                       
        app.p2_opt1.Enable="off";                       
        app.p2_opt0.Enable="off";                   
        app.p2_opt7.Visible="off";                       
        app.p2_opt6.Visible="off";                       
        app.p2_opt5.Visible="off";                       
        app.p2_opt4.Visible="off";                       
        app.p2_opt3.Visible="off";                       
        app.p2_opt2.Visible="off";                       
        app.p2_opt1.Visible="off";                       
        app.p2_opt0.Visible="off";

        set(app.p2_UIAxes,'Visible',"on");
        set(app.p2_UIAxes.Legend,'Visible',"on");
        set(app.p2_UIAxes.Children,'Visible',"on");
        set(app.p2_UIAxes4,'Visible',"off");
        set(app.p2_UIAxes4.Legend,'Visible',"off");
        set(app.p2_UIAxes4.Children,'Visible',"off");
        app.p2_strct.lims=[0,0,0,0,0;0,0,0,0,0];

        if  app.p2_string10==1 || app.p2_string11==1 || app.p2_string12==1 || app.p2_string13==1 || app.p2_string14==1 || app.p2_string16==1 || app.p2_string15==1 || app.p2_string17==1
            app.p2_VoltageSetValueDropDown.Visible="on";
            app.VoltageSetValueDropDownLabel.Visible="on";
            app.p2_SpeedSetValueDropDown.Visible="on";
            app.SpeedSetValueDropDownLabel.Visible="on";
            app.p2_TorqueSetValueDropDown.Visible="on";
            app.TorqueSetValueDropDownLabel.Visible="on";
            app.p2_YminrightEditField.Visible="on";
            app.YminrightEditFieldLabel.Visible="on";
            app.p2_YmaxrightEditField_2.Visible="on";
            app.YmaxrightEditField_2Label.Visible="on";
        end
        if  app.p2_string1==1 || app.p2_string2==1 || app.p2_string3==1 || app.p2_string4==1 || app.p2_string8==1 || app.p2_string7==1
            app.p2_VoltageSetValueDropDown.Visible="off";
            app.VoltageSetValueDropDownLabel.Visible="off";
            app.p2_SpeedSetValueDropDown.Visible="off";
            app.SpeedSetValueDropDownLabel.Visible="off";
            app.p2_TorqueSetValueDropDown.Visible="off";
            app.TorqueSetValueDropDownLabel.Visible="off";
            app.p2_StepEditField.Visible="off";
            app.StepEditFieldLabel.Visible="off";
        end
        if app.p2_string19==1 || app.p2_string20==1
            app.p2_VoltageSetValueDropDown.Visible="on";
            app.VoltageSetValueDropDownLabel.Visible="on";
            app.p2_StepEditField.Visible="on";
            app.StepEditFieldLabel.Visible="on";
            app.p2_SpeedSetValueDropDown.Visible="off";
            app.SpeedSetValueDropDownLabel.Visible="off";
            app.p2_TorqueSetValueDropDown.Visible="off";
            app.TorqueSetValueDropDownLabel.Visible="off";
        end

        if app.p2_string21==1
            disp("21")
            app.p2_VoltageSetValueDropDown.Visible="on";
            app.VoltageSetValueDropDownLabel.Visible="on";
            app.p2_StepEditField.Visible="off";
            app.StepEditFieldLabel.Visible="off";
            app.p2_SpeedSetValueDropDown.Visible="on";
            app.SpeedSetValueDropDownLabel.Visible="on";
            app.p2_TorqueSetValueDropDown.Visible="off";
            app.TorqueSetValueDropDownLabel.Visible="off";
            app.p2_T40ch1Button.Visible="off";
            app.p2_T40ch2Button.Visible="off";
            app.p2_t21Switch.Enable="on";
            app.p2_t21Switch.Visible="on";
        end

        if app.p2_string0==1
            app.p2_VoltageSetValueDropDown.Visible="off";
            app.VoltageSetValueDropDownLabel.Visible="off";
            app.p2_SpeedSetValueDropDown.Visible="off";
            app.SpeedSetValueDropDownLabel.Visible="off";
            app.p2_TorqueSetValueDropDown.Visible="off";
            app.TorqueSetValueDropDownLabel.Visible="off";
            app.p2_StepEditField.Visible="off";
            app.StepEditFieldLabel.Visible="off";
            app.p2_UITable2.Visible="off";
            app.p2_UIAxes2.Visible="on";
            app.p2_UIAxes3.Visible="on";
            app.p2_UIAxes2.Title.String="Power";
            app.p2_UIAxes3.Title.String="Torque";
            app.p2_TableLabel.Visible="off";
        end
        if app.p2_string3==1 || app.p2_string4==1
            app.p2_YminrightEditField.Visible="on";
            app.YminrightEditFieldLabel.Visible="on";
            app.p2_YmaxrightEditField_2.Visible="on";
            app.YmaxrightEditField_2Label.Visible="on";
        end
        if app.p2_string99==1
            app.p2_VoltageSetValueDropDown.Visible="off";
            app.VoltageSetValueDropDownLabel.Visible="off";
            app.p2_SpeedSetValueDropDown.Visible="off";
            app.SpeedSetValueDropDownLabel.Visible="off";
            app.p2_TorqueSetValueDropDown.Visible="off";
            app.TorqueSetValueDropDownLabel.Visible="off";
            app.p2_StepEditField.Visible="off";
            app.StepEditFieldLabel.Visible="off";
            app.p2_t99_Switch.Enable="on";
            app.p2_t99_Switch.Visible="on";

            app.p2_UITable2.Visible="off";
            app.p2_UIAxes2.Visible="on";
            app.p2_UIAxes3.Visible="on";
            app.p2_TableLabel.Visible="off";
            
        end
        if app.p2_string5==1 || app.p2_string6==1
            app.p2_VoltageSetValueDropDown.Visible="on";
            app.VoltageSetValueDropDownLabel.Visible="on";
            app.p2_SpeedSetValueDropDown.Visible="on";
            app.SpeedSetValueDropDownLabel.Visible="on";
            app.p2_TorqueSetValueDropDown.Visible="on";
            app.TorqueSetValueDropDownLabel.Visible="on";
        end    

        if app.p2_VoltageSetValueDropDown.Visible == "on"
            matchvoltagesetval=matches(app.p2_variables,'BTS_Voltage_Set_Val');
            app.p2_voltagesetval=app.p2_data{:,matchvoltagesetval};
            numelv=numel(unique(app.p2_voltagesetval));
            numelv1=numelv+1;vunique(1)=0;vunique(2:numelv1)=unique(app.p2_voltagesetval);
            voltagestri=string(vunique);
            app.p2_VoltageSetValueDropDown.Items=voltagestri;
            app.p2_VoltageSetValueDropDown.Value=app.p2_VoltageSetValueDropDown.Items(1);
        end
    end
end
end