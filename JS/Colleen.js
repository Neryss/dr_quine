/*
	outside
*/

function b() {return}

(function main(){
	/*
		inside
	*/
	b();
	process.stdout.write("/*\n	outside\n*/\n\nfunction b() {return}\n\n("+main.toString()+")()");
	return(0);
})()