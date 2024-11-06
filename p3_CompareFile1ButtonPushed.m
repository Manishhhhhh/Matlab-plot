function p3_CompareFile1ButtonPushed(app,number)
[a,app.p3_Comparepath(number)]=uigetfile({'*.*';'*.csv';'*.xlsx'},'MultiSelect','on');
if iscell(a)~=1
    a={a};
end    
[~,col]=size(a);
app.p3_Comparefile(number,1:col)=a;
switch number
    case 1
        if strlength(app.p3_Comparefile(1,1)) == 0
            app.p3_CompareFilename1.Value = "";
            app.p3_CompareFilepath1.Value = "";
        else
            app.p3_CompareFilename1full = app.p3_Comparefile(1,1:end);
            app.p3_CompareFilename1.Value = app.p3_Comparefile(1,1);
            app.p3_CompareFilepath1.Value = app.p3_Comparepath(1,1);
        end
    case 2
        if strlength(app.p3_Comparefile(2,1)) == 0
            app.p3_CompareFilename2.Value = "";
            app.p3_CompareFilepath2.Value = "";
        else
            app.p3_CompareFilename2full = app.p3_Comparefile(2,1:end);
            app.p3_CompareFilename2.Value = app.p3_Comparefile(2,1);
            app.p3_CompareFilepath2.Value = app.p3_Comparepath(2,1);
        end
    otherwise
end
