function p3_File2ButtonPushed(app)
[app.p3_file(2),app.p3_path(2)]=uigetfile({'*.*';'*.csv';'*.xlsx'});
if strlength(app.p3_file(2)) == 0
    app.p3_Filename2.Value = "";
    app.p3_Filepath2.Value = "";
else
app.p3_Filename2.Value = app.p3_file(2);
app.p3_Filepath2.Value = app.p3_path(2);
end