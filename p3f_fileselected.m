function p3f_fileselected(app)
%[file,path]=uigetfile({'*.*';'*.csv';'*.xlsx'});
% [file,path]=uigetfile({'*.*';'*.csv';'*.xlsx'},'MultiSelect','on');
cla(app.p3_UIAxes,"reset");
app.p3_data=[];
[~,col]=size(app.p3_file_2);
d = uiprogressdlg(app.UIFigure,'Title','Please wait',"Message","Reading the file",'Indeterminate','on');
% if app.p3_file_2{:} == 0
%     %|| isequal(app.p3_file_2,0)
%     app.p3_Message.Text="No files selected, Please select a valid file before plotting";
%     msg="No file selected, Please select a valid file before plotting";
%     title="Error";
%    f = errordlg(msg,title);
% else
app.p3_Message.Text = "Reading file[s], please wait";
if col == 1
    app.p3_file_2=app.p3_file_2{1,1};
    app.p3_data=readtable(fullfile(app.p3_path_2(1),app.p3_file_2),'VariableNamingRule',"preserve");
    app.p3_variables=app.p3_data.Properties.VariableNames;
    executionnum=1;
    str=app.p3_file_2;
else
    for i=1:col
        if i==1
            app.p3_data=readtable(fullfile(app.p3_path_2{1,i},app.p3_file_2{1,i}),'VariableNamingRule',"preserve");
            app.p3_variables=app.p3_data.Properties.VariableNames;
            [~,varcol]=size(app.p3_variables);
            str=app.p3_file_2(1);
        else
            data_temp="";
            data_temp=readtable(fullfile(app.p3_path_2{1,i},app.p3_file_2{1,i}),'VariableNamingRule',"preserve");
            variables_temp=data_temp.Properties.VariableNames;
            [~,newvarcol]=size(variables_temp);
            if newvarcol~=varcol
                msg="Files are not similar, please choose files with same variables";
                title="Error";
                f = errordlg(msg,title);
                executionnum=-1;
                return
            else
                for j=1:varcol
                    if strcmp(variables_temp(j),app.p3_variables(j))~=1
                        msg="Files are not similar, please choose files with same variables";
                        title="Error";
                        f = errordlg(msg,title);
                        executionnum=-1;
                        return
                    else
                        executionnum=1;
                    end
                end
            end

            [p2newrow,~]=size(app.p3_data);
            [newrow,~]=size(data_temp);
            app.p3_data(p2newrow+1:p2newrow+newrow,1:newvarcol)=data_temp;
            data_temp=[];
        end
    end
end
app.p3_xparameter1.Items=app.p3_variables;
app.p3_ylparameter1.Items=app.p3_variables;
app.p3_ylparameter2.Items=app.p3_variables;
app.p3_ylparameter3.Items=app.p3_variables;
app.p3_ylparameter4.Items=app.p3_variables;
app.p3_ylparameter5.Items=app.p3_variables;
app.p3_ylparameter6.Items=app.p3_variables;
app.p3_ylparameter7.Items=app.p3_variables;
app.p3_ylparameter8.Items=app.p3_variables;
app.p3_yrparameter1.Items=app.p3_variables;
app.p3_yrparameter2.Items=app.p3_variables;
app.p3_yrparameter3.Items=app.p3_variables;
app.p3_yrparameter4.Items=app.p3_variables;
app.p3_yrparameter5.Items=app.p3_variables;
app.p3_yrparameter6.Items=app.p3_variables;
app.p3_yrparameter7.Items=app.p3_variables;
app.p3_yrparameter8.Items=app.p3_variables;
%     executionnum=1;
app.p3_ylcheckbox1.Value = 1;
str=app.p3_file;
% end
app.p3_Message.Text = "Reading complete";
close(d);
p3f_plot(app);
end