function msgtxt = p3_saveimgfunc(uiaxes)
filter={'*.png';'*.jpeg';'*.pdf';};
[file,location]=uiputfile(filter);
if isequal(file,0)
    msgtxt="Save process cancelled";
    msg="Save process cancelled";
    title="Warning";
    f = errordlg(msg,title);
else
location=fullfile(location,file);
exportgraphics(uiaxes,location,'ContentType','vector');
msgtxt="Save complete";
end