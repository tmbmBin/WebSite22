//�����Ψp�H����(���ڤH)
function requestInfo_accName(thisID, replaceID){
 
	var url = "../UI.SearchPayName.Web/basPay_Edit.aspx?UnitNo=&mod=select";
	var sw = screen.width - 100
	var infoStream = showModalDialog(url,window,"dialogWidth: "+ sw + "px ; dialogHeight: 325px; dialogTop: px; dialogLeft: 50px; edge: Raised; center: Yes; help: No; resizable: Yes; status: No;");
	var prvID = thisID.replace(replaceID,'');
	if(infoStream != "Cancel"){
		//��ƶǦ^�ɡG0:���ڤH�N�X;1:�νs/������;2:���ڤH�W��;3:�p���q�ܢ�;4:�l���ϸ�;5:�a�};6:�Ȧ�O�N��;7:����N��;8:�b��;9:���ľ��c�W��;10:��W
		//alert(infoStream);
		var infoArray = infoStream.split("||");

		//���ڤH�N�X
		//document.all(prvID + 'text_F_NameNo').value = infoArray[0];
		//document.all(prvID + 'text_F_NameNo').style.fontWeight = 'bold';
		//���ڤH
		document.all(prvID + 'TBdgAcnPayName').value = infoArray[2];
		document.all(prvID + 'TBdgAcnPayName').style.fontWeight = 'bold';
		//�l���ϸ�
		//document.all(prvID + 'text_F_ZipCode').value = infoArray[4];
		//document.all(prvID + 'text_F_ZipCode').style.fontWeight = 'bold';
		//�a�}
		//document.all(prvID + 'text_F_Address').value = infoArray[5];
		//document.all(prvID + 'text_F_Address').style.fontWeight = 'bold';
		//�q��
		//document.all(prvID + 'text_F_Telephone').value = infoArray[3];
		//document.all(prvID + 'text_F_Telephone').style.fontWeight = 'bold';
		//���ľ��c�N��
		document.all(prvID + 'TBdgAcnBankNo').value = infoArray[7].replace(' ', '');
		document.all(prvID + 'TBdgAcnBankNo').style.fontWeight = 'bold';
		//���ľ��c�W��
		document.all(prvID + 'TBdgAcnBank').value = infoArray[9];
		document.all(prvID + 'TBdgAcnBank').style.fontWeight = 'bold';
		//��W
		document.all(prvID + 'TBdgAcnDepositor').value = infoArray[10];
		document.all(prvID + 'TBdgAcnDepositor').style.fontWeight = 'bold';
		//�b��
		document.all(prvID + 'TBdgAcnDepositorNo').value = infoArray[8].replace(' ', '');
		document.all(prvID + 'TBdgAcnDepositorNo').style.fontWeight = 'bold';
		//�Τ@�s��/�����Ҹ�
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
		//��ƶǦ^�ɡG0:�`��N�X;1:�`��W��;2:����N�X;3:����W��
		//alert(infoStream);
		var infoArray = infoStream.split("||");

		//���ľ��c�N��
		document.all(prvID + 'TBdgAcnBankNo').value = infoArray[2].replace(' ', '');
		document.all(prvID + 'TBdgAcnBankNo').style.fontWeight = 'bold';
		//���ľ��c�W��
		document.all(prvID + 'TBdgAcnBank').value = infoArray[1].replace(' ', '');
		document.all(prvID + 'TBdgAcnBank').style.fontWeight = 'bold';
	}
}