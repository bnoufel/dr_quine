const printf = require('printf');
/* First comment */
function print() {
	const str = "const printf = require('printf');%1$c/* First comment */%1$cfunction print() {%1$c%2$cconst str = %3$c%4$s%3$c;%1$c%2$cconst res = printf(%3$c%4$s%3$c, 10, 9, 34, str);%1$c%2$cconsole.log(res);%1$c}%1$c%1$cfunction main() {%1$c%2$c/* Comment in main */%1$c%2$cprint();%1$c}%1$c%1$cmain();";
	const res = printf("const printf = require('printf');%1$c/* First comment */%1$cfunction print() {%1$c%2$cconst str = %3$c%4$s%3$c;%1$c%2$cconst res = printf(%3$c%4$s%3$c, 10, 9, 34, str);%1$c%2$cconsole.log(res);%1$c}%1$c%1$cfunction main() {%1$c%2$c/* Comment in main */%1$c%2$cprint();%1$c}%1$c%1$cmain();", 10, 9, 34, str);
	console.log(res);
}

function main() {
	/* Comment in main */
	print();
}

main();
