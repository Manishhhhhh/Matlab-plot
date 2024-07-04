function p3_file6enableValueChanged(app)
value = app.p3_file6enable.Value;
if value == 1
    app.p3_File6Button.Enable=1;
    app.p3_Filename6.Enable=1;
    app.p3_Filepath6.Enable=1;
    app.p3_file(6)=app.p3_Filename6.Value;
    app.p3_path(6)=app.p3_Filepath6.Value;
else
    app.p3_File6Button.Enable=0;
    app.p3_Filename6.Enable=0;
    app.p3_Filepath6.Enable=0;
    app.p3_file(6)="";
    app.p3_path(6)="";
end
