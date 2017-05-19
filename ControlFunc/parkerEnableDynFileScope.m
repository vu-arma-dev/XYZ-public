function parkerEnableDynFileScope(tg,flag)
if nargin<2
    flag = 1;
end
id = tg.getparamid('Scopes/DynAna_File_scope','Value');
tg.setparam(id,flag);
end

