function saveTextAsFile()
{
    var textToSave = document.getElementById("TextToSave").value.replace(/\n/g, '\r\n');
    var textToSaveAsBlob = new Blob([textToSave], {type:"application/xspf+xml"});
    var textToSaveAsURL = window.URL.createObjectURL(textToSaveAsBlob);
    var fileNameToSaveAs = document.getElementById("inputFileNameToSaveAs").value;

    var downloadLink = document.createElement("a");
    downloadLink.download = fileNameToSaveAs;
    downloadLink.innerHTML = "Download File";
    downloadLink.href = textToSaveAsURL;
    downloadLink.onclick = destroyClickedElement;
    downloadLink.style.display = "none";
    document.body.appendChild(downloadLink);
 
    downloadLink.click();
}
 

function destroyClickedElement(event)
{
    document.body.removeChild(event.target);
}