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
