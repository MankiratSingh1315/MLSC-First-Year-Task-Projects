document.body.addEventListener('keydown',(event)=>{
    if (event.key==='c'){
        document.getElementById("js-input").value='';
    }
    else if (event.key==='Backspace'){
        document.getElementById("js-input").value= document.getElementById("js-input").value.toString().slice(0,-1);
    }
    else if (event.key==='Enter' || event.key==='='){
        document.getElementById("js-input").value=eval(document.getElementById("js-input").value);
    }
    else if (event.key==='0'){
        document.getElementById("js-input").value+='0';
    }
    else if (event.key==='1'){
        document.getElementById("js-input").value+='1';
    }
    else if (event.key==='2'){
        document.getElementById("js-input").value+='2';
    }
    else if (event.key==='3'){
        document.getElementById("js-input").value+='3';
    }
    else if (event.key==='4'){
        document.getElementById("js-input").value+='4';
    }
    else if (event.key==='5'){
        document.getElementById("js-input").value+='5';
    }
    else if (event.key==='6'){
        document.getElementById("js-input").value+='6';
    }
    else if (event.key==='7'){
        document.getElementById("js-input").value+='7';
    }
    else if (event.key==='8'){
        document.getElementById("js-input").value+='8';
    }
    else if (event.key==='9'){
        document.getElementById("js-input").value+='9';
    }
    else if (event.key==='+'){
        document.getElementById("js-input").value+='+';
    }
    else if (event.key==='-'){
        document.getElementById("js-input").value+='-';
    }
    else if (event.key==='*'){
        document.getElementById("js-input").value+='*';
    }
    else if (event.key==='/'){
        document.getElementById("js-input").value+='/';
    }
    });