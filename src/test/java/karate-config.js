function fn() {

	var env=karate.env;
	karate.log('Karate.env System Property Value:', env);
	var hostIP=System.property(
	if(!env){
		env='test';
	}	
	
	karate.log('Karate.env System Property Value:', env);
    var config = {
        baseUrl : 'http://localhost:8081',
        port:8081,
		//propertyFile:applicationTest.properties
    };

	if(env='test'){	
		baseUrl:http://localhost:8081';
		port=8081;
		//propertyFile:applicationTest.properties;
		karate.log('Karate.env System Property Value:', env);
	}else if(env='dev'){
		baseUrl:http://localhost:8082';
		port=8082;
		//propertyFile:applicationDev.properties;
		karate.log('Karate.env System Property Value:', env);
		}

    return config;
}