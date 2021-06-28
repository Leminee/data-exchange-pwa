//'use strict';

const soundClips = document.querySelector('.sound-clips');
const canvas = document.querySelector('.visualizer');
const mainSection = document.querySelector('.main-controls');
var mediaSource = new MediaSource();
mediaSource.addEventListener('sourceopen', handleSourceOpen, false);
var mediaRecorder;
var recordedBlobs;
var sourceBuffer;

var playerAudio = document.querySelector('audio#player');
var recordedAudio = document.querySelector('audio#recorded');

var recordButton = document.querySelector('button#record');
var playButton = document.querySelector('button#play');
var downloadButton = document.querySelector('button#download');

let audioCtx;
const canvasCtx = canvas.getContext('2d');

recordButton.onclick = toggleRecording;
playButton.onclick = play;
downloadButton.onclick = download;


var constraints = {
    audio: true,
    video: false
};

navigator.mediaDevices.getUserMedia(
    constraints
).then(
    successCallback,
    errrorCallback
);

function successCallback(stream) {
    console.log('getUserMedia() got stream: ', stream);
    visualize(stream);
    window.stream = stream;
    playerAudio.srcObject = stream;
}

function errrorCallback(stream) {
    console.log('navigator.getUserMedia error: ', error);
}

function handleSourceOpen(event) {
    console.log('MediaSource opened');
    sourceBuffer = mediaSource.addSourceBuffer('audio/mp3');
    console.log('Source buffer: ', sourceBuffer);
}

function handleDataAvailable(event) {
    if (event.data && event.data.size > 0) {
        recordedBlobs.push(event.data);
    }
}

function handleStop(event) {
    console.log('Recorder stopped: ', event);
    console.log('Recorded Blobs: ', recordedBlobs);
}

function toggleRecording() {
    if (recordButton.textContent === 'Aufnahme starten') {
        startRecording();
    } else {
        stopRecording();
        recordButton.textContent = 'Aufnahme starten';
        playButton.disabled = false;
        downloadButton.disabled = false;
    }
}

function startRecording() {
    var options = {mimeType: 'audio/webm'};
    recordedBlobs = [];

    try {
        mediaRecorder = new MediaRecorder(window.stream, options);
    } catch (e0) {
        console.log('Unable to create MediaRecorder with options Object: ', e0);
        try {
            options = {mimeType: 'audio/mp3'};
            mediaRecorder = new MediaRecorder(window.stream, options);
        } catch (e1) {
            console.log('Unable to create MediaRecorder with options Object: ', e1);
            try {
                options = 'audio/mp3';
                mediaRecorder = new MediaRecorder(window.stream, options);
            } catch (e2) {
                alert('MediaRecorder is not supported by this browser. \n\n' +
                    'Try Firefox 29 or later, or Chrome 47 or later, with Enable experimental Web Platform features enabled from chrome://flags');
                console.error('Exception while creating MediaRecorder: ', e2);
                return;
            }
        }
    }
    console.log('Created MediaRecorder', mediaRecorder, 'with options', options);
    recordButton.textContent = 'Stop Recording';
    playButton.disabled = true;
    downloadButton.disabled = true;
    mediaRecorder.onstop = handleStop;
    mediaRecorder.ondataavailable = handleDataAvailable;
    mediaRecorder.start(10); //COLLECT 10ms OF DATA
    console.log('MediaRecorder started', mediaRecorder);
}


function base64ToFile(data = false, fileName = false) {
    if (!data || !fileName) {
        return false;
    }

    var arr = data.split(','),
    mime = arr[0].match(/:(.*?);/)[1],
    bstr = atob(arr[1]),
    n = bstr.length,
    u8arr = new Uint8Array(n);

    while (n--) {
        u8arr[n] = bstr.charCodeAt(n);
    }

    return new File([u8arr], fileName, {type: mime}) || false;
}



function stopRecording() {
    mediaRecorder.stop();
    recordedAudio.controls = true;
    
    let file = base64ToFile(recordedBlobs.src + (new Date().getTime()) + '.webp');
    if (file) {
        let evt = new DragEvent('drop');
        Object.defineProperty(evt, 'dataTransfer', {
            value: new MyDataTransfer(file)
        });

        document.getElementById('uploadFile').dispatchEvent(
            evt
        );
    }
}


function play() {
    var type = (recordedBlobs[0] || {}).type;
    var superBuffer = new Blob(recordedBlobs, {type});
    recordedAudio.src = window.URL.createObjectURL(superBuffer);
}


function download() {
   
    const clipName = prompt('Enter a Name for your Sound Clip?', 'My unnamed Clip');

    const clipContainer = document.createElement('article');
    const clipLabel = document.createElement('p');
    

    clipContainer.classList.add('clip');

    if (clipName === null) {
        clipLabel.textContent = 'My unnamed clip';
    } else {
        clipLabel.textContent = clipName;
    }

                                    
    clipContainer.appendChild(clipLabel);
                                    
   
    var blob = new Blob(recordedBlobs, {type: 'audio/mp3'});
    var url = window.URL.createObjectURL(blob);
    var a = document.createElement('a');
    a.style.display = 'none';
    a.href = url;
    a.download = clipName;

                                    

    document.body.appendChild(a);
    a.click();
    //Timeout
    setTimeout(function() {
        document.body.removeChild(a);
        window.URL.revokeObjectURL(url);
    }, 100);
}



function visualize(stream) {
    if (!audioCtx) {
        audioCtx = new AudioContext();
    }

    const source = audioCtx.createMediaStreamSource(stream);

    const analyser = audioCtx.createAnalyser();
    analyser.fftSize = 2048;
    const bufferLength = analyser.frequencyBinCount;
    const dataArray = new Uint8Array(bufferLength);

    source.connect(analyser);

    draw()

    function draw() {
        const WIDTH = canvas.width;
        const HEIGHT = canvas.height;

        requestAnimationFrame(draw);

        analyser.getByteTimeDomainData(dataArray);

        canvasCtx.fillStyle = 'rgb(200, 200, 200)';
        canvasCtx.fillRect(0, 0, WIDTH, HEIGHT);

        canvasCtx.lineWidth = 2;
        canvasCtx.strokeStyle = 'rgb(0, 0, 0)';

        canvasCtx.beginPath();

        let sliceWidth = WIDTH * 1.0 / bufferLength;
        let x = 0;

        for (let i = 0; i < bufferLength; i++) {
            let v = dataArray[i] / 128.0;
            let y = v * HEIGHT / 2;
            
            if (i == 0) {
                canvasCtx.moveTo(x, y);
            } else {
                canvasCtx.lineTo(x, y);
            }

            x += sliceWidth;
        }

        canvasCtx.lineTo(canvas.width, canvas.height / 2);
        canvasCtx.stroke();
    }
}





window.onresize = function() {
    canvas.width = mainSection.offsetWidth;
}

window.onresize();


