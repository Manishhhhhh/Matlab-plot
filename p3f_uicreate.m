function p3f_uicreate(app)

app.p3_UIFigure6 = uifigure;
app.p3_UIFigure6.Scrollable='on';
app.p3_UIFigure6.Position=[200 100 1100 450];
app.p3_UIFigure6.Name="File select";
app.p3_UIFigure6.CloseRequestFcn = @(src,event)p3f_closereq(src);

app.p3_UIFigure5 = uifigure;
app.p3_UIFigure5.Scrollable='on';
app.p3_UIFigure5.Position=[200 100 1100 450];
app.p3_UIFigure5.Name="File select";
app.p3_UIFigure5.CloseRequestFcn = @(src,event)p3f_closereq(src);

app.p3_UIFigure2 = uifigure;
app.p3_UIFigure2.Scrollable='on';
app.p3_UIFigure2.Position=[200 100 400 400];
app.p3_UIFigure2.Name="Xaxis settings";
app.p3_UIFigure2.CloseRequestFcn = @(src,event)p3f_closereq(src);

app.p3_UIFigure3 = uifigure;
app.p3_UIFigure3.Scrollable='on';
app.p3_UIFigure3.Position=[200 100 1100 500];
app.p3_UIFigure3.Name="Yaxis(left) settings";
app.p3_UIFigure3.CloseRequestFcn = @(src,event)p3f_closereq(src);

app.p3_UIFigure4 = uifigure;
app.p3_UIFigure4.Scrollable='on';
app.p3_UIFigure4.Position=[200 100 1100 500];
app.p3_UIFigure4.Name="Yaxis(right) settings";
app.p3_UIFigure4.CloseRequestFcn = @(src,event)p3f_closereq(src);

app.p3_UIFigure6.Visible="off";
app.p3_UIFigure5.Visible="off";
app.p3_UIFigure2.Visible="off";
app.p3_UIFigure3.Visible="off";
app.p3_UIFigure4.Visible="off";

%p3f_fileselect(app);
%%%%%%%%%%%%%%%%%%%%%%%Xaxis settings%%%%%%%%%%%%%%%%%%%%%%
% Create GridLayout2_3
            app.GridLayout2_3 = uigridlayout(app.p3_UIFigure2,"BackgroundColor",[0.71,0.76,0.79]);
            app.GridLayout2_3.ColumnWidth = {100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100};
            app.GridLayout2_3.RowHeight = {50, 40, 40, 40, 40, 40, 40, 40, 40};

            % Create p3_xparameterlabel
            app.p3_xparameterlabel = uilabel(app.GridLayout2_3);
            app.p3_xparameterlabel.Layout.Row = 1;
            app.p3_xparameterlabel.Layout.Column = 1;
            app.p3_xparameterlabel.Text = 'Parameter';

            % Create p3_xparameter1
            app.p3_xparameter1 = uidropdown(app.GridLayout2_3);
            app.p3_xparameter1.Layout.Row = 2;
            app.p3_xparameter1.Layout.Column = 1;

%%%%%%%%%%%%%%%%%%%%%%%%YaxisLeft settings%%%%%%%%%%%%%%%%%%%%%
app.GridLayout2_5 = uigridlayout(app.p3_UIFigure3,"BackgroundColor",[0.71,0.76,0.79]);
app.GridLayout2_5.ColumnWidth = {30, 100, 100, 30, 100, 100, 100, 100, 100, 100, 100};
app.GridLayout2_5.RowHeight = {50, 40, 40, 40, 40, 40, 40, 40, 40};

