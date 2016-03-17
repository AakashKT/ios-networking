# ios-networking
This is a networking library, for simple json data downloading from http and https servers

<h1>Tutorial</h1>
<h3>Initialising the network objet for HTTP protocol</h3>
<p>Use this initialiser for initialising with type POST</p><br>
<p>Alternatively, you can pass "GET" instead of "POST" to initialise with type GET</p>
<code>
let netObj = Network(url: "http://example.com/example.json", type: "POST");
</code>
