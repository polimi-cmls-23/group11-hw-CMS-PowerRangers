# group11-hw-CMS-PowerRangers

The aim of this homework is to implement a complete computer music system with interaction design principles. We decided to implement the following block diagram:




![block](https://github.com/polimi-cmls-23/group11-hw-CMS-PowerRangers/assets/101117878/60ae843a-dfeb-4352-a104-d1cd5f55d968)




 We chose Arduino UNO as our control device (interaction system unit), we share information to SuperCollider (computer music unit) with serial messages providing the feedback events to Processing (graphical feedback unit) with OSC messages.
 The pourpose of our system is the frequency modulation of a synthesizer controlled by a gray scale photosensitive sensor and a digital push button. The digital push button activates or stops the synthesizer from playing, while the gray scale sensor controls the frequency through its ability to measure the intensity of light. So, depending on the brightness condition, frequency modulation happens, resulting on the change of pitch of the playing synth.
 
