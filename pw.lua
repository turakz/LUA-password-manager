--Lua 5.3.4
--pw.lua - an insecure password manager

fromFile = function()

    pwds = {}

    --let's get our passwords
    inFile = io.open("input.txt", r)

    if inFile == nil then
        io.stderr:write("Error, file not found")
    end

    --let's make this file default input
    io.input(inFile)

    --let's parse input line by line and get key,value pairs
    for line in io.lines() do
        for k, v in string.gmatch(line, "(%w+), (%w+)") do
            pwds[k] = v
        end
    end


    return pwds

end

getPwd = function(pwds, account)
    --retrieve key's value, copy to system clipboard (WINDOWS OS ONLY)
    clipCmd = "echo "..pwds[account].." | clip"
    os.execute(clipCmd)
end

--let's grab our command line argument-key and get its value
if (#arg < 1) then
    io.stderr:write("Error - missing CML argument\n\tUsage: lua pw.lua <accountType>\n")
else
    account = arg[1]
end

--retrieve account types
pwList = fromFile()
--retrieve our password
getPwd(pwList, account)




