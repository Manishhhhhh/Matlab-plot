function p3_file6enableValueChanged(app, event)
value = app.p3_file6enable.Value;
if value == 1
    app.p3_File6Button.Enable=1;
else
    app.p3_File6Button.Enable=0;
end