function p3f_fileselected(app)
%[file,path]=uigetfile("Z:\erg0\*.*",'MultiSelect','on');
[file,path]=uigetfile({'*.*';'*.csv';'*.xlsx'});
[~,col]=size(file);
d = uiprogressdlg(app.UIFigure,'Title','Please wait',"Message","Reading the file",'Indeterminate','on');
if isequal(file,0)
    disp("No file selected");
else
    d = uiprogressdlg(app.UIFigure,'Title','Please wait',"Message","Reading csv file",'Indeterminate','on');
    app.p3_data=readtable(fullfile(path,file),'VariableNamingRule',"preserve");
    app.p3_variables=app.p3_data.Properties.VariableNames;
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
    executionnum=1;
    str=file;

    %%%%%%%%%%%%%%%Dropdown color%%%%%%%%%%%%%%
%     s1 = uistyle("BackgroundColor","red");
%     s2 = uistyle("BackgroundColor","green");
%     s3 = uistyle("BackgroundColor","blue");
%     s4 = uistyle("BackgroundColor","cyan");
%     s5 = uistyle("BackgroundColor","magenta");
%     s6 = uistyle("BackgroundColor","yellow");
%     s7 = uistyle("BackgroundColor","black");
%     s8 = uistyle("BackgroundColor","white");
% 
%     addStyle(app.p3_ylcolor1,s1,"item",1);
%     addStyle(app.p3_ylcolor2,s2,"item",2);
%     addStyle(app.p3_ylcolor3,s3,"item",3);
%     addStyle(app.p3_ylcolor4,s4,"item",4);
%     addStyle(app.p3_ylcolor5,s5,"item",5);
%     addStyle(app.p3_ylcolor6,s6,"item",6);
%     addStyle(app.p3_ylcolor7,s7,"item",7);
%     addStyle(app.p3_ylcolor8,s8,"item",8);

close(d);
end
end