% Create p3_ylparameterlabel
            app.p3_ylparameterlabel = uilabel(app.GridLayout2_5);
            app.p3_ylparameterlabel.Layout.Row = 1;
            app.p3_ylparameterlabel.Layout.Column = 2;
            app.p3_ylparameterlabel.Text = 'Parameter';

            % Create p3_ylcolorlabel
            app.p3_ylcolorlabel = uilabel(app.GridLayout2_5);
            app.p3_ylcolorlabel.Layout.Row = 1;
            app.p3_ylcolorlabel.Layout.Column = 5;
            app.p3_ylcolorlabel.Text = 'Color';

            % Create p3_yllinestylelabel
            app.p3_yllinestylelabel = uilabel(app.GridLayout2_5);
            app.p3_yllinestylelabel.Layout.Row = 1;
            app.p3_yllinestylelabel.Layout.Column = 6;
            app.p3_yllinestylelabel.Text = 'Line style';

            % Create p3_ylparameter1
            app.p3_ylparameter1 = uidropdown(app.GridLayout2_5);
            app.p3_ylparameter1.Layout.Row = 2;
            app.p3_ylparameter1.Layout.Column = 2;

            % Create p3_ylparameter2
            app.p3_ylparameter2 = uidropdown(app.GridLayout2_5);
            app.p3_ylparameter2.Layout.Row = 3;
            app.p3_ylparameter2.Layout.Column = 2;

            % Create p3_ylcolor1
            app.p3_ylcolor1 = uidropdown(app.GridLayout2_5);
            app.p3_ylcolor1.Items = {'red', 'green', 'blue', 'cyan', 'magenta', 'yellow', 'black', 'white'};
            app.p3_ylcolor1.Layout.Row = 2;
            app.p3_ylcolor1.Layout.Column = 5;
            app.p3_ylcolor1.Value = 'red';

            % Create p3_ylcolor2
            app.p3_ylcolor2 = uidropdown(app.GridLayout2_5);
            app.p3_ylcolor2.Items = {'red', 'green', 'blue', 'cyan', 'magenta', 'yellow', 'black', 'white'};
            app.p3_ylcolor2.Layout.Row = 3;
            app.p3_ylcolor2.Layout.Column = 5;
            app.p3_ylcolor2.Value = 'red';

            % Create p3_yllinestyle1
            app.p3_yllinestyle1 = uidropdown(app.GridLayout2_5);
            app.p3_yllinestyle1.Items = {'-', '--', ':', '-.'};
            app.p3_yllinestyle1.Layout.Row = 2;
            app.p3_yllinestyle1.Layout.Column = 6;
            app.p3_yllinestyle1.Value = '-';

            % Create p3_yllinestyle2
            app.p3_yllinestyle2 = uidropdown(app.GridLayout2_5);
            app.p3_yllinestyle2.Items = {'-', '--', ':', '-.'};
            app.p3_yllinestyle2.Layout.Row = 3;
            app.p3_yllinestyle2.Layout.Column = 6;
            app.p3_yllinestyle2.Value = '-';

            % Create p3_ylmarkerlabel
            app.p3_ylmarkerlabel = uilabel(app.GridLayout2_5);
            app.p3_ylmarkerlabel.Layout.Row = 1;
            app.p3_ylmarkerlabel.Layout.Column = 8;
            app.p3_ylmarkerlabel.Text = 'Marker';

            % Create p3_yllinewidthlabel
            app.p3_yllinewidthlabel = uilabel(app.GridLayout2_5);
            app.p3_yllinewidthlabel.Layout.Row = 1;
            app.p3_yllinewidthlabel.Layout.Column = 7;
            app.p3_yllinewidthlabel.Text = 'Line width';

            % Create p3_ylmarkerfacecolorlabel
            app.p3_ylmarkerfacecolorlabel = uilabel(app.GridLayout2_5);
            app.p3_ylmarkerfacecolorlabel.Layout.Row = 1;
            app.p3_ylmarkerfacecolorlabel.Layout.Column = 9;
            app.p3_ylmarkerfacecolorlabel.Text = 'Marker face color';

            % Create p3_ylmarkersizeabel
            app.p3_ylmarkersizeabel = uilabel(app.GridLayout2_5);
            app.p3_ylmarkersizeabel.Layout.Row = 1;
            app.p3_ylmarkersizeabel.Layout.Column = 11;
            app.p3_ylmarkersizeabel.Text = 'Marker size';

            % Create p3_yllinewidth1
            app.p3_yllinewidth1 = uieditfield(app.GridLayout2_5, 'numeric');
            app.p3_yllinewidth1.Tooltip = {'Default = 0.5'};
            app.p3_yllinewidth1.Layout.Row = 2;
            app.p3_yllinewidth1.Layout.Column = 7;

            % Create p3_ylmarkersize1
            app.p3_ylmarkersize1 = uieditfield(app.GridLayout2_5, 'numeric');
            app.p3_ylmarkersize1.Layout.Row = 2;
            app.p3_ylmarkersize1.Layout.Column = 11;

            % Create p3_ylmarkersize2
            app.p3_ylmarkersize2 = uieditfield(app.GridLayout2_5, 'numeric');
            app.p3_ylmarkersize2.Layout.Row = 3;
            app.p3_ylmarkersize2.Layout.Column = 11;

            % Create p3_yllinewidth2
            app.p3_yllinewidth2 = uieditfield(app.GridLayout2_5, 'numeric');
            app.p3_yllinewidth2.Tooltip = {'Default = 0.5'};
            app.p3_yllinewidth2.Layout.Row = 3;
            app.p3_yllinewidth2.Layout.Column = 7;

            % Create p3_ylmarker1
            app.p3_ylmarker1 = uidropdown(app.GridLayout2_5);
            app.p3_ylmarker1.Items = {'o', '+', '*', '.', 'x', '_', '|', 'square', 'diamond', '^', 'v', '>', '<', 'pentagram', 'hexagram', 'none'};
            app.p3_ylmarker1.Layout.Row = 2;
            app.p3_ylmarker1.Layout.Column = 8;
            app.p3_ylmarker1.Value = 'o';

            % Create p3_ylmarkercolor1
            app.p3_ylmarkercolor1 = uidropdown(app.GridLayout2_5);
            app.p3_ylmarkercolor1.Items = {'red', 'green', 'blue', 'cyan', 'magenta', 'yellow', 'black', 'white'};
            app.p3_ylmarkercolor1.Layout.Row = 2;
            app.p3_ylmarkercolor1.Layout.Column = 9;
            app.p3_ylmarkercolor1.Value = 'red';

            % Create p3_ylmarker2
            app.p3_ylmarker2 = uidropdown(app.GridLayout2_5);
            app.p3_ylmarker2.Items = {'o', '+', '*', '.', 'x', '_', '|', 'square', 'diamond', '^', 'v', '>', '<', 'pentagram', 'hexagram', 'none'};
            app.p3_ylmarker2.Layout.Row = 3;
            app.p3_ylmarker2.Layout.Column = 8;
            app.p3_ylmarker2.Value = 'o';

            % Create p3_ylmarkercolor2
            app.p3_ylmarkercolor2 = uidropdown(app.GridLayout2_5);
            app.p3_ylmarkercolor2.Items = {'red', 'green', 'blue', 'cyan', 'magenta', 'yellow', 'black', 'white'};
            app.p3_ylmarkercolor2.Layout.Row = 3;
            app.p3_ylmarkercolor2.Layout.Column = 9;
            app.p3_ylmarkercolor2.Value = 'red';

            % Create p3_ylparameter3
            app.p3_ylparameter3 = uidropdown(app.GridLayout2_5);
            app.p3_ylparameter3.Layout.Row = 4;
            app.p3_ylparameter3.Layout.Column = 2;

            % Create p3_ylparameter4
            app.p3_ylparameter4 = uidropdown(app.GridLayout2_5);
            app.p3_ylparameter4.Layout.Row = 5;
            app.p3_ylparameter4.Layout.Column = 2;

            % Create p3_ylparameter5
            app.p3_ylparameter5 = uidropdown(app.GridLayout2_5);
            app.p3_ylparameter5.Layout.Row = 6;
            app.p3_ylparameter5.Layout.Column = 2;

            % Create p3_ylparameter6
            app.p3_ylparameter6 = uidropdown(app.GridLayout2_5);
            app.p3_ylparameter6.Layout.Row = 7;
            app.p3_ylparameter6.Layout.Column = 2;

            % Create p3_ylparameter7
            app.p3_ylparameter7 = uidropdown(app.GridLayout2_5);
            app.p3_ylparameter7.Layout.Row = 8;
            app.p3_ylparameter7.Layout.Column = 2;

            % Create p3_ylparameter8
            app.p3_ylparameter8 = uidropdown(app.GridLayout2_5);
            app.p3_ylparameter8.Layout.Row = 9;
            app.p3_ylparameter8.Layout.Column = 2;

            % Create p3_ylcolor3
            app.p3_ylcolor3 = uidropdown(app.GridLayout2_5);
            app.p3_ylcolor3.Items = {'red', 'green', 'blue', 'cyan', 'magenta', 'yellow', 'black', 'white'};
            app.p3_ylcolor3.Layout.Row = 4;
            app.p3_ylcolor3.Layout.Column = 5;
            app.p3_ylcolor3.Value = 'red';

            % Create p3_ylcolor4
            app.p3_ylcolor4 = uidropdown(app.GridLayout2_5);
            app.p3_ylcolor4.Items = {'red', 'green', 'blue', 'cyan', 'magenta', 'yellow', 'black', 'white'};
            app.p3_ylcolor4.Layout.Row = 5;
            app.p3_ylcolor4.Layout.Column = 5;
            app.p3_ylcolor4.Value = 'red';

            % Create p3_ylcolor5
            app.p3_ylcolor5 = uidropdown(app.GridLayout2_5);
            app.p3_ylcolor5.Items = {'red', 'green', 'blue', 'cyan', 'magenta', 'yellow', 'black', 'white'};
            app.p3_ylcolor5.Layout.Row = 6;
            app.p3_ylcolor5.Layout.Column = 5;
            app.p3_ylcolor5.Value = 'red';

            % Create p3_ylcolor6
            app.p3_ylcolor6 = uidropdown(app.GridLayout2_5);
            app.p3_ylcolor6.Items = {'red', 'green', 'blue', 'cyan', 'magenta', 'yellow', 'black', 'white'};
            app.p3_ylcolor6.Layout.Row = 7;
            app.p3_ylcolor6.Layout.Column = 5;
            app.p3_ylcolor6.Value = 'red';

            % Create p3_ylcolor7
            app.p3_ylcolor7 = uidropdown(app.GridLayout2_5);
            app.p3_ylcolor7.Items = {'red', 'green', 'blue', 'cyan', 'magenta', 'yellow', 'black', 'white'};
            app.p3_ylcolor7.Layout.Row = 8;
            app.p3_ylcolor7.Layout.Column = 5;
            app.p3_ylcolor7.Value = 'red';

            % Create p3_ylcolor8
            app.p3_ylcolor8 = uidropdown(app.GridLayout2_5);
            app.p3_ylcolor8.Items = {'red', 'green', 'blue', 'cyan', 'magenta', 'yellow', 'black', 'white'};
            app.p3_ylcolor8.Layout.Row = 9;
            app.p3_ylcolor8.Layout.Column = 5;
            app.p3_ylcolor8.Value = 'red';

            % Create p3_yllinestyle3
            app.p3_yllinestyle3 = uidropdown(app.GridLayout2_5);
            app.p3_yllinestyle3.Items = {'-', '--', ':', '-.'};
            app.p3_yllinestyle3.Layout.Row = 4;
            app.p3_yllinestyle3.Layout.Column = 6;
            app.p3_yllinestyle3.Value = '-';

            % Create p3_yllinestyle4
            app.p3_yllinestyle4 = uidropdown(app.GridLayout2_5);
            app.p3_yllinestyle4.Items = {'-', '--', ':', '-.'};
            app.p3_yllinestyle4.Layout.Row = 5;
            app.p3_yllinestyle4.Layout.Column = 6;
            app.p3_yllinestyle4.Value = '-';

            % Create p3_yllinestyle5
            app.p3_yllinestyle5 = uidropdown(app.GridLayout2_5);
            app.p3_yllinestyle5.Items = {'-', '--', ':', '-.'};
            app.p3_yllinestyle5.Layout.Row = 6;
            app.p3_yllinestyle5.Layout.Column = 6;
            app.p3_yllinestyle5.Value = '-';

            % Create p3_yllinestyle6
            app.p3_yllinestyle6 = uidropdown(app.GridLayout2_5);
            app.p3_yllinestyle6.Items = {'-', '--', ':', '-.'};
            app.p3_yllinestyle6.Layout.Row = 7;
            app.p3_yllinestyle6.Layout.Column = 6;
            app.p3_yllinestyle6.Value = '-';

            % Create p3_yllinestyle7
            app.p3_yllinestyle7 = uidropdown(app.GridLayout2_5);
            app.p3_yllinestyle7.Items = {'-', '--', ':', '-.'};
            app.p3_yllinestyle7.Layout.Row = 8;
            app.p3_yllinestyle7.Layout.Column = 6;
            app.p3_yllinestyle7.Value = '-';

            % Create p3_yllinestyle8
            app.p3_yllinestyle8 = uidropdown(app.GridLayout2_5);
            app.p3_yllinestyle8.Items = {'-', '--', ':', '-.'};
            app.p3_yllinestyle8.Layout.Row = 9;
            app.p3_yllinestyle8.Layout.Column = 6;
            app.p3_yllinestyle8.Value = '-';

            % Create p3_yllinewidth3
            app.p3_yllinewidth3 = uieditfield(app.GridLayout2_5, 'numeric');
            app.p3_yllinewidth3.Tooltip = {'Default = 0.5'};
            app.p3_yllinewidth3.Layout.Row = 4;
            app.p3_yllinewidth3.Layout.Column = 7;

            % Create p3_yllinewidth5
            app.p3_yllinewidth5 = uieditfield(app.GridLayout2_5, 'numeric');
            app.p3_yllinewidth5.Tooltip = {'Default = 0.5'};
            app.p3_yllinewidth5.Layout.Row = 6;
            app.p3_yllinewidth5.Layout.Column = 7;

            % Create p3_yllinewidth4
            app.p3_yllinewidth4 = uieditfield(app.GridLayout2_5, 'numeric');
            app.p3_yllinewidth4.Tooltip = {'Default = 0.5'};
            app.p3_yllinewidth4.Layout.Row = 5;
            app.p3_yllinewidth4.Layout.Column = 7;

            % Create p3_yllinewidth7
            app.p3_yllinewidth7 = uieditfield(app.GridLayout2_5, 'numeric');
            app.p3_yllinewidth7.Tooltip = {'Default = 0.5'};
            app.p3_yllinewidth7.Layout.Row = 8;
            app.p3_yllinewidth7.Layout.Column = 7;

            % Create p3_yllinewidth8
            app.p3_yllinewidth8 = uieditfield(app.GridLayout2_5, 'numeric');
            app.p3_yllinewidth8.Tooltip = {'Default = 0.5'};
            app.p3_yllinewidth8.Layout.Row = 9;
            app.p3_yllinewidth8.Layout.Column = 7;

            % Create p3_ylmarkersize3
            app.p3_ylmarkersize3 = uieditfield(app.GridLayout2_5, 'numeric');
            app.p3_ylmarkersize3.Layout.Row = 4;
            app.p3_ylmarkersize3.Layout.Column = 11;

            % Create p3_ylmarkersize4
            app.p3_ylmarkersize4 = uieditfield(app.GridLayout2_5, 'numeric');
            app.p3_ylmarkersize4.Layout.Row = 5;
            app.p3_ylmarkersize4.Layout.Column = 11;

            % Create p3_yllinewidth6
            app.p3_yllinewidth6 = uieditfield(app.GridLayout2_5, 'numeric');
            app.p3_yllinewidth6.Tooltip = {'Default = 0.5'};
            app.p3_yllinewidth6.Layout.Row = 7;
            app.p3_yllinewidth6.Layout.Column = 7;

            % Create p3_ylmarkersize7
            app.p3_ylmarkersize7 = uieditfield(app.GridLayout2_5, 'numeric');
            app.p3_ylmarkersize7.Layout.Row = 8;
            app.p3_ylmarkersize7.Layout.Column = 11;

            % Create p3_ylmarkersize8
            app.p3_ylmarkersize8 = uieditfield(app.GridLayout2_5, 'numeric');
            app.p3_ylmarkersize8.Layout.Row = 9;
            app.p3_ylmarkersize8.Layout.Column = 11;

            % Create p3_ylmarkersize5
            app.p3_ylmarkersize5 = uieditfield(app.GridLayout2_5, 'numeric');
            app.p3_ylmarkersize5.Layout.Row = 6;
            app.p3_ylmarkersize5.Layout.Column = 11;

            % Create p3_ylmarkersize6
            app.p3_ylmarkersize6 = uieditfield(app.GridLayout2_5, 'numeric');
            app.p3_ylmarkersize6.Layout.Row = 7;
            app.p3_ylmarkersize6.Layout.Column = 11;

            % Create p3_ylmarker3
            app.p3_ylmarker3 = uidropdown(app.GridLayout2_5);
            app.p3_ylmarker3.Items = {'o', '+', '*', '.', 'x', '_', '|', 'square', 'diamond', '^', 'v', '>', '<', 'pentagram', 'hexagram', 'none'};
            app.p3_ylmarker3.Layout.Row = 4;
            app.p3_ylmarker3.Layout.Column = 8;
            app.p3_ylmarker3.Value = 'o';

            % Create p3_ylmarkercolor3
            app.p3_ylmarkercolor3 = uidropdown(app.GridLayout2_5);
            app.p3_ylmarkercolor3.Items = {'red', 'green', 'blue', 'cyan', 'magenta', 'yellow', 'black', 'white'};
            app.p3_ylmarkercolor3.Layout.Row = 4;
            app.p3_ylmarkercolor3.Layout.Column = 9;
            app.p3_ylmarkercolor3.Value = 'red';

            % Create p3_ylmarker4
            app.p3_ylmarker4 = uidropdown(app.GridLayout2_5);
            app.p3_ylmarker4.Items = {'o', '+', '*', '.', 'x', '_', '|', 'square', 'diamond', '^', 'v', '>', '<', 'pentagram', 'hexagram', 'none'};
            app.p3_ylmarker4.Layout.Row = 5;
            app.p3_ylmarker4.Layout.Column = 8;
            app.p3_ylmarker4.Value = 'o';

            % Create p3_ylmarkercolor4
            app.p3_ylmarkercolor4 = uidropdown(app.GridLayout2_5);
            app.p3_ylmarkercolor4.Items = {'red', 'green', 'blue', 'cyan', 'magenta', 'yellow', 'black', 'white'};
            app.p3_ylmarkercolor4.Layout.Row = 5;
            app.p3_ylmarkercolor4.Layout.Column = 9;
            app.p3_ylmarkercolor4.Value = 'red';

            % Create p3_ylmarker6
            app.p3_ylmarker6 = uidropdown(app.GridLayout2_5);
            app.p3_ylmarker6.Items = {'o', '+', '*', '.', 'x', '_', '|', 'square', 'diamond', '^', 'v', '>', '<', 'pentagram', 'hexagram', 'none'};
            app.p3_ylmarker6.Layout.Row = 7;
            app.p3_ylmarker6.Layout.Column = 8;
            app.p3_ylmarker6.Value = 'o';

            % Create p3_ylmarkercolor6
            app.p3_ylmarkercolor6 = uidropdown(app.GridLayout2_5);
            app.p3_ylmarkercolor6.Items = {'red', 'green', 'blue', 'cyan', 'magenta', 'yellow', 'black', 'white'};
            app.p3_ylmarkercolor6.Layout.Row = 7;
            app.p3_ylmarkercolor6.Layout.Column = 9;
            app.p3_ylmarkercolor6.Value = 'red';

            % Create p3_ylmarker5
            app.p3_ylmarker5 = uidropdown(app.GridLayout2_5);
            app.p3_ylmarker5.Items = {'o', '+', '*', '.', 'x', '_', '|', 'square', 'diamond', '^', 'v', '>', '<', 'pentagram', 'hexagram', 'none'};
            app.p3_ylmarker5.Layout.Row = 6;
            app.p3_ylmarker5.Layout.Column = 8;
            app.p3_ylmarker5.Value = 'o';

            % Create p3_ylmarkercolor5
            app.p3_ylmarkercolor5 = uidropdown(app.GridLayout2_5);
            app.p3_ylmarkercolor5.Items = {'red', 'green', 'blue', 'cyan', 'magenta', 'yellow', 'black', 'white'};
            app.p3_ylmarkercolor5.Layout.Row = 6;
            app.p3_ylmarkercolor5.Layout.Column = 9;
            app.p3_ylmarkercolor5.Value = 'red';

            % Create p3_ylmarkercolor7
            app.p3_ylmarkercolor7 = uidropdown(app.GridLayout2_5);
            app.p3_ylmarkercolor7.Items = {'red', 'green', 'blue', 'cyan', 'magenta', 'yellow', 'black', 'white'};
            app.p3_ylmarkercolor7.Layout.Row = 8;
            app.p3_ylmarkercolor7.Layout.Column = 9;
            app.p3_ylmarkercolor7.Value = 'red';

            % Create p3_ylmarker8
            app.p3_ylmarker8 = uidropdown(app.GridLayout2_5);
            app.p3_ylmarker8.Items = {'o', '+', '*', '.', 'x', '_', '|', 'square', 'diamond', '^', 'v', '>', '<', 'pentagram', 'hexagram', 'none'};
            app.p3_ylmarker8.Layout.Row = 9;
            app.p3_ylmarker8.Layout.Column = 8;
            app.p3_ylmarker8.Value = 'o';

            % Create p3_ylmarker7
            app.p3_ylmarker7 = uidropdown(app.GridLayout2_5);
            app.p3_ylmarker7.Items = {'o', '+', '*', '.', 'x', '_', '|', 'square', 'diamond', '^', 'v', '>', '<', 'pentagram', 'hexagram', 'none'};
            app.p3_ylmarker7.Layout.Row = 8;
            app.p3_ylmarker7.Layout.Column = 8;
            app.p3_ylmarker7.Value = 'o';

            % Create p3_ylmarkercolor8
            app.p3_ylmarkercolor8 = uidropdown(app.GridLayout2_5);
            app.p3_ylmarkercolor8.Items = {'red', 'green', 'blue', 'cyan', 'magenta', 'yellow', 'black', 'white'};
            app.p3_ylmarkercolor8.Layout.Row = 9;
            app.p3_ylmarkercolor8.Layout.Column = 9;
            app.p3_ylmarkercolor8.Value = 'red';

            % Create p3_ylcheckbox1
            app.p3_ylcheckbox1 = uicheckbox(app.GridLayout2_5);
            app.p3_ylcheckbox1.Tooltip = {'Checked=Enables, unchecked=Disable'};
            app.p3_ylcheckbox1.Text = '';
            app.p3_ylcheckbox1.Layout.Row = 2;
            app.p3_ylcheckbox1.Layout.Column = 1;

            % Create p3_ylcheckbox2
            app.p3_ylcheckbox2 = uicheckbox(app.GridLayout2_5);
            app.p3_ylcheckbox2.Tooltip = {'Checked=Enables, unchecked=Disable'};
            app.p3_ylcheckbox2.Text = '';
            app.p3_ylcheckbox2.Layout.Row = 3;
            app.p3_ylcheckbox2.Layout.Column = 1;

            % Create p3_ylcheckbox3
            app.p3_ylcheckbox3 = uicheckbox(app.GridLayout2_5);
            app.p3_ylcheckbox3.Tooltip = {'Checked=Enables, unchecked=Disable'};
            app.p3_ylcheckbox3.Text = '';
            app.p3_ylcheckbox3.Layout.Row = 4;
            app.p3_ylcheckbox3.Layout.Column = 1;

            % Create p3_ylcheckbox4
            app.p3_ylcheckbox4 = uicheckbox(app.GridLayout2_5);
            app.p3_ylcheckbox4.Tooltip = {'Checked=Enables, unchecked=Disable'};
            app.p3_ylcheckbox4.Text = '';
            app.p3_ylcheckbox4.Layout.Row = 5;
            app.p3_ylcheckbox4.Layout.Column = 1;

            % Create p3_ylcheckbox5
            app.p3_ylcheckbox5 = uicheckbox(app.GridLayout2_5);
            app.p3_ylcheckbox5.Tooltip = {'Checked=Enables, unchecked=Disable'};
            app.p3_ylcheckbox5.Text = '';
            app.p3_ylcheckbox5.Layout.Row = 6;
            app.p3_ylcheckbox5.Layout.Column = 1;

            % Create p3_ylcheckbox6
            app.p3_ylcheckbox6 = uicheckbox(app.GridLayout2_5);
            app.p3_ylcheckbox6.Tooltip = {'Checked=Enables, unchecked=Disable'};
            app.p3_ylcheckbox6.Text = '';
            app.p3_ylcheckbox6.Layout.Row = 7;
            app.p3_ylcheckbox6.Layout.Column = 1;

            % Create p3_ylcheckbox7
            app.p3_ylcheckbox7 = uicheckbox(app.GridLayout2_5);
            app.p3_ylcheckbox7.Tooltip = {'Checked=Enables, unchecked=Disable'};
            app.p3_ylcheckbox7.Text = '';
            app.p3_ylcheckbox7.Layout.Row = 8;
            app.p3_ylcheckbox7.Layout.Column = 1;

            % Create p3_ylcheckbox8
            app.p3_ylcheckbox8 = uicheckbox(app.GridLayout2_5);
            app.p3_ylcheckbox8.Tooltip = {'Checked=Enables, unchecked=Disable'};
            app.p3_ylcheckbox8.Text = '';
            app.p3_ylcheckbox8.Layout.Row = 9;
            app.p3_ylcheckbox8.Layout.Column = 1;

            % Create p3_ylcheckbox11
            app.p3_ylcheckbox11 = uicheckbox(app.GridLayout2_5);
            app.p3_ylcheckbox11.Tooltip = {'Checked=Manual mode, unchecked=auto mode'};
            app.p3_ylcheckbox11.Text = '';
            app.p3_ylcheckbox11.Layout.Row = 2;
            app.p3_ylcheckbox11.Layout.Column = 4;

            % Create p3_ylcheckbox12
            app.p3_ylcheckbox12 = uicheckbox(app.GridLayout2_5);
            app.p3_ylcheckbox12.Tooltip = {'Checked=Manual mode, unchecked=auto mode'};
            app.p3_ylcheckbox12.Text = '';
            app.p3_ylcheckbox12.Layout.Row = 3;
            app.p3_ylcheckbox12.Layout.Column = 4;

            % Create p3_ylcheckbox13
            app.p3_ylcheckbox13 = uicheckbox(app.GridLayout2_5);
            app.p3_ylcheckbox13.Tooltip = {'Checked=Manual mode, unchecked=auto mode'};
            app.p3_ylcheckbox13.Text = '';
            app.p3_ylcheckbox13.Layout.Row = 4;
            app.p3_ylcheckbox13.Layout.Column = 4;

            % Create p3_ylcheckbox14
            app.p3_ylcheckbox14 = uicheckbox(app.GridLayout2_5);
            app.p3_ylcheckbox14.Tooltip = {'Checked=Manual mode, unchecked=auto mode'};
            app.p3_ylcheckbox14.Text = '';
            app.p3_ylcheckbox14.Layout.Row = 5;
            app.p3_ylcheckbox14.Layout.Column = 4;

            % Create p3_ylcheckbox15
            app.p3_ylcheckbox15 = uicheckbox(app.GridLayout2_5);
            app.p3_ylcheckbox15.Tooltip = {'Checked=Manual mode, unchecked=auto mode'};
            app.p3_ylcheckbox15.Text = '';
            app.p3_ylcheckbox15.Layout.Row = 6;
            app.p3_ylcheckbox15.Layout.Column = 4;

            % Create p3_ylcheckbox16
            app.p3_ylcheckbox16 = uicheckbox(app.GridLayout2_5);
            app.p3_ylcheckbox16.Tooltip = {'Checked=Manual mode, unchecked=auto mode'};
            app.p3_ylcheckbox16.Text = '';
            app.p3_ylcheckbox16.Layout.Row = 7;
            app.p3_ylcheckbox16.Layout.Column = 4;

            % Create p3_ylcheckbox17
            app.p3_ylcheckbox17 = uicheckbox(app.GridLayout2_5);
            app.p3_ylcheckbox17.Tooltip = {'Checked=Manual mode, unchecked=auto mode'};
            app.p3_ylcheckbox17.Text = '';
            app.p3_ylcheckbox17.Layout.Row = 8;
            app.p3_ylcheckbox17.Layout.Column = 4;

            % Create p3_ylcheckbox18
            app.p3_ylcheckbox18 = uicheckbox(app.GridLayout2_5);
            app.p3_ylcheckbox18.Tooltip = {'Checked=Manual mode, unchecked=auto mode'};
            app.p3_ylcheckbox18.Text = '';
            app.p3_ylcheckbox18.Layout.Row = 9;
            app.p3_ylcheckbox18.Layout.Column = 4;

            % Create p3_ylmodelabel
            app.p3_ylmodelabel = uilabel(app.GridLayout2_5);
            app.p3_ylmodelabel.Layout.Row = 1;
            app.p3_ylmodelabel.Layout.Column = 1;
            app.p3_ylmodelabel.Text = 'Mode';

            % Create p3_ylmode2label
            app.p3_ylmode2label = uilabel(app.GridLayout2_5);
            app.p3_ylmode2label.Layout.Row = 1;
            app.p3_ylmode2label.Layout.Column = 4;
            app.p3_ylmode2label.Text = 'Mode';

            % Create p3_ylmarkeredgecolorlabel
            app.p3_ylmarkeredgecolorlabel = uilabel(app.GridLayout2_5);
            app.p3_ylmarkeredgecolorlabel.Layout.Row = 1;
            app.p3_ylmarkeredgecolorlabel.Layout.Column = 10;
            app.p3_ylmarkeredgecolorlabel.Text = 'Marker edge color';

            % Create p3_ylmarkeredgecolor5
            app.p3_ylmarkeredgecolor5 = uidropdown(app.GridLayout2_5);
            app.p3_ylmarkeredgecolor5.Items = {'red', 'green', 'blue', 'cyan', 'magenta', 'yellow', 'black', 'white'};
            app.p3_ylmarkeredgecolor5.Layout.Row = 6;
            app.p3_ylmarkeredgecolor5.Layout.Column = 10;
            app.p3_ylmarkeredgecolor5.Value = 'red';

            % Create p3_ylmarkeredgecolor1
            app.p3_ylmarkeredgecolor1 = uidropdown(app.GridLayout2_5);
            app.p3_ylmarkeredgecolor1.Items = {'red', 'green', 'blue', 'cyan', 'magenta', 'yellow', 'black', 'white'};
            app.p3_ylmarkeredgecolor1.Layout.Row = 2;
            app.p3_ylmarkeredgecolor1.Layout.Column = 10;
            app.p3_ylmarkeredgecolor1.Value = 'red';

            % Create p3_ylmarkeredgecolor6
            app.p3_ylmarkeredgecolor6 = uidropdown(app.GridLayout2_5);
            app.p3_ylmarkeredgecolor6.Items = {'red', 'green', 'blue', 'cyan', 'magenta', 'yellow', 'black', 'white'};
            app.p3_ylmarkeredgecolor6.Layout.Row = 7;
            app.p3_ylmarkeredgecolor6.Layout.Column = 10;
            app.p3_ylmarkeredgecolor6.Value = 'red';

            % Create p3_ylmarkeredgecolor2
            app.p3_ylmarkeredgecolor2 = uidropdown(app.GridLayout2_5);
            app.p3_ylmarkeredgecolor2.Items = {'red', 'green', 'blue', 'cyan', 'magenta', 'yellow', 'black', 'white'};
            app.p3_ylmarkeredgecolor2.Layout.Row = 3;
            app.p3_ylmarkeredgecolor2.Layout.Column = 10;
            app.p3_ylmarkeredgecolor2.Value = 'red';

            % Create p3_ylmarkeredgecolor7
            app.p3_ylmarkeredgecolor7 = uidropdown(app.GridLayout2_5);
            app.p3_ylmarkeredgecolor7.Items = {'red', 'green', 'blue', 'cyan', 'magenta', 'yellow', 'black', 'white'};
            app.p3_ylmarkeredgecolor7.Layout.Row = 8;
            app.p3_ylmarkeredgecolor7.Layout.Column = 10;
            app.p3_ylmarkeredgecolor7.Value = 'red';

            % Create p3_ylmarkeredgecolor3
            app.p3_ylmarkeredgecolor3 = uidropdown(app.GridLayout2_5);
            app.p3_ylmarkeredgecolor3.Items = {'red', 'green', 'blue', 'cyan', 'magenta', 'yellow', 'black', 'white'};
            app.p3_ylmarkeredgecolor3.Layout.Row = 4;
            app.p3_ylmarkeredgecolor3.Layout.Column = 10;
            app.p3_ylmarkeredgecolor3.Value = 'red';

            % Create p3_ylmarkeredgecolor8
            app.p3_ylmarkeredgecolor8 = uidropdown(app.GridLayout2_5);
            app.p3_ylmarkeredgecolor8.Items = {'red', 'green', 'blue', 'cyan', 'magenta', 'yellow', 'black', 'white'};
            app.p3_ylmarkeredgecolor8.Layout.Row = 9;
            app.p3_ylmarkeredgecolor8.Layout.Column = 10;
            app.p3_ylmarkeredgecolor8.Value = 'red';

            % Create p3_ylmarkeredgecolor4
            app.p3_ylmarkeredgecolor4 = uidropdown(app.GridLayout2_5);
            app.p3_ylmarkeredgecolor4.Items = {'red', 'green', 'blue', 'cyan', 'magenta', 'yellow', 'black', 'white'};
            app.p3_ylmarkeredgecolor4.Layout.Row = 5;
            app.p3_ylmarkeredgecolor4.Layout.Column = 10;
            app.p3_ylmarkeredgecolor4.Value = 'red';
           
