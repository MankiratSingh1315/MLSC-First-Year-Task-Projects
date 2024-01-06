function calculate() {
  var display = document.getElementsByName('display')[0];
  try {
    display.value = eval(display.value);
  } catch (error) {
    display.value = 'Error';
  }
}