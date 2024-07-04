function p3f_mainclosereq(app)
    app.p3_Message.Text = "Closing app";
    delete(app.p3_UIFigure2);
    delete(app.p3_UIFigure3);
    delete(app.p3_UIFigure4);
    delete(app.p3_UIFigure5);
    delete(app.UIFigure);
    clear global;
end