%%%%%%%%%%%%%%%%%%%%%%%YaxisRight settings%%%%%%%%%%%%%%%%%%%%%%%%
% Create GridLayout2_6
            app.GridLayout2_6 = uigridlayout(app.p3_UIFigure4,"BackgroundColor",[0.71,0.76,0.79]);
            app.GridLayout2_6.ColumnWidth = {30, 100, 100, 30, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100};
            app.GridLayout2_6.RowHeight = {50, 40, 40, 40, 40, 40, 40, 40, 40};

            % Create p3_yrparameterlabel
            app.p3_yrparameterlabel = uilabel(app.GridLayout2_6);
            app.p3_yrparameterlabel.Layout.Row = 1;
            app.p3_yrparameterlabel.Layout.Column = 2;
            app.p3_yrparameterlabel.Text = 'Parameter';

            % Create p3_yrcolorlabel
            app.p3_yrcolorlabel = uilabel(app.GridLayout2_6);
            app.p3_yrcolorlabel.Layout.Row = 1;
            app.p3_yrcolorlabel.Layout.Column = 5;
            app.p3_yrcolorlabel.Text = 'Color';

            % Create p3_yrlinestylelabel
            app.p3_yrlinestylelabel = uilabel(app.GridLayout2_6);
            app.p3_yrlinestylelabel.Layout.Row = 1;
            app.p3_yrlinestylelabel.Layout.Column = 6;
            app.p3_yrlinestylelabel.Text = 'Line style';

            % Create p3_yrparameter1
            app.p3_yrparameter1 = uidropdown(app.GridLayout2_6);
            app.p3_yrparameter1.Layout.Row = 2;
            app.p3_yrparameter1.Layout.Column = 2;

            % Create p3_yrparameter2
            app.p3_yrparameter2 = uidropdown(app.GridLayout2_6);
            app.p3_yrparameter2.Layout.Row = 3;
            app.p3_yrparameter2.Layout.Column = 2;

            % Create p3_yrcolor1
            app.p3_yrcolor1 = uidropdown(app.GridLayout2_6);
            app.p3_yrcolor1.Items = {'red', 'green', 'blue', 'cyan', 'magenta', 'yellow', 'black', 'white'};
            app.p3_yrcolor1.Layout.Row = 2;
            app.p3_yrcolor1.Layout.Column = 5;
            app.p3_yrcolor1.Value = 'red';

            % Create p3_yrcolor2
            app.p3_yrcolor2 = uidropdown(app.GridLayout2_6);
            app.p3_yrcolor2.Items = {'red', 'green', 'blue', 'cyan', 'magenta', 'yellow', 'black', 'white'};
            app.p3_yrcolor2.Layout.Row = 3;
            app.p3_yrcolor2.Layout.Column = 5;
            app.p3_yrcolor2.Value = 'red';

            % Create p3_yrlinestyle1
            app.p3_yrlinestyle1 = uidropdown(app.GridLayout2_6);
            app.p3_yrlinestyle1.Items = {'-', '--', ':', '-.', ''};
            app.p3_yrlinestyle1.Layout.Row = 2;
            app.p3_yrlinestyle1.Layout.Column = 6;
            app.p3_yrlinestyle1.Value = '-';

            % Create p3_yrlinestyle2
            app.p3_yrlinestyle2 = uidropdown(app.GridLayout2_6);
            app.p3_yrlinestyle2.Items = {'-', '--', ':', '-.', ''};
            app.p3_yrlinestyle2.Layout.Row = 3;
            app.p3_yrlinestyle2.Layout.Column = 6;
            app.p3_yrlinestyle2.Value = '-';

            % Create p3_yrmarkerlabel
            app.p3_yrmarkerlabel = uilabel(app.GridLayout2_6);
            app.p3_yrmarkerlabel.Layout.Row = 1;
            app.p3_yrmarkerlabel.Layout.Column = 8;
            app.p3_yrmarkerlabel.Text = 'Marker';

            % Create p3_yrlinewidthlabel
            app.p3_yrlinewidthlabel = uilabel(app.GridLayout2_6);
            app.p3_yrlinewidthlabel.Layout.Row = 1;
            app.p3_yrlinewidthlabel.Layout.Column = 7;
            app.p3_yrlinewidthlabel.Text = 'Line width';

            % Create p3_yrmarkerfacecolorlabel
            app.p3_yrmarkerfacecolorlabel = uilabel(app.GridLayout2_6);
            app.p3_yrmarkerfacecolorlabel.Layout.Row = 1;
            app.p3_yrmarkerfacecolorlabel.Layout.Column = 9;
            app.p3_yrmarkerfacecolorlabel.Text = 'Marker face color';

            % Create p3_yrmarkersizelabel
            app.p3_yrmarkersizelabel = uilabel(app.GridLayout2_6);
            app.p3_yrmarkersizelabel.Layout.Row = 1;
            app.p3_yrmarkersizelabel.Layout.Column = 11;
            app.p3_yrmarkersizelabel.Text = 'Marker size';

            % Create p3_yrlinewidth1
            app.p3_yrlinewidth1 = uieditfield(app.GridLayout2_6, 'numeric');
            app.p3_yrlinewidth1.Layout.Row = 2;
            app.p3_yrlinewidth1.Layout.Column = 7;

            % Create p3_yrmarkersize1
            app.p3_yrmarkersize1 = uieditfield(app.GridLayout2_6, 'numeric');
            app.p3_yrmarkersize1.Layout.Row = 2;
            app.p3_yrmarkersize1.Layout.Column = 11;

            % Create p3_yrmarkersize2
            app.p3_yrmarkersize2 = uieditfield(app.GridLayout2_6, 'numeric');
            app.p3_yrmarkersize2.Layout.Row = 3;
            app.p3_yrmarkersize2.Layout.Column = 11;

            % Create p3_yrlinewidth2
            app.p3_yrlinewidth2 = uieditfield(app.GridLayout2_6, 'numeric');
            app.p3_yrlinewidth2.Layout.Row = 3;
            app.p3_yrlinewidth2.Layout.Column = 7;

            % Create p3_yrmarker1
            app.p3_yrmarker1 = uidropdown(app.GridLayout2_6);
            app.p3_yrmarker1.Items = {'o', '+', '*', '.', 'x', '_', '|', 'square', 'diamond', '^', 'v', '>', '<', 'pentagram', 'hexagram', 'none', ''};
            app.p3_yrmarker1.Layout.Row = 2;
            app.p3_yrmarker1.Layout.Column = 8;
            app.p3_yrmarker1.Value = 'o';

            % Create p3_yrmarkercolor1
            app.p3_yrmarkercolor1 = uidropdown(app.GridLayout2_6);
            app.p3_yrmarkercolor1.Items = {'red', 'green', 'blue', 'cyan', 'magenta', 'yellow', 'black', 'white'};
            app.p3_yrmarkercolor1.Layout.Row = 2;
            app.p3_yrmarkercolor1.Layout.Column = 9;
            app.p3_yrmarkercolor1.Value = 'red';

            % Create p3_yrmarker2
            app.p3_yrmarker2 = uidropdown(app.GridLayout2_6);
            app.p3_yrmarker2.Items = {'o', '+', '*', '.', 'x', '_', '|', 'square', 'diamond', '^', 'v', '>', '<', 'pentagram', 'hexagram', 'none', ''};
            app.p3_yrmarker2.Layout.Row = 3;
            app.p3_yrmarker2.Layout.Column = 8;
            app.p3_yrmarker2.Value = 'o';

            % Create p3_yrmarkercolor2
            app.p3_yrmarkercolor2 = uidropdown(app.GridLayout2_6);
            app.p3_yrmarkercolor2.Items = {'red', 'green', 'blue', 'cyan', 'magenta', 'yellow', 'black', 'white'};
            app.p3_yrmarkercolor2.Layout.Row = 3;
            app.p3_yrmarkercolor2.Layout.Column = 9;
            app.p3_yrmarkercolor2.Value = 'red';

            % Create p3_yrparameter3
            app.p3_yrparameter3 = uidropdown(app.GridLayout2_6);
            app.p3_yrparameter3.Layout.Row = 4;
            app.p3_yrparameter3.Layout.Column = 2;

            % Create p3_yrparameter4
            app.p3_yrparameter4 = uidropdown(app.GridLayout2_6);
            app.p3_yrparameter4.Layout.Row = 5;
            app.p3_yrparameter4.Layout.Column = 2;

            % Create p3_yrparameter5
            app.p3_yrparameter5 = uidropdown(app.GridLayout2_6);
            app.p3_yrparameter5.Layout.Row = 6;
            app.p3_yrparameter5.Layout.Column = 2;

            % Create p3_yrparameter6
            app.p3_yrparameter6 = uidropdown(app.GridLayout2_6);
            app.p3_yrparameter6.Layout.Row = 7;
            app.p3_yrparameter6.Layout.Column = 2;

            % Create p3_yrparameter7
            app.p3_yrparameter7 = uidropdown(app.GridLayout2_6);
            app.p3_yrparameter7.Layout.Row = 8;
            app.p3_yrparameter7.Layout.Column = 2;

            % Create p3_yrparameter8
            app.p3_yrparameter8 = uidropdown(app.GridLayout2_6);
            app.p3_yrparameter8.Layout.Row = 9;
            app.p3_yrparameter8.Layout.Column = 2;

            % Create p3_yrcolor3
            app.p3_yrcolor3 = uidropdown(app.GridLayout2_6);
            app.p3_yrcolor3.Items = {'red', 'green', 'blue', 'cyan', 'magenta', 'yellow', 'black', 'white'};
            app.p3_yrcolor3.Layout.Row = 4;
            app.p3_yrcolor3.Layout.Column = 5;
            app.p3_yrcolor3.Value = 'red';

            % Create p3_yrcolor4
            app.p3_yrcolor4 = uidropdown(app.GridLayout2_6);
            app.p3_yrcolor4.Items = {'red', 'green', 'blue', 'cyan', 'magenta', 'yellow', 'black', 'white'};
            app.p3_yrcolor4.Layout.Row = 5;
            app.p3_yrcolor4.Layout.Column = 5;
            app.p3_yrcolor4.Value = 'red';

            % Create p3_yrcolor5
            app.p3_yrcolor5 = uidropdown(app.GridLayout2_6);
            app.p3_yrcolor5.Items = {'red', 'green', 'blue', 'cyan', 'magenta', 'yellow', 'black', 'white'};
            app.p3_yrcolor5.Layout.Row = 6;
            app.p3_yrcolor5.Layout.Column = 5;
            app.p3_yrcolor5.Value = 'red';

            % Create p3_yrcolor6
            app.p3_yrcolor6 = uidropdown(app.GridLayout2_6);
            app.p3_yrcolor6.Items = {'red', 'green', 'blue', 'cyan', 'magenta', 'yellow', 'black', 'white'};
            app.p3_yrcolor6.Layout.Row = 7;
            app.p3_yrcolor6.Layout.Column = 5;
            app.p3_yrcolor6.Value = 'red';

            % Create p3_yrcolor7
            app.p3_yrcolor7 = uidropdown(app.GridLayout2_6);
            app.p3_yrcolor7.Items = {'red', 'green', 'blue', 'cyan', 'magenta', 'yellow', 'black', 'white'};
            app.p3_yrcolor7.Layout.Row = 8;
            app.p3_yrcolor7.Layout.Column = 5;
            app.p3_yrcolor7.Value = 'red';

            % Create p3_yrcolor8
            app.p3_yrcolor8 = uidropdown(app.GridLayout2_6);
            app.p3_yrcolor8.Items = {'red', 'green', 'blue', 'cyan', 'magenta', 'yellow', 'black', 'white'};
            app.p3_yrcolor8.Layout.Row = 9;
            app.p3_yrcolor8.Layout.Column = 5;
            app.p3_yrcolor8.Value = 'red';

            % Create p3_yrlinestyle3
            app.p3_yrlinestyle3 = uidropdown(app.GridLayout2_6);
            app.p3_yrlinestyle3.Items = {'-', '--', ':', '-.', ''};
            app.p3_yrlinestyle3.Layout.Row = 4;
            app.p3_yrlinestyle3.Layout.Column = 6;
            app.p3_yrlinestyle3.Value = '-';

            % Create p3_yrlinestyle4
            app.p3_yrlinestyle4 = uidropdown(app.GridLayout2_6);
            app.p3_yrlinestyle4.Items = {'-', '--', ':', '-.', ''};
            app.p3_yrlinestyle4.Layout.Row = 5;
            app.p3_yrlinestyle4.Layout.Column = 6;
            app.p3_yrlinestyle4.Value = '-';

            % Create p3_yrlinestyle5
            app.p3_yrlinestyle5 = uidropdown(app.GridLayout2_6);
            app.p3_yrlinestyle5.Items = {'-', '--', ':', '-.', ''};
            app.p3_yrlinestyle5.Layout.Row = 6;
            app.p3_yrlinestyle5.Layout.Column = 6;
            app.p3_yrlinestyle5.Value = '-';

            % Create p3_yrlinestyle6
            app.p3_yrlinestyle6 = uidropdown(app.GridLayout2_6);
            app.p3_yrlinestyle6.Items = {'-', '--', ':', '-.', ''};
            app.p3_yrlinestyle6.Layout.Row = 7;
            app.p3_yrlinestyle6.Layout.Column = 6;
            app.p3_yrlinestyle6.Value = '-';

            % Create p3_yrlinestyle7
            app.p3_yrlinestyle7 = uidropdown(app.GridLayout2_6);
            app.p3_yrlinestyle7.Items = {'-', '--', ':', '-.', ''};
            app.p3_yrlinestyle7.Layout.Row = 8;
            app.p3_yrlinestyle7.Layout.Column = 6;
            app.p3_yrlinestyle7.Value = '-';

            % Create p3_yrlinestyle8
            app.p3_yrlinestyle8 = uidropdown(app.GridLayout2_6);
            app.p3_yrlinestyle8.Items = {'-', '--', ':', '-.', ''};
            app.p3_yrlinestyle8.Layout.Row = 9;
            app.p3_yrlinestyle8.Layout.Column = 6;
            app.p3_yrlinestyle8.Value = '-';

            % Create p3_yrlinewidth3
            app.p3_yrlinewidth3 = uieditfield(app.GridLayout2_6, 'numeric');
            app.p3_yrlinewidth3.Layout.Row = 4;
            app.p3_yrlinewidth3.Layout.Column = 7;

            % Create p3_yrlinewidth5
            app.p3_yrlinewidth5 = uieditfield(app.GridLayout2_6, 'numeric');
            app.p3_yrlinewidth5.Layout.Row = 6;
            app.p3_yrlinewidth5.Layout.Column = 7;

            % Create p3_yrlinewidth4
            app.p3_yrlinewidth4 = uieditfield(app.GridLayout2_6, 'numeric');
            app.p3_yrlinewidth4.Layout.Row = 5;
            app.p3_yrlinewidth4.Layout.Column = 7;

            % Create p3_yrlinewidth7
            app.p3_yrlinewidth7 = uieditfield(app.GridLayout2_6, 'numeric');
            app.p3_yrlinewidth7.Layout.Row = 8;
            app.p3_yrlinewidth7.Layout.Column = 7;

            % Create p3_yrlinewidth8
            app.p3_yrlinewidth8 = uieditfield(app.GridLayout2_6, 'numeric');
            app.p3_yrlinewidth8.Layout.Row = 9;
            app.p3_yrlinewidth8.Layout.Column = 7;

            % Create p3_yrmarkersize3
            app.p3_yrmarkersize3 = uieditfield(app.GridLayout2_6, 'numeric');
            app.p3_yrmarkersize3.Layout.Row = 4;
            app.p3_yrmarkersize3.Layout.Column = 11;

            % Create p3_yrmarkersize4
            app.p3_yrmarkersize4 = uieditfield(app.GridLayout2_6, 'numeric');
            app.p3_yrmarkersize4.Layout.Row = 5;
            app.p3_yrmarkersize4.Layout.Column = 11;

            % Create p3_yrlinewidth6
            app.p3_yrlinewidth6 = uieditfield(app.GridLayout2_6, 'numeric');
            app.p3_yrlinewidth6.Layout.Row = 7;
            app.p3_yrlinewidth6.Layout.Column = 7;

            % Create p3_yrmarkersize7
            app.p3_yrmarkersize7 = uieditfield(app.GridLayout2_6, 'numeric');
            app.p3_yrmarkersize7.Layout.Row = 8;
            app.p3_yrmarkersize7.Layout.Column = 11;

            % Create p3_yrmarkersize8
            app.p3_yrmarkersize8 = uieditfield(app.GridLayout2_6, 'numeric');
            app.p3_yrmarkersize8.Layout.Row = 9;
            app.p3_yrmarkersize8.Layout.Column = 11;

            % Create p3_yrmarkersize5
            app.p3_yrmarkersize5 = uieditfield(app.GridLayout2_6, 'numeric');
            app.p3_yrmarkersize5.Layout.Row = 6;
            app.p3_yrmarkersize5.Layout.Column = 11;

            % Create p3_yrmarkersize6
            app.p3_yrmarkersize6 = uieditfield(app.GridLayout2_6, 'numeric');
            app.p3_yrmarkersize6.Layout.Row = 7;
            app.p3_yrmarkersize6.Layout.Column = 11;

            % Create p3_yrmarker3
            app.p3_yrmarker3 = uidropdown(app.GridLayout2_6);
            app.p3_yrmarker3.Items = {'o', '+', '*', '.', 'x', '_', '|', 'square', 'diamond', '^', 'v', '>', '<', 'pentagram', 'hexagram', 'none', ''};
            app.p3_yrmarker3.Layout.Row = 4;
            app.p3_yrmarker3.Layout.Column = 8;
            app.p3_yrmarker3.Value = 'o';

            % Create p3_yrmarkercolor3
            app.p3_yrmarkercolor3 = uidropdown(app.GridLayout2_6);
            app.p3_yrmarkercolor3.Items = {'red', 'green', 'blue', 'cyan', 'magenta', 'yellow', 'black', 'white'};
            app.p3_yrmarkercolor3.Layout.Row = 4;
            app.p3_yrmarkercolor3.Layout.Column = 9;
            app.p3_yrmarkercolor3.Value = 'red';

            % Create p3_yrmarker4
            app.p3_yrmarker4 = uidropdown(app.GridLayout2_6);
            app.p3_yrmarker4.Items = {'o', '+', '*', '.', 'x', '_', '|', 'square', 'diamond', '^', 'v', '>', '<', 'pentagram', 'hexagram', 'none', ''};
            app.p3_yrmarker4.Layout.Row = 5;
            app.p3_yrmarker4.Layout.Column = 8;
            app.p3_yrmarker4.Value = 'o';

            % Create p3_yrmarkercolor4
            app.p3_yrmarkercolor4 = uidropdown(app.GridLayout2_6);
            app.p3_yrmarkercolor4.Items = {'red', 'green', 'blue', 'cyan', 'magenta', 'yellow', 'black', 'white'};
            app.p3_yrmarkercolor4.Layout.Row = 5;
            app.p3_yrmarkercolor4.Layout.Column = 9;
            app.p3_yrmarkercolor4.Value = 'red';

            % Create p3_yrmarker6
            app.p3_yrmarker6 = uidropdown(app.GridLayout2_6);
            app.p3_yrmarker6.Items = {'o', '+', '*', '.', 'x', '_', '|', 'square', 'diamond', '^', 'v', '>', '<', 'pentagram', 'hexagram', 'none', ''};
            app.p3_yrmarker6.Layout.Row = 7;
            app.p3_yrmarker6.Layout.Column = 8;
            app.p3_yrmarker6.Value = 'o';

            % Create p3_yrmarkercolor6
            app.p3_yrmarkercolor6 = uidropdown(app.GridLayout2_6);
            app.p3_yrmarkercolor6.Items = {'red', 'green', 'blue', 'cyan', 'magenta', 'yellow', 'black', 'white'};
            app.p3_yrmarkercolor6.Layout.Row = 7;
            app.p3_yrmarkercolor6.Layout.Column = 9;
            app.p3_yrmarkercolor6.Value = 'red';

            % Create p3_yrmarker5
            app.p3_yrmarker5 = uidropdown(app.GridLayout2_6);
            app.p3_yrmarker5.Items = {'o', '+', '*', '.', 'x', '_', '|', 'square', 'diamond', '^', 'v', '>', '<', 'pentagram', 'hexagram', 'none', ''};
            app.p3_yrmarker5.Layout.Row = 6;
            app.p3_yrmarker5.Layout.Column = 8;
            app.p3_yrmarker5.Value = 'o';

            % Create p3_yrmarkercolor5
            app.p3_yrmarkercolor5 = uidropdown(app.GridLayout2_6);
            app.p3_yrmarkercolor5.Items = {'red', 'green', 'blue', 'cyan', 'magenta', 'yellow', 'black', 'white'};
            app.p3_yrmarkercolor5.Layout.Row = 6;
            app.p3_yrmarkercolor5.Layout.Column = 9;
            app.p3_yrmarkercolor5.Value = 'red';

            % Create p3_yrmarkercolor7
            app.p3_yrmarkercolor7 = uidropdown(app.GridLayout2_6);
            app.p3_yrmarkercolor7.Items = {'red', 'green', 'blue', 'cyan', 'magenta', 'yellow', 'black', 'white'};
            app.p3_yrmarkercolor7.Layout.Row = 8;
            app.p3_yrmarkercolor7.Layout.Column = 9;
            app.p3_yrmarkercolor7.Value = 'red';

            % Create p3_yrmarker8
            app.p3_yrmarker8 = uidropdown(app.GridLayout2_6);
            app.p3_yrmarker8.Items = {'o', '+', '*', '.', 'x', '_', '|', 'square', 'diamond', '^', 'v', '>', '<', 'pentagram', 'hexagram', 'none', ''};
            app.p3_yrmarker8.Layout.Row = 9;
            app.p3_yrmarker8.Layout.Column = 8;
            app.p3_yrmarker8.Value = 'o';

            % Create p3_yrmarker7
            app.p3_yrmarker7 = uidropdown(app.GridLayout2_6);
            app.p3_yrmarker7.Items = {'o', '+', '*', '.', 'x', '_', '|', 'square', 'diamond', '^', 'v', '>', '<', 'pentagram', 'hexagram', 'none', ''};
            app.p3_yrmarker7.Layout.Row = 8;
            app.p3_yrmarker7.Layout.Column = 8;
            app.p3_yrmarker7.Value = 'o';

            % Create p3_yrmarkercolor8
            app.p3_yrmarkercolor8 = uidropdown(app.GridLayout2_6);
            app.p3_yrmarkercolor8.Items = {'red', 'green', 'blue', 'cyan', 'magenta', 'yellow', 'black', 'white'};
            app.p3_yrmarkercolor8.Layout.Row = 9;
            app.p3_yrmarkercolor8.Layout.Column = 9;
            app.p3_yrmarkercolor8.Value = 'red';

            % Create p3_yrcheckbox2
            app.p3_yrcheckbox2 = uicheckbox(app.GridLayout2_6);
            app.p3_yrcheckbox2.Tooltip = {'Checked=Enables, unchecked=Disable'};
            app.p3_yrcheckbox2.Text = '';
            app.p3_yrcheckbox2.Layout.Row = 3;
            app.p3_yrcheckbox2.Layout.Column = 1;

            % Create p3_yrcheckbox1
            app.p3_yrcheckbox1 = uicheckbox(app.GridLayout2_6);
            app.p3_yrcheckbox1.Tooltip = {'Checked=Enables, unchecked=Disable'};
            app.p3_yrcheckbox1.Text = '';
            app.p3_yrcheckbox1.Layout.Row = 2;
            app.p3_yrcheckbox1.Layout.Column = 1;

            % Create p3_yrcheckbox3
            app.p3_yrcheckbox3 = uicheckbox(app.GridLayout2_6);
            app.p3_yrcheckbox3.Tooltip = {'Checked=Enables, unchecked=Disable'};
            app.p3_yrcheckbox3.Text = '';
            app.p3_yrcheckbox3.Layout.Row = 4;
            app.p3_yrcheckbox3.Layout.Column = 1;

            % Create p3_yrcheckbox4
            app.p3_yrcheckbox4 = uicheckbox(app.GridLayout2_6);
            app.p3_yrcheckbox4.Tooltip = {'Checked=Enables, unchecked=Disable'};
            app.p3_yrcheckbox4.Text = '';
            app.p3_yrcheckbox4.Layout.Row = 5;
            app.p3_yrcheckbox4.Layout.Column = 1;

            % Create p3_yrcheckbox5
            app.p3_yrcheckbox5 = uicheckbox(app.GridLayout2_6);
            app.p3_yrcheckbox5.Tooltip = {'Checked=Enables, unchecked=Disable'};
            app.p3_yrcheckbox5.Text = '';
            app.p3_yrcheckbox5.Layout.Row = 6;
            app.p3_yrcheckbox5.Layout.Column = 1;

            % Create p3_yrcheckbox6
            app.p3_yrcheckbox6 = uicheckbox(app.GridLayout2_6);
            app.p3_yrcheckbox6.Tooltip = {'Checked=Enables, unchecked=Disable'};
            app.p3_yrcheckbox6.Text = '';
            app.p3_yrcheckbox6.Layout.Row = 7;
            app.p3_yrcheckbox6.Layout.Column = 1;

            % Create p3_yrcheckbox7
            app.p3_yrcheckbox7 = uicheckbox(app.GridLayout2_6);
            app.p3_yrcheckbox7.Tooltip = {'Checked=Enables, unchecked=Disable'};
            app.p3_yrcheckbox7.Text = '';
            app.p3_yrcheckbox7.Layout.Row = 8;
            app.p3_yrcheckbox7.Layout.Column = 1;

            % Create p3_yrcheckbox8
            app.p3_yrcheckbox8 = uicheckbox(app.GridLayout2_6);
            app.p3_yrcheckbox8.Tooltip = {'Checked=Enables, unchecked=Disable'};
            app.p3_yrcheckbox8.Text = '';
            app.p3_yrcheckbox8.Layout.Row = 9;
            app.p3_yrcheckbox8.Layout.Column = 1;

            % Create p3_yrcheckbox11
            app.p3_yrcheckbox11 = uicheckbox(app.GridLayout2_6);
            app.p3_yrcheckbox11.Tooltip = {'Checked=Manual mode, unchecked=auto mode'};
            app.p3_yrcheckbox11.Text = '';
            app.p3_yrcheckbox11.Layout.Row = 2;
            app.p3_yrcheckbox11.Layout.Column = 4;

            % Create p3_yrcheckbox12
            app.p3_yrcheckbox12 = uicheckbox(app.GridLayout2_6);
            app.p3_yrcheckbox12.Tooltip = {'Checked=Manual mode, unchecked=auto mode'};
            app.p3_yrcheckbox12.Text = '';
            app.p3_yrcheckbox12.Layout.Row = 3;
            app.p3_yrcheckbox12.Layout.Column = 4;

            % Create p3_yrcheckbox13
            app.p3_yrcheckbox13 = uicheckbox(app.GridLayout2_6);
            app.p3_yrcheckbox13.Tooltip = {'Checked=Manual mode, unchecked=auto mode'};
            app.p3_yrcheckbox13.Text = '';
            app.p3_yrcheckbox13.Layout.Row = 4;
            app.p3_yrcheckbox13.Layout.Column = 4;

            % Create p3_yrcheckbox14
            app.p3_yrcheckbox14 = uicheckbox(app.GridLayout2_6);
            app.p3_yrcheckbox14.Tooltip = {'Checked=Manual mode, unchecked=auto mode'};
            app.p3_yrcheckbox14.Text = '';
            app.p3_yrcheckbox14.Layout.Row = 5;
            app.p3_yrcheckbox14.Layout.Column = 4;

            % Create p3_yrcheckbox15
            app.p3_yrcheckbox15 = uicheckbox(app.GridLayout2_6);
            app.p3_yrcheckbox15.Tooltip = {'Checked=Manual mode, unchecked=auto mode'};
            app.p3_yrcheckbox15.Text = '';
            app.p3_yrcheckbox15.Layout.Row = 6;
            app.p3_yrcheckbox15.Layout.Column = 4;

            % Create p3_yrcheckbox16
            app.p3_yrcheckbox16 = uicheckbox(app.GridLayout2_6);
            app.p3_yrcheckbox16.Tooltip = {'Checked=Manual mode, unchecked=auto mode'};
            app.p3_yrcheckbox16.Text = '';
            app.p3_yrcheckbox16.Layout.Row = 7;
            app.p3_yrcheckbox16.Layout.Column = 4;

            % Create p3_yrcheckbox17
            app.p3_yrcheckbox17 = uicheckbox(app.GridLayout2_6);
            app.p3_yrcheckbox17.Tooltip = {'Checked=Manual mode, unchecked=auto mode'};
            app.p3_yrcheckbox17.Text = '';
            app.p3_yrcheckbox17.Layout.Row = 8;
            app.p3_yrcheckbox17.Layout.Column = 4;

            % Create p3_yrcheckbox18
            app.p3_yrcheckbox18 = uicheckbox(app.GridLayout2_6);
            app.p3_yrcheckbox18.Tooltip = {'Checked=Manual mode, unchecked=auto mode'};
            app.p3_yrcheckbox18.Text = '';
            app.p3_yrcheckbox18.Layout.Row = 9;
            app.p3_yrcheckbox18.Layout.Column = 4;

            % Create p3_yrmodelabel
            app.p3_yrmodelabel = uilabel(app.GridLayout2_6);
            app.p3_yrmodelabel.Layout.Row = 1;
            app.p3_yrmodelabel.Layout.Column = 1;
            app.p3_yrmodelabel.Text = 'Mode';

            % Create p3_yrmode2label
            app.p3_yrmode2label = uilabel(app.GridLayout2_6);
            app.p3_yrmode2label.Layout.Row = 1;
            app.p3_yrmode2label.Layout.Column = 4;
            app.p3_yrmode2label.Text = 'Mode';

            % Create p3_yrmarkeredgecolorlabel
            app.p3_yrmarkeredgecolorlabel = uilabel(app.GridLayout2_6);
            app.p3_yrmarkeredgecolorlabel.Layout.Row = 1;
            app.p3_yrmarkeredgecolorlabel.Layout.Column = 10;
            app.p3_yrmarkeredgecolorlabel.Text = 'Marker edge color';

            % Create p3_yrmarkeredgecolor1
            app.p3_yrmarkeredgecolor1 = uidropdown(app.GridLayout2_6);
            app.p3_yrmarkeredgecolor1.Items = {'red', 'green', 'blue', 'cyan', 'magenta', 'yellow', 'black', 'white'};
            app.p3_yrmarkeredgecolor1.Layout.Row = 2;
            app.p3_yrmarkeredgecolor1.Layout.Column = 10;
            app.p3_yrmarkeredgecolor1.Value = 'red';

            % Create p3_yrmarkeredgecolor2
            app.p3_yrmarkeredgecolor2 = uidropdown(app.GridLayout2_6);
            app.p3_yrmarkeredgecolor2.Items = {'red', 'green', 'blue', 'cyan', 'magenta', 'yellow', 'black', 'white'};
            app.p3_yrmarkeredgecolor2.Layout.Row = 3;
            app.p3_yrmarkeredgecolor2.Layout.Column = 10;
            app.p3_yrmarkeredgecolor2.Value = 'red';

            % Create p3_yrmarkeredgecolor3
            app.p3_yrmarkeredgecolor3 = uidropdown(app.GridLayout2_6);
            app.p3_yrmarkeredgecolor3.Items = {'red', 'green', 'blue', 'cyan', 'magenta', 'yellow', 'black', 'white'};
            app.p3_yrmarkeredgecolor3.Layout.Row = 4;
            app.p3_yrmarkeredgecolor3.Layout.Column = 10;
            app.p3_yrmarkeredgecolor3.Value = 'red';

            % Create p3_yrmarkeredgecolor4
            app.p3_yrmarkeredgecolor4 = uidropdown(app.GridLayout2_6);
            app.p3_yrmarkeredgecolor4.Items = {'red', 'green', 'blue', 'cyan', 'magenta', 'yellow', 'black', 'white'};
            app.p3_yrmarkeredgecolor4.Layout.Row = 5;
            app.p3_yrmarkeredgecolor4.Layout.Column = 10;
            app.p3_yrmarkeredgecolor4.Value = 'red';

            % Create p3_yrmarkeredgecolor5
            app.p3_yrmarkeredgecolor5 = uidropdown(app.GridLayout2_6);
            app.p3_yrmarkeredgecolor5.Items = {'red', 'green', 'blue', 'cyan', 'magenta', 'yellow', 'black', 'white'};
            app.p3_yrmarkeredgecolor5.Layout.Row = 6;
            app.p3_yrmarkeredgecolor5.Layout.Column = 10;
            app.p3_yrmarkeredgecolor5.Value = 'red';

            % Create p3_yrmarkeredgecolor6
            app.p3_yrmarkeredgecolor6 = uidropdown(app.GridLayout2_6);
            app.p3_yrmarkeredgecolor6.Items = {'red', 'green', 'blue', 'cyan', 'magenta', 'yellow', 'black', 'white'};
            app.p3_yrmarkeredgecolor6.Layout.Row = 7;
            app.p3_yrmarkeredgecolor6.Layout.Column = 10;
            app.p3_yrmarkeredgecolor6.Value = 'red';

            % Create p3_yrmarkeredgecolor7
            app.p3_yrmarkeredgecolor7 = uidropdown(app.GridLayout2_6);
            app.p3_yrmarkeredgecolor7.Items = {'red', 'green', 'blue', 'cyan', 'magenta', 'yellow', 'black', 'white'};
            app.p3_yrmarkeredgecolor7.Layout.Row = 8;
            app.p3_yrmarkeredgecolor7.Layout.Column = 10;
            app.p3_yrmarkeredgecolor7.Value = 'red';

            % Create p3_yrmarkeredgecolor8
            app.p3_yrmarkeredgecolor8 = uidropdown(app.GridLayout2_6);
            app.p3_yrmarkeredgecolor8.Items = {'red', 'green', 'blue', 'cyan', 'magenta', 'yellow', 'black', 'white'};
            app.p3_yrmarkeredgecolor8.Layout.Row = 9;
            app.p3_yrmarkeredgecolor8.Layout.Column = 10;
            app.p3_yrmarkeredgecolor8.Value = 'red';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
