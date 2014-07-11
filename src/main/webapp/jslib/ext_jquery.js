$.fn.serializeObject = function() {
	var o = {};
	var a = this.serializeArray();
	$.each(a, function() {
		if (this.value) {
			if (o[this.name]) {
				if (!o[this.name].push) {
					o[this.name] = [ o[this.name] ];
				}
				o[this.name].push(this.value || '');
			} else {
				o[this.name] = this.value || '';
			}
		}
	});
	return o;
}

jQuery.ax=function(url, data, async, type, dataType, successfn, errorfn) {
    async = (async==null || async=="" || typeof(async)=="undefined")? "true" : async;
    type = (type==null || type=="" || typeof(type)=="undefined")? "post" : type;
    dataType = (dataType==null || dataType=="" || typeof(dataType)=="undefined")? "json" : dataType;
    data = (data==null || data=="" || typeof(data)=="undefined")? {"date": new Date().getTime()} : data;
    $.ajax({
        type: type,
        async: async,
        data: data,
        url: url,
        dataType: dataType,
        success: function(d){
            successfn(d);
        },
        error: function(e){
            errorfn(e);
        }
    });
};