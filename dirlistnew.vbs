Class clsApplication
    Property Get Path()
          Dim sTmp
          If IsObject(WScript) Then 
               'Windows Scripting Host
Path = left(WScript.ScriptFullName, InStr(WScript.ScriptFullName, WScript.ScriptName) -2)
path = Replace(Path, "\","/" )
         
          End If
    End Property
End Class
Dim App : Set App = New clsApplication 'use as App.Path


Dim ls, fsObj, fd, fs, fl, sfs, sf, tf, als, afd, afs, afl, asfs, asf, afsObj

    ' specify the file extensions to list
    dim fileTypes
    fileTypes = Array("mp4","avi","mkv","mpeg","flv","mov","wmv","MP4")

    ls = ""
    Set fsObj = CreateObject("Scripting.FileSystemObject")
    Set fd = fsObj.GetFolder(".")
    Set afsObj = CreateObject("Scripting.FileSystemObject")
    Set afd = afsObj.GetFolder(".")
    set fs = fd.Files
    set afs = afd.Files
    
    ' list subfolders
    set sfs = fd.SubFolders
    For Each sf in sfs
 ls = ls & "<li><img src=""file:///C:/media/folder.ico"" class=""ico""> <a href=""" & sf.name & chr(47) & "index.html" & chr(34) & " class=""focusable""" & Chr(62) & sf.name & "</a></li>" & chr(10)
    
next
    ' list subfolders
    set asfs = afd.SubFolders
    For Each asf in asfs
        als = als & "<li><img src=""file:///C:/media/folder.ico"" class=""ico""> <a href=""" & asf.name & chr(47) & "index.html" & chr(34) & " class=""focusable""" & Chr(62) & asf.name & "</a></li>" & chr(10)
    Next

        For Each fl in fs
        ' check whether the extension matches 
        if arrayContains(fileTypes, fsObj.GetExtensionName(fl.name))then
            ls = ls & "<li><img src=""file:///C:/media/video.png"" class=""ico""><a href=""" & fl.name & chr(34) & " class=""focusable""" & Chr(62) & fl.name & "</a></li>" & chr(10)

end if
next

        For Each afl in afs
        ' check whether the extension matches 
      if arrayContains(fileTypes, afsObj.GetExtensionName(afl.name)) then
            als = als & "<li><input type=""checkbox"" class=""focusable cb"" onfocus=""parentFocus(event)"" onblur=""parentBlur(event)"" value=""<track><location>" & "file:///" & app.path & "/" &  afl.name & "</location></track>"">" & "<label>" & afl.name & "</label>" & chr(10)


        end if
    Next
    Set tf = fsObj.OpenTextFile("index.html", 2, True, False)

tf.Writeline ("<!DOCTYPE html>")


tf.Writeline ("<html>")
tf.Writeline ("<head>")
tf.Writeline ("<title>Media Center</title>")
tf.Writeline ("<meta charset=""utf-8""/>")
    tf.Writeline ("<link type=""text/css"" rel=""stylesheet"" href=""file:///c:/media/style.css"">")

tf.Writeline ("<script type=""text/javascript"" src=""file:///c:/media/jquery-3.1.1.min.js""></script>")


tf.Writeline ("<script src=""file:///c:/media/spatial_navigation.js""></script>")

tf.Writeline ("<script src=""file:///c:/media/spatial_focusable.js""></script>")

tf.Writeline ("<script type=""text/javascript"" src=""file:///c:/media/date_time.js""></script>")


tf.Writeline ("<script type=""text/javascript"" src=""file:///c:/media/playlist_text_to_file.js""></script>")

tf.Writeline ("<script type=""text/javascript"" src=""file:///c:/media/checkboxenter.js""></script>")

tf.Writeline ("<script type=""text/javascript"" src=""file:///c:/media/checkboxfocus.js""></script>")

tf.Writeline ("<script type=""text/javascript"">")
tf.Writeline ("$(document).ready(function(){")
tf.Writeline ("   $('input:checkbox').prop('checked', false);")
tf.Writeline ("}); ")
tf.Writeline ("</script>")


tf.Writeline ("<script type=""text/javascript"" src=""file:///c:/media/stopenterkey.js""></script>")


tf.Writeline ("<script>")
tf.Writeline ("function addText(event) {")
tf.Writeline ("var targ = event.target || event.srcElement;")
tf.Writeline (" document.getElementById(""TextToSave"").value += targ.value || ")
tf.Writeline ("targ.innerText;")
tf.Writeline ("}")
tf.Writeline ("</script>")


    tf.Writeline ("</head>")
tf.Writeline ("<body>")


tf.Writeline ("<div class=""topbar"">")

tf.Writeline ("<span id=""date_time"">")
tf.Writeline ("<script type=""text/javascript"">")
tf.Writeline ("window.onload = date_time")
tf.Writeline ("('date_time');</script></span>")
tf.Writeline ("<div id=""pathname"">")
tf.Writeline ("<script type=""text/javascript"" src=""file:///c:/media/currentdir.js""></script>")
tf.Writeline ("</div>")
tf.Writeline ("</div>")

      
tf.Writeline ("<div id=""container"">")

tf.Writeline ("<div id=""leftbox"">")
tf.Writeline ("<ul>")
tf.Writeline ("<li><a href=""javascript:history.go(-1)"" class=""focusable playlistbutton""> Go Back </a></li>")
tf.Writeline ("</ul>")


tf.Writeline ("<button class=""focusable playlistbutton"" id=""mybutton"">Call Red</button>")

tf.Writeline ("<div id=""playon"">")

tf.Writeline ("<form id=""omdbform"">")
tf.Writeline ("<input type=""text"" name=""movie"" ")
tf.Writeline ("placeholder=""movie title"" id=""moviename"" ") 
tf.Writeline ("onchange=""this.form.submit();"">")
tf.Writeline ("</form>")

tf.Writeline ("<div id=""containera"">")
tf.Writeline ("<span class=""poster"">Poster</span>")
tf.Writeline ("    <h3 class=""title"">Title</h3>")
tf.Writeline ("    <span class=""year"">Year</span>")
tf.Writeline ("       <span class=""rated"">Rated</span>") 
tf.Writeline ("    <p class=""plot"">Plot</p>")
tf.Writeline ("</div>")


tf.Writeline ("</div>")
tf.Writeline ("<div id=""playoff"">")

tf.Writeline ("<Form id=""form"">")

tf.Writeline ("<div class=""selectbut"">")
tf.Writeline ("<input type=""button"" class=""check focusable playlistbutton"" value=""Select All"">")
tf.Writeline ("</div>")




tf.Writeline ("<div class=""selectbut"">")
tf.Writeline ("<button onclick=""addText(event); saveTextAsFile()"" ") 
tf.Writeline ("value=""</trackList> </playlist>"" ")
tf.Writeline ("id=""trackbutton"" class=""focusable ")
tf.Writeline ("playlistbutton"">Play</button></div>")


tf.Writeline ("<div class=""selectbut"">")
tf.Writeline ("<button  class=""focusable playlistbutton"" ") 
tf.Writeline ("onclick=""clearTextArea();"">Clear Playlist</button>")
tf.Writeline ("</div>")

tf.Writeline ("</div>")
tf.Writeline ("</div>")

tf.Writeline ("<div id=""rightbox"">")


tf.Writeline ("<ul>")
tf.Writeline ls
tf.Writeline ("</ul>")
tf.Writeline ("</div>")


tf.Writeline ("<div id=""playlist"" class=""playlistcheck"">")
tf.Writeline ("<ul class=""checkbox"">")


tf.Writeline als

tf.Writeline ("</ul>")
tf.Writeline ("</div>")
tf.Writeline ("</div>")


tf.Writeline ("<script type=""text/javascript"" src=""file:///c:/media/buttontext.js"">")
tf.Writeline ("</script>")


tf.Writeline ("<textarea id=""TextToSave"" cols=""60""") 
tf.Writeline ("rows=""15""")
tf.Writeline ("onfocus=""if(this.value=='type your text here ...')this.value='';"" onblur=""if")

tf.Writeline ("(this.value=='')this.value='type your text here ...';"">")
tf.Writeline ("<?xml version=""1.0""?>")
tf.Writeline ("<playlist xmlns=""http://xspf.org/ns/0/"" version=""1"">")
tf.Writeline ("	<title>Playlist</title>")
tf.Writeline ("	<trackList>")

tf.Writeline ("</textarea>")

tf.Writeline ("  <script>")
tf.Writeline ("  if (window.parent && window.parent.parent){")
tf.Writeline ("  window.parent.parent.postMessage([""resultsFrame"", {")
tf.Writeline (" height: document.body.getBoundingClientRect")
tf.Writeline ("().height,")
tf.Writeline ("      slug: ""BHCdJ""")
tf.Writeline ("    }], ""*"")")
tf.Writeline ("  }")
tf.Writeline ("</script>")


tf.Writeline ("<script>")
tf.Writeline ("function addText(event) {")
tf.Writeline ("var targ = event.target || event.srcElement;")
tf.Writeline (" document.getElementById(""TextToSave"").value += targ.value || ")
tf.Writeline ("targ.innerText;")
tf.Writeline ("}")
tf.Writeline ("</script>")



tf.Writeline ("<table class=""filenametosaveas"">")
tf.Writeline ("    <tr>")
tf.Writeline ("        <td>Filename to Save As:</td>")
tf.Writeline ("        <td><input id=""inputFileNameToSaveAs""") 
tf.Writeline ("value=""x.xspf""></td>")
tf.Writeline ("<td><button onclick=""saveTextAsFile()"">Save Text to File</button></td>")

tf.Writeline ("    </tr>")
tf.Writeline ("</table>")
tf.Writeline ("</form>")

tf.Writeline ("<script type=""text/javascript"" src=""file:///c:/media/saveTextAsFile.js""></script>")

tf.Writeline ("<script type=""text/javascript"" src=""file:///c:/media/updateTextArea.js""></script>")

tf.Writeline ("<script type=""text/javascript"" src=""file:///c:/media/selectall.js""></script>")



tf.Writeline ("<script type=""text/javascript"" src=""file:///c:/media/clearTextArea.js""></script>")

tf.Writeline ("<script type=""text/javascript"" src=""file:///c:/media/movieinfo.js""></script>")


tf.Writeline ("</body>")
tf.Writeline ("</html>")
    tf.Close
    Set fsObj = Nothing

    function arrayContains (arr, val)            
        dim found
        found = false
        for i = 0 to ubound(arr)
            if arr(i) = val then    
                found = true
                exit for 
            end if
        next
        arrayContains = found            
    end function