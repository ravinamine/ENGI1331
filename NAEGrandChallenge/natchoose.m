function choice = natchoose

    d = dialog('Position',[300 300 250 150],'Name','Select');
    txt = uicontrol('Parent',d,...
           'Style','text',...
           'Position',[20 80 210 40],...
           'String','Select a Nation');

    popup = uicontrol('Parent',d,...
           'Style','popup',...
           'Position',[75 70 100 25],...
           'String',{'Ghana';'Kenya';'SouthAfrica';'France';'Germany';'Spain';'UnitedKingdom';'Argentina';'Ecuador';'Mexico';'Canada';'UnitedStates'},...
           'Callback',@popup_callback);

    btn = uicontrol('Parent',d,...
           'Position',[89 20 70 25],...
           'String','Enter',...
           'Callback','delete(gcf)');

    choice = 'Ghana';

    uiwait(d);

       function popup_callback(popup,event)
          idx = popup.Value;
          popup_items = popup.String;
          choice = char(popup_items(idx,:));
       end
end
