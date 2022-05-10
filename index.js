let http = require('http')
let {spawn} = require('child_process')

let server = http.createServer(function(req,res){
	if(req.method === 'POST' && req.url === '/hooks'){
		let buffers = []
		req.on('data',function(buffer){
			buffers.push(buffer)
		})
		req.on('end',function(buffer){
			let body = Buffer.concat(buffers)
			let event = req.headers['x-github-event'];
			console.log(event)
			res.setHeader('Content-Type','application/json');
			console.log(22223333)
			res.end(JSON.stringify({code:200}))
			console.log(2224444)
			if(event === 'push'){
				let payload = JSON.parse(body)
				console.log(222222)
				console.log(11111,payload.repository.name)
				const repository_name = payload.repository.name
				if(repository_name === "webHooks"){
					spawn('sh',[`./hooks.sh`]);
				}else if(repository_name === "web"){
					spawn('sh',[`./web.sh`]);
				}else{
					spawn('sh',[`./manage.sh`]);
				}
			}
			
		})
	}
})

server.listen(9003,function(){
	var host = server.address().address;
	var port = server.address().port;
	console.log('地址:',host)
	console.log('端口:',port)
	console.log("服务开启成功")
})

