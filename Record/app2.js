

record.onclick = () =>{
    navigator.mediaDevices.getUserMedia({audio:true})
    .then(stream => {

        mediaRecorder = new MediaRecorder(stream)
        mediaRecorder.start()
        chuck = []

        mediaRecorder.addEventListener("dataavailable", e =>{
            chuck.push(e.data)
        })

        mediaRecorder.addEventListener("stop", e =>{
            blob = new Blob(chuck)
            audio_url = URL.createObjectURL(blob)
            audio = new Audio(audio_url)
            audio.setAttribute("controls",1)
            mp3.appendChild(audio)
            
        })

    })
}

stoprecord.onclick = () =>{
    mediaRecorder.stop()
}