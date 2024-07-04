function p3_File3ButtonPushed(app)
[app.p3_file(3),app.p3_path(3)]=uigetfile({'*.*';'*.csv';'*.xlsx'});
if strlength(app.p3_file(3)) == 0
    app.p3_Filename3.Value = "";
    app.p3_Filepath3.Value = "";
else
app.p3_Filename3.Value = app.p3_file(3);
app.p3_Filepath3.Value = app.p3_path(3);
end