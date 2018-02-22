              //define the city  data array
                var cityArr = [];
                cityArr['apac'] =
                [
                 {txt:'Bangalore', val:'ban'},
                 {txt:'Beijing', val:'bei'},
                 {txt:'Singapore', val:'sin'},
                 {txt:'Sydney', val:'syd'}
                 ];
                cityArr['us'] =
                [
                 {txt:'Boston', val:'bos'},
                 {txt:'Irvine', val:'irv'},
                 {txt:'Redwood', val:'red'}
                 ];
                 cityArr['emea'] =
                [
                 {txt:'Berkshire', val:'ber'},
                 {txt:'Barcelona', val:'bar'},
                 {txt:'Bonn', val:'bon'},
                 {txt:'Feldkirchen', val:'fel'},
                 {txt:'Nürnberg', val:'nur'},
                 {txt:'Suresnes', val:'sur'},
                 {txt:'Switzerland', val:'swi'}
                 ];
                function setCity(city)
                {
                    setSelectOption('city', cityArr[city], 'Please select...', '<%=cityname%>');
                }
                function checkPasswd(){
                    var pwd1=document.getElementById("password1").value;
                    var pwd2=document.getElementById("password2").value;
                    if(pwd1 !== pwd2){
                        document.getElementById("passwdMsg").innerHTML="Password Not Matched!";
                        return;
                    }
                    document.getElementById("passwdMsg").innerHTML="Password Matched!";
               
                }