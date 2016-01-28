requests = require 'requests'
json = require 'cjson'

payload = json.encode({
    name = '',
    value = "<p>Test",
    pos = 0,
    description = '',
})

payload = {name = '', type= 'html', value = "<p>Test", pos = 0, description = ''}
-- print(payload)

app_url = 'http://localhost:3000/api/v1/values'
r = requests.post({url = app_url, data='random data'})

print(r.json().data)

new_app_url = app_url .. '/' .. r.json()['_id']
--print(new_app_url)

--r = os.execute("curl " .. app_url .. " -H 'Content-Type: application/json' --data-binary ' " .. payload .. " ' ")
--r = json.decode(r)
--print(r)
