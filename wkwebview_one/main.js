

function go() {
    try {
        webkit.messageHandlers.callbackHandler.postMessage("whatever");
    } catch(err) {
        console.log('doesnt exist');
    }
}
