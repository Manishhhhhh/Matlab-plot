function p3f_ReadFileButtonPushed(app)
app.p3_file_2=app.p3_file;
app.p3_path_2=app.p3_path;
app.p3_file_2(cellfun('isempty',app.p3_file_2)) = [];
app.p3_path_2(cellfun('isempty',app.p3_path_2)) = [];
app.p3_UIFigure5.Visible="off";
if isequal(app.p3_file_2,0) 
    %app.p3_file_2{:} == 0 
    app.p3_Message.Text="No files selected, Please select a valid file before plotting";
    msg="No file selected, Please select a valid file before plotting";
    title="Error";
   f = errordlg(msg,title);
else
p3f_fileselected(app);
end