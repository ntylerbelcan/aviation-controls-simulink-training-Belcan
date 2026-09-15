dd = Simulink.data.dictionary.open('polynomial_System.sldd');

sect = getSection(dd,'Design Data');
entries = find(sect);

Name = {};
EntryType = {};
DataType = {};
Dimensions = {};
Min = {};
Max = {};
Unit = {};
Description = {};

for k = 1:numel(entries)

    Name{end+1,1} = entries(k).Name;

    obj = getValue(entries(k));

    EntryType{end+1,1} = class(obj);

    if isprop(obj,'DataType')
        DataType{end+1,1} = obj.DataType;
    else
        DataType{end+1,1} = '';
    end

    if isprop(obj,'Dimensions')
        Dimensions{end+1,1} = mat2str(obj.Dimensions);
    else
        Dimensions{end+1,1} = '';
    end

    if isprop(obj,'Min')
        Min{end+1,1} = obj.Min;
    else
        Min{end+1,1} = '';
    end

    if isprop(obj,'Max')
        Max{end+1,1} = obj.Max;
    else
        Max{end+1,1} = '';
    end

    if isprop(obj,'Unit')
        Unit{end+1,1} = obj.Unit;
    else
        Unit{end+1,1} = '';
    end

    if isprop(obj,'Description')
        Description{end+1,1} = obj.Description;
    else
        Description{end+1,1} = '';
    end

end

T = table( ...
    Name,...
    EntryType,...
    DataType,...
    Dimensions,...
    Min,...
    Max,...
    Unit,...
    Description);

writetable(T,'DataDictionary.xlsx');