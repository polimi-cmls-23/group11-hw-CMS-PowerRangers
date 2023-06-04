int sensorPin=A0;       //define the sensor analog pin 


const int buttonPin=4;  //define the button pin


int previousButtonState = HIGH;
int currentButtonState = HIGH;

boolean buttonStatus = false;




void setup() {
  pinMode(sensorPin, INPUT);
  pinMode(buttonPin, INPUT_PULLUP);
  Serial.begin(9600);   //serial comunication at 9600 bit/s
}

void loop() {
  currentButtonState= digitalRead(buttonPin);           //button status reading


  if(currentButtonState!=previousButtonState){
  if(currentButtonState== LOW){
    buttonStatus= !buttonStatus;
  
}

previousButtonState = currentButtonState;
}

delay(500);                          //time between two loop iteration (500 ms)

 if (buttonStatus) {
    int sensorValue = analogRead(sensorPin);
    
    
    Serial.print(sensorValue);
    Serial.print("a");
    
  }else{
    Serial.print(0);
    Serial.print("a");
  }


  }