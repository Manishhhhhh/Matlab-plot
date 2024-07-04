function p3_File7ButtonPushed(app)
[app.p3_file(7),app.p3_path(7)]=uigetfile({'*.*';'*.csv';'*.xlsx'});
if strlength(app.p3_file(7)) == 0
    app.p3_Filename7.Value = "";
    app.p3_Filepath7.Value = "";
else
app.p3_Filename7.Value = app.p3_file(7);
app.p3_Filepath7.Value = app.p3_path(7);
end