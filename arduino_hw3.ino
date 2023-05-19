int sensorPin=A0;       //define the sensor analog pin 
//int sensorValue=0;      //initial value of the sensore measure

const int buttonPin=4;  //define the button pin


int previousButtonState = HIGH;
int currentButtonState = HIGH;

boolean buttonStatus = false;




void setup() {
  //pinMode(sensorPin, INPUT);
  pinMode(sensorPin, INPUT);
  pinMode(buttonPin, INPUT_PULLUP);
  Serial.begin(9600);   //serial comunication at 9600 bit/s
}

void loop() {
  currentButtonState= digitalRead(buttonPin);           //button status reading


  if(currentButtonState!=previousButtonState){
  if(currentButtonState== LOW){
    buttonStatus= !buttonStatus;
  
  // int sensorValue= analogRead(sensorPin);   //one-variable check sensor detection
  // //float voltage= sensorValue * (5.0/1023.0); 

  // Serial.println("Gray scale value :");
  // Serial.println(sensorValue);          //each loop run prints the detection value
  // //Serial.println("  Voltage:");
  // //Serial.println(voltage);

  
}

previousButtonState = currentButtonState;
}

delay(500);                          //time between two loop iteration (500 ms)

 if (buttonStatus) {
    int sensorValue = analogRead(sensorPin);
    
    
    Serial.print(sensorValue);
    Serial.print("a");
    //Serial.print(currentButtonState);
    //Serial.print("b");
    
  }else{
    Serial.print(0);
    Serial.print("a");
  }


  }