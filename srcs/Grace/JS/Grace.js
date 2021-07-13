const printf = require('printf');
const fs = require('fs');
/*
	First comment
*/

function func() {
	const str = "const printf = require('printf');%1$cconst fs = require('fs');%1$c/*%1$c%2$cFirst comment%1$c*/%1$c%1$cfunction func() {%1$c%2$cconst str = %3$c%4$s%3$c;%1$c%2$cconst res = printf(%3$c%4$s%3$c, 10, 9, 34, str);%1$c%2$cfs.writeFileSync('Grace_kid.js', res, {mode: 0o755});%1$c}%1$c%1$cfunc();";
	const res = printf("const printf = require('printf');%1$cconst fs = require('fs');%1$c/*%1$c%2$cFirst comment%1$c*/%1$c%1$cfunction func() {%1$c%2$cconst str = %3$c%4$s%3$c;%1$c%2$cconst res = printf(%3$c%4$s%3$c, 10, 9, 34, str);%1$c%2$cfs.writeFileSync('Grace_kid.js', res, {mode: 0o755});%1$c}%1$c%1$cfunc();", 10, 9, 34, str);
	fs.writeFileSync('Grace_kid.js', res, {mode: 0o755});
}

func();