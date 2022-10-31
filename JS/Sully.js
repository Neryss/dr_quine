const { exec } = require('child_process');
const fs = require('fs');
let i = 5;
(function main(){
	if (i > 0)
	{
		--i;
		fs.writeFile(`Sully_${i}.js`, `const { exec } = require('child_process');\nconst fs = require('fs');\nlet i = ${i};\n(` + main.toString() + ")()", err => {
			if (err)
				console.error(err);
		})
		exec(`node Sully_${i}.js`);
	}
	return(0);
})()