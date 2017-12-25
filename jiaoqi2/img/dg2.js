/**
 * Created by Charles Gan on 2016/12/19.
 */
var od = {cid : '', buyerName : '', buyerMobile : '', buyerSex : '', country : '',
    province : '', city : '', buyerProvince : '', buyerCity : '', buyerArea : '', buyerAddress : '', productId : '',
    productPlanId : '', customerId : '', orderPrice : '', payCategory : '',
    sendTime : '', buyerRemarks : '', bm : '', fromUrl : '', channel : '', color : '', size : '',
    dealMoney : '', createBy : ''};


function submitorder() {
    setValue();
    /**var temp = document.createElement("form");
    temp.action = "http://192.168.1.26:8082/order/gen/genOrderByForm";
    temp.method = "post";
    temp.style.display = "none";
    //temp.setRequestHeader("Content-Type", "application/json");
    for (var x in od) {
        var opt = document.createElement("textarea");
        opt.name = x;
        opt.value = od[x];
        // alert(opt.name)
        temp.appendChild(opt);
    }*/

	var imgSrc = "http://fgenod.ecsage.net/order/gen/genOrderByForm?";
	//alert("###" + imgSrc + "###");
	for (var x in od) {
        var opt = document.createElement("textarea");
        opt.name = x;
        opt.value = od[x];
        imgSrc += (x + "=" + od[x] + "&");
    }
   //alert("###" + imgSrc + "@@@");
	imgSrc = imgSrc.substring(0, imgSrc.length - 1);
	
	//alert("@@@" + imgSrc + "@@@");
	var imgObj = document.getElementById("img2");
	imgObj.src = imgSrc;
}

function setValue()
{
    od.cid = cid;
    od.buyerName = getValue("username2");
    od.buyerMobile = getValue("mobile2");
    od.buyerProvince = getValue("s_province");
    od.buyerCity = getValue("s_city");
    od.buyerArea = getValue("s_county");
    od.buyerAddress = getValue("addr2");
    od.productId = getValue("productId2");
    od.customerId = getValue("customerId2");
    od.payCategory = getValue("payCategory2");
    od.buyerRemarks = getValue("remark2");
    od.bm = bm;
    od.fromUrl = getValue("fromUrl");
    od.payCategory = getValue("payCategory2");
    od.sendTime = getValue("sendTime2");
    //od.buyerTel = '';
    //od.buyerEmail = '';
    //od.country = '';
    //od.province = '';
    //od.city = '';
    //od.orderStatus = '';
    //od.ip = '';
    //od.customerService = '';
    //od.lineTime = '';
    //od.channel = '';
    //od.dealMoney = '';
//    od.createBy = getValue("createBy2");
    //od.createTime = '';
    //od.remarks = '';

    var obj = document.getElementsByName("productPlanId2");
    if (obj != null)
    {
        for(var i=0; i<obj.length; i++){
            if(obj[i].checked){
                od.orderPrice = (obj[i].attributes["price"].nodeValue);
                od.productPlanId = (obj[i].attributes["value"].nodeValue);
                break;
            }
        }
    }
    var col = document.getElementsByName("color2");
    if (col != null)
    {
        for(var i=0; i<col.length; i++){
            if(col[i].checked){
                od.color = (col[i].attributes["value"].nodeValue);
                break;
            }
        }
    }
    var siz = document.getElementsByName("size2");
    if (siz != null)
    {
        for(var i=0; i<siz.length; i++){
            if(siz[i].checked){
                od.size = (siz[i].attributes["value"].nodeValue);
                break;
            }
        }
    }
    var chkObjs = document.getElementsByName("sex2");
    for(var i=0;i<chkObjs.length;i++){
        if(chkObjs[i].checked){
            od.buyerSex = (chkObjs[i].value);
            break;
        }
    }
}

function getValue(key)
{
    var obj = null;
	try
	{
		obj = document.getElementById(key);
	}
	catch (e)
	{
	}
    if (obj == null || typeof(obj) == 'undefined' || typeof(obj.value) == 'undefined')
    {
        return '';
    }
    return obj.value;
}
