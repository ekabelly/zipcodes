

const initSearch = () =>{
	const country = getWIthId('country').value;
	const zip = getWIthId('zipcode').value;
	fetchPlaces(country, zip);
}

const fetchPlaces = (country, zip) =>{
	const xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
      if(this.status === 200 && this.readyState === 4) {
        console.log(JSON.parse(this.responseText));
        initPlacesList(JSON.parse(this.responseText));
      }
    }
    xhr.open('GET','dal/server.php?country='+country+'&zip='+zip);
    xhr.send();
}

const initPlacesList = res =>{
	if (res.status === 'failed') {
		getWIthId('error').innerHTML = res.messege;
		getWIthId('table').innerHTML = '';
	}else{
		getWIthId('error').innerHTML = '';
		getWIthId('table').innerHTML = arrToTable(res);
	}
}

const arrToTable = arr =>
'<tr>'+Object.keys(arr[0]).filter(key=>key!=='id').map(key=>'<th>'+key+'</th>').join('')
+arr.map(val=>'<tr><td>'+val.place+'</td><td>'+val.longitude+'</td><td>'+val.latitude+'</td>').join('');

const getWIthId = id =>document.getElementById(id);