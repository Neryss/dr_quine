/*
	outside
*/

function b() {return}

(function main(){
	/*
		inside
	*/
	process.stdout.write("/*\n	outside\n*/\n\nfunction b() {return}\n\n("+main.toString()+")()");
})()