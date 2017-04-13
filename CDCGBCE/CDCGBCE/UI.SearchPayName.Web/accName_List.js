//機關或私人團體(受款人)
function requestInfo_accName(thisID, replaceID){
 
	var url = "../UI.SearchPayName.Web/basPay_Edit.aspx?UnitNo=&mod=select";
	var sw = screen.width - 100
	var infoStream = showModalDialog(url,window,"dialogWidth: "+ sw + "px ; dialogHeight: 325px; dialogTop: px; dialogLeft: 50px; edge: Raised; center: Yes; help: No; resizable: Yes; status: No;");
	var prvID = thisID.replace(replaceID,'');
	if(infoStream != "Cancel"){
		//資料傳回時：0:受款人代碼;1:統編/身分證;2:受款人名稱;3:聯絡電話１;4:郵遞區號;5:地址;6:銀行別代號;7:分行代號;8:帳號;9:金融機構名稱;10:戶名
		//alert(infoStream);
		var infoArray = infoStream.split("||");

		//受款人代碼
		//document.all(prvID + 'text_F_NameNo').value = infoArray[0];
		//document.all(prvID + 'text_F_NameNo').style.fontWeight = 'bold';
		//受款人
		document.all(prvID + 'TBdgAcnPayName').value = infoArray[2];
		document.all(prvID + 'TBdgAcnPayName').style.fontWeight = 'bold';
		//郵遞區號
		//document.all(prvID + 'text_F_ZipCode').value = infoArray[4];
		//document.all(prvID + 'text_F_ZipCode').style.fontWeight = 'bold';
		//地址
		//document.all(prvID + 'text_F_Address').value = infoArray[5];
		//document.all(prvID + 'text_F_Address').style.fontWeight = 'bold';
		//電話
		//document.all(prvID + 'text_F_Telephone').value = infoArray[3];
		//document.all(prvID + 'text_F_Telephone').style.fontWeight = 'bold';
		//金融機構代號
		document.all(prvID + 'TBdgAcnBankNo').value = infoArray[7].replace(' ', '');
		document.all(prvID + 'TBdgAcnBankNo').style.fontWeight = 'bold';
		//金融機構名稱
		document.all(prvID + 'TBdgAcnBank').value = infoArray[9];
		document.all(prvID + 'TBdgAcnBank').style.fontWeight = 'bold';
		//戶名
		document.all(prvID + 'TBdgAcnDepositor').value = infoArray[10];
		document.all(prvID + 'TBdgAcnDepositor').style.fontWeight = 'bold';
		//帳號
		document.all(prvID + 'TBdgAcnDepositorNo').value = infoArray[8].replace(' ', '');
		document.all(prvID + 'TBdgAcnDepositorNo').style.fontWeight = 'bold';
		//統一編號/身分證號
		//document.all(prvID + 'text_F_BusinessNo').value = infoArray[1];
		//document.all(prvID + 'text_F_BusinessNo').style.fontWeight = 'bold';
		
		
		
	}
}

function requestInfo_codBankSubName(thisID, replaceID){
	var url = "codBank_Edit.aspx?bnkBankNo=";
	var sw = 640;	//screen.width - 100
	var infoStream = showModalDialog(url,window,"dialogWidth: "+ sw + "px ; dialogHeight: 480px; dialogTop: px; dialogLeft: 50px; edge: Raised; center: Yes; help: No; resizable: Yes; status: No;");
	var prvID = thisID.replace(replaceID,'');
	if(infoStream != "Cancel"){
		//資料傳回時：0:總行代碼;1:總行名稱;2:分行代碼;3:分行名稱
		//alert(infoStream);
		var infoArray = infoStream.split("||");

		//金融機構代號
		document.all(prvID + 'TBdgAcnBankNo').value = infoArray[2].replace(' ', '');
		document.all(prvID + 'TBdgAcnBankNo').style.fontWeight = 'bold';
		//金融機構名稱
		document.all(prvID + 'TBdgAcnBank').value = infoArray[1].replace(' ', '');
		document.all(prvID + 'TBdgAcnBank').style.fontWeight = 'bold';
	}
}