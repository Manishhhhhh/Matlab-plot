function p3_file3enableValueChanged(app)
value = app.p3_file3enable.Value;
if value == 1
    app.p3_File3Button.Enable=1;
    app.p3_Filename3.Enable=1;
    app.p3_Filepath3.Enable=1;
    app.p3_file(3)=app.p3_Filename3.Value;
    app.p3_path(3)=app.p3_Filepath3.Value;
else
    app.p3_File3Button.Enable=0;
    app.p3_Filename3.Enable=0;
    app.p3_Filepath3.Enable=0;
    app.p3_file(3)="";
    app.p3_path(3)="";
end
