function p3f_closereq(fig)
%         selection = uiconfirm(fig,'Close the figure window?',...
%             'Confirmation');
        
%         switch selection
%             case 'OK'
                fig.Visible='off';
%             case 'Cancel'
%                 return
%         end
    end