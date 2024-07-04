function p3_file8enableValueChanged(app)
value = app.p3_file8enable.Value;
if value == 1
    app.p3_File8Button.Enable=1;
    app.p3_Filename8.Enable=1;
    app.p3_Filepath8.Enable=1;
    app.p3_file(8)=app.p3_Filename8.Value;
    app.p3_path(8)=app.p3_Filepath8.Value;
else
    app.p3_File8Button.Enable=0;
    app.p3_Filename8.Enable=0;
    app.p3_Filepath8.Enable=0;
    app.p3_file(8)="";
    app.p3_path(8)="";
end
