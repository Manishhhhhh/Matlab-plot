function p3_file5enableValueChanged(app)
value = app.p3_file5enable.Value;
if value == 1
    app.p3_File5Button.Enable=1;
    app.p3_Filename5.Enable=1;
    app.p3_Filepath5.Enable=1;
    app.p3_file(5)=app.p3_Filename5.Value;
    app.p3_path(5)=app.p3_Filepath5.Value;
else
    app.p3_File5Button.Enable=0;
    app.p3_Filename5.Enable=0;
    app.p3_Filepath5.Enable=0;
    app.p3_file(5)="";
    app.p3_path(5)="";
end
