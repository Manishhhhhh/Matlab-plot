function p3_comparefile1enableValueChanged(app,number,value)
switch number
    case 1
        if value == 1
            app.p3_CompareFile1Button.Enable=1;
            app.p3_CompareFilename1.Enable=1;
            app.p3_CompareFilepath1.Enable=1;
            app.p3_Comparefile(1,1:end)=app.p3_CompareFilename1full;
            app.p3_Comparepath(1,1)=app.p3_CompareFilepath1.Value;
        else
            app.p3_CompareFile1Button.Enable=0;
            app.p3_CompareFilename1.Enable=0;
            app.p3_CompareFilepath1.Enable=0;
            app.p3_Comparefile(1,1:end)="";
            app.p3_Comparepath(1,1)="";
        end
        %disp(app.p3_Comparefile)
    case 2
        if value == 1
            app.p3_CompareFile2Button.Enable=1;
            app.p3_CompareFilename2.Enable=1;
            app.p3_CompareFilepath2.Enable=1;
            app.p3_Comparefile(2,1:end)=app.p3_CompareFilename2full;
            app.p3_Comparepath(2,1)=app.p3_CompareFilepath2.Value;
        else
            app.p3_CompareFile2Button.Enable=0;
            app.p3_CompareFilename2.Enable=0;
            app.p3_CompareFilepath2.Enable=0;
            app.p3_Comparefile(2,1:end)="";
            app.p3_Comparepath(2,1)="";
        end
        %disp(app.p3_Comparefile)
    otherwise
end
end
