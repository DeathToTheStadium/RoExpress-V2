-- Set Variables Table
local app,RService,Players,Debris;
app = {}
app.client = {}

RService = game:GetService('RunService')

-- Server Api Methods
function app.new()
    local self = {}
    return setmetatable(self,{__index = app})
end

-- Client Api Methods
function app.client.new()
    local self = {}
    return setmetatable(self,{__index = app.client})
end



return setmetatable(app,{
    __index = function(object,index)
        if RService:IsServer() then return app.new() end
        return app.client.new()
    end
})