let string = "";
let buttons = document.querySelectorAll("button");
let input = document.querySelector("input");
buttons.forEach((val)=>{
    val.addEventListener("click",(e)=>{
        if (e.target.innerHTML == '=') {
            string = eval(string);
            input.value = string;
        }
        else if (e.target.innerHTML == 'AC') {
            string = "";
            input.value = string;

        }
        else if (e.target.innerHTML == 'de') {
            string = string.slice(0,-1);
            input.value = string;
        }
        else{

            console.log(e.target);
            string = string + e.target.innerHTML;
            input.value = string;
        }
    })
})

// .value is used as 
// if you have an input field with an id of userInput, you can use .value
//  in JavaScript to retrieve the value the user entered into the field

// e.target will give us the property with which event occurs 
// in this case it will return button element 
// and if we write e.target.innerhtml it e=will give us value of that property 