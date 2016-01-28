local http = require 'socket.http'
local json = require 'cjson'
local ltn12 = require 'ltn12'

Sender = {} -- base class

function Sender:new(name, description, position, cell_type, app_url)
    app_url = app_url or 'http://localhost:3000/api/v1/values'
    this = {app_url = app_url, name = name, description = description,
            position = position, cell_type = cell_type}
    self.__index = self
    cmd = json.encode({
        name = this.name,
        type = this.cell_type,
        value = {},
        pos = this.position,
        description = this.description
    })
    r = http.request({
        url = this.app_url,
        method = 'POST',
        header = { ['content-length'] = #cmd, ['content-type'] = 'application/text' },
        source = ltn12.source.string(cmd)
    })
    this.app_url = this.app_url .. '/' .. r.text._id -- TODO
    return setmetatable(this, self)
end

function VisualizeConvWeights:new(static_path, name, description, position,
                                  cell_type, app_url)
    -- Visualize convolutional weights in a grid
    --
    -- Parameters:
    -- -----------
    -- static_path: path to Agnez static files with trailing `/`
    --
    self.static_path = static_path
    Sender.new(self, name, description, position, cell_type, app_url)

function VisualizeConvWeights:on_epoch_end(weight)
    filename = self.static_path .. self.name .. '.png'
    image.save(filename, weight)
    r = http.request(url=self.app_url, method=
