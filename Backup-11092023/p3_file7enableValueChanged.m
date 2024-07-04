function p3_file7enableValueChanged(app)
value = app.p3_file7enable.Value;
if value == 1
    app.p3_File7Button.Enable=1;
    app.p3_Filename7.Enable=1;
    app.p3_Filepath7.Enable=1;
    app.p3_file(7)=app.p3_Filename7.Value;
    app.p3_path(7)=app.p3_Filepath7.Value;
else
    app.p3_File7Button.Enable=0;
    app.p3_Filename7.Enable=0;
    app.p3_Filepath7.Enable=0;
    app.p3_file(7)="";
    app.p3_path(7)="";
end
