const printf = require('printf');
const fs = require('fs');
const path = require('path');
const exec = require('child_process').exec;
(() => {
	let i = 5;
	let name = path.basename(__filename);
	const end = name.indexOf('_');
	if (i <= 0)
		return 1;
	if (end === -1)
		i++;
	name = `${name.substr(0, end > -1 ? end : name.length - 3)}_`;
	const str = "const printf = require('printf');%1$cconst fs = require('fs');%1$cconst path = require('path');%1$cconst exec = require('child_process').exec;%1$c(() => {%1$c%2$clet i = %3$d;%1$c%2$clet name = path.basename(__filename);%1$c%2$cconst end = name.indexOf('_');%1$c%2$cif (i <= 0)%1$c%2$c%2$creturn 1;%1$c%2$cif (end === -1)%1$c%2$c%2$ci++;%1$c%2$cname = `${name.substr(0, end > -1 ? end : name.length - 3)}_`;%1$c%2$cconst str = %5$c%4$s%5$c;%1$c%2$cconst res = printf(str, 10, 9, (i - 1), str, 34);%1$c%2$cfs.writeFileSync(`${name}${i - 1}.js`, res, {mode: 0o755});%1$c%2$cexec(`node ${name}${i - 1}.js`);%1$c})()%1$c";
	const res = printf(str, 10, 9, (i - 1), str, 34);
	fs.writeFileSync(`${name}${i - 1}.js`, res, {mode: 0o755});
	exec(`node ${name}${i - 1}.js`);
})()
