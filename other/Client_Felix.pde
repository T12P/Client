import processing.net.*;

Client client;

void setup() {
  size (200, 200);
  
  client = new Client(this, "10.1.10.27", 12345);
}

void draw() {
  background(255);
  
  if(client.available() > 0) {
     
    String message = client.readString();
    println("Empfange Nachricht: " + message);
  }
}
  
