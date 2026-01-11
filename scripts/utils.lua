function dump_table(o, depth)
    if depth == nil then
        depth = 0
    end
    if type(o) == 'table' then
        local tabs = ('\t'):rep(depth)
        local tabs2 = ('\t'):rep(depth + 1)
        local s = '{\n'
        for k, v in pairs(o) do
            if type(k) ~= 'number' then
                k = '"' .. k .. '"'
            end
            s = s .. tabs2 .. '[' .. k .. '] = ' .. dump_table(v, depth + 1) .. ',\n'
        end
        return s .. tabs .. '}'
    else
        return tostring(o)
    end
end

function has(item, amount)
	local count = Tracker:ProviderCountForCode(item)
	amount = tonumber(amount)
	if not amount then
		return count > 0
	else
		return count >= amount
	end
end

function slums_to_port()
    return has("red") or (has("green") and has("yellow")) or (has("train") and has("jet_board"))
end

function slums_to_stadium()
    return has("green") or (has("red") and has("yellow")) or (has("train") and has("yellow") and has("jet_board"))
end

function slums_to_market()
    return (has("yellow") and has("green")) or (has("red") and has("yellow")) or (has("train") and has("yellow") and has("jet_board"))
end

function port_to_stadium()
    return has("yellow") or (has("red") and has("green")) or (has("train") and has("green") and has("jet_board"))
end

function port_to_market()
    return has("yellow")
end

function market_to_stadium()
    return has("yellow")
end

function slums_to_landing_pad()
    return has("jet_board") or (has("red") and has("train")) or (has("green") and has("yellow") and has("train"))
end

function slums_to_nest()
    return (has("jet_board") and has("train")) or (has("red") and has("train")) or (has("green") and has("yellow") and has("train"))
end