% Create Fileslectgridlayout
            app.p3_Fileslectgridlayout = uigridlayout(app.p3_UIFigure5);
            app.p3_Fileslectgridlayout.ColumnWidth = {30, 200, 50, 100, '1x', '1x', '1x'};
            app.p3_Fileslectgridlayout.RowHeight = {40, 40, 40, 40, 40, 40, 40, 40};

            % Create p3_File1Button
            app.p3_File1Button = uibutton(app.p3_Fileslectgridlayout, 'push');
            app.p3_File1Button.ButtonPushedFcn = @(src,evnt)p3_File1ButtonPushed(app);
            app.p3_File1Button.Layout.Row = 1;
            app.p3_File1Button.Layout.Column = 2;
            app.p3_File1Button.Text = 'File1';

            % Create p3_File2Button
            app.p3_File2Button = uibutton(app.p3_Fileslectgridlayout, 'push');
            app.p3_File2Button.ButtonPushedFcn =  @(src,evnt)p3_File2ButtonPushed(app);
            app.p3_File2Button.Layout.Row = 2;
            app.p3_File2Button.Layout.Column = 2;
            app.p3_File2Button.Text = 'File2';

            % Create p3_File3Button
            app.p3_File3Button = uibutton(app.p3_Fileslectgridlayout, 'push');
            app.p3_File3Button.ButtonPushedFcn =  @(src,evnt)p3_File3ButtonPushed(app);
            app.p3_File3Button.Layout.Row = 3;
            app.p3_File3Button.Layout.Column = 2;
            app.p3_File3Button.Text = 'File3';

            % Create p3_File4Button
            app.p3_File4Button = uibutton(app.p3_Fileslectgridlayout, 'push');
            app.p3_File4Button.ButtonPushedFcn =  @(src,evnt)p3_File4ButtonPushed(app);
            app.p3_File4Button.Layout.Row = 4;
            app.p3_File4Button.Layout.Column = 2;
            app.p3_File4Button.Text = 'File4';

            % Create p3_File5Button
            app.p3_File5Button = uibutton(app.p3_Fileslectgridlayout, 'push');
            app.p3_File5Button.ButtonPushedFcn =  @(src,evnt)p3_File5ButtonPushed(app);
            app.p3_File5Button.Layout.Row = 5;
            app.p3_File5Button.Layout.Column = 2;
            app.p3_File5Button.Text = 'File5';

            % Create p3_File6Button
            app.p3_File6Button = uibutton(app.p3_Fileslectgridlayout, 'push');
            app.p3_File6Button.ButtonPushedFcn =  @(src,evnt)p3_File6ButtonPushed(app);
            app.p3_File6Button.Layout.Row = 6;
            app.p3_File6Button.Layout.Column = 2;
            app.p3_File6Button.Text = 'File6';

            % Create p3_File7Button
            app.p3_File7Button = uibutton(app.p3_Fileslectgridlayout, 'push');
            app.p3_File7Button.ButtonPushedFcn =  @(src,evnt)p3_File7ButtonPushed(app);
            app.p3_File7Button.Layout.Row = 7;
            app.p3_File7Button.Layout.Column = 2;
            app.p3_File7Button.Text = 'File7';

            % Create p3_File8Button
            app.p3_File8Button = uibutton(app.p3_Fileslectgridlayout, 'push');
            app.p3_File8Button.ButtonPushedFcn =  @(src,evnt)p3_File8ButtonPushed(app);
            app.p3_File8Button.Layout.Row = 8;
            app.p3_File8Button.Layout.Column = 2;
            app.p3_File8Button.Text = 'File8';

            app.p3_File9Button = uibutton(app.p3_Fileslectgridlayout, 'push');
            app.p3_File9Button.ButtonPushedFcn =  @(src,evnt)p3f_ReadFileButtonPushed(app);
            app.p3_File9Button.Layout.Row = 9;
            app.p3_File9Button.Layout.Column = 5;
            app.p3_File9Button.Text = 'Read file';

            % Create FilenameEditFieldLabel
            app.p3_FilenameEditFieldLabel = uilabel(app.p3_Fileslectgridlayout);
            app.p3_FilenameEditFieldLabel.HorizontalAlignment = 'right';
            app.p3_FilenameEditFieldLabel.Layout.Row = 1;
            app.p3_FilenameEditFieldLabel.Layout.Column = 4;
            app.p3_FilenameEditFieldLabel.Text = 'Filename';

            % Create p3_Filename1
            app.p3_Filename1 = uieditfield(app.p3_Fileslectgridlayout, 'text');
            app.p3_Filename1.Layout.Row = 1;
            app.p3_Filename1.Layout.Column = 5;

            app.p3_Filepath1 = uieditfield(app.p3_Fileslectgridlayout, 'text');
            app.p3_Filepath1.Layout.Row = 1;
            app.p3_Filepath1.Layout.Column = [6 7];


            % Create FilenameEditField_2Label
            app.p3_FilenameEditField_2Label = uilabel(app.p3_Fileslectgridlayout);
            app.p3_FilenameEditField_2Label.HorizontalAlignment = 'right';
            app.p3_FilenameEditField_2Label.Layout.Row = 2;
            app.p3_FilenameEditField_2Label.Layout.Column = 4;
            app.p3_FilenameEditField_2Label.Text = 'Filename';

            % Create p3_Filename2
            app.p3_Filename2 = uieditfield(app.p3_Fileslectgridlayout, 'text');
            app.p3_Filename2.Layout.Row = 2;
            app.p3_Filename2.Layout.Column = 5;

            app.p3_Filepath2 = uieditfield(app.p3_Fileslectgridlayout, 'text');
            app.p3_Filepath2.Layout.Row = 2;
            app.p3_Filepath2.Layout.Column = [6 7];

            % Create FilenameEditField_3Label
            app.p3_FilenameEditField_3Label = uilabel(app.p3_Fileslectgridlayout);
            app.p3_FilenameEditField_3Label.HorizontalAlignment = 'right';
            app.p3_FilenameEditField_3Label.Layout.Row = 3;
            app.p3_FilenameEditField_3Label.Layout.Column = 4;
            app.p3_FilenameEditField_3Label.Text = 'Filename';

            % Create p3_Filename3
            app.p3_Filename3 = uieditfield(app.p3_Fileslectgridlayout, 'text');
            app.p3_Filename3.Layout.Row = 3;
            app.p3_Filename3.Layout.Column = 5;

            app.p3_Filepath3 = uieditfield(app.p3_Fileslectgridlayout, 'text');
            app.p3_Filepath3.Layout.Row = 3;
            app.p3_Filepath3.Layout.Column = [6 7];

            % Create FilenameEditField_4Label
            app.p3_FilenameEditField_4Label = uilabel(app.p3_Fileslectgridlayout);
            app.p3_FilenameEditField_4Label.HorizontalAlignment = 'right';
            app.p3_FilenameEditField_4Label.Layout.Row = 4;
            app.p3_FilenameEditField_4Label.Layout.Column = 4;
            app.p3_FilenameEditField_4Label.Text = 'Filename';

            % Create p3_Filename4
            app.p3_Filename4 = uieditfield(app.p3_Fileslectgridlayout, 'text');
            app.p3_Filename4.Layout.Row = 4;
            app.p3_Filename4.Layout.Column = 5;

            app.p3_Filepath4 = uieditfield(app.p3_Fileslectgridlayout, 'text');
            app.p3_Filepath4.Layout.Row = 4;
            app.p3_Filepath4.Layout.Column = [6 7];

            % Create FilenameEditField_5Label
            app.p3_FilenameEditField_5Label = uilabel(app.p3_Fileslectgridlayout);
            app.p3_FilenameEditField_5Label.HorizontalAlignment = 'right';
            app.p3_FilenameEditField_5Label.Layout.Row = 5;
            app.p3_FilenameEditField_5Label.Layout.Column = 4;
            app.p3_FilenameEditField_5Label.Text = 'Filename';

            % Create p3_Filename5
            app.p3_Filename5 = uieditfield(app.p3_Fileslectgridlayout, 'text');
            app.p3_Filename5.Layout.Row = 5;
            app.p3_Filename5.Layout.Column = 5;

            app.p3_Filepath5 = uieditfield(app.p3_Fileslectgridlayout, 'text');
            app.p3_Filepath5.Layout.Row = 5;
            app.p3_Filepath5.Layout.Column = [6 7];

            % Create FilenameEditField_6Label
            app.p3_FilenameEditField_6Label = uilabel(app.p3_Fileslectgridlayout);
            app.p3_FilenameEditField_6Label.HorizontalAlignment = 'right';
            app.p3_FilenameEditField_6Label.Layout.Row = 6;
            app.p3_FilenameEditField_6Label.Layout.Column = 4;
            app.p3_FilenameEditField_6Label.Text = 'Filename';

            % Create p3_Filename6
            app.p3_Filename6 = uieditfield(app.p3_Fileslectgridlayout, 'text');
            app.p3_Filename6.Layout.Row = 6;
            app.p3_Filename6.Layout.Column = 5;

            app.p3_Filepath6 = uieditfield(app.p3_Fileslectgridlayout, 'text');
            app.p3_Filepath6.Layout.Row = 6;
            app.p3_Filepath6.Layout.Column = [6 7];

            % Create FilenameEditField_7Label
            app.p3_FilenameEditField_7Label = uilabel(app.p3_Fileslectgridlayout);
            app.p3_FilenameEditField_7Label.HorizontalAlignment = 'right';
            app.p3_FilenameEditField_7Label.Layout.Row = 7;
            app.p3_FilenameEditField_7Label.Layout.Column = 4;
            app.p3_FilenameEditField_7Label.Text = 'Filename';

            % Create p3_Filename7
            app.p3_Filename7 = uieditfield(app.p3_Fileslectgridlayout, 'text');
            app.p3_Filename7.Layout.Row = 7;
            app.p3_Filename7.Layout.Column = 5;

            app.p3_Filepath7 = uieditfield(app.p3_Fileslectgridlayout, 'text');
            app.p3_Filepath7.Layout.Row = 7;
            app.p3_Filepath7.Layout.Column = [6 7];

            % Create FilenameEditField_8Label
            app.p3_FilenameEditField_8Label = uilabel(app.p3_Fileslectgridlayout);
            app.p3_FilenameEditField_8Label.HorizontalAlignment = 'right';
            app.p3_FilenameEditField_8Label.Layout.Row = 8;
            app.p3_FilenameEditField_8Label.Layout.Column = 4;
            app.p3_FilenameEditField_8Label.Text = 'Filename';

            % Create p3_Filename8
            app.p3_Filename8 = uieditfield(app.p3_Fileslectgridlayout, 'text');
            app.p3_Filename8.Layout.Row = 8;
            app.p3_Filename8.Layout.Column = 5;

            app.p3_Filepath8 = uieditfield(app.p3_Fileslectgridlayout, 'text');
            app.p3_Filepath8.Layout.Row = 8;
            app.p3_Filepath8.Layout.Column = [6 7];

            % Create p3_file1enable
            app.p3_file1enable = uicheckbox(app.p3_Fileslectgridlayout);
            app.p3_file1enable.ValueChangedFcn = @(sr,evnt)p3_file1enableValueChanged(app);
            app.p3_file1enable.Text = '';
            app.p3_file1enable.Layout.Row = 1;
            app.p3_file1enable.Layout.Column = 1;

            % Create p3_file1e2able
            app.p3_file2enable = uicheckbox(app.p3_Fileslectgridlayout);
            app.p3_file2enable.ValueChangedFcn = @(sr,evnt)p3_file2enableValueChanged(app);
            app.p3_file2enable.Text = '';
            app.p3_file2enable.Layout.Row = 2;
            app.p3_file2enable.Layout.Column = 1;

            % Create p3_file3enable
            app.p3_file3enable = uicheckbox(app.p3_Fileslectgridlayout);
            app.p3_file3enable.ValueChangedFcn = @(sr,evnt)p3_file3enableValueChanged(app);
            app.p3_file3enable.Text = '';
            app.p3_file3enable.Layout.Row = 3;
            app.p3_file3enable.Layout.Column = 1;

            % Create p3_file4enable
            app.p3_file4enable = uicheckbox(app.p3_Fileslectgridlayout);
            app.p3_file4enable.ValueChangedFcn = @(sr,evnt)p3_file4enableValueChanged(app);
            app.p3_file4enable.Text = '';
            app.p3_file4enable.Layout.Row = 4;
            app.p3_file4enable.Layout.Column = 1;

            % Create p3_file5enable
            app.p3_file5enable = uicheckbox(app.p3_Fileslectgridlayout);
            app.p3_file5enable.ValueChangedFcn = @(sr,evnt)p3_file5enableValueChanged(app);
            app.p3_file5enable.Text = '';
            app.p3_file5enable.Layout.Row = 5;
            app.p3_file5enable.Layout.Column = 1;

            % Create p3_file6enable
            app.p3_file6enable = uicheckbox(app.p3_Fileslectgridlayout);
            app.p3_file6enable.ValueChangedFcn = @(sr,evnt)p3_file6enableValueChanged(app);
            app.p3_file6enable.Text = '';
            app.p3_file6enable.Layout.Row = 6;
            app.p3_file6enable.Layout.Column = 1;

            % Create p3_file7enable
            app.p3_file7enable = uicheckbox(app.p3_Fileslectgridlayout);
            app.p3_file7enable.ValueChangedFcn = @(sr,evnt)p3_file7enableValueChanged(app);
            app.p3_file7enable.Text = '';
            app.p3_file7enable.Layout.Row = 7;
            app.p3_file7enable.Layout.Column = 1;

            % Create p3_file8enable
            app.p3_file8enable = uicheckbox(app.p3_Fileslectgridlayout);
            app.p3_file8enable.ValueChangedFcn = @(sr,evnt)p3_file8enableValueChanged(app);
            app.p3_file8enable.Text = '';
            app.p3_file8enable.Layout.Row = 8;
            app.p3_file8enable.Layout.Column = 1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            app.p3_CompareFileslectgridlayout = uigridlayout(app.p3_UIFigure6);
            app.p3_CompareFileslectgridlayout.ColumnWidth = {30, 200, 50, 100, '1x', '1x', '1x'};
            app.p3_CompareFileslectgridlayout.RowHeight = {40, 40, 40, 40, 40, 40, 40, 40};

            % Create p3_File1Button
            app.p3_CompareFile1Button = uibutton(app.p3_CompareFileslectgridlayout, 'push');
            app.p3_CompareFile1Button.ButtonPushedFcn = @(src,evnt)p3_CompareFile1ButtonPushed(app,1);
            app.p3_CompareFile1Button.Layout.Row = 1;
            app.p3_CompareFile1Button.Layout.Column = 2;
            app.p3_CompareFile1Button.Text = 'File1';

            % Create p3_File2Button
            app.p3_CompareFile2Button = uibutton(app.p3_CompareFileslectgridlayout, 'push');
            app.p3_CompareFile2Button.ButtonPushedFcn =  @(src,evnt)p3_CompareFile1ButtonPushed(app,2);
            app.p3_CompareFile2Button.Layout.Row = 2;
            app.p3_CompareFile2Button.Layout.Column = 2;
            app.p3_CompareFile2Button.Text = 'File2';

            app.p3_CompareFile9Button = uibutton(app.p3_CompareFileslectgridlayout, 'push');
            app.p3_CompareFile9Button.ButtonPushedFcn =  @(src,evnt)p3f_compareReadFileButtonPushed(app);
            app.p3_CompareFile9Button.Layout.Row = 9;
            app.p3_CompareFile9Button.Layout.Column = 5;
            app.p3_CompareFile9Button.Text = 'Read file';
            %%%%%%%%
            % Create Filename 1 EditFieldLabel
            app.p3_CompareFilenameEditFieldLabel = uilabel(app.p3_CompareFileslectgridlayout);
            app.p3_CompareFilenameEditFieldLabel.HorizontalAlignment = 'right';
            app.p3_CompareFilenameEditFieldLabel.Layout.Row = 1;
            app.p3_CompareFilenameEditFieldLabel.Layout.Column = 4;
            app.p3_CompareFilenameEditFieldLabel.Text = 'Filename';
            
            % Create p3_Filename1
            app.p3_CompareFilename1 = uieditfield(app.p3_CompareFileslectgridlayout, 'text');
            app.p3_CompareFilename1.Layout.Row = 1;
            app.p3_CompareFilename1.Layout.Column = 5;

            app.p3_CompareFilepath1 = uieditfield(app.p3_CompareFileslectgridlayout, 'text');
            app.p3_CompareFilepath1.Layout.Row = 1;
            app.p3_CompareFilepath1.Layout.Column = [6 7];

            %%%%%%%%
            % Create FilenameEditField_2Label
            app.p3_CompareFilenameEditField_2Label = uilabel(app.p3_CompareFileslectgridlayout);
            app.p3_CompareFilenameEditField_2Label.HorizontalAlignment = 'right';
            app.p3_CompareFilenameEditField_2Label.Layout.Row = 2;
            app.p3_CompareFilenameEditField_2Label.Layout.Column = 4;
            app.p3_CompareFilenameEditField_2Label.Text = 'Filename';

            % Create p3_Filename2
            app.p3_CompareFilename2 = uieditfield(app.p3_CompareFileslectgridlayout, 'text');
            app.p3_CompareFilename2.Layout.Row = 2;
            app.p3_CompareFilename2.Layout.Column = 5;

            app.p3_CompareFilepath2 = uieditfield(app.p3_CompareFileslectgridlayout, 'text');
            app.p3_CompareFilepath2.Layout.Row = 2;
            app.p3_CompareFilepath2.Layout.Column = [6 7];
            %%%%%%%%%
            % Create p3_file1enable
            app.p3_Comparefile1enable = uicheckbox(app.p3_CompareFileslectgridlayout);
            app.p3_Comparefile1enable.ValueChangedFcn = @(sr,evnt)p3_comparefile1enableValueChanged(app,1,app.p3_Comparefile1enable.Value);
            app.p3_Comparefile1enable.Text = '';
            app.p3_Comparefile1enable.Layout.Row = 1;
            app.p3_Comparefile1enable.Layout.Column = 1;

            % Create p3_file1e2able
            app.p3_Comparefile2enable = uicheckbox(app.p3_CompareFileslectgridlayout);
            app.p3_Comparefile2enable.ValueChangedFcn = @(sr,evnt)p3_comparefile1enableValueChanged(app,2,app.p3_Comparefile2enable.Value);
            app.p3_Comparefile2enable.Text = '';
            app.p3_Comparefile2enable.Layout.Row = 2;
            app.p3_Comparefile2enable.Layout.Column = 1;

end