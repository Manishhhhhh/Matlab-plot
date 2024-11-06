function p3f_comparefileselected(app)
cla(app.p3_UIAxes,"reset");
app.p3_data=table;
app.p3_variables="";
varpos=1;
[row,~]=size(app.p3_file_2);
d = uiprogressdlg(app.UIFigure,'Title','Please wait',"Message","Reading the file",'Indeterminate','on');
app.p3_Message.Text = "Reading file[s], please wait";
for j=1:row %for compare option
    newfile=app.p3_file_2(j,1:end);
    newfile(cellfun('isempty',newfile)) = [];
    [~,col]=size(newfile);
    if col == 1
        newdata=readtable(fullfile(app.p3_path_2(j,1),newfile),'VariableNamingRule',"preserve");
        newvariables=newdata.Properties.VariableNames;
        varnum="File"+string(j)+"-";
        strfinal="";
        [newnumrows,newnumvars]=size(newdata);
        [numrows,~]=size(app.p3_data);
        if newnumrows < numrows && j~=1
            newdata{newnumrows+1:numrows,:}=nan;
            app.p3_data(:,varpos:varpos+newnumvars-1)=newdata;
        elseif newnumrows > numrows && j~=1
            app.p3_data{numrows+1:newnumrows,:}=nan;
            app.p3_data(:,varpos:varpos+newnumvars-1)=newdata;
        else
            app.p3_data(:,varpos:varpos+newnumvars-1)=newdata;
        end
        for nmv=1:newnumvars
            strfinal(nmv)=append(varnum,newvariables{nmv});
        end
        app.p3_variables(1,varpos:varpos+newnumvars-1)=strfinal;
        varpos=varpos+newnumvars;

    else
        for i=1:col %original
            if i==1
                newdata=readtable(fullfile(app.p3_path_2{j,1},app.p3_file_2{j,i}),'VariableNamingRule',"preserve");
                newvariables=newdata.Properties.VariableNames;
                varnum="File"+string(j)+"-";
                strfinal="";
                [~,newnumvars]=size(newdata);
            else
                newtempdata=readtable(fullfile(app.p3_path_2{j,1},app.p3_file_2{j,i}),'VariableNamingRule',"preserve");
                [newtempnumrows,newtempnumvars]=size(newtempdata);
                if newtempnumvars~=newnumvars
                    msg="Files are not similar, please choose files with same variables";
                    title="Error";
                    f = errordlg(msg,title);
                    app.p3_Message.Text = "File mismatch error";
                    return
                end
                [p2newrow,~]=size(newdata);
                newdata(p2newrow+1:p2newrow+newtempnumrows,1:newtempnumvars)=newtempdata;
            end
        end
        [newnumrows,newnumvars]=size(newdata);
        [numrows,~]=size(app.p3_data);
        if newnumrows < numrows && j~=1
            newdata{newnumrows+1:numrows,:}=nan;
            app.p3_data(:,varpos:varpos+newnumvars-1)=newdata;
        elseif newnumrows > numrows && j~=1
            app.p3_data{numrows+1:newnumrows,:}=nan;
            app.p3_data(:,varpos:varpos+newnumvars-1)=newdata;
        else
            app.p3_data(:,varpos:varpos+newnumvars-1)=newdata;
        end
        for nmv=1:newnumvars
            strfinal(nmv)=append(varnum,newvariables{nmv});
        end
        app.p3_variables(1,varpos:varpos+newnumvars-1)=strfinal;
        varpos=varpos+newnumvars;
    end
end
app.p3_data.Properties.VariableNames=app.p3_variables;
%disp(app.p3_data);
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
app.p3_ylcheckbox1.Value = 1;
app.p3_Message.Text = "Reading complete";
close(d);
p3f_plot(app);
end