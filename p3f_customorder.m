function p3f_customorder(app)
app.p3_comparefile1enable.Value=0;
app.p3_comparefile2enable.Value=0;
% app.p3_comparefile3enable.Value=0;
% app.p3_comparefile4enable.Value=0;
% app.p3_comparefile5enable.Value=0;
% app.p3_comparefile6enable.Value=0;
% app.p3_comparefile7enable.Value=0;
% app.p3_comparefile8enable.Value=0;
p3_comparefile1enableValueChanged(app);
p3_comparefile2enableValueChanged(app);
% p3_comparefile3enableValueChanged(app);
% p3_comparefile4enableValueChanged(app);
% p3_comparefile5enableValueChanged(app);
% p3_comparefile6enableValueChanged(app);
% p3_comparefile7enableValueChanged(app);
% p3_comparefile8enableValueChanged(app);

% [file,path]=uigetfile({'*.*';'*.csv';'*.xlsx'},'MultiSelect','on');
% if isequal(file,0)
%     %|| isequal(app.p3_file_2,0)
%     app.p3_Message.Text="No files selected, Please select a valid file before plotting";
%     msg="No file selected, Please select a valid file before plotting";
%     title="Error";
%     f = errordlg(msg,title);
% else
%     if ~iscell(file)
%         file = {file};
%     end
%     [~,siz]=size(file);
%     % if siz==1
%     % else
%     for ii=1:siz
%         app.p3_path(ii)=path;
%     end
%     app.p3_file_2=file;
%     app.p3_path_2=app.p3_path;
%     p3f_comparefileselected(app);
%     %p3f_ReadFileButtonPushed(app);
end