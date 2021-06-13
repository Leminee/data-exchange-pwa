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
    screenshotImage.src = canvas.toDataURL('image/webp');
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




