function setEmbed() 
{ 
  var obj = new String; 
  var parameter = new String; 
  var embed = new String; 
  var html = new String; 
  var allParameter = new String; 
  var clsid = new String; 
  var codebase = new String; 
  var pluginspace = new String; 
  var embedType = new String; 
  var src = new String; 
  var width = new String; 
  var height = new String; 

    
  this.init = function( getType , s ,w , h ) { 
      
      if ( getType == "flash") 
      { 

        clsid = "D27CDB6E-AE6D-11cf-96B8-444553540000";        
        codebase = "https://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0"; 
        pluginspage = "https://www.macromedia.com/go/getflashplayer"; 
        embedType = "application/x-shockwave-flash"; 
      } 
            
      parameter += "<param name='movie' value='"+ s + "'>\n";  
      parameter += "<param name='quality' value='high'>\n";    
      
      src = s; 
      width = w; 
      height = h; 
  } 
  
  this.parameter = function( parm , value ) {      
      parameter += "<param name='"+parm +"' value='"+ value + "'>\n";        
      allParameter += " "+parm + "='"+ value+"'"; 
  }  
  
  this.show = function() { 
      if ( clsid ) 
      { 
        obj = "<object classid=\"clsid:"+ clsid +"\" codebase=\""+ codebase +"\" width='"+ width +"' height='"+ height +"'>\n"; 
      } 
      
      embed = "<embed src='" + src + "' pluginspage='"+ pluginspage + "' type='"+ embedType + "' width='"+ width + "' height='"+ height +"'"+ allParameter +" ></embed>\n"; 
      
      if ( obj ) 
      { 
        embed += "</object>\n"; 
      } 
      
      html = obj + parameter + embed; 
      
      document.write( html );  
  } 
  
} 
