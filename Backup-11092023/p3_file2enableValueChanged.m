function p3_file2enableValueChanged(app)
value = app.p3_file2enable.Value;
if value == 1
    app.p3_File2Button.Enable=1;
    app.p3_Filename2.Enable=1;
    app.p3_Filepath2.Enable=1;
    app.p3_file(2)=app.p3_Filename2.Value;
    app.p3_path(2)=app.p3_Filepath2.Value;
else
    app.p3_File2Button.Enable=0;
    app.p3_Filename2.Enable=0;
    app.p3_Filepath2.Enable=0;
    app.p3_file(2)="";
    app.p3_path(2)="";
end
