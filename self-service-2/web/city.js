              //define the city  data array
                var cityArr = [];
                cityArr['apac'] =
                [
                 {txt:'Bangalore', val:'Bangalore'},
                 {txt:'Beijing', val:'Beijing'},
                 {txt:'Singapore', val:'Singapore'},
                 {txt:'Sydney', val:'Sydney'}
                 ];
                cityArr['us'] =
                [
                 {txt:'Boston', val:'Boston'},
                 {txt:'Irvine', val:'Irvine'},
                 {txt:'Redwood', val:'Redwood'}
                 ];
                 cityArr['emea'] =
                [
                 {txt:'Berkshire', val:'Berkshire'},
                 {txt:'Barcelona', val:'Barcelona'},
                 {txt:'Bonn', val:'Bonn'},
                 {txt:'Feldkirchen', val:'Feldkirchen'},
                 {txt:'Nürnberg', val:'Nürnberg'},
                 {txt:'Suresnes', val:'Suresnes'},
                 {txt:'Switzerland', val:'Switzerland'}
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