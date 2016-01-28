http = require 'socket.http'
json = require 'cjson'
ltn12 = require 'ltn12'

app_url = 'http://localhost:3000/api/v1/values'


cmd = json.encode({[[name" : '', "type": 'html',
    "value" = "<p>Test",
    "pos" = 0,
    "description" = '',]]
    })

function http_request()
    local r = {}
    local sinktab = {}
    resp, code, headers, status = http.request({
        url = app_url,
        method = "POST",
        header = { ["Content-Length"] = 68, ["Content-Type"] = "application/text" },
        source = ltn12.source.string(cmd),
        sink = ltn12.sink.table(sinktab)
    })
    r['code'], r['headers'], r['status'], r['response'] = code, headers, status, resp
    print("here")
    print(r)
    return r
end

http_request()

