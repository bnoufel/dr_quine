const printf = require('printf');const fs = require('fs');const path = require('path');const exec = require('child_process').exec;
function Sully() {let i=5,name=path.basename(__filename),end=name.indexOf('_');if (i <= 0) return 1;if (end === -1) i++;name = `${name.substr(0, end > -1 ? end : name.length - 3)}_`;
	const str = "const printf = require('printf');const fs = require('fs');const path = require('path');const exec = require('child_process').exec;%1$cfunction Sully() {let i=%3$d,name=path.basename(__filename),end=name.indexOf('_');if (i <= 0) return 1;if (end === -1) i++;name = `${name.substr(0, end > -1 ? end : name.length - 3)}_`;%1$c%2$cconst str = %5$c%4$s%5$c;%1$c%2$cconst res = printf(str, 10, 9, (i - 1), str, 34);fs.writeFileSync(`${name}${i - 1}.js`, res, {mode: 0o755});exec(`node ${name}${i - 1}.js`);}Sully();";
	const res = printf(str, 10, 9, (i - 1), str, 34);fs.writeFileSync(`${name}${i - 1}.js`, res, {mode: 0o755});exec(`node ${name}${i - 1}.js`);}Sully();