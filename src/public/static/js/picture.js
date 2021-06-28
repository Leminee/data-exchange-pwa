let video = document.querySelector("#video");
const screenshotImage = document.querySelector('img');


if(navigator.mediaDevices && navigator.mediaDevices.getUserMedia){
    navigator.mediaDevices.getUserMedia({video: true}).then(stream =>{
        video.srcObject = stream;
        video.play();
    })
}

document.getElementById('snap').addEventListener('click', ()=>{
    canvas.width = video.videoWidth;
    canvas.height = video.videoHeight;
    canvas.getContext('2d').drawImage(video, 0, 0);
    screenshotImage.src = canvas.toDataURL('image/png');
});

document.getElementById('send').addEventListener('click', ()=>{
    let file = base64ToFile(screenshotImage.src, 'camera'+(new Date().getTime())+'.webp');

    if (file) {
        let evt = new DragEvent('drop');
        Object.defineProperty(evt, 'dataTransfer', {
            value: new MyDataTransfer(file)
        });

        document.getElementById('uploadFile').dispatchEvent(
            evt
        );
    }
});

function base64ToFile(data = false, fileName = false) {
    if (!data || !fileName) {
        return false;
    }

    var binary = atob(dataUrl.split(',')[1]);
    var array = [];
    for (var i = 0; i < binary.length; i++) {
        array.push(binary.charCodeAt(i));
    }

    var photo = new Blob([new Uint8Array(array)], { type: 'image/png'});
    const formData = new FormData();
    formData.append("files", photo, dateTime + ".png");

}

function MyDataTransfer(file) {
    this.dropEffect = 'all';
    this.effectAllowed = 'all';
    this.items = [file];
    this.types = ['Files'];
    this.getData = function () {
        return file;
    }
    this.file = [file];
}

function downloadBase64File(data = false, fileName = false, mimeType = false) {
    if(!data || !fileName ||mimeType) {
        return false;
    }

    const linkSource = `data:${mimeType};base64,${contentBase64}`;
    const downloadLink = document.createElement('a');
    document.body.appendChild(downloadLink);

    downloadLink.href = linkSource;
    downloadLink.target = '_self';
    downloadLink.download = fileName,
    downloadLink.click();
};




