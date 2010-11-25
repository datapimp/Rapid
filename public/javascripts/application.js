var RapidApplication = function(){
  this.default_handler = function(code){
    eval(code); 
  };

  this.handlers = {};
  
  this.socket = new Juggernaut;

  this.register = function(handler,fn){
    this.handlers[ handler ] = fn;
  };

  this.subscribe = function(channel,handler){
    handler = handler || this.default_handler;
    this.socket.subscribe(channel,handler);
  };
};

var Application = new RapidApplication;

Application.register("users_show", function(data){
  console.log('Got Data On Users Show', data);
});
