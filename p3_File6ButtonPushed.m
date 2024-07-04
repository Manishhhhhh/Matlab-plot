function p3_File6ButtonPushed(app)
[app.p3_file(6),app.p3_path(6)]=uigetfile({'*.*';'*.csv';'*.xlsx'});
if strlength(app.p3_file(6)) == 0
    app.p3_Filename6.Value = "";
    app.p3_Filepath6.Value = "";
else
app.p3_Filename6.Value = app.p3_file(6);
app.p3_Filepath6.Value = app.p3_path(6);
end