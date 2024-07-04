function p3_File1ButtonPushed(app)
[app.p3_file(1),app.p3_path(1)]=uigetfile({'*.*';'*.csv';'*.xlsx'});
if strlength(app.p3_file(1)) == 0
    app.p3_Filename1.Value = "";
    app.p3_Filepath1.Value = "";
else
    app.p3_Filename1.Value = app.p3_file(1);
    app.p3_Filepath1.Value = app.p3_path(1);
end