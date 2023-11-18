package com.example.calculater

import android.annotation.SuppressLint
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.EditText

class MainActivity : AppCompatActivity() {
    @SuppressLint("MissingInflatedId")
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val inputBar = findViewById<EditText>(R.id.inputBar)

        // Defining Buttons
        val bt_1 = findViewById<Button>(R.id.bt_1)
        val bt_2 = findViewById<Button>(R.id.bt_2)
        val bt_3 = findViewById<Button>(R.id.bt_3)
        val bt_4 = findViewById<Button>(R.id.bt_4)
        val bt_5 = findViewById<Button>(R.id.bt_5)
        val bt_6 = findViewById<Button>(R.id.bt_6)
        val bt_7 = findViewById<Button>(R.id.bt_7)
        val bt_8 = findViewById<Button>(R.id.bt_8)
        val bt_9 = findViewById<Button>(R.id.bt_9)
        val bt_0 = findViewById<Button>(R.id.bt_0)
        val bt_plus = findViewById<Button>(R.id.bt_plus)
        val bt_minus = findViewById<Button>(R.id.bt_minus)
        val bt_divide = findViewById<Button>(R.id.bt_divide)
        val bt_multiply = findViewById<Button>(R.id.bt_multiply)
        val bt_equal = findViewById<Button>(R.id.bt_equal)
        val bt_clear = findViewById<Button>(R.id.bt_clear)
        val bt_backspace = findViewById<Button>(R.id.bt_backspace)
        val bt_exit = findViewById<Button>(R.id.bt_exit)
        inputBar.setText("0")

        //function for calculation
        fun calculate(operator: Char, firstNumber: Float, secondNumber: Float): Any {
            if (operator == '/') return (firstNumber / secondNumber)
            else if (operator == '*') return firstNumber * secondNumber
            else if (operator == '-') return firstNumber - secondNumber
            else if (operator == '+') return firstNumber + secondNumber
            else return "Error"
        }

        //function for spliting string(input) and return result from calculate()
        fun separateInput(input: String) : Any {
            var result: Any = "error"
            for (word in input) {
                if (word == '+') {
                    val firstNumber = input.split("+")[0].toFloat()
                    val secondNumber = input.split("+")[1].toFloat()
                    result = calculate('+', firstNumber, secondNumber)
                    break
                }
                else if (word == '-') {
                    val firstNumber = input.split("-")[0].toFloat()
                    val secondNumber = input.split("-")[1].toFloat()
                    result = calculate('-', firstNumber, secondNumber)
                    break
                }
                else if (word == '*') {
                    val firstNumber = input.split("*")[0].toFloat()
                    val secondNumber = input.split("*")[1].toFloat()
                    result = calculate('*', firstNumber, secondNumber)
                    break
                }
                else if (word == '/') {
                    val firstNumber = input.split("/")[0].toFloat()
                    val secondNumber = input.split("/")[1].toFloat()
                    result = calculate('/', firstNumber, secondNumber)
                    break
                }
            }
            return result
        }

        //funtion to give equation to the separateInput() and print result
        fun displayresult(){
            val equation = inputBar.text.toString()
            separateInput(equation)
            inputBar.setText("${separateInput(equation)}")
        }

        fun backspace(){
            val equation = inputBar.text.toString()
            if (equation=="error") inputBar.setText("")
            else{
                var newEquaion = ""
                for (i in 0 until equation.length-1) {
                    newEquaion += equation[i]
                }
                inputBar.setText(newEquaion)
            }
        }


        //funtion for editing equation when any button is clicked
        fun editText(text: String){
            val equation = inputBar.text.toString()
            if (equation=="0" || equation=="error") {
                inputBar.setText(text)
            }
            else{
                val newEquation = equation+text
                inputBar.setText(newEquation)
            }
        }

        fun clear(){
            inputBar.setText("")
        }

        bt_1.setOnClickListener {
            editText("1")
        }

        bt_2.setOnClickListener {
            editText("2")
        }

        bt_3.setOnClickListener {
            editText("3")
        }

        bt_4.setOnClickListener {
            editText("4")
        }

        bt_5.setOnClickListener {
            editText("5")
        }

        bt_6.setOnClickListener {
            editText("6")
        }

        bt_7.setOnClickListener {
            editText("7")
        }

        bt_8.setOnClickListener {
            editText("8")
        }

        bt_9.setOnClickListener {
            editText("9")
        }

        bt_0.setOnClickListener {
            editText("0")
        }

        bt_plus.setOnClickListener {
            val equation = inputBar.text.toString()
            val last_val = equation[equation.length-1]
            if (last_val == '+' || last_val == '-' || last_val == '*' || last_val == '/'){
                backspace()
            }
            editText("+")
        }

        bt_minus.setOnClickListener {
            val equation = inputBar.text.toString()
            val last_val = equation[equation.length-1]
            if (last_val == '+' || last_val == '-' || last_val == '*' || last_val == '/'){
                backspace()
            }
            editText("-")
        }

        bt_multiply.setOnClickListener {
            val equation = inputBar.text.toString()
            val last_val = equation[equation.length-1]
            if (last_val == '+' || last_val == '-' || last_val == '*' || last_val == '/'){
                backspace()
            }
            editText("*")
        }

        bt_divide.setOnClickListener {
            val equation = inputBar.text.toString()
            val last_val = equation[equation.length-1]
            if (last_val == '+' || last_val == '-' || last_val == '*' || last_val == '/'){
                backspace()
            }
            editText("/")
        }

        bt_clear.setOnClickListener {
            clear()
        }

        bt_backspace.setOnClickListener {
            backspace()
        }

        bt_exit.setOnClickListener {
            finishAffinity()
        }

        bt_equal.setOnClickListener {
            displayresult()
        }
    }

}