s.boot;
SerialPort.devices;

b = NetAddr.new("127.0.0.1", 12000);
~port = SerialPort.new("/dev/cu.usbmodem14201", 9600);

(
~charArray = [ ];
~getValues = Routine.new({
	var ascii;
	{
		ascii = ~port.read.asAscii;
		if(ascii.isDecDigit,{~charArray = ~charArray.add(ascii)});
		if(ascii == $a,{
			~val1= ~charArray.collect(_.digit).convertDigits;
			~charArray = [ ];
		});
	}.loop;
}).play;
)

(
SynthDef(\sound, {
    |freq = 440, amp = 0.1, gate = 1|
    var sig;

    // Frequency modulation
    var mod = SinOsc.ar(freq * 0.5, mul: 0.5);
    sig = SinOsc.ar(freq + mod, mul: amp);

    // Amplify and output
    Out.ar(0, sig);
}).add;
)

~synth =Synth(\sound,[\freq, 0]);
//~synth.free;

(
 var noteFunction = { arg x; var y;
	y= case
	{x>0 && x<78.69}{440.00}
	{x>78.69 && x<157.38}{466.16}
	{x>157.38 && x<236.07}{493.88}
	{x>236.07 && x<314.76}{523.25}
	{x>314.76 && x<393.45}{554.37}
	{x>393.45 && x<462.14}{587.33}
	{x>462.14 && x<550.83}{622.25}
	{x>550.83 && x<629.52}{659.25}
	{x>629.52 && x<708.21}{698.46}
	{x>708.21 && x<786.9}{739.99}
	{x>786.9 && x<865.59}{783.99}
	{x>865.59 && x<944.28}{830.61}
	{x>944.28 && x<1024}{880.00};
};


~control = Routine.new({
	{
		if(~val1!=0, {
			~synth.set(\freq, noteFunction.value(~val1));
			b.sendMsg("/play", noteFunction.value(~val1));
			0.005.wait;
		}, {
			~synth.set(\freq, 0);
			b.sendMsg("/stop");
			0.005.wait;
		});
	}.loop;
}).play;
)
