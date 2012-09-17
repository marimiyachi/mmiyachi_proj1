var xhr = new XMLHttpRequest();
xhr.onreadystatechange = function() {
  if (xhr.readyState == 1) {
    console.log('The call to open(...) succeeded.');
  }
  if (xhr.readyState == 2) {
    console.log('The call to send(...) succeeded. Waiting for response...');
  }
  if (xhr.readyState == 3) {
    console.log('The response is coming in!');
  }
  if (xhr.readyState == 4) {
    console.log('We now have the complete response: ' + xhr.response);
  }
}
xhr.open('GET', 'http://rocky-hollows-4060.herokuapp.com/pages/1/show', true);
xhr.send('');
