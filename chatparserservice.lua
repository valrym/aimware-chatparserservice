local settings = {
	["prefixc"] = "$c",
	["prefix"] = "*a"
}

function chatreg(m)
		if m:GetID() == 6 or m:GetID() == 5 and m:GetInt( 1 ) == client.GetLocalPlayerIndex() then 
			local msgs = m:GetString(4,1);
			local params = {}
			for sub in msgs:gmatch("%S+") do table.insert(params, sub) end
			if string.find(m:GetString(4,1), settings.prefixc) and 	params[2] ~= nil then
				local fullparams = string.sub(msgs, string.len(params[1]) + string.len(params[2]) + 2)
				local cmd = params[2] .. " " .. fullparams
				client.Command("echo" .. " \"[CPS]: executed \'" .. cmd .. "\'\"", true)
				client.Command(cmd, true)	
			else if string.find(m:GetString(4,1), settings.prefix) then
				local cmd = params[2] .. " " .. params[3] 
				client.Command("echo" .. " \"[CPS]: executed \'" .. cmd .. "\'\"", true)
				gui.Command(cmd)	
			end
		end
	end
end

callbacks.Register("DispatchUserMessage", "cht", chatreg);