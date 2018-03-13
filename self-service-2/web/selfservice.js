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
}

//define the city  data array
var cityArr = [];
cityArr['apac'] =
        [
            {txt: 'Bangalore', val: 'Bangalore'},
            {txt: 'Beijing', val: 'Beijing'},
            {txt: 'Singapore', val: 'Singapore'},
            {txt: 'Sydney', val: 'Sydney'}
        ];
cityArr['us'] =
        [
            {txt: 'Atlanta', val: 'Atlanta'},
            {txt: 'Boston', val: 'Boston'},
            {txt: 'Irvine', val: 'Irvine'},
            {txt: 'Redwood', val: 'Redwood'}
        ];
cityArr['emea'] =
        [
            {txt: 'Berkshire', val: 'Berkshire'},
            {txt: 'Barcelona', val: 'Barcelona'},
            {txt: 'Bonn', val: 'Bonn'},
            {txt: 'Feldkirchen', val: 'Feldkirchen'},
            {txt: 'Nürnberg', val: 'Nürnberg'},
            {txt: 'Suresnes', val: 'Suresnes'},
            {txt: 'Switzerland', val: 'Switzerland'}
        ];
function setCity(city)
{
    setSelectOption('city', cityArr[city], 'Please select...', '<%=cityname%>');
}
function checkPasswd() {
    var pwd1 = document.getElementById("password1").value;
    var pwd2 = document.getElementById("password2").value;
    if (pwd1 !== pwd2) {
        document.getElementById("passwdMsg").style.color="red";
        document.getElementById("passwdMsg").innerHTML = "Not Matched!";
        document.getElementById("password1").required="required";
        document.getElementById("password2").required="required";
        return;
    }
    document.getElementById("passwdMsg").style.color="green";
    document.getElementById("passwdMsg").innerHTML = "Matched!";
    document.getElementById("password1").removeAttribute("required");
    document.getElementById("password2").removeAttribute("required");

}