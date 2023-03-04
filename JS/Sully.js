const { exec } = require('child_process');
const fs = require('fs');
let i = 5;
(function main(){
	if (i >= 0)
	{
		let tmp = `Sully_${i}.js`;
		if (fs.existsSync(`./Sully_${i}.js`))
		{
			i--
			tmp = `Sully_${i}.js`;
		}
		fs.writeFile(tmp, `const { exec } = require('child_process');\nconst fs = require('fs');\nlet i = ${i};\n(` + main.toString() + ")()", err => {
			if (err)
				console.error(err);
		})
		if (i > 0)
			exec(`node Sully_${i}.js`);
	}
	return(0);
})()