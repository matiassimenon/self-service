//common functions for form 'select' options
function removeOptions(selectObj)
{
    if (typeof selectObj !== 'object')
    {
        selectObj = document.getElementById(selectObj);
    }
    var len = selectObj.options.length;
    for (var i = 0; i < len; i++) {
        //clear current option
        selectObj.options[0] = null;
    }
}
/*
 * @param {String || Object]} selectObj 
 * @param {Array} optionList e.g. [{txt:'beijing', val:'010'}, {txt:'shangai', val:'020'}], required
 * @param {String} firstOption e.g. "..."
 * @param {String} selected, optional
 */
function setSelectOption(selectObj, optionList, firstOption, selected) {
    if (typeof selectObj !== 'object')
    {
        selectObj = document.getElementById(selectObj);
    }
    // clear options
    removeOptions(selectObj);
    // count
    var start = 0;

    if (firstOption) {
        selectObj.options[0] = new Option(firstOption, '');
        start++;
    }
    var len = optionList.length;
    for (var i = 0; i < len; i++) {
        // set option
        selectObj.options[start] = new Option(optionList[i].txt, optionList[i].val);
        if (selected == optionList[i].val) {
            selectObj.options[start].selected = true;
        }
        start++;
    }
}

function setSelected(selectObj, selectedValue) {
    if (typeof selectObj !== 'object')
    {
        selectObj = document.getElementById(selectObj);
    }
    var len = selectObj.options.length;
    for (var i = 0; i < len; i++) {
        // set option
        var value1 = selectObj.options[i];
        if (selectedValue === value1.value) {
            selectObj.options[i].selected = true;
            return;
        }
    }
}


//function for table data row
function clickRow(row) {
    if (row.selected === 'true') {
        row.bgColor = 'white';
        row.selected = 'false';
    } else {
        row.bgColor = '#22CCCC';
        row.selected = 'true';
    }
    //disable the Request button if multiple rows selected
    var table=document.getElementById("templateTable");
    var requestBtn=document.getElementById("requestBtn");
    if(table !== null){
        var rows=table.rows;
        var num=0;
        for( var i=0; i< rows.length; i++){
            if(rows[i].selected === 'true'){
                num++;
            }
        }
        if(num >1){
            requestBtn.disabled="disabled";
        }else{
            requestBtn.removeAttribute("disabled");
        }
    }
}

//define the city  data array
var cityArr = [];
cityArr['APAC'] =
        [
            {txt: 'Bangalore', val: 'blr'},
            {txt: 'Beijing', val: 'bjs'},
            {txt: 'Singapore', val: 'sin'},
            {txt: 'Sydney', val: 'swz'},
            {txt: 'Tokyo', val: 'tyo'}
        ];
cityArr['US'] =
        [
            {txt: 'Atlanta', val: 'atl'},
            {txt: 'Boston', val: 'bos'},
            {txt: 'Irvine', val: 'irv'},
            {txt: 'Redwood City', val: 'rwc'},
            {txt: 'Montreal', val: 'yul'}
        ];
cityArr['EMEA'] =
        [
            {txt: 'Maidenhead', val: 'lhr'},
            {txt: 'Barcelona', val: 'bcn'},
            {txt: 'Bonn', val: 'cgn'},
            {txt: 'Feldkirchen', val: 'grz'},
            {txt: 'Nantes ', val: 'nte'},
            {txt: 'Nürnberg', val: 'nue'},
            {txt: 'Suresnes', val: 'sur'},
            {txt: 'Alpnach', val: 'zrh'}
        ];
function setCity(region)
{
    setSelectOption('city', cityArr[region], 'Please select...');
}
function checkPasswd() {
    var pwd1 = document.getElementById("password1").value;
    var pwd2 = document.getElementById("password2").value;
    var message, color, disable;
    
    if(pwd1.length === 0 || pwd2.length === 0) {
        message = "Password Empty!";
        color = "red";
        disable = true;
    } else if(pwd1 !== pwd2) {
        message = "Not Matched!";
        color = "red";
        disable = true;
    } else {
        message = "Matched!";
        color = "green";
        disable = false;
    }

    document.getElementById("passwdMsg").style.color=color;
    document.getElementById("passwdMsg").innerHTML = message;
    document.getElementById("submitBtn").disabled = disable;
}
