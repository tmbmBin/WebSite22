function replacer(key, value) { if (typeof value === 'number' && !isFinite(value)) { return String(value); } return value; }
function getFileSizeStr(len) {
	var byteSize = Math.round(len / 1024 * 100) / 100;
	var suffix = 'KB';
	if (byteSize > 1000) {
		byteSize = Math.round(byteSize * .001 * 100) / 100;
		suffix = 'MB';
	}
	return byteSize + suffix;
}