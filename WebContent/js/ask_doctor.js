
function SelectStatusTop(){
	document.getElementById('SelectStatusTop').style.display = 'block';
}

function SelectKeShiTop(){
	document.getElementById('SelectKeShiTop').style.display='block';
}

function SelectKeshiCancelTop(){
	document.getElementById('SelectKeShiTop').style.display='none';
	document.getElementById("SelectKeShiTop").value = "";
}

function SelectKeshiCancelTop(){
	document.getElementById('SelectKeShiTop').style.display='none';
	document.getElementById("SelectKeShiTop").value = "";
}

function StatusChanged(){
	document.getElementById('SelectStatusAttentionTop').style.display='none';
	document.getElementById('SelectStatusTop').style.display='none';
	document.getElementById('SelectedStatusTop').style.display='block';
	var SelectedStatusTop = document.getElementById("SelectedStatusTop");
	var ASKStatusTop =$('input:radio[name="ASKStatusTop"]:checked').val();
	var message = null;
	if(ASKStatusTop==-1){
		message = "全部问题";
	}else if(ASKStatusTop==1){
		message = "已回答";
	}else if(ASKStatusTop==0){
		message = "未回答";
	}
	SelectedStatusTop.innerHTML = "<a>" + message + "</a>";
	
	var ASKSelectForm = document.getElementById("ASKSelectForm");
	ASKSelectForm.submit(); 
}

function KeshiChanged(){
	
	document.getElementById('SelectKeShiAttentionTop').style.display='none';
	document.getElementById('SelectKeShiTop').style.display='none';
	document.getElementById('SelectedKeShiTop').style.display='block';
	var SelectedKeShiTop = document.getElementById("SelectedKeShiTop");
	var ASKKeShiTop =$('input:radio[name="ASKKeShiTop"]:checked').val();
	var message = null;
	if(ASKKeShiTop==0){
		message = "全部科室";
	}else if(ASKKeShiTop==1){
		message = "中医内科";
	}else if(ASKKeShiTop==2){
		message = "中医外科";
	}
	else if(ASKKeShiTop==3){
		message = "妇&nbsp;&nbsp;科";
	}
	else if(ASKKeShiTop==4){
		message = "儿&nbsp;&nbsp;科";
	}
	else if(ASKKeShiTop==5){
		message = "针推科";
	}
	else if(ASKKeShiTop==6){
		message = "男&nbsp;&nbsp;科";
	}
	SelectedKeShiTop.innerHTML = "<a>" + message + "</a>";
	
	var ASKSelectForm = document.getElementById("ASKSelectForm");
	ASKSelectForm.submit(); 
	
}

