//common functions for form 'select' options


function removeOptions(selectObj)
 {
    if (typeof selectObj !== 'object')
    {
        selectObj = document.getElementById(selectObj);
    }
    var len = selectObj.options.length;
    for (var i=0; i < len; i++) {
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
        start ++;
    }
    var len = optionList.length;
    for (var i=0; i < len; i++) {
        // set option
        selectObj.options[start] = new Option(optionList[i].txt, optionList[i].val);
        if(selected == optionList[i].val)  {
            selectObj.options[start].selected = true;
         }
         start ++;
    }
 }
 
function setSelected(selectObj, selectedValue){
    if (typeof selectObj !== 'object')
    {
         selectObj = document.getElementById(selectObj);
    }
    var len = selectObj.options.length;
    for (var i=0; i < len; i++) {
        // set option
        var value1=selectObj.options[i];
        if(selectedValue == value1.value)  {
            selectObj.options[i].selected = true;
            return;
         }       
    }
}


//function for table data row
function clickRow(row){                
    if(row.selected === 'true'){
        row.bgColor='#fff';
        row.selected='false';
    }else{
        row.bgColor='#22CCCC';
        row.selected='true';
    }               
}