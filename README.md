# ios-networking
This is a networking library, for simple json data downloading from http and https servers

<h1>Tutorial</h1>
<h3>Initialising the network object with HTTP protocol</h3>
<p>Use this initialiser for initialising with the required type</p>
<p>Alternatively, you can pass "GET" instead of "POST" to initialise with type GET</p>
<code>
let netObj = Network(url: "http://example.com/example.json", type: "POST");
</code>
<h3>Initialising the network object with HTTPS protocol</h3>
<p>Use this initialiser for initialising with with the required type</p>
<p>Alternatively, you can pass "GET" instead of "POST" to initialise with type GET</p>
<code>
let netObj = Network(url: "https://example.com/example.json", username: "exampleUser", authKey: "exampleAuthKey", type: "POST");
</code>
<h3>Getting data from server</h3>
<p>Use this function to get data, the argument passed is a closure for performing tasks after download has finished</p>
<code>
let netObj = Network(url: "http://example.com/example.json", type: "POST");
</code>
<br>
<code>
netObj.getData({
</code>
<br>
<code>
  (error) -> Void in
</code>
<br>
<code>
  //put code to execute after download finished
</code>
<br>
<code>
});
</code>

<h3>Sending data to server and handling response</h3>
<p>Use this function to send data and handle server response</p>
<code>
let netObj = Network(url: "http://example.com/example.json", type: "POST");
netObj.sendData("data1=value1&data2=value2&data3=value3", onReceive: {
  (error) -> Void in 
  //put code to execute after receiving server response
  
});
</code>
