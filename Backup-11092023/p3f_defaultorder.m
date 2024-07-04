function p3f_defaultorder(app)
app.p3_file1enable.Value=0;
app.p3_file2enable.Value=0;
app.p3_file3enable.Value=0;
app.p3_file4enable.Value=0;
app.p3_file5enable.Value=0;
app.p3_file6enable.Value=0;
app.p3_file7enable.Value=0;
app.p3_file8enable.Value=0;
p3_file1enableValueChanged(app);
p3_file2enableValueChanged(app);
p3_file3enableValueChanged(app);
p3_file4enableValueChanged(app);
p3_file5enableValueChanged(app);
p3_file6enableValueChanged(app);
p3_file7enableValueChanged(app);
p3_file8enableValueChanged(app);
[file,path]=uigetfile({'*.*';'*.csv';'*.xlsx'},'MultiSelect','on');
if isequal(file,0)
    %|| isequal(app.p3_file_2,0)
    app.p3_Message.Text="No files selected, Please select a valid file before plotting";
    msg="No file selected, Please select a valid file before plotting";
    title="Error";
    f = errordlg(msg,title);
else
    if ~iscell(file)
        file = {file};
    end
    [~,siz]=size(file);
    % if siz==1
    % else
    for ii=1:siz
        app.p3_path(ii)=path;
    end
    app.p3_file_2=file;
    app.p3_path_2=app.p3_path;
    p3f_fileselected(app);
    %p3f_ReadFileButtonPushed(app);
end