function p3_file1enableValueChanged(app)
value = app.p3_file1enable.Value;
if value == 1
    app.p3_File1Button.Enable=1;
    app.p3_Filename1.Enable=1;
    app.p3_Filepath1.Enable=1;
    app.p3_file(1)=app.p3_Filename1.Value;
    app.p3_path(1)=app.p3_Filepath1.Value;
else
    app.p3_File1Button.Enable=0;
    app.p3_Filename1.Enable=0;
    app.p3_Filepath1.Enable=0; 
    app.p3_file(1)="";
    app.p3_path(1)="";
end
