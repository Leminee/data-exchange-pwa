let mediaRecorder = false;
const constraints = { audi: true, video: false};

record.onclick = () =>{
    navigator.mediaDevices.getUserMedia({audio:true})
    .then(stream => {

        mediaRecorder = new MediaRecorder(stream)
        mediaRecorder.start()
        chunk = [] 


        mediaRecorder.addEventListener("dataavailable", e =>{
            chunk.push(e.data)
        })

        mediaRecorder.addEventListener('stop', e =>{
            blob = new Blob(chunk, {type : 'audio/mp3'})
            audio_url = URL.createObjectURL(blob)
            audio = new Audio(audio_url)
            audio.setAttribute("controls",1)

            if (mp3.firstChild) {
                mp3.removeChild(mp3.firstChild);
              }

            mp3.appendChild(audio);
            audio.load();
            var aElement = document.createElement("a");
            aElement.href = audio.src;
            aElement.download = audio_url;
            document.body.appendChild(aElement);
            aElement.click();
        })
    })
}

stoprecord.onclick = () =>{
    mediaRecorder.stop()
}
