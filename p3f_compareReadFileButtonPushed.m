function p3f_compareReadFileButtonPushed(app)
app.p3_file_2=app.p3_Comparefile;
app.p3_path_2=app.p3_Comparepath;
[row,col]=size(app.p3_file_2);
iii=1;
for i=1:row
    newfile="";
    newfile=app.p3_file_2(i,1:end);
    newfile(cellfun('isempty',newfile)) = [];
    [~,c]=size(newfile);
    if c < col
        for ii=c+1:col
            newfile(1,ii)="";
        end
    end
    if newfile(1) == ""
        
    else
        app.p3_file_2(iii,:)=newfile(:);
        iii=iii+1;
    end
end
app.p3_file_2(iii:row,:)=[];
app.p3_path_2(cellfun('isempty',app.p3_path_2)) = [];
app.p3_UIFigure5.Visible="off";
app.p3_UIFigure6.Visible="off";
if isequal(app.p3_file_2,0) 
    app.p3_Message.Text="No files selected, Please select a valid file before plotting";
    msg="No file selected, Please select a valid file before plotting";
    title="Error";
   f = errordlg(msg,title);
else
p3f_comparefileselected(app);
end
end