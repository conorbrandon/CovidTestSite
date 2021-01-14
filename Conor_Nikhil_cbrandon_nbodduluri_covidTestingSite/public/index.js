document.addEventListener('DOMContentLoaded',function(){
    fetch('http://localhost:5000/employeetestdata')
    .then(res => res.json())
    .then(data => loadHTMLTable(data['data']))
    
  });
  

  document.querySelector('table tbody').addEventListener('click', function(event){
    if(event.target.className === "delete-row-btn"){
        deleteRowById(event.target.dataset.id)
        
    }
  })

  function deleteRowById(id){
    fetch('http://localhost:5000/labtech/testcollection/delete/' + id, {
      method: 'DELETE'
  })
  insertRowIntoTable();
  }

  const addBtn = document.getElementById('add-id-btn');

  addBtn.onclick = () =>{
    const empIdInput = document.getElementById('employeeid-input');
    const empID = empIdInput.value;
    const testBarcodeInput = document.getElementById('testBarcodeid-input');
    const testBarcodeId = testBarcodeInput.value;
  
  
  fetch('http://localhost:5000/labtech/testCollection/add', {
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
      method: 'POST',
      body: JSON.stringify({testBarcode: testBarcodeId, employeeID: empID})
  })
  //.then(res => res.json())
  //.then(data => insertRowIntoTable(data['data']))
  insertRowIntoTable();
  
}

function insertRowIntoTable(){
  
  location.reload();
  
}


  function loadHTMLTable(data){
    const table = document.querySelector('table tbody')
    //console.log(data)
    if(data.length === 0){
      table.innerHTML = "<tr><td class='no-data' colspan='3'> No Data </td></tr>";
      return;
    }
    let tableHTML = "";
    data.forEach(function ({employeeID,testBarcode}){
        tableHTML+="<tr>";
        tableHTML+=`<td>${employeeID}</td>`;
        tableHTML+=`<td>${testBarcode}</td>`;
        tableHTML+=`<td><button class="delete-row-btn" data-id=${testBarcode}>Delete</button></td>`;
        tableHTML+="</tr>"
    })
    table.innerHTML = tableHTML;
    
  }