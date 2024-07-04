function p3_file4enableValueChanged(app)
value = app.p3_file4enable.Value;
if value == 1
    app.p3_File4Button.Enable=1;
    app.p3_Filename4.Enable=1;
    app.p3_Filepath4.Enable=1;
    app.p3_file(4)=app.p3_Filename4.Value;
    app.p3_path(4)=app.p3_Filepath4.Value;
else
    app.p3_File4Button.Enable=0;
    app.p3_Filename4.Enable=0;
    app.p3_Filepath4.Enable=0;
    app.p3_file(4)="";
    app.p3_path(4)="";
end
